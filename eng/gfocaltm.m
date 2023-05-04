function fig = gfocaltm(varargin);
% gfocaltm(...)
% T Mbase
ffig = ne_group(varargin,'T Mbase','pfocaltmtd','pfocaltmcpu','pfocaltmram','pfocaltmd');
if nargout > 0 fig = ffig; end
