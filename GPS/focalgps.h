#ifndef FOCALGPS_H_INCLUDED
#define FOCALGPS_H_INCLUDED
#include <cstdint>

typedef struct {
  int32_t msecs_UTC;
  // Stored as integer minutes * 1e-4
  // i.e. one degree is 600000. Number of whole degrees
  // of Latitude are then Lat_min_em4/600000.
  int32_t Lat_min_em4, Lon_min_em4;
  float Speed, Course; // Average of the most recent N_samples values
  float Alt; // Just latest
  float HDOP;
  ///< secs * 1000 time when current log file was opened
  int32_t mlf_time;

  uint16_t mlf_index;

  // YY = years since 2000
  // MM = month number 1-12
  // DD = day number 1-31
  uint8_t YY, MM, DD;
  uint8_t N_RMC;

  uint8_t Fix_Q; // 0=Invalid, 1=GPS, 2=DGPS
  uint8_t N_Sats;
  uint8_t N_GGA;

  uint8_t N_other;
  uint8_t N_errors;

  uint8_t Nav_status; // A=0 (OK) V=1 (warning)
} FOCAL_GPS_t;

extern FOCAL_GPS_t FOCAL_GPS;

#endif
