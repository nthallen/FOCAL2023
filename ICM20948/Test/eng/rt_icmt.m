function dfs_out = rt_icmt(dfs)
% dfs = rt_icmt()
%   Create a data_fields object and setup all the buttons for realtime
%   plots
% dfs_out = rt_icmt(dfs)
%   Use the data_fields object and setup all the buttons for realtime plots
if nargin < 1 || isempty(dfs)
  dfs = data_fields('title', 'ICM20948 Vibration Sensor Test', ...
    'Color', [.8 .8 1], ...
    'h_leading', 8, 'v_leading', 2, ...
    'btn_fontsize', 12, ...
    'txt_fontsize', 12);
  context_level = dfs.rt_init;
else
  context_level = 1;
end
dfs.start_col;
dfs.plot('tm', 'label', 'T Mbase', 'plots', {'tmtd','tmcpu','tmram','tmd'});
dfs.plot('tmtd','label','T Drift','vars',{'SysTDrift'});
dfs.plot('tmcpu','label','CPU','vars',{'CPU_Pct'});
dfs.plot('tmram','label','RAM','vars',{'memused'});
dfs.plot('tmd','label','Disk','vars',{'Disk'});
dfs.plot('icm', 'label', 'ICM', 'plots', {'icmm','icmr'});
dfs.plot('icmm','label','Max','vars',{'ICM_max_g'});
dfs.plot('icmr','label','Rate','vars',{'ICM_sps'});
dfs.end_col;
dfs.start_col;
dfs.plot('icmhk', 'label', 'ICM HK', 'plots', {'icmhkm','icmhkmlf','icmhkmode','icmhkr','icmhkremainder','icmhkmsecs','icmhks','icmhkstatus','icmhkstale'});
dfs.plot('icmhkm','label','Max','vars',{'ICM_max_accel'});
dfs.plot('icmhkmlf','label','MLF','vars',{'ICM_mlf'});
dfs.plot('icmhkmode','label','Mode','vars',{'ICM_mode'});
dfs.plot('icmhkr','label','Rate','vars',{'ICM_sps'});
dfs.plot('icmhkremainder','label','Remainder','vars',{'ICM_rem0','ICM_rem1'});
dfs.plot('icmhkmsecs','label','msecs','vars',{'ICM_msecs'});
dfs.plot('icmhks','label','Scale','vars',{'ICM_fsc'});
dfs.plot('icmhkstatus','label','Status','vars',{{'name','ICM_nack','var_name','ICM_fs','bit_number',2}});
dfs.plot('icmhkstale','label','Stale','vars',{'ICM_stale'});
dfs.end_col;
dfs.set_connection('127.0.0.1', 1416);
if nargout > 0
  dfs_out = dfs;
else
  dfs.resize(context_level);
end
