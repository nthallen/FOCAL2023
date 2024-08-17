#ifndef WINDMASTER_H_INCLUDED
#define WINDMASTER_H_INCLUDED

typedef struct {
  float U, V, W; // Average of the most recent N_samples values
  float SoS;
  float SonicTemp;
  ///< secs * 1000 time when current log file was opened
  int32_t mlf_time;
  uint16_t mlf_index;
  uint16_t N_samples;
  uint16_t N_errors;
} WindMaster_t;

// extern WindMaster_t WindMaster;

#endif
