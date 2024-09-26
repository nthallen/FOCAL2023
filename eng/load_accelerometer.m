function A = load_accelerometer()
% A = load_accelerometer();
%
% Uses FOCAL_DATA_DIR (as does getrun and ui_focal) to locate the
% housekeeping data. We also need to know the location of the raw
% data in order to access the raw accelerometer data. I will use the
% following heuristic:
%   If FOCAL_RAW_DATA_DIR is a script, run it to return the directory name.
%   This is equivalent to FOCAL_DATA_DIR, so could be:
%
%  function path = FOCAL_RAW_DATA_DIR
%  % path = FOCAL_RAW_DATA_DIR;
%  path = 'C:\cygwin64\home\focal\raw\data';
%
%   Note that the path here is hard-coded to be the raw/data directory.
%
%  If that does not locate the run, we will try the following directories:
%    /home/focal/raw/data
%    c:\cygwin64\home\focal\raw\data
%
[ D, T ] = ne_load('focaleng_1', 'FOCAL_DATA_DIR');
pdir = 'FOCAL_RAW_DATA_DIR';
rawpath = { '/home/focal/raw/data';
            'c:\cygwin64\home\focal\raw\data';
            '..'}; 
run = getrun(1);
base = '';

for i=0:length(rawpath)
  if i < 1
    if exist(pdir,'file')
      rawdir = FOCAL_RAW_DATA_DIR;
      if ~exist(rawdir,'dir')
        error('Function "%s" did not return a directory', pdir);
      end
    else
      rawdir = [];
    end
  else
    rawdir = rawpath{i};
  end
  if ~isempty(rawdir)
    accelpath = [ rawdir filesep run filesep 'Accel'];
    if exist(accelpath, 'dir')
      base = accelpath;
      break;
    end
  end
end

if isempty(base)
  error('Unable to locate Accel directory for run "%s"', run);
end
%%
% Note: I am using the term 'sample' to refer to the 1 Hz reports.
% I am using 'row' or 'pts' to refer to the higher-rate raw data.
% I will try not to confuse the two too often!

%
%%
% i = 1;
% fname = mlf_path(base,i);
% fid = fopen(fname,'r');
% A = fread(fid,'int16');
% fclose(fid);
% assert(mod(length(A),3)==0);
% B = reshape(A,3,[])';
%
% ICM_sps indicates the number of samples that were collected during
% the previous second.
% ICM_mlf indicates the Accel multi-level file index that contains those
% samples.
% The telemetry time associated with a particular number of samples is
% clearly related to the last sample, rather than the first. However, to be
% more precise, ICM_msecs reports the number of msecs into the previous
% second that those samples were recorded. So the precise time of last
% sample is. T+ICM_msecs-1. If we have an extended period of consistent
% sampling, we should be able to interpolate to get a precise time vector
% for every sample.
%
% What is consistent? I think it may simply be ICM_sps is continuously
% non-zero.
%
% sum(D.ICM_sps) should be the total number of samples recorded.
Naccel = sum(D.ICM_sps);
sampling = [ false; (D.ICM_sps ~= 0) & (D.ICM_mode == 2); false ];
starts = find(diff(sampling)>0);
ends = find(diff(sampling)<0)-1;
% seg_samples = ends-starts+1;
assert(length(starts) == length(ends));
assert(all(starts <= ends));
%%
% Let's make some sense out of D.ICM_mlf
% Look at non-zero elements first, maybe where mode is 2
idx = (1:length(D.ICM_mlf));
V = (D.ICM_mlf > 0);
mlfV = D.ICM_mlf(V);
idxV = idx(V);
% V represents all the valid mlf numbers
dmlf = diff([0; mlfV ]);
% dmlf>0 are where in V mlf changes
V2 = dmlf>0;
mlfs = mlfV(V2);
mlfstarts = idxV(V2);
dmlf = diff([mlfV; mlfV(end)+1]);
V3 = dmlf>0;
mlfends = idxV(V3);
assert(length(mlfstarts) == length(mlfends));
assert(all(mlfstarts <= mlfends));
mlflens = mlfends-mlfstarts+1;
%%
% ax = nsubplots(4);
% plot(ax(1),T,D.ICM_sps,'+');
% plot(ax(2),T,D.ICM_mode,'o');
% plot(ax(3),T(mlfstarts),mlflens,'*');
% plot(ax(4),T(V), mlfV,'.');
% linkaxes(ax,'x');
%
X = zeros(Naccel,1)*NaN;
Y = X;
Z = X;
ST = X; % What did I want to record here? Oh, Sample Time?
Npts = 0;
for seg = 1:length(starts)
  fprintf(1,'Processing segment %d of %d\n', seg, length(starts));
  sample = starts(seg);
  endsample = ends(seg);
  % Nsamples = seg_samples(seg);
  seg_pts_0 = Npts; % actually one before the pt in the segment
  segT = T(sample:endsample)-1+D.ICM_msecs(sample:endsample)/1000;
  while sample <= endsample
    mlf = D.ICM_mlf(sample);
    % The first samples for this segment are stored in mlf
    % But they may not be in the first second of data.
    % It's even possible there were samples from a previous
    % segment in the same file.
    mlfsi = find(mlfs==mlf,1);
    st = mlfstarts(mlfsi);
    len = mlflens(mlfsi);
    sps = D.ICM_sps(st:(st+len-1));
    i = 1+sample-st;
    lasti = min(len,1+endsample-st);
    S = load_mlf(base, mlf, sps, [i lasti]);
    if len ~= length(S)
      %assert(len == length(S));
    end
    while i <= len && sample <= endsample
      B = S{i};
      Npts_sample = size(B,1);
      if Npts_sample ~= D.ICM_sps(sample)
        fprintf(1,'ICM_sps(%d) was %d, corrected to %d\n', ...
          sample, D.ICM_sps(sample), Npts_sample);
        D.ICM_sps(sample) = Npts_sample;
      end
      % assert(Npts_sample == D.ICM_sps(sample));
      if Npts_sample > 0 % B could be empty and not size 0x3
        idx = 1:Npts_sample;
        X(Npts+idx,1) = B(:,1);
        Y(Npts+idx,1) = B(:,2);
        Z(Npts+idx,1) = B(:,3);
        Npts = Npts + Npts_sample;
      end
      sample = sample + 1;
      i = i+1;
    end
  end
  segNpts = cumsum(D.ICM_sps(starts(seg):endsample));
  VT = polyfit(segNpts,segT,1);
  ST(seg_pts_0+(1:segNpts(end))) = polyval(VT,1:segNpts(end));
  assert(Npts == seg_pts_0 + segNpts(end));
end
A.Acc = [ X Y Z ];
A.T = ST;

end
%%

% just read it in and make sure it is self-consistion.
% Pass in expected sps vector (instead of recording),
% and if it doesn't agree, try to see if shifting helps.
% Could also pass in what records we expect?
function S = load_mlf(base, mlf, sps, needed_idxes)
  % S = load_mlf(base, mlf);
  % S cell array of records, each 3 colums wide
  fname = mlf_path(base,mlf);
  fid = fopen(fname,'r');
  A = fread(fid,'int16');
  fclose(fid);
  assert(mod(length(A),3)==0);
  B = reshape(A,3,[])';
  row = 1;
  samples_in_mlf = 0;
  pts_in_mlf = zeros(length(sps),1);
  while row <= size(B,1)
    samples_in_mlf = samples_in_mlf+1;
    pts_in_mlf(samples_in_mlf) = B(row,3);
    row = row + 1+ B(row,3);
  end
  start_cell = 1;
  samples_in_S = length(sps);
  if samples_in_mlf ~= samples_in_S
    fprintf(1,'mlf=%d samples_in_mlf=%d secs_in_tm=%d\n', ...
      mlf, samples_in_mlf, samples_in_S);
    n_needed = diff(needed_idxes)+1;
    if n_needed > samples_in_mlf
      assert(n_needed <= samples_in_mlf);
    end
    % so must be less
    if (needed_idxes(1) ~= 1) && (needed_idxes(2) ~= length(sps))
      assert((needed_idxes(1) == 1) || (needed_idxes(2) == length(sps)));
    end
    ix = needed_idxes(1):needed_idxes(2);
    if needed_idxes(1) == 1
      if any(sps(ix) ~= pts_in_mlf(ix))
        fprintf(1,'sps does not match pts_in_mlf:\n');
        [sps(ix) pts_in_mlf(ix)]
      end
    else
      start_cell = samples_in_S - samples_in_mlf + 1;
      if any(sps(ix) ~= pts_in_mlf(ix-start_cell+1))
        fprintf(1,'sps does not match pts_in_mlf:\n');
        [sps(ix) pts_in_mlf(ix-start_cell+1)]
        % assert(all(sps(ix) == pts_in_mlf(ix-start_cell+1)));
      end
    end
  end

  S = cell(samples_in_S,1);
  row = 1;
  for i=start_cell:(samples_in_mlf+start_cell-1)
    if row > size(B,1)
      assert(row <= size(B,1));
    end
    fs = 2*2^B(row,2)/32768;
    ns = B(row,3);
    S{i} = B(row+(1:ns),:)*fs;
    row = row+1+ns;
  end
  if row ~= size(B,1)+1
    assert(row == size(B,1)+1);
  end
end

