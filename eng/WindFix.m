function WindFix(check)
% WindFix(check)
% If check is non-zero, plot existing wind data.
% If check is zero, apply correction to MAT files.
%%
runsdir = ne_load_runsdir('FOCAL_DATA_DIR');
dirs = [ dir([runsdir filesep '240*']) ];
wanted = ~cellfun(@isempty,[strfind({dirs.name},'240831')])' | ...
  ~cellfun(@isempty,[strfind({dirs.name},'2409')])';
dirs = dirs(wanted);
% has_wind_data = zeros(length(dirs),1) > 1;
% for i=1:length(dirs)
%   has_wind_data(i) = check_run_wind(dirs(i).name);
% end
for i=1:length(dirs)
  if check
    check_run_wind(dirs(i).name);
  else
    fix_run_wind(dirs(i).name);
  end
end
end

% %%
% fix_run_wind('240909.1');
% fix_run_wind('240909.2');
% %%
% check_run_wind('240909.1');
% %%
% check_run_wind('240909.2');
%%
function has_wind = check_run_wind(run)
  % return true if 
  runsdir = ne_load_runsdir('FOCAL_DATA_DIR');
  fpath = [runsdir filesep run filesep 'focaleng_1.mat'];
  D = load(fpath);
  if ~isfield(D,'Wind_U')
    fprintf(1,'No Wind data for run %s\n', run);
    if nargout > 0; has_wind = false; end
    return;
  end
  % Now is there any actual data?
  if any(D.Wind_N_samples) || any(D.Wind_N_errors)
    T = time2d(D.Tfocaleng_1);
    ax = nsubplots(4);
    skip = find(D.Wind_SoS,1);
    plot(ax(1),T(skip:end),D.Wind_U(skip:end), ...
      T(skip:end),D.Wind_V(skip:end),T(skip:end),D.Wind_W(skip:end));
    title(ax(1),sprintf('Run %s', run));
    plot(ax(2),T(skip:end),D.Wind_SoS(skip:end));
    plot(ax(3),T(skip:end),D.Wind_SonicTemp(skip:end));
    plot(ax(4),T(skip:end),D.Wind_stale(skip:end));
    linkaxes(ax,'x');
    if nargout > 0; has_wind = true; end
  else
    fprintf(1,'No Wind instrument data for run %s\n', run);
    if nargout > 0; has_wind = false; end
  end
end

function fix_run_wind(run)
  runsdir = ne_load_runsdir('FOCAL_DATA_DIR');
  fpath = [runsdir filesep run filesep 'focaleng_1.mat'];
  D = load(fpath);
  if ~isfield(D,'Wind_U')
    fprintf(1,'No Wind data for run %s\n', run);
    return;
  end
  avgs = {'Wind_U','Wind_V','Wind_W','Wind_SoS','Wind_SonicTemp'};
  NS = D.Wind_N_samples;
  corr = find_corr(D.Wind_U, NS);
  if any(corr)
    for i=1:length(avgs)
      D.(avgs{i}) = fixavg4nans(D.(avgs{i}),NS,corr);
    end
    D.Wind_N_samples = D.Wind_N_samples - corr;
    D.Wind_N_errors = D.Wind_N_errors + corr;
    save(fpath,'-struct','D');
    fprintf(1,'Wind for run %s has been corrected\n', run);
  else
    fprintf(1,'No correction required for run %s\n', run);
  end
end


%%
function corr = find_corr(In,NS)
rawInsum = In.*NS;
dInsum = diff(rawInsum);
Vp = dInsum > 100;
Np = floor((100+dInsum(Vp))/999);
Vn = dInsum < -100;
Nn = floor((100-dInsum(Vn))/999);
dcorr = zeros(length(In),1);
dcorr(find(Vp)+1) = Np;
dcorr(find(Vn)+1) = -Nn;
corr = cumsum(dcorr);
end

function X = fixavg4nans(In,NS,corr)
X = ((In.*NS) - 999*corr)./(NS-corr);
end

