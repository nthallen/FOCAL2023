function fig = gfocalgpsgpshk(varargin);
% gfocalgpsgpshk(...)
% GPS HK
ffig = ne_group(varargin,'GPS HK','pfocalgpsgpshkhdop','pfocalgpsgpshks','pfocalgpsgpshkstale');
if nargout > 0 fig = ffig; end
