%{
  #include "GDS_cmd_driver.h"
%}

&command
  : Gas Deck &GD_on_off_cmd &GD_on_off * { GDS_cmd->command($3,$4); }
  ;

&GD_on_off_cmd <int>
  : CAL_HI   { $0 = 0; }
  : CAL_LO   { $0 = 1; }
  : CAL_REF  { $0 = 2; }
  : CO2_REF  { $0 = 3; }
  : CAL_SPR  { $0 = 4; }
  : MM_PUMP  { $0 = 5; }
  : MM_EXH   { $0 = 6; }
  : CO2_PUMP { $0 = 7; }
  : CO2_EXH  { $0 = 8; }
  : CKT3_EN  { $0 = 9; }
  : INV_ARM  { $0 = 10; }
  ;

&GD_on_off <int>
  : on { $0 = 1; }
  : off { $0 = 0; }
  ;
