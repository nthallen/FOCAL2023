function dfs_out = rt_eng(dfs)
% dfs = rt_eng()
%   Create a data_fields object and setup all the buttons for realtime
%   plots
% dfs_out = rt_eng(dfs)
%   Use the data_fields object and setup all the buttons for realtime plots
if nargin < 1
  dfs = data_fields('title', 'Engineering Data', ...
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
dfs.plot('qclic', 'label', 'QCLI C', 'plots', {'qclicw','qclics','qclicssp','qclico'});
dfs.plot('qclicw','label','Wave','vars',{'QCLI_C_Wave'});
dfs.plot('qclics','label','Scan','vars',{'SSP_C_Num'});
dfs.plot('qclicssp','label','SSP','vars',{'SSP_C_Status'});
dfs.plot('qclico','label','Overflow','vars',{{'name','CAOVF1_C','var_name','SSP_C_Flags','bit_number',0},{'name','CAOVF2_C','var_name','SSP_C_Flags','bit_number',1},{'name','CAOVF3_C','var_name','SSP_C_Flags','bit_number',2},{'name','PAOVF1_C','var_name','SSP_C_Flags','bit_number',3},{'name','PAOVF2_C','var_name','SSP_C_Flags','bit_number',4},{'name','PAOVF3_C','var_name','SSP_C_Flags','bit_number',5},{'name','ADOVF1_C','var_name','SSP_C_Flags','bit_number',6},{'name','ADOVF2_C','var_name','SSP_C_Flags','bit_number',7},{'name','ADOVF3_C','var_name','SSP_C_Flags','bit_number',8}});
dfs.plot('qcli_c_stat', 'label', 'QCLI C stat', 'plots', {'qcli_c_statsn','qcli_c_stats','qcli_c_staterr','qcli_c_statfifodep','qcli_c_statflash','qcli_c_statmode','qcli_c_statrw','qcli_c_statstatus','qcli_c_statskip'});
dfs.plot('qcli_c_statsn','label','SN','vars',{'SSP_C_SN'});
dfs.plot('qcli_c_stats','label','Stale','vars',{'QCLI_C_Stale','SSP_C_Stale'});
dfs.plot('qcli_c_staterr','label','err','vars',{'QCLI_C_err'});
dfs.plot('qcli_c_statfifodep','label','fifodep','vars',{'QCLI_C_fifodep'});
dfs.plot('qcli_c_statflash','label','flash','vars',{'QCLI_C_flash'});
dfs.plot('qcli_c_statmode','label','mode','vars',{'QCLI_C_mode'});
dfs.plot('qcli_c_statrw','label','rw','vars',{'QCLI_C_rw'});
dfs.plot('qcli_c_statstatus','label','status','vars',{{'name','QCLI_C_present','var_name','QCLI_C_CS','bit_number',11},{'name','QCLI_C_laser','var_name','QCLI_C_s','bit_number',12},{'name','QCLI_C_cordte','var_name','QCLI_C_s','bit_number',11},{'name','QCLI_C_cmderr','var_name','QCLI_C_s','bit_number',13},{'name','QCLI_C_cksum','var_name','QCLI_C_s','bit_number',14},{'name','QCLI_C_busy','var_name','QCLI_C_s','bit_number',15},{'name','QCLI_C_loc','var_name','QCLI_C_s','bit_number',3},{'name','QCLI_C_lot','var_name','QCLI_C_s','bit_number',4},{'name','QCLI_C_dot','var_name','QCLI_C_s','bit_number',5},{'name','QCLI_C_waveerr','var_name','QCLI_C_s','bit_number',8},{'name','QCLI_C_ready','var_name','QCLI_C_s','bit_number',9}});
dfs.plot('qcli_c_statskip','label','Skip','vars',{'SSP_C_TS'});
dfs.end_col;
dfs.start_col;
dfs.plot('t', 'label', 'Temps', 'plots', {'tsspc'});
dfs.plot('tsspc','label','SSP C','vars',{'SSP_C_T_FPGA','SSP_C_T_HtSink'});
dfs.plot('sspc', 'label', 'SSP C', 'plots', {'sspca','sspcnsr'});
dfs.plot('sspca','label','Amp','vars',{'SSP_C_amp0','SSP_C_amp1','SSP_C_noise0','SSP_C_noise1'});
dfs.plot('sspcnsr','label','NSR','vars',{'SSP_C_noise_pct0','SSP_C_noise_pct1'});
dfs.end_col;
dfs.resize(context_level);
dfs.set_connection('127.0.0.1', 1080);
if nargout > 0
  dfs_out = dfs;
end
