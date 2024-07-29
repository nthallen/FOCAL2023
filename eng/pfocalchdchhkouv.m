function pfocalchdchhkouv(varargin);
% pfocalchdchhkouv( [...] );
% uDCH4 HK OUV
h = ne_dstat({
  'OUV0_CH4', 'uDCH4_stat0', 0; ...
	'OUV1_CH4', 'uDCH4_stat1', 0; ...
	'OUV2_CH4', 'uDCH4_stat2', 0; ...
	'OUV3_CH4', 'uDCH4_stat3', 0; ...
	'OUV4_CH4', 'uDCH4_stat4', 0; ...
	'OUV5_CH4', 'uDCH4_stat5', 0; ...
	'OUV6_CH4', 'uDCH4_stat6', 0; ...
	'OUV7_CH4', 'uDCH4_stat7', 0 }, 'OUV', varargin{:} );
