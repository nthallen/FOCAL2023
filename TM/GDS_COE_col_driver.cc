#include "GDS_COE_col_driver.h"

void GDS_COE_col_driver::setup() {
  mr = pack_mread_request(n_reads_mr,
    "20,22:1:26,31,10,61:1:64,70");
  uint16_t coeffs[] =
    { 0xA8EE, 0xAD60, 0x64EF, 0x697F, 0x7FF9, 0x6875};
  check_ms8607_coeffs(0x65, coeffs);
}
