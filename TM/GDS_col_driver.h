#include "sb_driver.h"

class GDS_col_driver : public SB_driver {
  public:
    inline GDS_col_driver(const char *service, const char *subservice) :
      SB_driver(service, subservice) {}
    void init(); // Any setup required by collection
    void acquire(); // Code to retrieve data
    float float_val(uint16_t lsb_idx, uint16_t msb_idx);
    static const int n_reads_mr = 24;
    uint16_t vals[n_reads_mr];
  protected:
    void check_ms8607_coeffs(uint16_t base, uint16_t *coeffs);
    bool check_coeff( uint16_t base, int i, uint16_t C_in,
                      uint16_t C_chk);
    subbus_mread_req *mr;
};

extern GDS_col_driver *GDS_col;
