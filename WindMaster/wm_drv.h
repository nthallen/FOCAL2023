#ifndef WM_DRV_H_INCLUDED
#define WM_DRV_H_INCLUDED

#include <fcntl.h>
#include <stdio.h>
#include <time.h>
#include "windmaster.h"
#include "mlf.h"
#include "dasio/serial.h"

using namespace DAS_IO;

class Wind : public Serial
{
  public:
    Wind();
    static const char *mlf_base;
    static const char *port;
    static const char *mlf_config;
  protected:
    bool protocol_input() override;
    bool tm_sync() override;
    const char *ISO8601();
    void write_tstamp();
    uint8_t checksum(const uint8_t *csbuf, int nc);
    void next_file();
    void archive();
    void zero_sums();
    mlf_def_t *mlf;
    FILE *ofp;
    int Bytes_in_File;
    struct timespec Tstamp;
    struct timespec FileTstamp;
    struct {
      float U, V, W, SoS, SonicTemp;
    } sum;
    int16_t N_samples;
    int16_t N_errors;
    bool gettime_error;
    static const int Bytes_per_File = 40960;
};

extern WindMaster_t WindMaster;

#endif
