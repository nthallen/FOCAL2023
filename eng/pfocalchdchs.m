function pfocalchdchs(varargin);
% pfocalchdchs( [...] );
% uDCH4 Status
h = ne_dstat({
  'Alert_CH4', 'uDCH4_stat0', 7; ...
	'Reset_CH4', 'uDCH4_stat0', 3 }, 'Status', varargin{:} );
