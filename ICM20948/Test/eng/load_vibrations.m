function res = load_vibrations(base, fnum)
if nargin < 1 || isempty(base)
  base = 'C:\cygwin64\home\focal\ICMtest\raw\junk\240906.3\ICM';
end
% fnum = icmteng_1.ICM_mlf;
fnums = unique(fnum);
fnums = fnums(fnums>0);

for i=length(fnums):-1:1
  path = mlf_path(base,fnums(i));
  fdata(i) = load_vibfile(path, 1);
end
trows = sum([fdata.nrows]);
res.data = zeros(trows, 3);
res.fnum = zeros(trows, 1);
nrows = 0;
for i = 1:length(fnums)
  fnum = fnums(i);
  rows = nrows + (1:fdata(i).nrows);
  res.data(rows,:) = fdata(i).data;
  res.fnum(rows) = fnum;
  nrows = nrows+fdata(i).nrows;
end
fprintf(1,'Parsed\n');

function dev = load_vibfile(ifile, NS)
trows = zeros(NS,1);
dev(NS) = struct('data', [], 'nrows', 0);
for i=1:NS-1
  dev(i) = dev(NS);
end
% ifile = '00.dat';
fid = fopen(ifile,'r');
data = fread(fid,'int16');
data = reshape(data,3,[])';
fclose(fid);
nrow = 1;
while nrow < size(data,1)
  devno = data(nrow,1)+1;
  nrows = data(nrow,3);
  nrow = nrow + nrows + 1;
  trows(devno) = trows(devno)+nrows;
end
for i=1:NS
  dev(i).data = zeros(trows(i),3);
end
nrow = 1;
while nrow < size(data,1)
  devno = data(nrow,1)+1;
  nrows = data(nrow,3);
  fs = data(nrow,2);
  rdata = data(nrow+(1:nrows),:) * 2^(fs-14);
  dev(devno).data(dev(devno).nrows + (1:nrows),:) = rdata;
  dev(devno).nrows = dev(devno).nrows + nrows;
  nrow = nrow + nrows + 1;
end
