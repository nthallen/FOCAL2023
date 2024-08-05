function pfocalbbcs(varargin);
% pfocalbbcs( [...] );
% Bay Cmd Status
h = ne_dstat({
  'CO2_CAL_Gas_Inlet', 'GDS_Bay_cmd_stat', 0; ...
	'CH4_CAL_Gas_Inlet', 'GDS_Bay_cmd_stat', 1 }, 'Cmd Status', varargin{:} );
