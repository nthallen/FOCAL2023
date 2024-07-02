#include "GDS_cmd_driver.h"
#include "nl.h"

void GDS_cmd_driver::init() {
  if (load()) {
    msg(MSG, "%s: connected to %s", iname, get_subbus_name());
  }
  // Any setup required by the command server
}

void GDS_cmd_driver::command(int pin_idx, int on_off) {
  if (pin_idx < 0 || pin_idx > 11)
    msg(2, "%s: pin index %d out of range, ignored",
      iname, pin_idx);
  else if (on_off < 0 || on_off > 1)
    msg(2, "%s: on_off value %d out of range, ignored",
      iname, on_off);
  else if (fd >= 0) {
    write_ack(0x10, pin_idx*2 + on_off);
  }
}
