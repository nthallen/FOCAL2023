function pfocaldacsdchs(varargin);
% pfocaldacsdchs( [...] );
% uDCH4 Status
h = ne_dstat({
  'Alert', 'uDCH4_stat0', 7; ...
	'Reset', 'uDCH4_stat0', 3; ...
	'Alert', 'uDCH4_stat0', 7; ...
	'Reset', 'uDCH4_stat0', 3 }, 'Status', varargin{:} );