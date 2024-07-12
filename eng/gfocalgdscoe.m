function fig = gfocalgdscoe(varargin);
% gfocalgdscoe(...)
% COE
ffig = ne_group(varargin,'COE','pfocalgdscoecp','pfocalgdscoedt','pfocalgdscoetemi','pfocalgdscoep','pfocalgdscoet','pfocalgdscoerh');
if nargout > 0 fig = ffig; end
