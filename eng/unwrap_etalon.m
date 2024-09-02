function unwrap_etalon(ibase,obase)
% unwrap_scans([ibase[,obase]]);
% This program is useful if spectra are inverted. It is better to fix it in hardware. 
% Should be customized for each axis and probably a specific version should be made 
% and copied into local directories.
if nargin < 1 || isempty(ibase)
   ibase = find_scans_dir;
end
if nargin < 2 || isempty(obase)
   obase = [ ibase 'o' ];
end
[wvs,ranges] = waves_used;
for wvsi = 1:length(ranges)
  wv = wvs(wvsi);
  if wv.ISICOS
    %ZR = 5:wv.TzSamples;
    wrap = (2^31)/(wv.NAverage*wv.NCoadd);
    for rngi = 1:size(ranges(wvsi).ranges,1)
      range = ranges(wvsi).ranges(rngi,:);
      scans = range(1):range(2);
      for i=1:length(scans)
        scan = scans(i);
        pi = mlf_path(ibase,scan);
        [fi,hdr] = loadbin(pi);
        if isempty(fi)
          warning('File not found: %d => %s', scan, ibase);
        else
          fo = fi;
          fo(:,2) = 2*(fi(:,2) > wrap)*wrap - fi(:,2);
          po = mlf_path(obase,scan);
          mlf_mkdir(obase,scan);
          writebin( po, fo, hdr );
        end
      end
    end
  end
end
