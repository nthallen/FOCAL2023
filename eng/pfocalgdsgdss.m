function pfocalgdsgdss(varargin);
% pfocalgdsgdss( [...] );
% GDS Status
h = ne_dstat({
  'GDS_Cal_Hi', 'GDS_cmd_stat', 0; ...
	'GDS_Cal_Lo', 'GDS_cmd_stat', 0; ...
	'GDS_Cal_Ref', 'GDS_cmd_stat', 0; ...
	'GDS_CO2_Ref', 'GDS_cmd_stat', 0; ...
	'GDS_Cal_Spr', 'GDS_cmd_stat', 0; ...
	'GDS_MM_Pump', 'GDS_cmd_stat', 0; ...
	'GDS_MM_Exh', 'GDS_cmd_stat', 0; ...
	'GDS_CO2_Pump', 'GDS_cmd_stat', 0; ...
	'GDS_CO2_Exh', 'GDS_cmd_stat', 0; ...
	'GDS_Ckt3_En', 'GDS_cmd_stat', 0; ...
	'GDS_Inv_Arm', 'GDS_cmd_stat', 0 }, 'Status', varargin{:} );
