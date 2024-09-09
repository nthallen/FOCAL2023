function fig = gfocalwgpsgps(varargin);
% gfocalwgpsgps(...)
% GPS
ffig = ne_group(varargin,'GPS','pfocalwgpsgpsd','pfocalwgpsgpsl','pfocalwgpsgpslon','pfocalwgpsgpsa','pfocalwgpsgpss','pfocalwgpsgpsc');
if nargout > 0 fig = ffig; end
