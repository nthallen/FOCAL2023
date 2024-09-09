function pfocalwgpsgpshks(varargin);
% pfocalwgpsgpshks( [...] );
% GPS HK Status
h = ne_dstat({
  'GPS_Fix', 'GPS_Fix_Q', 0; ...
	'GPS_warn', 'GPS_Nav_status', 0 }, 'Status', varargin{:} );
