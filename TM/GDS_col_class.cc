#include "GDS_col_class.h"
#include "nl.h"

bool GDS_col_class::acquire(uint16_t *vals) {
  if (loaded) {
    int rv = mread_subbus(mr, vals);
    if (rv < 0) {
      report_err("%s: Error %d from subbusd", iname, rv);
      return false;
    } else if (rv > 0) {
      report_err("%s: NACK on some value reported", iname);
    }
    return true;
  }
  return false;
}

float GDS_col_class::float_val(uint16_t *vals, uint16_t lsb_idx,
          uint16_t msb_idx)
{
  union {
    uint16_t uint16[2];
    float fval;
  } u;
  u.uint16[0] = vals[lsb_idx];
  u.uint16[1] = vals[msb_idx];
  return u.fval;
}

bool GDS_col_class::check_coeff( uint16_t base, int i,
                            uint16_t C_in, uint16_t C_chk)
{
  if ( C_in != C_chk ) {
    msg(2, "%s: PTRH[0x%X] C%d = 0x%04X, expected 0x%04X",
      iname, base, i, C_in, C_chk);
    return 1;
  }
  return 0;
}

void GDS_col_class::check_ms8607_coeffs(uint16_t base,
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
