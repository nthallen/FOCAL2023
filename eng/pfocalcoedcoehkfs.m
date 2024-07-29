function pfocalcoedcoehkfs(varargin);
% pfocalcoedcoehkfs( [...] );
% uD COE HK F Sat
h = ne_dstat({
  'FSat0_CO2', 'uD_COE_stat0', 1; ...
	'FSat1_CO2', 'uD_COE_stat1', 1; ...
	'FSat2_CO2', 'uD_COE_stat2', 1; ...
	'FSat3_CO2', 'uD_COE_stat3', 1; ...
	'FSat4_CO2', 'uD_COE_stat4', 1; ...
	'FSat5_CO2', 'uD_COE_stat5', 1; ...
	'FSat6_CO2', 'uD_COE_stat6', 1; ...
	'FSat7_CO2', 'uD_COE_stat7', 1 }, 'F Sat', varargin{:} );