#include <errno.h>
#include <string.h>
#include "wm_drv.h"
#include "oui.h"
#include "nl.h"
#include "nl_assert.h"
#include "dasio/appid.h"
#include "dasio/loop.h"
#include "dasio/quit.h"
#include "dasio/tm_data_sndr.h"

using namespace DAS_IO;

const char *Wind::mlf_base = "Wind";
const char *Wind::port;
const char *Wind::mlf_config;
WindMaster_t WindMaster;

Wind::Wind() :
    Serial(mlf_base, 1024, port, O_RDONLY | O_NONBLOCK),
    mlf(0),
    ofp(0),
    Bytes_in_File(0),
    N_samples(0),
    N_errors(0),
    gettime_error(false)
{
  zero_sums();
  mlf = mlf_init(3, 60, 1, mlf_base, "dat", mlf_config);
  Tstamp.tv_sec = Tstamp.tv_nsec = 0;
  FileTstamp.tv_sec = FileTstamp.tv_nsec = 0;
  flags |= gflag(0);
  setup(19200,8,'n',1,-1,0);
}

bool Wind::protocol_input()
{
  // Parse input, verify and write to output file
  // Update aggregate information.
  // Q,+000.04,+000.00,+000.00,M,+346.15,+024.31,00,2C
  float U, V, W, SoS, SonicTemp;
  uint16_t status, cksum;
  if (not_str("\x02Q,") ||
      not_float(U) || not_str(",") ||
      not_float(V) || not_str(",") ||
      not_float(W) || not_str(",M,") ||
      not_float(SoS) || not_str(",") ||
      not_float(SonicTemp) || not_str(",") ||
      not_hex(status) || not_str(",\x03") ||
      not_hex(cksum) || not_str("\r\n")) {
    if (cp >= nc) return false; // Incomplete, need more data
    archive();
    consume(nc);
    ++N_errors;
  } else {
    archive();
    uint8_t new_cs = checksum((char *)(buf+1), nc-5);
    if (new_cs != cksum) {
      report_err("%s: Invalid checksum: should be %02X", iname, new_cs);
      ++N_errors;
    } else {
      sum.U += U;
      sum.V += V;
      sum.W += W;
      sum.SoS += SoS;
      sum.SonicTemp += SonicTemp;
      ++N_samples;
    }
  }
  return false;
}

/** Called after TM data is sent
 */
bool Wind::tm_sync()
{
  // ### Load up WindMaster with current averages
  // ### reset averages
  if (N_samples) {
    WindMaster.U = sum.U/N_samples;
    WindMaster.V = sum.V/N_samples;
    WindMaster.W = sum.W/N_samples;
    WindMaster.SoS = sum.SoS/N_samples;
    WindMaster.SonicTemp = sum.SonicTemp/N_samples;
  }
  WindMaster.mlf_index = mlf->index;
  WindMaster.N_samples = N_samples;
  WindMaster.N_errors = N_errors;
  if (FileTstamp.tv_sec) {
    int32_t dsecs = Tstamp.tv_sec - FileTstamp.tv_sec;
    int32_t dnsecs = Tstamp.tv_nsec - FileTstamp.tv_nsec;
    if (dnsecs < 0) {
      --dsecs;
      dnsecs += 1000000000;
    }
    WindMaster.mlf_time = dsecs*1000 + dnsecs/1000000;
  }
  zero_sums();
  return false;
}

const char *Wind::ISO8601() {
  // yyyy-mm-ddThh:mm:ss.mmm
  static char buf[24];
  struct tm *tms = gmtime(&Tstamp.tv_sec);
  snprintf(buf, 24, "%4d-%02d-%02dT%02d:%02d:%06.3lf",
    tms->tm_year + 1900,
    tms->tm_mon + 1,
    tms->tm_mday,
    tms->tm_hour,
    tms->tm_min,
    tms->tm_sec + 1e-9*Tstamp.tv_nsec);
  return buf;
}

void Wind::write_tstamp()
{ // T,ISO8601,CS\r\n
  nl_assert(ofp);
  char tbuf[64]; // ISO8601 is 23 @ msec res.
  int nb = snprintf(tbuf, 64, "T,%s,", ISO8601());
  uint8_t cs = checksum(tbuf, nb);
  nl_assert(nb < 55);
  nb += snprintf(tbuf+nb, 64-nb, "%02X\r\n", cs);
  fprintf(ofp, "%s", tbuf);
  Bytes_in_File += nb;
}

uint8_t Wind::checksum(const char *csbuf, int nc) {
  uint8_t cs = 0;
  while (nc > 0) {
    cs ^= *csbuf++;
    --nc;
  }
  return cs;
}

/**
 * Assumes Tstamp has been updated appropriately, which is
 * done in archive().
 */
void Wind::next_file()
{
  if (ofp && fclose(ofp)) {
    msg(MSG_ERROR, "Error closing file: %s", strerror(errno));
  }
  ofp = mlf_next_file(mlf);
  if (ofp == 0)
    msg(MSG_FATAL, "Unable to open output file");
  Bytes_in_File = 0;
  write_tstamp();
  FileTstamp = Tstamp;
}

void Wind::archive()
{
  // record current time
  int rv = clock_gettime(CLOCK_REALTIME, &Tstamp);
  if (rv && !gettime_error) {
    msg(MSG_ERROR, "clock_gettime returned error %d: %s",
      errno, strerror(errno));
  }
  
  if (ofp && Bytes_in_File + (int)nc > Bytes_per_File) {
    fclose(ofp);
    ofp = 0;
  }
  if (ofp == 0) next_file();
  nl_assert(ofp);
  fprintf(ofp, "%s", buf);
  Bytes_in_File += nc;
}

void Wind::zero_sums() {
  sum.U = sum.V = sum.W = 0;
  sum.SoS = 0;
  sum.SonicTemp = 0;
  N_samples = 0;
  N_errors = 0;
}

int main(int argc, char **argv) {
  oui_init_options(argc, argv);
  if (!Wind::port)
    msg(MSG_FATAL,
      "Must specify WindMaster serial port with -p option");
  AppID.new_name(Wind::mlf_base);
  AppID.report_startup();
  {
    Loop ELoop;
    Wind *WindP = new Wind();
    ELoop.add_child(WindP);
    
    Quit *QP = new Quit();
    ELoop.add_child(QP);
    QP->connect();
    
    TM_data_sndr *TM = new
      TM_data_sndr("TM", 0, AppID.name, &WindMaster,
        sizeof(WindMaster));
    ELoop.add_child(TM);
    TM->connect();
    
    ELoop.event_loop();
  }
  AppID.report_shutdown();
  return 0;
}
