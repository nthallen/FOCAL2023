function picmticmhkstatus(varargin);
% picmticmhkstatus( [...] );
% ICM HK Status
h = ne_dstat({
  'ICM_nack', 'ICM_fs', 2 }, 'Status', varargin{:} );
