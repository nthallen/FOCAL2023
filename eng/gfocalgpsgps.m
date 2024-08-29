function fig = gfocalgpsgps(varargin);
% gfocalgpsgps(...)
% GPS
ffig = ne_group(varargin,'GPS','pfocalgpsgpsd','pfocalgpsgpsl','pfocalgpsgpslon','pfocalgpsgpsa','pfocalgpsgpss','pfocalgpsgpsc');
if nargout > 0 fig = ffig; end
