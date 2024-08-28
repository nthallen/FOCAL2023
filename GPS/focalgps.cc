#include <errno.h>
#include <string.h>
#include <cmath>
#include "gps_drv.h"
#include "oui.h"
#include "nl.h"
#include "nl_assert.h"
#include "dasio/appid.h"
#include "dasio/loop.h"
#include "dasio/quit.h"
#include "dasio/tm_data_sndr.h"

using namespace DAS_IO;

const char *GPS::mlf_base = "GPS";
const char *GPS::port;
const char *GPS::mlf_config;
FOCAL_GPS_t FOCAL_GPS;

GPS::GPS() :
    Serial(mlf_base, 1024, port, O_RDONLY | O_NONBLOCK),
    mlf(0),
    ofp(0),
    Bytes_in_File(0),
    gettime_error(false)
{
  zero_sums();
  mlf = mlf_init(3, 60, 1, mlf_base, "dat", mlf_config);
  Tstamp.tv_sec = Tstamp.tv_nsec = 0;
  FileTstamp.tv_sec = FileTstamp.tv_nsec = 0;
  flags |= gflag(0);
  setup(9600,8,'n',1,-1,0);
}

bool GPS::protocol_input()
{
  // Parse input, verify and write to output file
  // Update aggregate information.
  uint16_t cksum;
  unsigned parsed = 0;
  bool no_KW;
  char KW[31], Nav_stat[31], RMC_Mode[31];
  while (nc > cp) {
    if (not_found('$')) {
      parsed = nc;
      break;
    }
    parsed = cp-1;
    if ((no_KW = not_KW(KW)) || not_found('*',true)
        || not_nhexdigits(2,cksum) || not_str("\r\n")) {
      if (cp >= nc && cp - parsed < 200) break;
      parsed = cp;
      ++FOCAL_GPS.N_errors;
      break;
    } else {
      unsigned parsed_saved = parsed;
      int nc_cksum = cp-6-parsed;
      uint8_t new_cs = checksum(buf+parsed+1, nc_cksum);
      parsed = cp; // EOM
      if (new_cs != cksum) {
        report_err("%s: Invalid checksum: should be %02X, parsed=%d N=%d",
          iname, new_cs, parsed_saved, nc_cksum);
        ++FOCAL_GPS.N_errors;
      } else {
        // Now we have complete packet and a valid checksum
        // Now backup and parse the message internals.
        cp = parsed_saved + 7;
        if (!strcmp(KW,"GNRMC")) {
          int32_t msecs_UTC;
          double Lat, Lon;
          float Speed, Course;
          int YY, MM, DD;
          if (not_GPSTime(msecs_UTC) || not_str(",") ||
              not_KW(Nav_stat) || // Must be either 'A' or 'V'
              not_GPSLat(Lat) ||
              not_GPSLon(Lon) ||
              not_float(Speed) || not_str(",") ||
              not_float(Course) || not_str(",") ||
              not_ndigits(2,DD) ||
              not_ndigits(2,MM) ||
              not_ndigits(2,YY) || not_str(",") ||
              not_KW(RMC_Mode) || not_str("*")
              ) {
            report_err("%s: Error parsing GNRMC", iname);
            ++FOCAL_GPS.N_errors;
          } else {
            FOCAL_GPS.msecs_UTC = msecs_UTC;
            switch (Nav_stat[0]) {
              case 'A': FOCAL_GPS.Nav_status = 0; break;
              case 'V': FOCAL_GPS.Nav_status = 1; break;
              default:  FOCAL_GPS.Nav_status = 2; break;
            }
            FOCAL_GPS.Lat_min_em4 =
              (Lat>0) ? floor(Lat*600000.)
                      :  ceil(Lat*600000.);
            FOCAL_GPS.Lon_min_em4 =
              (Lon>0) ? floor(Lon*600000.)
                      :  ceil(Lon*600000.);
            FOCAL_GPS.Speed = Speed;
            FOCAL_GPS.Course = Course;
            FOCAL_GPS.DD = DD;
            FOCAL_GPS.MM = MM;
            FOCAL_GPS.YY = YY;
            ++FOCAL_GPS.N_RMC;
            report_ok(0);
          }
        } else if (!strcmp(KW,"GNGGA")) {
          uint8_t Fix_Q, NSats;
          float HDOP, Alt;
          if (not_found(',') || // skip time
              not_found(',') || // Lat
              not_found(',') || // Lat ordinal
              not_found(',') || // Lon
              not_found(',') || // Lon ordinal
              not_uint8(Fix_Q) || not_str(",") ||
              not_uint8(NSats) || not_str(",") ||
              not_nfloat(&HDOP) || not_str(",") ||
              not_nfloat(&Alt) || not_str(",")) {
            ++FOCAL_GPS.N_errors;
          } else {
            FOCAL_GPS.Fix_Q = Fix_Q;
            FOCAL_GPS.NSats = NSats;
            FOCAL_GPS.HDOP = HDOP;
            FOCAL_GPS.Alt = Alt;
            ++FOCAL_GPS.N_GGA;
            report_ok(0);
          }
        } else {
          // Could record the KW
          ++FOCAL_GPS.N_other;
          cp = parsed;
        }
      }
    }
    cp = parsed;
  }
  if (parsed > 0) {
    archive(parsed);
  }
  return false;
}

bool GPS::not_GPSTime(int32_t &msecs_UTC)
{
  int hour, min;
  float sec;
  if (not_ndigits(2, hour) ||
      not_ndigits(2, min) ||
      not_float(sec) ||
      not_str(","))
    return true;
  msecs_UTC = floor(sec*1000) + min*60. + hour*3600.;
  return false;
}

bool GPS::not_GPSLatLon(double &deg, int n_digits_deg, const char *ordinals)
{
  int whole_deg;
  double minutes;
  if (buf[cp] == ',' && buf[cp+1] == ',')
  {
    deg = 9999;
    return false;
  }
  if (not_ndigits(n_digits_deg, whole_deg) ||
      not_double(minutes) || not_str(","))
    return true;
  deg = whole_deg + minutes/60.;
  if (buf[cp] == ordinals[0] && buf[cp+1] == ',') {
    cp += 2;
    return false;
  }
  if (buf[cp] == ordinals[1] && buf[cp+1] == ',') {
    cp += 2;
    deg = -deg;
    return false;
  }
  return true; // mismatched ordinal?
}


/** Called after TM data is sent
 */
bool GPS::tm_sync()
{
  // ### Load up FOCAL_GPS with current averages
  // ### reset averages
  FOCAL_GPS.mlf_index = mlf->index;
  if (FileTstamp.tv_sec) {
    int32_t dsecs = Tstamp.tv_sec - FileTstamp.tv_sec;
    int32_t dnsecs = Tstamp.tv_nsec - FileTstamp.tv_nsec;
    if (dnsecs < 0) {
      --dsecs;
      dnsecs += 1000000000;
    }
    FOCAL_GPS.mlf_time = dsecs*1000 + dnsecs/1000000;
  }
  zero_sums();
  return false;
}

const char *GPS::ISO8601() {
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

void GPS::write_tstamp()
{ // T,ISO8601,CS\r\n
  nl_assert(ofp);
  char tbuf[64]; // ISO8601 is 23 @ msec res.
  int nb = snprintf(tbuf, 64, "T,%s,", ISO8601());
  uint8_t cs = checksum((uint8_t*)tbuf, nb);
  nl_assert(nb < 55);
  nb += snprintf(tbuf+nb, 64-nb, "%02X\r\n", cs);
  fprintf(ofp, "%s", tbuf);
  Bytes_in_File += nb;
}

uint8_t GPS::checksum(const uint8_t *csbuf, int nb) {
  uint8_t cs = 0;
  for (int i = 0; i < nb; ++i) {
    cs ^= csbuf[i];
  }
  return cs;
}

/**
 * Assumes Tstamp has been updated appropriately, which is
 * done in archive().
 */
void GPS::next_file()
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

void GPS::archive(unsigned parsed)
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
  uint8_t save_char = buf[parsed];
  buf[parsed] = 0;
  fprintf(ofp, "%s", buf);
  buf[parsed] = save_char;
  Bytes_in_File += parsed;
  consume(parsed);
}

void GPS::zero_sums() {
  FOCAL_GPS.N_RMC = 0;
  FOCAL_GPS.N_GGA = 0;
  FOCAL_GPS.N_other = 0;
  FOCAL_GPS.N_errors = 0;
}

int main(int argc, char **argv) {
  oui_init_options(argc, argv);
  if (!GPS::port)
    msg(MSG_FATAL,
      "Must specify GPS serial port with -p option");
  AppID.new_name(GPS::mlf_base);
  AppID.report_startup();
  {
    Loop ELoop;
    GPS *GPSp = new GPS();
    ELoop.add_child(GPSp);
    
    Quit *Qp = new Quit();
    ELoop.add_child(Qp);
    Qp->connect();
    
    TM_data_sndr *TM = new
      TM_data_sndr("TM", 0, AppID.name, &FOCAL_GPS,
        sizeof(FOCAL_GPS));
    ELoop.add_child(TM);
    TM->connect();
    
    ELoop.event_loop();
  }
  AppID.report_shutdown();
  return 0;
}
