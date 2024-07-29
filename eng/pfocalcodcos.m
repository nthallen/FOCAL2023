function pfocalcodcos(varargin);
% pfocalcodcos( [...] );
% uDCO2 Status
h = ne_dstat({
  'Alert_CO2', 'uDCO2_stat0', 7; ...
	'Reset_CO2', 'uDCO2_stat0', 3 }, 'Status', varargin{:} );
