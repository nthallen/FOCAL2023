#ifndef GPS_DRV_H_INCLUDED
#define GPS_DRV_H_INCLUDED

#include <fcntl.h>
#include <stdio.h>
#include <time.h>
#include "focalgps.h"
#include "mlf.h"
#include "dasio/serial.h"

using namespace DAS_IO;

class GPS : public Serial
{
  public:
    GPS();
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
    void archive(unsigned parsed);
    void zero_sums();
    
    /**
     * @param msecs_UTC On success, contains msecs since 00:00:00 UTC
     * @return false on success
     */
    bool not_GPSTime(int32_t &msecs_UTC);

    /**
     * @param deg On success, records degrees
     * @param n_digits_deg The number of initial digits that record whole degrees
     * @param ordinals String with two characters
     * @returns false on success
     *
     * If the next character is a comma, deg will be set to 9999 return false.
     *
     * The first ordinal character indicates the value should be positive. The
     * second indicates the value should be negative. If neither matches, it is
     * considered an error, and true is returned.
     *
     * On success, cp is positioned after the comma following the ordinal letter.
     */
    bool not_GPSLatLon(int32_t &min_em4, int n_digits_deg, const char *ordinals);

    /**
     * @param deg On success records degrees of North Latitude
     * @return false on success
     */
    inline bool not_GPSLat(int32_t &min_em4)
    {
      return not_GPSLatLon(min_em4, 2, "NS");
    }

    /**
     * @param deg On success records degress of West Longitude
     * @return false on success
     */
    inline bool not_GPSLon(int32_t &min_em4)
    {
      return not_GPSLatLon(min_em4, 3, "WE"); 
    }
    
    mlf_def_t *mlf;
    FILE *ofp;
    int Bytes_in_File;
    struct timespec Tstamp;
    struct timespec FileTstamp;
    bool gettime_error;
    static const int Bytes_per_File = 40960;
};

#endif
