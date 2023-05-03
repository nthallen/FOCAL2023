function fig = gfocalqcli_c_stat(varargin);
% gfocalqcli_c_stat(...)
% QCLI C stat
ffig = ne_group(varargin,'QCLI C stat','pfocalqcli_c_statsn','pfocalqcli_c_stats','pfocalqcli_c_staterr','pfocalqcli_c_statfifodep','pfocalqcli_c_statflash','pfocalqcli_c_statmode','pfocalqcli_c_statrw','pfocalqcli_c_statstatus','pfocalqcli_c_statskip');
if nargout > 0 fig = ffig; end
