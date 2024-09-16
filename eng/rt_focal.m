function dfs_out = rt_focal(dfs)
% dfs = rt_focal()
%   Create a data_fields object and setup all the buttons for realtime
%   plots
% dfs_out = rt_focal(dfs)
%   Use the data_fields object and setup all the buttons for realtime plots
if nargin < 1 || isempty(dfs)
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
dfs.plot('hkmebs', 'label', 'ME Bay Stale', 'plots', {'hkmebsmes','hkmebsfgs'});
dfs.plot('hkmebsmes','label','ME Stale','vars',{'ME_Bay_Stale'});
dfs.plot('hkmebsfgs','label','Fwd Gas Stale','vars',{'Fwd_Gas_Stale'});
dfs.plot('hkmebe', 'label', 'ME Bay Errors', 'plots', {'hkmebefge'});
dfs.plot('hkmebefge','label','Fwd Gas Errors','vars',{'Fwd_Gas_ErrorNumber','Fwd_Gas_ErrorInstance','Fwd_Gas_ErrorParameter'});
dfs.plot('hkmebfg', 'label', 'ME Bay Fwd Gas', 'plots', {'hkmebfgt','hkmebfgc','hkmebfgv','hkmebfgs'});
dfs.plot('hkmebfgt','label','Temp','vars',{'Fwd_Gas_T','Fwd_Gas_Set_T','Fwd_Gas_Sink_T'});
dfs.plot('hkmebfgc','label','Current','vars',{'Fwd_Gas_OutputCurrent'});
dfs.plot('hkmebfgv','label','Voltage','vars',{'Fwd_Gas_OutputVoltage'});
dfs.plot('hkmebfgs','label','Status','vars',{'Fwd_Gas_DevStatus'});
dfs.plot('hkmecos', 'label', 'ME CO2 Stale', 'plots', {'hkmecosmes','hkmecoscoqcls'});
dfs.plot('hkmecosmes','label','ME Stale','vars',{'ME_CO2_Stale'});
dfs.plot('hkmecoscoqcls','label','CO2 QCL Stale','vars',{'CO2_QCL_Stale'});
dfs.end_col;
dfs.start_col;
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
dfs.plot('hkgdhk', 'label', 'GD HK', 'plots', {'hkgdhks','hkgdhkstale','hkgdhkpsia','hkgdhkt'});
dfs.plot('hkgdhks','label','Status','vars',{'Cal_Status'});
dfs.plot('hkgdhkstale','label','Stale','vars',{'Cal_Stale','GD_Stale'});
dfs.plot('hkgdhkpsia','label','psia','vars',{'Cal_P'});
dfs.plot('hkgdhkt','label','T','vars',{'Cal_T'});
dfs.plot('hkgd', 'label', 'GD', 'plots', {'hkgdslm','hkgdlpm'});
dfs.plot('hkgdslm','label','slm','vars',{'Cal_MassFlow','Cal_Set'});
dfs.plot('hkgdlpm','label','lpm','vars',{'Cal_VolFlow'});
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
dfs.plot('qclit', 'label', 'Temps', 'plots', {'qclitsspc','qclitsspm'});
dfs.plot('qclitsspc','label','SSP C','vars',{'SSP_C_T_FPGA','SSP_C_T_HtSink'});
dfs.plot('qclitsspm','label','SSP M','vars',{'SSP_M_T_FPGA','SSP_M_T_HtSink'});
dfs.end_col;
dfs.start_col;
dfs.plot('qclisspc', 'label', 'SSP C', 'plots', {'qclisspca','qclisspcnsr'});
dfs.plot('qclisspca','label','Amp','vars',{'SSP_C_amp0','SSP_C_amp1','SSP_C_noise0','SSP_C_noise1'});
dfs.plot('qclisspcnsr','label','NSR','vars',{'SSP_C_noise_pct0','SSP_C_noise_pct1'});
dfs.plot('qcliqclim', 'label', 'QCLI M', 'plots', {'qcliqclimw','qcliqclims','qcliqclimssp','qcliqclimo'});
dfs.plot('qcliqclimw','label','Wave','vars',{'QCLI_M_Wave'});
dfs.plot('qcliqclims','label','Scan','vars',{'SSP_M_Num'});
dfs.plot('qcliqclimssp','label','SSP','vars',{'SSP_M_Status'});
dfs.plot('qcliqclimo','label','Overflow','vars',{{'name','CAOVF1_M','var_name','SSP_M_Flags','bit_number',0},{'name','CAOVF2_M','var_name','SSP_M_Flags','bit_number',1},{'name','CAOVF3_M','var_name','SSP_M_Flags','bit_number',2},{'name','PAOVF1_M','var_name','SSP_M_Flags','bit_number',3},{'name','PAOVF2_M','var_name','SSP_M_Flags','bit_number',4},{'name','PAOVF3_M','var_name','SSP_M_Flags','bit_number',5},{'name','ADOVF1_M','var_name','SSP_M_Flags','bit_number',6},{'name','ADOVF2_M','var_name','SSP_M_Flags','bit_number',7},{'name','ADOVF3_M','var_name','SSP_M_Flags','bit_number',8}});
dfs.plot('qcli_qcli_m_stat', 'label', 'QCLI M stat', 'plots', {'qcli_qcli_m_statsn','qcli_qcli_m_stats','qcli_qcli_m_staterr','qcli_qcli_m_statfifodep','qcli_qcli_m_statflash','qcli_qcli_m_statmode','qcli_qcli_m_statrw','qcli_qcli_m_statstatus','qcli_qcli_m_statskip'});
dfs.plot('qcli_qcli_m_statsn','label','SN','vars',{'SSP_M_SN'});
dfs.plot('qcli_qcli_m_stats','label','Stale','vars',{'QCLI_M_Stale','SSP_M_Stale'});
dfs.plot('qcli_qcli_m_staterr','label','err','vars',{'QCLI_M_err'});
dfs.plot('qcli_qcli_m_statfifodep','label','fifodep','vars',{'QCLI_M_fifodep'});
dfs.plot('qcli_qcli_m_statflash','label','flash','vars',{'QCLI_M_flash'});
dfs.plot('qcli_qcli_m_statmode','label','mode','vars',{'QCLI_M_mode'});
dfs.plot('qcli_qcli_m_statrw','label','rw','vars',{'QCLI_M_rw'});
dfs.plot('qcli_qcli_m_statstatus','label','status','vars',{{'name','QCLI_M_present','var_name','QCLI_M_CS','bit_number',11},{'name','QCLI_M_laser','var_name','QCLI_M_s','bit_number',12},{'name','QCLI_M_cordte','var_name','QCLI_M_s','bit_number',11},{'name','QCLI_M_cmderr','var_name','QCLI_M_s','bit_number',13},{'name','QCLI_M_cksum','var_name','QCLI_M_s','bit_number',14},{'name','QCLI_M_busy','var_name','QCLI_M_s','bit_number',15},{'name','QCLI_M_loc','var_name','QCLI_M_s','bit_number',3},{'name','QCLI_M_lot','var_name','QCLI_M_s','bit_number',4},{'name','QCLI_M_dot','var_name','QCLI_M_s','bit_number',5},{'name','QCLI_M_waveerr','var_name','QCLI_M_s','bit_number',8},{'name','QCLI_M_ready','var_name','QCLI_M_s','bit_number',9}});
dfs.plot('qcli_qcli_m_statskip','label','Skip','vars',{'SSP_M_TS'});
dfs.end_col;
dfs.start_col;
dfs.plot('qclisspm', 'label', 'SSP M', 'plots', {'qclisspma','qclisspmnsr'});
dfs.plot('qclisspma','label','Amp','vars',{'SSP_M_amp0','SSP_M_amp1','SSP_M_noise0','SSP_M_noise1'});
dfs.plot('qclisspmnsr','label','NSR','vars',{'SSP_M_noise_pct0','SSP_M_noise_pct1'});
dfs.end_tab;
dfs.start_tab('COE');
dfs.start_col;
dfs.plot('coedcoeptrh', 'label', 'uD COE PTRH', 'plots', {'coedcoeptrhp','coedcoeptrht','coedcoeptrhrh'});
dfs.plot('coedcoeptrhp','label','P','vars',{'uD_COE_OE_P','uD_COE_LH_P'});
dfs.plot('coedcoeptrht','label','T','vars',{'uD_COE_OE_T','uD_COE_LH_T'});
dfs.plot('coedcoeptrhrh','label','RH','vars',{'uD_COE_OE_RH','uD_COE_LH_RH'});
dfs.plot('coedcoe', 'label', 'uD COE', 'plots', {'coedcoedac','coedcoeais','coedcoes'});
dfs.plot('coedcoedac','label','DAC','vars',{'uD_COE_VSet0','uD_COE_VSet1','uD_COE_VSet2','uD_COE_VSet3'});
dfs.plot('coedcoeais','label','AI Stat','vars',{'uD_COE_stat'});
dfs.plot('coedcoes','label','Status','vars',{{'name','Alert_CO2','var_name','uD_COE_stat0','bit_number',7},{'name','Reset_CO2','var_name','uD_COE_stat0','bit_number',3}});
dfs.plot('coedcoehk', 'label', 'uD COE HK', 'plots', {'coedcoehkms','coedcoehkfs','coedcoehkouv','coedcoehkain','coedcoehke'});
dfs.plot('coedcoehkms','label','M Sat','vars',{{'name','MSat0_CO2','var_name','uD_COE_stat0','bit_number',2},{'name','MSat1_CO2','var_name','uD_COE_stat1','bit_number',2},{'name','MSat2_CO2','var_name','uD_COE_stat2','bit_number',2},{'name','MSat3_CO2','var_name','uD_COE_stat3','bit_number',2},{'name','MSat4_CO2','var_name','uD_COE_stat4','bit_number',2},{'name','MSat5_CO2','var_name','uD_COE_stat5','bit_number',2},{'name','MSat6_CO2','var_name','uD_COE_stat6','bit_number',2},{'name','MSat7_CO2','var_name','uD_COE_stat7','bit_number',2}});
dfs.plot('coedcoehkfs','label','F Sat','vars',{{'name','FSat0_CO2','var_name','uD_COE_stat0','bit_number',1},{'name','FSat1_CO2','var_name','uD_COE_stat1','bit_number',1},{'name','FSat2_CO2','var_name','uD_COE_stat2','bit_number',1},{'name','FSat3_CO2','var_name','uD_COE_stat3','bit_number',1},{'name','FSat4_CO2','var_name','uD_COE_stat4','bit_number',1},{'name','FSat5_CO2','var_name','uD_COE_stat5','bit_number',1},{'name','FSat6_CO2','var_name','uD_COE_stat6','bit_number',1},{'name','FSat7_CO2','var_name','uD_COE_stat7','bit_number',1}});
dfs.plot('coedcoehkouv','label','OUV','vars',{{'name','OUV0_CO2','var_name','uD_COE_stat0','bit_number',0},{'name','OUV1_CO2','var_name','uD_COE_stat1','bit_number',0},{'name','OUV2_CO2','var_name','uD_COE_stat2','bit_number',0},{'name','OUV3_CO2','var_name','uD_COE_stat3','bit_number',0},{'name','OUV4_CO2','var_name','uD_COE_stat4','bit_number',0},{'name','OUV5_CO2','var_name','uD_COE_stat5','bit_number',0},{'name','OUV6_CO2','var_name','uD_COE_stat6','bit_number',0},{'name','OUV7_CO2','var_name','uD_COE_stat7','bit_number',0}});
dfs.plot('coedcoehkain','label','AI N','vars',{'uD_COE_N'});
dfs.plot('coedcoehke','label','Errs','vars',{'uD_COE_errs'});
dfs.plot('coeco', 'label', 'CO2', 'plots', {'coecop','coecoct','coecoft','coecort'});
dfs.plot('coecop','label','P','vars',{'CO2_CellP'});
dfs.plot('coecoct','label','Cell T','vars',{'CO2_Cell1T','CO2_Cell2T','CO2_Cell3T'});
dfs.plot('coecoft','label','Flow T','vars',{'CO2_SamInT','CO2_SamOutT'});
dfs.plot('coecort','label','Rov T','vars',{'CO2_RefInT','CO2_RefOutT'});
dfs.end_col;
dfs.start_col;
dfs.plot('coecoe', 'label', 'COE', 'plots', {'coecoecp','coecoedt','coecoetemi','coecoep','coecoet','coecoerh'});
dfs.plot('coecoecp','label','Cell P','vars',{'GDS_COE_CellP_Hi'});
dfs.plot('coecoedt','label','Det Tmon','vars',{'CO2_Ref_Det_Tmon','CO2_Sig_Det_Tmon'});
dfs.plot('coecoetemi','label','TEM Imon','vars',{'CO2_Ref_TEM_Imon','CO2_Sig_TEM_Imon'});
dfs.plot('coecoep','label','P','vars',{'GDS_COE_MS_P'});
dfs.plot('coecoet','label','T','vars',{'GDS_COE_MS_T'});
dfs.plot('coecoerh','label','RH','vars',{'GDS_COE_RH'});
dfs.plot('coecoehk', 'label', 'COE HK', 'plots', {'coecoehkics','coecoehkn','coecoehkc'});
dfs.plot('coecoehkics','label','I2C Status','vars',{{'name','C_Pkg_coll','var_name','GDS_COE_I2C_Status','bit_number',0},{'name','C_Busy','var_name','GDS_COE_I2C_Status','bit_number',1},{'name','C_Bus','var_name','GDS_COE_I2C_Status','bit_number',2},{'name','C_Bad_addr','var_name','GDS_COE_I2C_Status','bit_number',3},{'name','C_Arb_lost','var_name','GDS_COE_I2C_Status','bit_number',4},{'name','C_Nack','var_name','GDS_COE_I2C_Status','bit_number',5}});
dfs.plot('coecoehkn','label','Nreads','vars',{'GDS_COE_Nreads'});
dfs.plot('coecoehkc','label','Cmd','vars',{{'name','At_T_Sig','var_name','GDS_COE_cmd_stat','bit_number',0},{'name','At_T_Ref','var_name','GDS_COE_cmd_stat','bit_number',1}});
dfs.end_tab;
dfs.start_tab('MOE');
dfs.start_col;
dfs.plot('moedmoeptrh', 'label', 'uD MOE PTRH', 'plots', {'moedmoeptrhp','moedmoeptrht','moedmoeptrhrh'});
dfs.plot('moedmoeptrhp','label','P','vars',{'uD_MOE_OE_P','uD_MOE_LH_P'});
dfs.plot('moedmoeptrht','label','T','vars',{'uD_MOE_OE_T','uD_MOE_LH_T'});
dfs.plot('moedmoeptrhrh','label','RH','vars',{'uD_MOE_OE_RH','uD_MOE_LH_RH'});
dfs.plot('moedmoe', 'label', 'uD MOE', 'plots', {'moedmoedac','moedmoeais','moedmoes'});
dfs.plot('moedmoedac','label','DAC','vars',{'uD_MOE_VSet0','uD_MOE_VSet1','uD_MOE_VSet2','uD_MOE_VSet3'});
dfs.plot('moedmoeais','label','AI Stat','vars',{'uD_MOE_stat'});
dfs.plot('moedmoes','label','Status','vars',{{'name','Alert_CH4','var_name','uD_MOE_stat0','bit_number',7},{'name','Reset_CH4','var_name','uD_MOE_stat0','bit_number',3}});
dfs.plot('moedmoehk', 'label', 'uD MOE HK', 'plots', {'moedmoehkms','moedmoehkfs','moedmoehkouv','moedmoehkain','moedmoehke'});
dfs.plot('moedmoehkms','label','M Sat','vars',{{'name','MSat0_CH4','var_name','uD_MOE_stat0','bit_number',2},{'name','MSat1_CH4','var_name','uD_MOE_stat1','bit_number',2},{'name','MSat2_CH4','var_name','uD_MOE_stat2','bit_number',2},{'name','MSat3_CH4','var_name','uD_MOE_stat3','bit_number',2},{'name','MSat4_CH4','var_name','uD_MOE_stat4','bit_number',2},{'name','MSat5_CH4','var_name','uD_MOE_stat5','bit_number',2},{'name','MSat6_CH4','var_name','uD_MOE_stat6','bit_number',2},{'name','MSat7_CH4','var_name','uD_MOE_stat7','bit_number',2}});
dfs.plot('moedmoehkfs','label','F Sat','vars',{{'name','FSat0_CH4','var_name','uD_MOE_stat0','bit_number',1},{'name','FSat1_CH4','var_name','uD_MOE_stat1','bit_number',1},{'name','FSat2_CH4','var_name','uD_MOE_stat2','bit_number',1},{'name','FSat3_CH4','var_name','uD_MOE_stat3','bit_number',1},{'name','FSat4_CH4','var_name','uD_MOE_stat4','bit_number',1},{'name','FSat5_CH4','var_name','uD_MOE_stat5','bit_number',1},{'name','FSat6_CH4','var_name','uD_MOE_stat6','bit_number',1},{'name','FSat7_CH4','var_name','uD_MOE_stat7','bit_number',1}});
dfs.plot('moedmoehkouv','label','OUV','vars',{{'name','OUV0_CH4','var_name','uD_MOE_stat0','bit_number',0},{'name','OUV1_CH4','var_name','uD_MOE_stat1','bit_number',0},{'name','OUV2_CH4','var_name','uD_MOE_stat2','bit_number',0},{'name','OUV3_CH4','var_name','uD_MOE_stat3','bit_number',0},{'name','OUV4_CH4','var_name','uD_MOE_stat4','bit_number',0},{'name','OUV5_CH4','var_name','uD_MOE_stat5','bit_number',0},{'name','OUV6_CH4','var_name','uD_MOE_stat6','bit_number',0},{'name','OUV7_CH4','var_name','uD_MOE_stat7','bit_number',0}});
dfs.plot('moedmoehkain','label','AI N','vars',{'uD_MOE_N'});
dfs.plot('moedmoehke','label','Errs','vars',{'uD_MOE_errs'});
dfs.plot('moech', 'label', 'CH4', 'plots', {'moechp','moechct','moechft','moechrt'});
dfs.plot('moechp','label','P','vars',{'CH4_CellP'});
dfs.plot('moechct','label','Cell T','vars',{'CH4_Cell1T','CH4_Cell2T','CH4_Cell3T'});
dfs.plot('moechft','label','Flow T','vars',{'CH4_SamInT','CH4_SamOutT'});
dfs.plot('moechrt','label','Rov T','vars',{'CH4_Rov1T','CH4_Rov2T'});
dfs.end_tab;
dfs.start_tab('GDS');
dfs.start_col;
dfs.plot('gdsgdshk', 'label', 'GDS HK', 'plots', {'gdsgdshkics','gdsgdshkn'});
dfs.plot('gdsgdshkics','label','I2C Status','vars',{{'name','Pkg_coll','var_name','GDS_I2C_Status','bit_number',0},{'name','Busy','var_name','GDS_I2C_Status','bit_number',1},{'name','Bus','var_name','GDS_I2C_Status','bit_number',2},{'name','Bad_addr','var_name','GDS_I2C_Status','bit_number',3},{'name','Arb_lost','var_name','GDS_I2C_Status','bit_number',4},{'name','Nack','var_name','GDS_I2C_Status','bit_number',5}});
dfs.plot('gdsgdshkn','label','Nreads','vars',{'GDS_Nreads'});
dfs.plot('gdsgds', 'label', 'GDS', 'plots', {'gdsgdscs','gdsgdse','gdsgdst','gdsgdsp','gdsgdsrh'});
dfs.plot('gdsgdscs','label','Cmd Status','vars',{{'name','GDS_Cal_Hi','var_name','GDS_cmd_stat','bit_number',0},{'name','GDS_Cal_Lo','var_name','GDS_cmd_stat','bit_number',1},{'name','GDS_Cal_Ref','var_name','GDS_cmd_stat','bit_number',2},{'name','GDS_CO2_Ref','var_name','GDS_cmd_stat','bit_number',3},{'name','GDS_MM_Pump','var_name','GDS_cmd_stat','bit_number',4},{'name','GDS_MM_Exh','var_name','GDS_cmd_stat','bit_number',5},{'name','GDS_CO2_Pump','var_name','GDS_cmd_stat','bit_number',6},{'name','GDS_CO2_Exh','var_name','GDS_cmd_stat','bit_number',7}});
dfs.plot('gdsgdse','label','Entran','vars',{'Cal_Hi_HP','Cal_Hi_LP','Cal_Lo_HP','Cal_Lo_LP','Ref_HP','Ref_LP'});
dfs.plot('gdsgdst','label','Temps','vars',{'Rov1_T','Rov2_T','Rov3_T','Rov4_T','Rov5_T','Rov6_T','MM_Pump_T','MM_Mot_T','CO2_Pump_T','CO2_Mot_T','GDS_MS_T'});
dfs.plot('gdsgdsp','label','P','vars',{'GDS_MS_P'});
dfs.plot('gdsgdsrh','label','RH','vars',{'GDS_RH'});
dfs.end_tab;
dfs.start_tab('Bay');
dfs.start_col;
dfs.plot('bbhk', 'label', 'Bay HK', 'plots', {'bbhkics','bbhkn'});
dfs.plot('bbhkics','label','I2C Status','vars',{{'name','B_Pkg_coll','var_name','GDS_Bay_I2C_Status','bit_number',0},{'name','B_Busy','var_name','GDS_Bay_I2C_Status','bit_number',1},{'name','B_Bus','var_name','GDS_Bay_I2C_Status','bit_number',2},{'name','B_Bad_addr','var_name','GDS_Bay_I2C_Status','bit_number',3},{'name','B_Arb_lost','var_name','GDS_Bay_I2C_Status','bit_number',4},{'name','B_Nack','var_name','GDS_Bay_I2C_Status','bit_number',5}});
dfs.plot('bbhkn','label','Nreads','vars',{'GDS_Bay_Nreads'});
dfs.plot('bb', 'label', 'Bay', 'plots', {'bbcs','bbli','bbt','bbp','bbrh'});
dfs.plot('bbcs','label','Cmd Status','vars',{{'name','CO2_CAL_Gas_Inlet','var_name','GDS_Bay_cmd_stat','bit_number',0},{'name','CH4_CAL_Gas_Inlet','var_name','GDS_Bay_cmd_stat','bit_number',1}});
dfs.plot('bbli','label','Laser I','vars',{'CO2_QCL_I','CH4_QCL_I'});
dfs.plot('bbt','label','Temps','vars',{'CO2_Pamp_T','CO2_SSP_FPGA_T','CO2_24VT','CH4_Pamp_T','CH4_SSP_FPGA_T','CH4_24VT','GDS_Bay_MS_T'});
dfs.plot('bbp','label','P','vars',{'GDS_Bay_MS_P'});
dfs.plot('bbrh','label','RH','vars',{'GDS_Bay_RH'});
dfs.end_tab;
dfs.start_tab('Wind GPS');
dfs.start_col;
dfs.plot('wgpsw', 'label', 'Wind', 'plots', {'wgpsww','wgpswss','wgpswt'});
dfs.plot('wgpsww','label','Wind','vars',{'Wind_U','Wind_V','Wind_W'});
dfs.plot('wgpswss','label','So S','vars',{'Wind_SoS'});
dfs.plot('wgpswt','label','Temp','vars',{'Wind_SonicTemp'});
dfs.plot('wgpswhk', 'label', 'Wind HK', 'plots', {'wgpswhkt','wgpswhkfi','wgpswhkn','wgpswhkn_errors','wgpswhks'});
dfs.plot('wgpswhkt','label','d Time','vars',{'Wind_mlf_time'});
dfs.plot('wgpswhkfi','label','File Idx','vars',{'Wind_mlf_idx'});
dfs.plot('wgpswhkn','label','N samples','vars',{'Wind_N_samples'});
dfs.plot('wgpswhkn_errors','label','N errors','vars',{'Wind_N_errors'});
dfs.plot('wgpswhks','label','Stale','vars',{'Wind_stale'});
dfs.plot('wgpsgps', 'label', 'GPS', 'plots', {'wgpsgpsd','wgpsgpsl','wgpsgpslon','wgpsgpsa','wgpsgpss','wgpsgpsc'});
dfs.plot('wgpsgpsd','label','Drift','vars',{'GPS_TDrift'});
dfs.plot('wgpsgpsl','label','Lat','vars',{'GPS_Lat'});
dfs.plot('wgpsgpslon','label','Lon','vars',{'GPS_Lon'});
dfs.plot('wgpsgpsa','label','Alt','vars',{'GPS_Alt'});
dfs.plot('wgpsgpss','label','Speed','vars',{'GPS_Speed'});
dfs.plot('wgpsgpsc','label','Course','vars',{'GPS_Course'});
dfs.end_col;
dfs.start_col;
dfs.plot('wgpsgpshkn', 'label', 'GPS HK N', 'plots', {'wgpsgpshknnrmc','wgpsgpshknngga','wgpsgpshknn','wgpsgpshknn_errors','wgpsgpshknns'});
dfs.plot('wgpsgpshknnrmc','label','N RMC','vars',{'GPS_N_RMC'});
dfs.plot('wgpsgpshknngga','label','N GGA','vars',{'GPS_N_GGA'});
dfs.plot('wgpsgpshknn','label','N other','vars',{'GPS_N_other'});
dfs.plot('wgpsgpshknn_errors','label','N errors','vars',{'GPS_N_errors'});
dfs.plot('wgpsgpshknns','label','N Sats','vars',{'GPS_N_Sats'});
dfs.plot('wgpsgpshk', 'label', 'GPS HK', 'plots', {'wgpsgpshkhdop','wgpsgpshks','wgpsgpshkstale'});
dfs.plot('wgpsgpshkhdop','label','HDOP','vars',{'GPS_HDOP'});
dfs.plot('wgpsgpshks','label','Status','vars',{{'name','GPS_Fix','var_name','GPS_Fix_Q','bit_number',0},{'name','GPS_warn','var_name','GPS_Nav_status','bit_number',0}});
dfs.plot('wgpsgpshkstale','label','Stale','vars',{'GPS_stale'});
dfs.plot('wind_gps_gps_mlf', 'label', 'GPS mlf', 'plots', {'wind_gps_gps_mlft','wind_gps_gps_mlffi'});
dfs.plot('wind_gps_gps_mlft','label','d Time','vars',{'GPS_mlf_time'});
dfs.plot('wind_gps_gps_mlffi','label','File Idx','vars',{'GPS_mlf_idx'});
dfs.plot('wgpsicm', 'label', 'ICM', 'plots', {'wgpsicmm','wgpsicmr'});
dfs.plot('wgpsicmm','label','Max','vars',{'ICM_max_g'});
dfs.plot('wgpsicmr','label','Rate','vars',{'ICM_sps'});
dfs.end_col;
dfs.start_col;
dfs.plot('wgpsicmhk', 'label', 'ICM HK', 'plots', {'wgpsicmhkmlf','wgpsicmhkm','wgpsicmhkr','wgpsicmhkremainder','wgpsicmhkmsecs','wgpsicmhks','wgpsicmhkstatus','wgpsicmhkstale'});
dfs.plot('wgpsicmhkmlf','label','MLF','vars',{'ICM_mlf'});
dfs.plot('wgpsicmhkm','label','Mode','vars',{'ICM_mode'});
dfs.plot('wgpsicmhkr','label','Rate','vars',{'ICM_sps'});
dfs.plot('wgpsicmhkremainder','label','Remainder','vars',{'ICM_rem0','ICM_rem1'});
dfs.plot('wgpsicmhkmsecs','label','msecs','vars',{'ICM_msecs'});
dfs.plot('wgpsicmhks','label','Scale','vars',{'ICM_fsc'});
dfs.plot('wgpsicmhkstatus','label','Status','vars',{{'name','ICM_nack','var_name','ICM_fs','bit_number',2}});
dfs.plot('wgpsicmhkstale','label','Stale','vars',{'ICM_stale'});
dfs.end_tab;
dfs.end_col;
dfs.set_connection('127.0.0.1', 1366);
if nargout > 0
  dfs_out = dfs;
else
  dfs.resize(context_level);
end
