function pfocalcodcohkfs(varargin);
% pfocalcodcohkfs( [...] );
% uDCO2 HK F Sat
h = ne_dstat({
  'FSat0_CO2', 'uDCO2_stat0', 1; ...
	'FSat1_CO2', 'uDCO2_stat1', 1; ...
	'FSat2_CO2', 'uDCO2_stat2', 1; ...
	'FSat3_CO2', 'uDCO2_stat3', 1; ...
	'FSat4_CO2', 'uDCO2_stat4', 1; ...
	'FSat5_CO2', 'uDCO2_stat5', 1; ...
	'FSat6_CO2', 'uDCO2_stat6', 1; ...
	'FSat7_CO2', 'uDCO2_stat7', 1 }, 'F Sat', varargin{:} );
