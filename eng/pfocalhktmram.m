function pfocalhktmram(varargin);
% pfocalhktmram( [...] );
% HKT Mbase RAM
h = timeplot({'memused'}, ...
      'HKT Mbase RAM', ...
      'RAM', ...
      {'memused'}, ...
      varargin{:} );
