function dfs_out = rt_focal(dfs)
% dfs = rt_focal()
%   Create a data_fields object and setup all the buttons for realtime
%   plots
% dfs_out = rt_focal(dfs)
%   Use the data_fields object and setup all the buttons for realtime plots
if nargin < 1
  dfs = data_fields('title', 'FOCAL', ...
    'Color', [.8 .8 1], ...
    'h_leading', 8, 'v_leading', 2, ...
    'btn_fontsize', 12, ...
    'txt_fontsize', 12);
  context_level = dfs.rt_init;
else
  context_level = 1;
end
dfs.start_col;
dfs.plot('hk', 'label', 'HK', 'plots', {'hks'});
dfs.plot('hks','label','Status','vars',{{'name','BAT_Pwr_DS','var_name','DS84A','bit_number',4},{'name','BAT_Purge_DS','var_name','DS848','bit_number',5},{'name','QCLI_C_Reset_DS','var_name','DS84C','bit_number',1},{'name','QCLI_M_Reset_DS','var_name','DS868','bit_number',1},{'name','BAT_Pwr_S','var_name','DS873','bit_number',4},{'name','SW0','var_name','IOSwS','bit_number',0},{'name','SW1','var_name','IOSwS','bit_number',1},{'name','FltMd','var_name','IOSwS','bit_number',2}});
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
dfs.end_col;
dfs.start_col;
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
dfs.plot('t', 'label', 'Temps', 'plots', {'tsspc'});
dfs.plot('tsspc','label','SSP C','vars',{'SSP_C_T_FPGA','SSP_C_T_HtSink'});
dfs.plot('sspc', 'label', 'SSP C', 'plots', {'sspca','sspcnsr'});
dfs.plot('sspca','label','Amp','vars',{'SSP_C_amp0','SSP_C_amp1','SSP_C_noise0','SSP_C_noise1'});
dfs.plot('sspcnsr','label','NSR','vars',{'SSP_C_noise_pct0','SSP_C_noise_pct1'});
dfs.end_col;
dfs.start_col;
dfs.plot('mebs', 'label', 'ME Bay Stale', 'plots', {'mebsmes','mebsbhs','mebsfgs','mebscooes','mebschoes'});
dfs.plot('mebsmes','label','ME Stale','vars',{'ME_Bay_Stale'});
dfs.plot('mebsbhs','label','Bay Heat Stale','vars',{'Bay_Heat_Stale'});
dfs.plot('mebsfgs','label','Fwd Gas Stale','vars',{'Fwd_Gas_Stale'});
dfs.plot('mebscooes','label','CO2 OE Stale','vars',{'CO2_OE_Stale'});
dfs.plot('mebschoes','label','CH4 OE Stale','vars',{'CH4_OE_Stale'});
dfs.plot('mebe', 'label', 'ME Bay Errors', 'plots', {'mebebhe','mebefge','mebecooee','mebechoee'});
dfs.plot('mebebhe','label','Bay Heat Errors','vars',{'Bay_Heat_ErrorNumber','Bay_Heat_ErrorInstance','Bay_Heat_ErrorParameter'});
dfs.plot('mebefge','label','Fwd Gas Errors','vars',{'Fwd_Gas_ErrorNumber','Fwd_Gas_ErrorInstance','Fwd_Gas_ErrorParameter'});
dfs.plot('mebecooee','label','CO2 OE Errors','vars',{'CO2_OE_ErrorNumber','CO2_OE_ErrorInstance','CO2_OE_ErrorParameter'});
dfs.plot('mebechoee','label','CH4 OE Errors','vars',{'CH4_OE_ErrorNumber','CH4_OE_ErrorInstance','CH4_OE_ErrorParameter'});
dfs.plot('mebbh', 'label', 'ME Bay Bay Heat', 'plots', {'mebbht','mebbhc','mebbhv','mebbhs'});
dfs.plot('mebbht','label','Temp','vars',{'Bay_Heat_T','Bay_Heat_Set_T','Bay_Heat_Sink_T'});
dfs.plot('mebbhc','label','Current','vars',{'Bay_Heat_OutputCurrent'});
dfs.plot('mebbhv','label','Voltage','vars',{'Bay_Heat_OutputVoltage'});
dfs.plot('mebbhs','label','Status','vars',{'Bay_Heat_DevStatus'});
dfs.end_col;
dfs.start_col;
dfs.plot('mebfg', 'label', 'ME Bay Fwd Gas', 'plots', {'mebfgt','mebfgc','mebfgv','mebfgs'});
dfs.plot('mebfgt','label','Temp','vars',{'Fwd_Gas_T','Fwd_Gas_Set_T','Fwd_Gas_Sink_T'});
dfs.plot('mebfgc','label','Current','vars',{'Fwd_Gas_OutputCurrent'});
dfs.plot('mebfgv','label','Voltage','vars',{'Fwd_Gas_OutputVoltage'});
dfs.plot('mebfgs','label','Status','vars',{'Fwd_Gas_DevStatus'});
dfs.plot('mebcooe', 'label', 'ME Bay CO2 OE', 'plots', {'mebcooet','mebcooec','mebcooev','mebcooes'});
dfs.plot('mebcooet','label','Temp','vars',{'CO2_OE_T','CO2_OE_Set_T','CO2_OE_Sink_T'});
dfs.plot('mebcooec','label','Current','vars',{'CO2_OE_OutputCurrent'});
dfs.plot('mebcooev','label','Voltage','vars',{'CO2_OE_OutputVoltage'});
dfs.plot('mebcooes','label','Status','vars',{'CO2_OE_DevStatus'});
dfs.plot('mebchoe', 'label', 'ME Bay CH4 OE', 'plots', {'mebchoet','mebchoec','mebchoev','mebchoes'});
dfs.plot('mebchoet','label','Temp','vars',{'CH4_OE_T','CH4_OE_Set_T','CH4_OE_Sink_T'});
dfs.plot('mebchoec','label','Current','vars',{'CH4_OE_OutputCurrent'});
dfs.plot('mebchoev','label','Voltage','vars',{'CH4_OE_OutputVoltage'});
dfs.plot('mebchoes','label','Status','vars',{'CH4_OE_DevStatus'});
dfs.plot('mecos', 'label', 'ME CO2 Stale', 'plots', {'mecosmes','mecoscoqcls'});
dfs.plot('mecosmes','label','ME Stale','vars',{'ME_CO2_Stale'});
dfs.plot('mecoscoqcls','label','CO2 QCL Stale','vars',{'CO2_QCL_Stale'});
dfs.plot('mecoe', 'label', 'ME CO2 Errors', 'plots', {'mecoecoqcle'});
dfs.plot('mecoecoqcle','label','CO2 QCL Errors','vars',{'CO2_QCL_ErrorNumber','CO2_QCL_ErrorInstance','CO2_QCL_ErrorParameter'});
dfs.end_col;
dfs.start_col;
dfs.plot('mecocoqcl', 'label', 'ME CO2 CO2 QCL', 'plots', {'mecocoqclt','mecocoqclc','mecocoqclv','mecocoqcls'});
dfs.plot('mecocoqclt','label','Temp','vars',{'CO2_QCL_T','CO2_QCL_Set_T','CO2_QCL_Sink_T'});
dfs.plot('mecocoqclc','label','Current','vars',{'CO2_QCL_OutputCurrent'});
dfs.plot('mecocoqclv','label','Voltage','vars',{'CO2_QCL_OutputVoltage'});
dfs.plot('mecocoqcls','label','Status','vars',{'CO2_QCL_DevStatus'});
dfs.plot('mechs', 'label', 'ME CH4 Stale', 'plots', {'mechsmes','mechschqcls'});
dfs.plot('mechsmes','label','ME Stale','vars',{'ME_CH4_Stale'});
dfs.plot('mechschqcls','label','CH4 QCL Stale','vars',{'CH4_QCL_Stale'});
dfs.plot('meche', 'label', 'ME CH4 Errors', 'plots', {'mechechqcle'});
dfs.plot('mechechqcle','label','CH4 QCL Errors','vars',{'CH4_QCL_ErrorNumber','CH4_QCL_ErrorInstance','CH4_QCL_ErrorParameter'});
dfs.plot('mechchqcl', 'label', 'ME CH4 CH4 QCL', 'plots', {'mechchqclt','mechchqclc','mechchqclv','mechchqcls'});
dfs.plot('mechchqclt','label','Temp','vars',{'CH4_QCL_T','CH4_QCL_Set_T','CH4_QCL_Sink_T'});
dfs.plot('mechchqclc','label','Current','vars',{'CH4_QCL_OutputCurrent'});
dfs.plot('mechchqclv','label','Voltage','vars',{'CH4_QCL_OutputVoltage'});
dfs.plot('mechchqcls','label','Status','vars',{'CH4_QCL_DevStatus'});
dfs.plot('cpchk', 'label', 'CPC HK', 'plots', {'cpchks','cpchkstale','cpchkt'});
dfs.plot('cpchks','label','Status','vars',{'C_AbsP_Status','C_DiffP_Status'});
dfs.plot('cpchkstale','label','Stale','vars',{'C_AbsP_Stale','C_DiffP_Stale','CPC_Stale'});
dfs.plot('cpchkt','label','Torr','vars',{'C_AbsP_P','C_DiffP_P'});
dfs.end_col;
dfs.start_col;
dfs.plot('cpc', 'label', 'CPC', 'plots', {'cpct'});
dfs.plot('cpct','label','Torr','vars',{'C_AbsP_Set','C_DiffP_Set'});
dfs.plot('mpchk', 'label', 'MPC HK', 'plots', {'mpchks','mpchkstale','mpchkt'});
dfs.plot('mpchks','label','Status','vars',{'M_AbsP_Status'});
dfs.plot('mpchkstale','label','Stale','vars',{'M_AbsP_Stale','MPC_Stale'});
dfs.plot('mpchkt','label','Torr','vars',{'M_AbsP_P'});
dfs.plot('mpc', 'label', 'MPC', 'plots', {'mpct'});
dfs.plot('mpct','label','Torr','vars',{'M_AbsP_Set'});
dfs.plot('gdhk', 'label', 'GD HK', 'plots', {'gdhks','gdhkstale','gdhkmbar','gdhkt'});
dfs.plot('gdhks','label','Status','vars',{'Cal_Status'});
dfs.plot('gdhkstale','label','Stale','vars',{'Cal_Stale','GD_Stale'});
dfs.plot('gdhkmbar','label','mbar','vars',{'Cal_P'});
dfs.plot('gdhkt','label','T','vars',{'Cal_T'});
dfs.plot('gd', 'label', 'GD', 'plots', {'gdnccm','gdccm'});
dfs.plot('gdnccm','label','nccm','vars',{'Cal_MassFlow','Cal_Set'});
dfs.plot('gdccm','label','ccm','vars',{'Cal_VolFlow'});
dfs.end_col;
dfs.resize(context_level);
dfs.set_connection('127.0.0.1', 1080);
if nargout > 0
  dfs_out = dfs;
end
