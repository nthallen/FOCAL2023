%{
  #include "GDS_Bay_cmd_driver.h"
%}

&command
  : Bay &GDS_Bay_on_off_cmd &GDS_Bay_on_off * {
      GDS_Bay_cmd->command($2,$3); }
  ;

&GDS_Bay_on_off_cmd <int>
  : CO2_CAL_Gas_Inlet   { $0 = 0; }
  : CH4_CAL_Gas_Inlet   { $0 = 1; }
# : CAL_REF  { $0 = 2; }
# : CO2_REF  { $0 = 3; }
# : CAL_SPR  { $0 = 4; }
# : MM_PUMP  { $0 = 5; }
# : MM_EXH   { $0 = 6; }
# : CO2_PUMP { $0 = 7; }
# : CO2_EXH  { $0 = 8; }
# : CKT3_EN  { $0 = 9; }
# : INV_ARM  { $0 = 10; }
  ;

&GDS_Bay_on_off <int>
  : on { $0 = 1; }
  : off { $0 = 0; }
  ;
