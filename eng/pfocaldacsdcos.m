function pfocaldacsdcos(varargin);
% pfocaldacsdcos( [...] );
% uDAC Su DCO2 Status
h = ne_dstat({
  'Alert', 'uDCO2_stat0', 7; ...
	'Reset', 'uDCO2_stat0', 3 }, 'Status', varargin{:} );
