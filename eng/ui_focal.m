function ui_focal(dirfunc, stream)
% ui_focal
% ui_focal(dirfunc [, stream])
% dirfunc is a string specifying the name of a function
%   that specifies where data run directories are stored.
% stream is an optional argument specifying which stream
%   the run directories have recorded, e.g. 'SerIn'
if nargin < 1
  dirfunc = 'FOCAL_DATA_DIR';
end
if nargin >= 2
  f = ne_dialg(stream, 1);
else
  f = ne_dialg('FOCAL',1);
end
f = ne_dialg(f, 'newcol');
f = ne_dialg(f, 'newtab', 'HK');
f = ne_dialg(f, 'add', 0, 1, 'gfocalhkhk', 'HK' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkhks', 'Status' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalhktm', 'T Mbase' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhktmtd', 'T Drift' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhktmcpu', 'CPU' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhktmram', 'RAM' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhktmd', 'Disk' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalhkmebs', 'ME Bay Stale' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkmebsmes', 'ME Stale' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkmebsfgs', 'Fwd Gas Stale' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalhkmebe', 'ME Bay Errors' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkmebefge', 'Fwd Gas Errors' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalhkmebfg', 'ME Bay Fwd Gas' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkmebfgt', 'Temp' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkmebfgc', 'Current' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkmebfgv', 'Voltage' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkmebfgs', 'Status' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalhkmecos', 'ME CO2 Stale' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkmecosmes', 'ME Stale' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkmecoscoqcls', 'CO2 QCL Stale' );
f = ne_dialg(f, 'newcol');
f = ne_dialg(f, 'add', 0, 1, 'gfocalhkmecoe', 'ME CO2 Errors' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkmecoecoqcle', 'CO2 QCL Errors' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalhkmecocoqcl', 'ME CO2 CO2 QCL' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkmecocoqclt', 'Temp' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkmecocoqclc', 'Current' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkmecocoqclv', 'Voltage' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkmecocoqcls', 'Status' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalhkmechs', 'ME CH4 Stale' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkmechsmes', 'ME Stale' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkmechschqcls', 'CH4 QCL Stale' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalhkmeche', 'ME CH4 Errors' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkmechechqcle', 'CH4 QCL Errors' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalhkmechchqcl', 'ME CH4 CH4 QCL' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkmechchqclt', 'Temp' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkmechchqclc', 'Current' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkmechchqclv', 'Voltage' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkmechchqcls', 'Status' );
f = ne_dialg(f, 'newcol');
f = ne_dialg(f, 'add', 0, 1, 'gfocalhkcpchk', 'CPC HK' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkcpchks', 'Status' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkcpchkstale', 'Stale' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkcpchkt', 'Torr' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalhkcpc', 'CPC' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkcpct', 'Torr' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalhkmpchk', 'MPC HK' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkmpchks', 'Status' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkmpchkstale', 'Stale' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkmpchkt', 'Torr' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalhkmpc', 'MPC' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkmpct', 'Torr' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalhkgdhk', 'GD HK' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkgdhks', 'Status' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkgdhkstale', 'Stale' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkgdhkpsia', 'psia' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkgdhkt', 'T' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalhkgd', 'GD' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkgdslm', 'slm' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalhkgdlpm', 'lpm' );
f = ne_dialg(f, 'newcol');
f = ne_dialg(f, 'newtab', 'QCLI');
f = ne_dialg(f, 'add', 0, 1, 'gfocalqcliqclic', 'QCLI C' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcliqclicw', 'Wave' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcliqclics', 'Scan' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcliqclicssp', 'SSP' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcliqclico', 'Overflow' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalqcli_qcli_c_stat', 'QCLI C stat' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcli_qcli_c_statsn', 'SN' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcli_qcli_c_stats', 'Stale' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcli_qcli_c_staterr', 'err' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcli_qcli_c_statfifodep', 'fifodep' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcli_qcli_c_statflash', 'flash' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcli_qcli_c_statmode', 'mode' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcli_qcli_c_statrw', 'rw' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcli_qcli_c_statstatus', 'status' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcli_qcli_c_statskip', 'Skip' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalqclit', 'Temps' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqclitsspc', 'SSP C' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqclitsspm', 'SSP M' );
f = ne_dialg(f, 'newcol');
f = ne_dialg(f, 'add', 0, 1, 'gfocalqclisspc', 'SSP C' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqclisspca', 'Amp' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqclisspcnsr', 'NSR' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalqcliqclim', 'QCLI M' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcliqclimw', 'Wave' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcliqclims', 'Scan' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcliqclimssp', 'SSP' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcliqclimo', 'Overflow' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalqcli_qcli_m_stat', 'QCLI M stat' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcli_qcli_m_statsn', 'SN' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcli_qcli_m_stats', 'Stale' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcli_qcli_m_staterr', 'err' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcli_qcli_m_statfifodep', 'fifodep' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcli_qcli_m_statflash', 'flash' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcli_qcli_m_statmode', 'mode' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcli_qcli_m_statrw', 'rw' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcli_qcli_m_statstatus', 'status' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqcli_qcli_m_statskip', 'Skip' );
f = ne_dialg(f, 'newcol');
f = ne_dialg(f, 'add', 0, 1, 'gfocalqclisspm', 'SSP M' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqclisspma', 'Amp' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalqclisspmnsr', 'NSR' );
f = ne_dialg(f, 'newcol');
f = ne_dialg(f, 'newtab', 'COE');
f = ne_dialg(f, 'add', 0, 1, 'gfocalcoedcoeptrh', 'uD COE PTRH' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcoedcoeptrhp', 'P' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcoedcoeptrht', 'T' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcoedcoeptrhrh', 'RH' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalcoedcoe', 'uD COE' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcoedcoedac', 'DAC' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcoedcoeais', 'AI Stat' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcoedcoes', 'Status' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalcoedcoehk', 'uD COE HK' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcoedcoehkms', 'M Sat' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcoedcoehkfs', 'F Sat' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcoedcoehkouv', 'OUV' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcoedcoehkain', 'AI N' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcoedcoehke', 'Errs' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalcoeco', 'CO2' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcoecop', 'P' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcoecoct', 'Cell T' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcoecoft', 'Flow T' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcoecort', 'Rov T' );
f = ne_dialg(f, 'newcol');
f = ne_dialg(f, 'add', 0, 1, 'gfocalcoecoe', 'COE' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcoecoecp', 'Cell P' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcoecoedt', 'Det Tmon' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcoecoetemi', 'TEM Imon' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcoecoep', 'P' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcoecoet', 'T' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcoecoerh', 'RH' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalcoecoehk', 'COE HK' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcoecoehkics', 'I2C Status' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcoecoehkn', 'Nreads' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalcoecoehkc', 'Cmd' );
f = ne_dialg(f, 'newcol');
f = ne_dialg(f, 'newtab', 'MOE');
f = ne_dialg(f, 'add', 0, 1, 'gfocalmoedmoeptrh', 'uD MOE PTRH' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmoedmoeptrhp', 'P' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmoedmoeptrht', 'T' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmoedmoeptrhrh', 'RH' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalmoedmoe', 'uD MOE' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmoedmoedac', 'DAC' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmoedmoeais', 'AI Stat' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmoedmoes', 'Status' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalmoedmoehk', 'uD MOE HK' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmoedmoehkms', 'M Sat' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmoedmoehkfs', 'F Sat' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmoedmoehkouv', 'OUV' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmoedmoehkain', 'AI N' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmoedmoehke', 'Errs' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalmoech', 'CH4' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmoechp', 'P' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmoechct', 'Cell T' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmoechft', 'Flow T' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalmoechrt', 'Rov T' );
f = ne_dialg(f, 'newcol');
f = ne_dialg(f, 'newtab', 'GDS');
f = ne_dialg(f, 'add', 0, 1, 'gfocalgdsgdshk', 'GDS HK' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalgdsgdshkics', 'I2C Status' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalgdsgdshkn', 'Nreads' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalgdsgds', 'GDS' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalgdsgdscs', 'Cmd Status' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalgdsgdse', 'Entran' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalgdsgdst', 'Temps' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalgdsgdsp', 'P' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalgdsgdsrh', 'RH' );
f = ne_dialg(f, 'newcol');
f = ne_dialg(f, 'newtab', 'Bay');
f = ne_dialg(f, 'add', 0, 1, 'gfocalbbhk', 'Bay HK' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalbbhkics', 'I2C Status' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalbbhkn', 'Nreads' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalbb', 'Bay' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalbbcs', 'Cmd Status' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalbbli', 'Laser I' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalbbt', 'Temps' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalbbp', 'P' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalbbrh', 'RH' );
f = ne_dialg(f, 'newcol');
f = ne_dialg(f, 'newtab', 'Wind GPS');
f = ne_dialg(f, 'add', 0, 1, 'gfocalwgpsw', 'Wind' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpsww', 'Wind' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpswss', 'So S' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpswt', 'Temp' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalwgpswhk', 'Wind HK' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpswhkt', 'd Time' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpswhkfi', 'File Idx' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpswhkn', 'N samples' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpswhkn_errors', 'N errors' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpswhks', 'Stale' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalwgpsgps', 'GPS' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpsgpsd', 'Drift' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpsgpsl', 'Lat' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpsgpslon', 'Lon' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpsgpsa', 'Alt' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpsgpss', 'Speed' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpsgpsc', 'Course' );
f = ne_dialg(f, 'newcol');
f = ne_dialg(f, 'add', 0, 1, 'gfocalwgpsgpshkn', 'GPS HK N' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpsgpshknnrmc', 'N RMC' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpsgpshknngga', 'N GGA' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpsgpshknn', 'N other' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpsgpshknn_errors', 'N errors' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpsgpshknns', 'N Sats' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalwgpsgpshk', 'GPS HK' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpsgpshkhdop', 'HDOP' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpsgpshks', 'Status' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpsgpshkstale', 'Stale' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalwind_gps_gps_mlf', 'GPS mlf' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwind_gps_gps_mlft', 'd Time' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwind_gps_gps_mlffi', 'File Idx' );
f = ne_dialg(f, 'add', 0, 1, 'gfocalwgpsicm', 'ICM' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpsicmm', 'Max' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpsicmr', 'Rate' );
f = ne_dialg(f, 'newcol');
f = ne_dialg(f, 'add', 0, 1, 'gfocalwgpsicmhk', 'ICM HK' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpsicmhkmlf', 'MLF' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpsicmhkm', 'Mode' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpsicmhkr', 'Rate' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpsicmhkremainder', 'Remainder' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpsicmhkmsecs', 'msecs' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpsicmhks', 'Scale' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpsicmhkstatus', 'Status' );
f = ne_dialg(f, 'add', 1, 0, 'pfocalwgpsicmhkstale', 'Stale' );
f = ne_dialg(f, 'newcol');
f = ne_dialg(f, 'newtab', 'Runs');
f = ne_listdirs(f, dirfunc, 15);
f = ne_dialg(f, 'newcol');
ne_dialg(f, 'resize');
