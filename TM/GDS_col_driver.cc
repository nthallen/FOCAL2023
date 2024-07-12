#include "GDS_col_driver.h"
#include "nl.h"

void GDS_col_driver::setup() {
  mr = pack_mread_request(n_reads_mr, "20:1:31,10,61:1:64,70");
  uint16_t coeffs[] =
    {0xB2BB, 0xAD3D, 0x69EE, 0x6AFC, 0x7E3F, 0x67F2};
  check_ms8607_coeffs(0x65, coeffs);
}
