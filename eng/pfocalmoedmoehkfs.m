function pfocalmoedmoehkfs(varargin);
% pfocalmoedmoehkfs( [...] );
% uD MOE HK F Sat
h = ne_dstat({
  'FSat0_CH4', 'uD_MOE_stat0', 1; ...
	'FSat1_CH4', 'uD_MOE_stat1', 1; ...
	'FSat2_CH4', 'uD_MOE_stat2', 1; ...
	'FSat3_CH4', 'uD_MOE_stat3', 1; ...
	'FSat4_CH4', 'uD_MOE_stat4', 1; ...
	'FSat5_CH4', 'uD_MOE_stat5', 1; ...
	'FSat6_CH4', 'uD_MOE_stat6', 1; ...
	'FSat7_CH4', 'uD_MOE_stat7', 1 }, 'F Sat', varargin{:} );
