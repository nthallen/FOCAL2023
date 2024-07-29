function pfocalcocoehkc(varargin);
% pfocalcocoehkc( [...] );
% COE HK Cmd
h = ne_dstat({
  'At_T_Sig', 'GDS_COE_cmd_stat', 0; ...
	'At_T_Ref', 'GDS_COE_cmd_stat', 1 }, 'Cmd', varargin{:} );
