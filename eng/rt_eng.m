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
dfs.plot('bs', 'label', 'Bay Stale', 'plots', {'bsmes','bsbhs'});
dfs.plot('bsmes','label','ME Stale','vars',{'Bay_Stale'});
dfs.plot('bsbhs','label','Bay Heat Stale','vars',{'Bay_Heat_Stale'});
dfs.plot('be', 'label', 'Bay Errors', 'plots', {'bebhe'});
dfs.plot('bebhe','label','Bay Heat Errors','vars',{'Bay_Heat_ErrorNumber','Bay_Heat_ErrorInstance','Bay_Heat_ErrorParameter'});
dfs.plot('bbh', 'label', 'Bay Bay Heat', 'plots', {'bbht','bbhc','bbhv','bbhs'});
dfs.plot('bbht','label','Temp','vars',{'Bay_Heat_T','Bay_Heat_Set_T','Bay_Heat_Sink_T'});
dfs.plot('bbhc','label','Current','vars',{'Bay_Heat_OutputCurrent'});
dfs.plot('bbhv','label','Voltage','vars',{'Bay_Heat_OutputVoltage'});
dfs.plot('bbhs','label','Status','vars',{'Bay_Heat_DevStatus'});
dfs.plot('cos', 'label', 'CO2 Stale', 'plots', {'cosmes','coscoqcls','coscooes','cosfgs'});
dfs.plot('cosmes','label','ME Stale','vars',{'CO2_Stale'});
dfs.plot('coscoqcls','label','CO2 QCL Stale','vars',{'CO2_QCL_Stale'});
dfs.plot('coscooes','label','CO2 OE Stale','vars',{'CO2_OE_Stale'});
dfs.plot('cosfgs','label','Fwd Gas Stale','vars',{'Fwd_Gas_Stale'});
dfs.end_col;
dfs.start_col;
dfs.plot('coe', 'label', 'CO2 Errors', 'plots', {'coecoqcle','coecooee','coefge'});
dfs.plot('coecoqcle','label','CO2 QCL Errors','vars',{'CO2_QCL_ErrorNumber','CO2_QCL_ErrorInstance','CO2_QCL_ErrorParameter'});
dfs.plot('coecooee','label','CO2 OE Errors','vars',{'CO2_OE_ErrorNumber','CO2_OE_ErrorInstance','CO2_OE_ErrorParameter'});
dfs.plot('coefge','label','Fwd Gas Errors','vars',{'Fwd_Gas_ErrorNumber','Fwd_Gas_ErrorInstance','Fwd_Gas_ErrorParameter'});
dfs.plot('cocoqcl', 'label', 'CO2 CO2 QCL', 'plots', {'cocoqclt','cocoqclc','cocoqclv','cocoqcls'});
dfs.plot('cocoqclt','label','Temp','vars',{'CO2_QCL_T','CO2_QCL_Set_T','CO2_QCL_Sink_T'});
dfs.plot('cocoqclc','label','Current','vars',{'CO2_QCL_OutputCurrent'});
dfs.plot('cocoqclv','label','Voltage','vars',{'CO2_QCL_OutputVoltage'});
dfs.plot('cocoqcls','label','Status','vars',{'CO2_QCL_DevStatus'});
dfs.plot('cocooe', 'label', 'CO2 CO2 OE', 'plots', {'cocooet','cocooec','cocooev','cocooes'});
dfs.plot('cocooet','label','Temp','vars',{'CO2_OE_T','CO2_OE_Set_T','CO2_OE_Sink_T'});
dfs.plot('cocooec','label','Current','vars',{'CO2_OE_OutputCurrent'});
dfs.plot('cocooev','label','Voltage','vars',{'CO2_OE_OutputVoltage'});
dfs.plot('cocooes','label','Status','vars',{'CO2_OE_DevStatus'});
dfs.plot('cofg', 'label', 'CO2 Fwd Gas', 'plots', {'cofgt','cofgc','cofgv','cofgs'});
dfs.plot('cofgt','label','Temp','vars',{'Fwd_Gas_T','Fwd_Gas_Set_T','Fwd_Gas_Sink_T'});
dfs.plot('cofgc','label','Current','vars',{'Fwd_Gas_OutputCurrent'});
dfs.plot('cofgv','label','Voltage','vars',{'Fwd_Gas_OutputVoltage'});
dfs.plot('cofgs','label','Status','vars',{'Fwd_Gas_DevStatus'});
dfs.end_col;
dfs.start_col;
dfs.plot('chs', 'label', 'CH4 Stale', 'plots', {'chsmes','chschqcls','chschoes'});
dfs.plot('chsmes','label','ME Stale','vars',{'CH4_Stale'});
dfs.plot('chschqcls','label','CH4 QCL Stale','vars',{'CH4_QCL_Stale'});
dfs.plot('chschoes','label','CH4 OE Stale','vars',{'CH4_OE_Stale'});
dfs.plot('che', 'label', 'CH4 Errors', 'plots', {'chechqcle','chechoee'});
dfs.plot('chechqcle','label','CH4 QCL Errors','vars',{'CH4_QCL_ErrorNumber','CH4_QCL_ErrorInstance','CH4_QCL_ErrorParameter'});
dfs.plot('chechoee','label','CH4 OE Errors','vars',{'CH4_OE_ErrorNumber','CH4_OE_ErrorInstance','CH4_OE_ErrorParameter'});
dfs.plot('chchqcl', 'label', 'CH4 CH4 QCL', 'plots', {'chchqclt','chchqclc','chchqclv','chchqcls'});
dfs.plot('chchqclt','label','Temp','vars',{'CH4_QCL_T','CH4_QCL_Set_T','CH4_QCL_Sink_T'});
dfs.plot('chchqclc','label','Current','vars',{'CH4_QCL_OutputCurrent'});
dfs.plot('chchqclv','label','Voltage','vars',{'CH4_QCL_OutputVoltage'});
dfs.plot('chchqcls','label','Status','vars',{'CH4_QCL_DevStatus'});
dfs.plot('chchoe', 'label', 'CH4 CH4 OE', 'plots', {'chchoet','chchoec','chchoev','chchoes'});
dfs.plot('chchoet','label','Temp','vars',{'CH4_OE_T','CH4_OE_Set_T','CH4_OE_Sink_T'});
dfs.plot('chchoec','label','Current','vars',{'CH4_OE_OutputCurrent'});
dfs.plot('chchoev','label','Voltage','vars',{'CH4_OE_OutputVoltage'});
dfs.plot('chchoes','label','Status','vars',{'CH4_OE_DevStatus'});
dfs.end_col;
dfs.resize(context_level);
dfs.set_connection('127.0.0.1', 1080);
if nargout > 0
  dfs_out = dfs;
end
