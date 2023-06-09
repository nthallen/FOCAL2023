function pfocalqcli_qcli_m_statstatus(varargin);
% pfocalqcli_qcli_m_statstatus( [...] );
% QCLI M stat status
h = ne_dstat({
  'QCLI_M_present', 'QCLI_M_CS', 11; ...
	'QCLI_M_laser', 'QCLI_M_s', 12; ...
	'QCLI_M_cordte', 'QCLI_M_s', 11; ...
	'QCLI_M_cmderr', 'QCLI_M_s', 13; ...
	'QCLI_M_cksum', 'QCLI_M_s', 14; ...
	'QCLI_M_busy', 'QCLI_M_s', 15; ...
	'QCLI_M_loc', 'QCLI_M_s', 3; ...
	'QCLI_M_lot', 'QCLI_M_s', 4; ...
	'QCLI_M_dot', 'QCLI_M_s', 5; ...
	'QCLI_M_waveerr', 'QCLI_M_s', 8; ...
	'QCLI_M_ready', 'QCLI_M_s', 9 }, 'status', varargin{:} );
