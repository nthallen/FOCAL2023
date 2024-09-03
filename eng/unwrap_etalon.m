function unwrap_etalon(ibase,obase,invert,scannums)
% unwrap_etalon([ibase[,obase[,invert[,scannums]]]]);
% This program is useful if spectra are inverted. It is better to fix it in hardware. 
% Should be customized for each axis and probably a specific version should be made 
% and copied into local directories.
% If invert is present and non-zero, the etalon will be inverted. If it is
% not present, no inversion will be performed.
% If scannums is present, only those scans will be unwrapped. If scannums
% is omitted, all scans will be unwrapped.
if nargin < 1 || isempty(ibase)
   ibase = find_scans_dir;
end
if nargin < 2 || isempty(obase)
   obase = [ ibase 'o' ];
end
if nargin < 3
  invert = 0;
end
if nargin < 4 || isempty(scannums)
  [wvs,ranges] = waves_used;
else
  [wvs,ranges] = waves_used(scannums);
end
if invert
  invertx = -1;
else
  invertx = 1;
end
for wvsi = 1:length(ranges)
  wv = wvs(wvsi);
  if wv.ISICOS
    %ZR = 5:wv.TzSamples;
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
          wrap = (2^31)/((hdr.NAvg+1)*hdr.NCoadd);
          fo = fi;
          fo(:,2) = invertx*(fi(:,2) - 2*(fi(:,2) > wrap)*wrap);
          po = mlf_path(obase,scan);
          mlf_mkdir(obase,scan);
          writebin( po, fo, hdr );
        end
      end
    end
  end
end
