function ui_focal
f = ne_dialg('FOCAL',1);
f = ne_dialg(f, 'add', 0, 1, 'gfocaltm', 'T Mbase' );
f = ne_dialg(f, 'add', 1, 0, 'pfocaltmtd', 'T Drift' );
f = ne_dialg(f, 'add', 1, 0, 'pfocaltmcpu', 'CPU' );
f = ne_dialg(f, 'add', 1, 0, 'pfocaltmram', 'RAM' );
f = ne_dialg(f, 'add', 1, 0, 'pfocaltmd', 'Disk' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalqclic', 'QCLI C' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqclicw', 'Wave' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqclics', 'Scan' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqclicssp', 'SSP' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqclico', 'Overflow' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalqcli_c_stat', 'QCLI C stat' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcli_c_statsn', 'SN' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcli_c_stats', 'Stale' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcli_c_statflash', 'flash' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcli_c_statmode', 'mode' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcli_c_statstatus', 'status' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcli_c_statskip', 'Skip' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalt', 'Temps' );
f = ne_dialg(f, 'add', 1, 0, 'pfocaltsspc', 'SSP C' );
f = ne_dialg(f, 'newcol');
f = ne_dialg(f, 'add', 0, 1, 'gfocalsspc', 'SSP C' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalsspca', 'Amp' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalsspcnsr', 'NSR' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalmebs', 'ME Bay Stale' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmebsmes', 'ME Stale' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmebsbhs', 'Bay Heat Stale' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalmebe', 'ME Bay Errors' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmebebhe', 'Bay Heat Errors' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalmebbh', 'ME Bay Bay Heat' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmebbht', 'Temp' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmebbhc', 'Current' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmebbhv', 'Voltage' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmebbhs', 'Status' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalmecos', 'ME CO2 Stale' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmecosmes', 'ME Stale' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmecoscoqcls', 'CO2 QCL Stale' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmecoscooes', 'CO2 OE Stale' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmecosfgs', 'Fwd Gas Stale' );
f = ne_dialg(f, 'newcol');
f = ne_dialg(f, 'add', 0, 1, 'gfocalmecoe', 'ME CO2 Errors' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmecoecoqcle', 'CO2 QCL Errors' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmecoecooee', 'CO2 OE Errors' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmecoefge', 'Fwd Gas Errors' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalmecocoqcl', 'ME CO2 CO2 QCL' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmecocoqclt', 'Temp' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmecocoqclc', 'Current' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmecocoqclv', 'Voltage' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmecocoqcls', 'Status' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalmecocooe', 'ME CO2 CO2 OE' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmecocooet', 'Temp' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmecocooec', 'Current' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmecocooev', 'Voltage' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmecocooes', 'Status' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalmecofg', 'ME CO2 Fwd Gas' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmecofgt', 'Temp' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmecofgc', 'Current' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmecofgv', 'Voltage' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmecofgs', 'Status' );
f = ne_dialg(f, 'newcol');
f = ne_dialg(f, 'add', 0, 1, 'gfocalmechs', 'ME CH4 Stale' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmechsmes', 'ME Stale' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmechschqcls', 'CH4 QCL Stale' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmechschoes', 'CH4 OE Stale' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalmeche', 'ME CH4 Errors' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmechechqcle', 'CH4 QCL Errors' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmechechoee', 'CH4 OE Errors' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalmechchqcl', 'ME CH4 CH4 QCL' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmechchqclt', 'Temp' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmechchqclc', 'Current' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmechchqclv', 'Voltage' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmechchqcls', 'Status' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalmechchoe', 'ME CH4 CH4 OE' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmechchoet', 'Temp' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmechchoec', 'Current' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmechchoev', 'Voltage' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmechchoes', 'Status' );
f = ne_dialg(f, 'newcol');
f = ne_dialg(f, 'add', 0, 1, 'gfocalcpchk', 'CPC HK' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcpchks', 'Status' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcpchkstale', 'Stale' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcpchkt', 'Torr' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalcpc', 'CPC' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcpct', 'Torr' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalgdhk', 'GD HK' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalgdhks', 'Status' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalgdhkstale', 'Stale' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalgdhkmbar', 'mbar' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalgdhkt', 'T' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalgd', 'GD' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalgdnccm', 'nccm' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalgdccm', 'ccm' );
f = ne_listdirs(f, 'FOCAL_DATA_DIR', 15);
f = ne_dialg(f, 'newcol');
ne_dialg(f, 'resize');
