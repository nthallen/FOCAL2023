function fig = gengqcli_c_stat(varargin);
% gengqcli_c_stat(...)
% QCLI C stat
ffig = ne_group(varargin,'QCLI C stat','pengqcli_c_statsn','pengqcli_c_stats','pengqcli_c_staterr','pengqcli_c_statfifodep','pengqcli_c_statflash','pengqcli_c_statmode','pengqcli_c_statrw','pengqcli_c_statstatus','pengqcli_c_statskip');
if nargout > 0 fig = ffig; end
