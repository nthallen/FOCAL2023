#include "GDS_COE_col_driver.h"
#include "nl.h"
#include "nl_assert.h"

void GDS_COE_col_driver::setup() {
  mr = pack_mread_request(n_reads_mr,
    "20,22:1:26,31,10,61:1:64,70");
  uint16_t coeffs[] =
    { 0, 0, 0, 0, 0, 0};
  check_ms8607_coeffs(0x65, coeffs);
}
