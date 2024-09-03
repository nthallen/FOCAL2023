function dfs_out = rt_focalx(varargin)
opts.dfs = [];
opts.hostname = '10.245.83.107';
opts.homedir = '/home/focal';
for i=1:2:length(varargin)-1
  if isfield(opts,varargin{i})
    opts.(varargin{i}) = varargin{i+1};
  else
    error('rt_focalx: Unrecognized option: %s', varargin{i});
  end
end
dfs = rt_focal(opts.dfs);
opts.dfs = dfs;
dfs.start_tab('Scans');
dfs.start_col;

% homedir = '/home/focal';
homedir = '/home/focal/raw/data/240902.1';
sspsco2 = SSP_state(opts, 'SSP_C', 'SSP_C_Num', ...
  'CO2_Signal', 'CO2_Etalon', 'CO2_Ref');
dfs.plot('Sco2', 'label', 'CO2', 'plots', {'Sco2sig', 'Sco2ref', 'Sco2etln'});
dfs.plot('Sco2sig','label','Signal','vars',{'CO2_Signal','SSP_C_Num'}, ...
  'custom_axis',@(dfs, parent, label, ts) ...
    SSP_scan(sspsco2, 'CO2_Signal', dfs, parent, label, ts));
dfs.plot('Sco2ref','label','Reference','vars',{'CO2_Ref'}, ...
  'custom_axis',@(dfs, parent, label, ts) ...
    SSP_scan(sspsco2, 'CO2_Ref', dfs, parent, label, ts));
dfs.plot('Sco2etln','label','Etalon','vars',{'CO2_Etalon'}, ...
  'custom_axis',@(dfs, parent, label, ts) ...
    SSP_scan(sspsco2, 'CO2_Etalon', dfs, parent, label, ts));

sspsch4 = SSP_state(opts, 'SSP_M', 'SSP_M_Num', ...
  'CH4_Signal', 'CH4_Etalon');
dfs.plot('Sch4', 'label', 'CH4', 'plots', {'Sch4sig', 'Sch4etln'});
dfs.plot('Sch4sig','label','Signal','vars',{'CH4_Signal','SSP_M_Num'}, ...
  'custom_axis',@(dfs, parent, label, ts) ...
    SSP_scan(sspsch4, 'CH4_Signal', dfs, parent, label, ts));
dfs.plot('Sch4etln','label','Etalon','vars',{'CH4_Etalon'}, ...
  'custom_axis',@(dfs, parent, label, ts) ...
    SSP_scan(sspsch4, 'CH4_Etalon', dfs, parent, label, ts));
dfs.end_col;
dfs.end_tab;
if nargout > 0
  dfs_out = dfs;
else
  dfs.resize();
end
