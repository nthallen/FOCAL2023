function pfocalqcli_qcli_c_stats(varargin);
% pfocalqcli_qcli_c_stats( [...] );
% QCLI C stat Stale
h = timeplot({'QCLI_C_Stale','SSP_C_Stale'}, ...
      'QCLI C stat Stale', ...
      'Stale', ...
      {'QCLI\_C\_Stale','SSP\_C\_Stale'}, ...
      varargin{:} );