function pfocalmoechft(varargin);
% pfocalmoechft( [...] );
% CH4 Flow T
h = timeplot({'CH4_SamInT','CH4_SamOutT'}, ...
      'CH4 Flow T', ...
      'Flow T', ...
      {'CH4\_SamInT','CH4\_SamOutT'}, ...
      varargin{:} );
