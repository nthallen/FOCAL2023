function pfocalcoedcoes(varargin);
% pfocalcoedcoes( [...] );
% uD COE Status
h = ne_dstat({
  'Alert_CO2', 'uD_COE_stat0', 7; ...
	'Reset_CO2', 'uD_COE_stat0', 3 }, 'Status', varargin{:} );
