#include "GDS_MOE_col_driver.h"

void GDS_MOE_col_driver::setup() {
  mr = pack_mread_request(n_reads_mr,
    "20,22,31,61:1:64,70");
  uint16_t coeffs[] =
    { 0, 0, 0, 0, 0, 0};
  check_ms8607_coeffs(0x65, coeffs);
}
