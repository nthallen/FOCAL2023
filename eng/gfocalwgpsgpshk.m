function fig = gfocalwgpsgpshk(varargin);
% gfocalwgpsgpshk(...)
% GPS HK
ffig = ne_group(varargin,'GPS HK','pfocalwgpsgpshkhdop','pfocalwgpsgpshks','pfocalwgpsgpshkstale');
if nargout > 0 fig = ffig; end
