#ifndef GDS_Bay_CMD_DRIVER_H_INCLUDED
#define GDS_Bay_CMD_DRIVER_H_INCLUDED

#include "sb_driver.h"

class GDS_Bay_cmd_driver : public SB_driver {
  public:
    inline GDS_Bay_cmd_driver(const char *service, const char *subservice) :
      SB_driver(service, subservice) {}
    void init(); // Any setup required by the command server
    void command(int pin_idx, int on_off);
};

extern GDS_Bay_cmd_driver *GDS_Bay_cmd;

#endif
