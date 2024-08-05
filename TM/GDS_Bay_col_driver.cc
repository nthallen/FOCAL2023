#include "GDS_Bay_col_driver.h"
#include "nl.h"

void GDS_Bay_col_driver::setup() {
  mr = pack_mread_request(n_reads_mr,
  "20,21,22,27:1:2C,31,10,61:1:64,70");
  uint16_t coeffs[] =
    {0, 0, 0, 0, 0, 0};
  check_ms8607_coeffs(0x65, coeffs);
}
