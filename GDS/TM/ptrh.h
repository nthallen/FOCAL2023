#ifndef PTRH_H_INCLUDED
#define PTRH_H_INCLUDED

/**
 * @brief MS8607 PTRH Functionality
 */
class PTRH {
  public:
    ptrh( const char *id, uint16_t base, uint16_t C1, uint16_t C2,
           uint16_t C3, uint16_t C4, uint16_t C5, uint16_t C6);
    void check_coeffs();
    void acquire();
    inline uint16_t Status() { return P[0]; }
    inline uint16_t MS5607Ta() { return P[5]; }
    inline unsigned char MS5607Tb() { return P[6]; }
    inline uint16_t MS5607Pa() { return P[3]; }
    inline unsigned char MS5607Pb() { return P[4]; }
    double MS5607T( uint16_t Dta, uint16_t Dtb);
    double MS5607P( uint16_t Dpa, uint16_t Dpb);
  private:
    const char *id;
    uint16_t base_addr;
    uint16_t C[6];
    uint16_t P[7];
    subbus_mread_req *preq;
    double C1d, C2d, C3d, C4d, C6d;
    unsigned long C5d;
    double Off, Sens;
    int check_coeff( int i, uint16_t C);
    void pack();
    int stale;
};

/* On-Board MS8607 PTRH */
ms8_base = hex2dec('60'); % 0x60

% Read Coefficients
rm_obj = read_multi_prep([ms8_base+5,1,ms8_base+10]);  % [0x65 - 0x6A]
[vals,~] = read_multi(s,rm_obj);
%
if isempty(vals) || length(vals) ~= 6 
  error('vals length was %d, expected 6', length(vals));
end
%
fprintf(1, '\nMS8607 Coefficients:\n');
for i=1:6
  fprintf(1, '  C%d: %x  %d\n', i, vals(i), vals(i));
end
%% P, T, and RH
%
rm_obj = read_multi_prep([ms8_base+1,1,ms8_base+16]); % 0x61 - 0x70

fprintf(1, '\nMS8607 Pressure, Temperature, and Relative Humidity:\n');
for i=0:9
  [vals,ack] = read_multi(s, rm_obj);
  
PTRHread = struct( ...
  'T', { typecast(uint32(vals(3)+65536*vals(4)),'single') }, ...
  'P', { typecast(uint32(vals(1)+65536*vals(2)),'single') }, ...
  'RH', { vals(16) });
  
  fprintf(1,'P%d: %7.3f mBar ( %7.3f Torr )  T%d: %7.3f degC  RH%d: %5.2f %%\n', ...
    i, PTRHread.P, (PTRHread.P * 0.750062), i, PTRHread.T, i, PTRHread.RH/100);
 
  pause(1);
end
#endif
