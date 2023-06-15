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
dfs.start_tab('HK');
dfs.start_col;
dfs.plot('hkhk', 'label', 'HK', 'plots', {'hkhks'});
dfs.plot('hkhks','label','Status','vars',{{'name','BAT_Pwr_DS','var_name','DS84A','bit_number',4},{'name','BAT_Purge_DS','var_name','DS848','bit_number',5},{'name','QCLI_C_Reset_DS','var_name','DS84C','bit_number',1},{'name','QCLI_M_Reset_DS','var_name','DS868','bit_number',1},{'name','BAT_Pwr_S','var_name','DS873','bit_number',4},{'name','SW0','var_name','IOSwS','bit_number',0},{'name','SW1','var_name','IOSwS','bit_number',1},{'name','FltMd','var_name','IOSwS','bit_number',2}});
dfs.plot('hktm', 'label', 'T Mbase', 'plots', {'hktmtd','hktmcpu','hktmram','hktmd'});
dfs.plot('hktmtd','label','T Drift','vars',{'SysTDrift'});
dfs.plot('hktmcpu','label','CPU','vars',{'CPU_Pct'});
dfs.plot('hktmram','label','RAM','vars',{'memused'});
dfs.plot('hktmd','label','Disk','vars',{'Disk'});
dfs.plot('hkmebs', 'label', 'ME Bay Stale', 'plots', {'hkmebsmes','hkmebsbhs','hkmebsfgs','hkmebscooes','hkmebschoes'});
dfs.plot('hkmebsmes','label','ME Stale','vars',{'ME_Bay_Stale'});
dfs.plot('hkmebsbhs','label','Bay Heat Stale','vars',{'Bay_Heat_Stale'});
dfs.plot('hkmebsfgs','label','Fwd Gas Stale','vars',{'Fwd_Gas_Stale'});
dfs.plot('hkmebscooes','label','CO2 OE Stale','vars',{'CO2_OE_Stale'});
dfs.plot('hkmebschoes','label','CH4 OE Stale','vars',{'CH4_OE_Stale'});
dfs.plot('hkmebe', 'label', 'ME Bay Errors', 'plots', {'hkmebebhe','hkmebefge','hkmebecooee','hkmebechoee'});
dfs.plot('hkmebebhe','label','Bay Heat Errors','vars',{'Bay_Heat_ErrorNumber','Bay_Heat_ErrorInstance','Bay_Heat_ErrorParameter'});
dfs.plot('hkmebefge','label','Fwd Gas Errors','vars',{'Fwd_Gas_ErrorNumber','Fwd_Gas_ErrorInstance','Fwd_Gas_ErrorParameter'});
dfs.plot('hkmebecooee','label','CO2 OE Errors','vars',{'CO2_OE_ErrorNumber','CO2_OE_ErrorInstance','CO2_OE_ErrorParameter'});
dfs.plot('hkmebechoee','label','CH4 OE Errors','vars',{'CH4_OE_ErrorNumber','CH4_OE_ErrorInstance','CH4_OE_ErrorParameter'});
dfs.end_col;
dfs.start_col;
dfs.plot('hkmebbh', 'label', 'ME Bay Bay Heat', 'plots', {'hkmebbht','hkmebbhc','hkmebbhv','hkmebbhs'});
dfs.plot('hkmebbht','label','Temp','vars',{'Bay_Heat_T','Bay_Heat_Set_T','Bay_Heat_Sink_T'});
dfs.plot('hkmebbhc','label','Current','vars',{'Bay_Heat_OutputCurrent'});
dfs.plot('hkmebbhv','label','Voltage','vars',{'Bay_Heat_OutputVoltage'});
dfs.plot('hkmebbhs','label','Status','vars',{'Bay_Heat_DevStatus'});
dfs.plot('hkmebfg', 'label', 'ME Bay Fwd Gas', 'plots', {'hkmebfgt','hkmebfgc','hkmebfgv','hkmebfgs'});
dfs.plot('hkmebfgt','label','Temp','vars',{'Fwd_Gas_T','Fwd_Gas_Set_T','Fwd_Gas_Sink_T'});
dfs.plot('hkmebfgc','label','Current','vars',{'Fwd_Gas_OutputCurrent'});
dfs.plot('hkmebfgv','label','Voltage','vars',{'Fwd_Gas_OutputVoltage'});
dfs.plot('hkmebfgs','label','Status','vars',{'Fwd_Gas_DevStatus'});
dfs.plot('hkmebcooe', 'label', 'ME Bay CO2 OE', 'plots', {'hkmebcooet','hkmebcooec','hkmebcooev','hkmebcooes'});
dfs.plot('hkmebcooet','label','Temp','vars',{'CO2_OE_T','CO2_OE_Set_T','CO2_OE_Sink_T'});
dfs.plot('hkmebcooec','label','Current','vars',{'CO2_OE_OutputCurrent'});
dfs.plot('hkmebcooev','label','Voltage','vars',{'CO2_OE_OutputVoltage'});
dfs.plot('hkmebcooes','label','Status','vars',{'CO2_OE_DevStatus'});
dfs.plot('hkmebchoe', 'label', 'ME Bay CH4 OE', 'plots', {'hkmebchoet','hkmebchoec','hkmebchoev','hkmebchoes'});
dfs.plot('hkmebchoet','label','Temp','vars',{'CH4_OE_T','CH4_OE_Set_T','CH4_OE_Sink_T'});
dfs.plot('hkmebchoec','label','Current','vars',{'CH4_OE_OutputCurrent'});
dfs.plot('hkmebchoev','label','Voltage','vars',{'CH4_OE_OutputVoltage'});
dfs.plot('hkmebchoes','label','Status','vars',{'CH4_OE_DevStatus'});
dfs.end_col;
dfs.start_col;
dfs.plot('hkmecos', 'label', 'ME CO2 Stale', 'plots', {'hkmecosmes','hkmecoscoqcls'});
dfs.plot('hkmecosmes','label','ME Stale','vars',{'ME_CO2_Stale'});
dfs.plot('hkmecoscoqcls','label','CO2 QCL Stale','vars',{'CO2_QCL_Stale'});
dfs.plot('hkmecoe', 'label', 'ME CO2 Errors', 'plots', {'hkmecoecoqcle'});
dfs.plot('hkmecoecoqcle','label','CO2 QCL Errors','vars',{'CO2_QCL_ErrorNumber','CO2_QCL_ErrorInstance','CO2_QCL_ErrorParameter'});
dfs.plot('hkmecocoqcl', 'label', 'ME CO2 CO2 QCL', 'plots', {'hkmecocoqclt','hkmecocoqclc','hkmecocoqclv','hkmecocoqcls'});
dfs.plot('hkmecocoqclt','label','Temp','vars',{'CO2_QCL_T','CO2_QCL_Set_T','CO2_QCL_Sink_T'});
dfs.plot('hkmecocoqclc','label','Current','vars',{'CO2_QCL_OutputCurrent'});
dfs.plot('hkmecocoqclv','label','Voltage','vars',{'CO2_QCL_OutputVoltage'});
dfs.plot('hkmecocoqcls','label','Status','vars',{'CO2_QCL_DevStatus'});
dfs.plot('hkmechs', 'label', 'ME CH4 Stale', 'plots', {'hkmechsmes','hkmechschqcls'});
dfs.plot('hkmechsmes','label','ME Stale','vars',{'ME_CH4_Stale'});
dfs.plot('hkmechschqcls','label','CH4 QCL Stale','vars',{'CH4_QCL_Stale'});
dfs.plot('hkmeche', 'label', 'ME CH4 Errors', 'plots', {'hkmechechqcle'});
dfs.plot('hkmechechqcle','label','CH4 QCL Errors','vars',{'CH4_QCL_ErrorNumber','CH4_QCL_ErrorInstance','CH4_QCL_ErrorParameter'});
dfs.plot('hkmechchqcl', 'label', 'ME CH4 CH4 QCL', 'plots', {'hkmechchqclt','hkmechchqclc','hkmechchqclv','hkmechchqcls'});
dfs.plot('hkmechchqclt','label','Temp','vars',{'CH4_QCL_T','CH4_QCL_Set_T','CH4_QCL_Sink_T'});
dfs.plot('hkmechchqclc','label','Current','vars',{'CH4_QCL_OutputCurrent'});
dfs.plot('hkmechchqclv','label','Voltage','vars',{'CH4_QCL_OutputVoltage'});
dfs.plot('hkmechchqcls','label','Status','vars',{'CH4_QCL_DevStatus'});
dfs.end_col;
dfs.start_col;
dfs.plot('hkcpchk', 'label', 'CPC HK', 'plots', {'hkcpchks','hkcpchkstale','hkcpchkt'});
dfs.plot('hkcpchks','label','Status','vars',{'C_AbsP_Status','C_DiffP_Status'});
dfs.plot('hkcpchkstale','label','Stale','vars',{'C_AbsP_Stale','C_DiffP_Stale','CPC_Stale'});
dfs.plot('hkcpchkt','label','Torr','vars',{'C_AbsP_P','C_DiffP_P'});
dfs.plot('hkcpc', 'label', 'CPC', 'plots', {'hkcpct'});
dfs.plot('hkcpct','label','Torr','vars',{'C_AbsP_Set','C_DiffP_Set'});
dfs.plot('hkmpchk', 'label', 'MPC HK', 'plots', {'hkmpchks','hkmpchkstale','hkmpchkt'});
dfs.plot('hkmpchks','label','Status','vars',{'M_AbsP_Status'});
dfs.plot('hkmpchkstale','label','Stale','vars',{'M_AbsP_Stale','MPC_Stale'});
dfs.plot('hkmpchkt','label','Torr','vars',{'M_AbsP_P'});
dfs.plot('hkmpc', 'label', 'MPC', 'plots', {'hkmpct'});
dfs.plot('hkmpct','label','Torr','vars',{'M_AbsP_Set'});
dfs.plot('hkgdhk', 'label', 'GD HK', 'plots', {'hkgdhks','hkgdhkstale','hkgdhkmbar','hkgdhkt'});
dfs.plot('hkgdhks','label','Status','vars',{'Cal_Status'});
dfs.plot('hkgdhkstale','label','Stale','vars',{'Cal_Stale','GD_Stale'});
dfs.plot('hkgdhkmbar','label','mbar','vars',{'Cal_P'});
dfs.plot('hkgdhkt','label','T','vars',{'Cal_T'});
dfs.plot('hkgd', 'label', 'GD', 'plots', {'hkgdnccm','hkgdccm'});
dfs.plot('hkgdnccm','label','nccm','vars',{'Cal_MassFlow','Cal_Set'});
dfs.plot('hkgdccm','label','ccm','vars',{'Cal_VolFlow'});
dfs.end_tab;
dfs.start_tab('QCLI');
dfs.start_col;
dfs.plot('qcliqclic', 'label', 'QCLI C', 'plots', {'qcliqclicw','qcliqclics','qcliqclicssp','qcliqclico'});
dfs.plot('qcliqclicw','label','Wave','vars',{'QCLI_C_Wave'});
dfs.plot('qcliqclics','label','Scan','vars',{'SSP_C_Num'});
dfs.plot('qcliqclicssp','label','SSP','vars',{'SSP_C_Status'});
dfs.plot('qcliqclico','label','Overflow','vars',{{'name','CAOVF1_C','var_name','SSP_C_Flags','bit_number',0},{'name','CAOVF2_C','var_name','SSP_C_Flags','bit_number',1},{'name','CAOVF3_C','var_name','SSP_C_Flags','bit_number',2},{'name','PAOVF1_C','var_name','SSP_C_Flags','bit_number',3},{'name','PAOVF2_C','var_name','SSP_C_Flags','bit_number',4},{'name','PAOVF3_C','var_name','SSP_C_Flags','bit_number',5},{'name','ADOVF1_C','var_name','SSP_C_Flags','bit_number',6},{'name','ADOVF2_C','var_name','SSP_C_Flags','bit_number',7},{'name','ADOVF3_C','var_name','SSP_C_Flags','bit_number',8}});
dfs.plot('qcli_qcli_c_stat', 'label', 'QCLI C stat', 'plots', {'qcli_qcli_c_statsn','qcli_qcli_c_stats','qcli_qcli_c_staterr','qcli_qcli_c_statfifodep','qcli_qcli_c_statflash','qcli_qcli_c_statmode','qcli_qcli_c_statrw','qcli_qcli_c_statstatus','qcli_qcli_c_statskip'});
dfs.plot('qcli_qcli_c_statsn','label','SN','vars',{'SSP_C_SN'});
dfs.plot('qcli_qcli_c_stats','label','Stale','vars',{'QCLI_C_Stale','SSP_C_Stale'});
dfs.plot('qcli_qcli_c_staterr','label','err','vars',{'QCLI_C_err'});
dfs.plot('qcli_qcli_c_statfifodep','label','fifodep','vars',{'QCLI_C_fifodep'});
dfs.plot('qcli_qcli_c_statflash','label','flash','vars',{'QCLI_C_flash'});
dfs.plot('qcli_qcli_c_statmode','label','mode','vars',{'QCLI_C_mode'});
dfs.plot('qcli_qcli_c_statrw','label','rw','vars',{'QCLI_C_rw'});
dfs.plot('qcli_qcli_c_statstatus','label','status','vars',{{'name','QCLI_C_present','var_name','QCLI_C_CS','bit_number',11},{'name','QCLI_C_laser','var_name','QCLI_C_s','bit_number',12},{'name','QCLI_C_cordte','var_name','QCLI_C_s','bit_number',11},{'name','QCLI_C_cmderr','var_name','QCLI_C_s','bit_number',13},{'name','QCLI_C_cksum','var_name','QCLI_C_s','bit_number',14},{'name','QCLI_C_busy','var_name','QCLI_C_s','bit_number',15},{'name','QCLI_C_loc','var_name','QCLI_C_s','bit_number',3},{'name','QCLI_C_lot','var_name','QCLI_C_s','bit_number',4},{'name','QCLI_C_dot','var_name','QCLI_C_s','bit_number',5},{'name','QCLI_C_waveerr','var_name','QCLI_C_s','bit_number',8},{'name','QCLI_C_ready','var_name','QCLI_C_s','bit_number',9}});
dfs.plot('qcli_qcli_c_statskip','label','Skip','vars',{'SSP_C_TS'});
dfs.plot('qclit', 'label', 'Temps', 'plots', {'qclitsspc'});
dfs.plot('qclitsspc','label','SSP C','vars',{'SSP_C_T_FPGA','SSP_C_T_HtSink'});
dfs.plot('qclisspc', 'label', 'SSP C', 'plots', {'qclisspca','qclisspcnsr'});
dfs.plot('qclisspca','label','Amp','vars',{'SSP_C_amp0','SSP_C_amp1','SSP_C_noise0','SSP_C_noise1'});
dfs.plot('qclisspcnsr','label','NSR','vars',{'SSP_C_noise_pct0','SSP_C_noise_pct1'});
dfs.end_tab;
dfs.start_tab('uDACS');
dfs.start_col;
dfs.plot('dacsdchptrh', 'label', 'uDCH4 PTRH', 'plots', {'dacsdchptrhp','dacsdchptrht','dacsdchptrhrh'});
dfs.plot('dacsdchptrhp','label','P','vars',{'uDCH4_OE_P','uDCH4_LH_P','uDCH4_OE_P','uDCH4_LH_P'});
dfs.plot('dacsdchptrht','label','T','vars',{'uDCH4_OE_T','uDCH4_LH_T','uDCH4_OE_T','uDCH4_LH_T'});
dfs.plot('dacsdchptrhrh','label','RH','vars',{'uDCH4_OE_RH','uDCH4_LH_RH','uDCH4_OE_RH','uDCH4_LH_RH'});
dfs.plot('dacsdch', 'label', 'uDCH4', 'plots', {'dacsdchdac','dacsdchais','dacsdchs'});
dfs.plot('dacsdchdac','label','DAC','vars',{'uDCH4_VSet0','uDCH4_VSet1','uDCH4_VSet2','uDCH4_VSet3','uDCH4_VSet0','uDCH4_VSet1','uDCH4_VSet2','uDCH4_VSet3'});
dfs.plot('dacsdchais','label','AI Stat','vars',{'uDCH4_stat','uDCH4_stat'});
dfs.plot('dacsdchs','label','Status','vars',{{'name','Alert','var_name','uDCH4_stat0','bit_number',7},{'name','Reset','var_name','uDCH4_stat0','bit_number',3},{'name','Alert','var_name','uDCH4_stat0','bit_number',7},{'name','Reset','var_name','uDCH4_stat0','bit_number',3}});
dfs.plot('dacsdchhk', 'label', 'uDCH4 HK', 'plots', {'dacsdchhkms','dacsdchhkfs','dacsdchhkouv','dacsdchhkain','dacsdchhke'});
dfs.plot('dacsdchhkms','label','M Sat','vars',{{'name','MSat0','var_name','uDCH4_stat0','bit_number',2},{'name','MSat1','var_name','uDCH4_stat1','bit_number',2},{'name','MSat2','var_name','uDCH4_stat2','bit_number',2},{'name','MSat3','var_name','uDCH4_stat3','bit_number',2},{'name','MSat4','var_name','uDCH4_stat4','bit_number',2},{'name','MSat5','var_name','uDCH4_stat5','bit_number',2},{'name','MSat6','var_name','uDCH4_stat6','bit_number',2},{'name','MSat7','var_name','uDCH4_stat7','bit_number',2},{'name','MSat0','var_name','uDCH4_stat0','bit_number',2},{'name','MSat1','var_name','uDCH4_stat1','bit_number',2},{'name','MSat2','var_name','uDCH4_stat2','bit_number',2},{'name','MSat3','var_name','uDCH4_stat3','bit_number',2},{'name','MSat4','var_name','uDCH4_stat4','bit_number',2},{'name','MSat5','var_name','uDCH4_stat5','bit_number',2},{'name','MSat6','var_name','uDCH4_stat6','bit_number',2},{'name','MSat7','var_name','uDCH4_stat7','bit_number',2}});
dfs.plot('dacsdchhkfs','label','F Sat','vars',{{'name','FSat0','var_name','uDCH4_stat0','bit_number',1},{'name','FSat1','var_name','uDCH4_stat1','bit_number',1},{'name','FSat2','var_name','uDCH4_stat2','bit_number',1},{'name','FSat3','var_name','uDCH4_stat3','bit_number',1},{'name','FSat4','var_name','uDCH4_stat4','bit_number',1},{'name','FSat5','var_name','uDCH4_stat5','bit_number',1},{'name','FSat6','var_name','uDCH4_stat6','bit_number',1},{'name','FSat7','var_name','uDCH4_stat7','bit_number',1},{'name','FSat0','var_name','uDCH4_stat0','bit_number',1},{'name','FSat1','var_name','uDCH4_stat1','bit_number',1},{'name','FSat2','var_name','uDCH4_stat2','bit_number',1},{'name','FSat3','var_name','uDCH4_stat3','bit_number',1},{'name','FSat4','var_name','uDCH4_stat4','bit_number',1},{'name','FSat5','var_name','uDCH4_stat5','bit_number',1},{'name','FSat6','var_name','uDCH4_stat6','bit_number',1},{'name','FSat7','var_name','uDCH4_stat7','bit_number',1}});
dfs.plot('dacsdchhkouv','label','OUV','vars',{{'name','OUV0','var_name','uDCH4_stat0','bit_number',0},{'name','OUV1','var_name','uDCH4_stat1','bit_number',0},{'name','OUV2','var_name','uDCH4_stat2','bit_number',0},{'name','OUV3','var_name','uDCH4_stat3','bit_number',0},{'name','OUV4','var_name','uDCH4_stat4','bit_number',0},{'name','OUV5','var_name','uDCH4_stat5','bit_number',0},{'name','OUV6','var_name','uDCH4_stat6','bit_number',0},{'name','OUV7','var_name','uDCH4_stat7','bit_number',0},{'name','OUV0','var_name','uDCH4_stat0','bit_number',0},{'name','OUV1','var_name','uDCH4_stat1','bit_number',0},{'name','OUV2','var_name','uDCH4_stat2','bit_number',0},{'name','OUV3','var_name','uDCH4_stat3','bit_number',0},{'name','OUV4','var_name','uDCH4_stat4','bit_number',0},{'name','OUV5','var_name','uDCH4_stat5','bit_number',0},{'name','OUV6','var_name','uDCH4_stat6','bit_number',0},{'name','OUV7','var_name','uDCH4_stat7','bit_number',0}});
dfs.plot('dacsdchhkain','label','AI N','vars',{'uDCH4_N','uDCH4_N'});
dfs.plot('dacsdchhke','label','Errs','vars',{'uDCH4_errs','uDCH4_errs'});
dfs.plot('dacsch', 'label', 'CH4', 'plots', {'dacschp','dacschct','dacschft','dacschrt'});
dfs.plot('dacschp','label','P','vars',{'CH4_CellP','CH4_CellP'});
dfs.plot('dacschct','label','Cell T','vars',{'CH4_Cell1T','CH4_Cell2T','CH4_Cell3T','CH4_Cell1T','CH4_Cell2T','CH4_Cell3T'});
dfs.plot('dacschft','label','Flow T','vars',{'CH4_SamInT','CH4_SamOutT','CH4_SamInT','CH4_SamOutT'});
dfs.plot('dacschrt','label','Rov T','vars',{'CH4_Rov1T','CH4_Rov2T','CH4_Rov1T','CH4_Rov2T'});
dfs.end_tab;
dfs.end_col;
dfs.resize(context_level);
dfs.set_connection('127.0.0.1', 1080);
if nargout > 0
  dfs_out = dfs;
end
