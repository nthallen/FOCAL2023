#ifndef GDS_COE_COL_DRIVER_H_INCLUDED
#define GDS_COE_COL_DRIVER_H_INCLUDED

#include "GDS_col_class.h"

class GDS_COE_col_driver : public GDS_col_class {
  public:
    inline GDS_COE_col_driver(const char *service, const char *subservice) :
      GDS_col_class(service, subservice) {}
    void setup() override;
    static const int n_reads_mr = 13;
    uint16_t vals[n_reads_mr];
    inline float float_val(uint16_t lsb_idx, uint16_t msb_idx)
      { return GDS_col_class::float_val(vals, lsb_idx, msb_idx); }
    inline bool acquire() { return GDS_col_class::acquire(vals); }
  protected:
};

extern GDS_COE_col_driver *GDS_COE_col;

#endif
