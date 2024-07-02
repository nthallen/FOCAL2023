#include "sb_driver.h"

class GDS_cmd_driver : public SB_driver {
  public:
    inline GDS_cmd_driver(const char *service, const char *subservice) :
      SB_driver(service, subservice) {}
    void init(); // Any setup required by the command server
    void command(int pin_idx, int on_off);
};

extern GDS_cmd_driver *GDS_cmd;
