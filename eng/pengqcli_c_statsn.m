function pengqcli_c_statsn(varargin);
% pengqcli_c_statsn( [...] );
% QCLI C stat SN
h = timeplot({'SSP_C_SN'}, ...
      'QCLI C stat SN', ...
      'SN', ...
      {'SSP\_C\_SN'}, ...
      varargin{:} );
