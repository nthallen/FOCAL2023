function picmttmram(varargin);
% picmttmram( [...] );
% T Mbase RAM
h = timeplot({'memused'}, ...
      'T Mbase RAM', ...
      'RAM', ...
      {'memused'}, ...
      varargin{:} );