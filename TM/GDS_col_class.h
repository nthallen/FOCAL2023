#ifndef GDS_COL_CLASS_H_INCLUDED
#define GDS_COL_CLASS_H_INCLUDED

#include "sb_driver.h"

class GDS_col_class : public SB_driver {
  public:
    inline GDS_col_class(const char *service, const char *subservice) :
      SB_driver(service, subservice) {}
    void acquire(uint16_t *vals);
    float float_val(uint16_t *vals, uint16_t lsb_idx, uint16_t msb_idx);
  protected:
    void check_ms8607_coeffs(uint16_t base, uint16_t *coeffs);
    bool check_coeff( uint16_t base, int i, uint16_t C_in,
                      uint16_t C_chk);
    subbus_mread_req *mr;
};

#endif
