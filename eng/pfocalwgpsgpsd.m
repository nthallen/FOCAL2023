function pfocalwgpsgpsd(varargin);
% pfocalwgpsgpsd( [...] );
% GPS Drift
h = timeplot({'GPS_TDrift'}, ...
      'GPS Drift', ...
      'Drift', ...
      {'GPS\_TDrift'}, ...
      varargin{:} );