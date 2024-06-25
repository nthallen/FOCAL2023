#include "GDS_col_driver.h"
#include "nl.h"

void GDS_col_driver::init() {
  if (load()) {
    msg(MSG, "%s: connected to %s", iname, get_subbus_name());
  }
  mr = pack_mread_request(n_reads_mr, "20:1:31,10,61:1:64,70");
uint16_t coeffs[] =
  {0xB2BB, 0xAD3D, 0x69EE, 0x6AFC, 0x7E3F, 0x67F2};
  check_ms8607_coeffs(0x65, coeffs);
}

void GDS_col_driver::acquire() {
  int rv = mread_subbus(mr, vals);
  if (rv < 0) {
    report_err("%s: Error %d from subbusd", iname, rv);
  } else if (rv > 0) {
    report_err("%s: NACK on some value reported", iname);
  }
}

float GDS_col_driver::float_val(uint16_t lsb_idx, uint16_t msb_idx) {
  union {
    uint16_t uint16[2];
    float fval;
  } u;
  u.uint16[0] = vals[lsb_idx];
  u.uint16[1] = vals[msb_idx];
  return u.fval;
}

bool GDS_col_driver::check_coeff( uint16_t base, int i,
                            uint16_t C_in, uint16_t C_chk)
{
  if ( C_in != C_chk ) {
    msg(2, "%s: PTRH[0x%X] C%d = 0x%04X, expected 0x%04X",
      iname, base, i, C_in, C_chk);
    return 1;
  }
  return 0;
}

void GDS_col_driver::check_ms8607_coeffs(uint16_t base,
            uint16_t *coeffs)
{
  int i, ok = 1, rv;
  uint16_t CR[6];
  char req[15];
  subbus_mread_req *creq;
  
  snprintf(req, 15, "%X:1:%X", base, base + 5);
  creq = pack_mread_request(6, req);
  rv = mread_subbus(creq, CR);
  free_memory(creq);
  if ( rv < 0 ) {
    msg(2, "%s: PTRH[0x%X] Error %d reported by subbus_serusb",
      iname, base, rv);
  } else {
    if ( rv > 0 )
      msg( 2, "%s: PTRH[0x%X] NACK (at least one) reading coefficients",
        iname, base);
    for (i = 1; i <= 6; ++i) {
      if ( check_coeff(base, i, CR[i-1], coeffs[i-1]) )
        ok = 0;
    }
    if (ok) msg(0, "%s: PTRH[0x%X] Coefficients checked OK",
          iname, base);
  }
}
