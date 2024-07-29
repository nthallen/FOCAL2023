function pfocalmoedmoes(varargin);
% pfocalmoedmoes( [...] );
% uD MOE Status
h = ne_dstat({
  'Alert_CH4', 'uD_MOE_stat0', 7; ...
	'Reset_CH4', 'uD_MOE_stat0', 3 }, 'Status', varargin{:} );
