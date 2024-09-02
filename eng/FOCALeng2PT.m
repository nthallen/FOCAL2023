function FOCALeng2PT
%This is a customized eng to PT file conversion program for HCI.
%This creates the PT.mat file required by the ICOSfit programs.
cfg = load_ICOSfit_cfg;
runs = ne_load_runsdir('FOCAL_DATA_DIR');
run = getrun(1);
E = load_eng('focaleng_1.mat', runs, run);
%E10 = load_eng('HCIeng_10.mat', runs, run);
if isempty(E) 
    return;
end
T1 = E.Tfocaleng_1;
% T10 = E10.THCIeng_10;

if strcmp(cfg.ScanDir,'SSP_C')
    PT.TPT = T1;
    PT.CellP = E.C_AbsP_P; %cell pressure (in Torr) to use for fit
    PT.Tavg = 273.15 + E.CO2_SamInT; %gas temp (in K) to use for fit
      PT.ScanNum = E.SSP_C_Num;
    PT.QCLI_Wave = E.QCLI_C_Wave; %for example QCLI_C_Wave
elseif strcmp(cfg.ScanDir,'SSP_M') || strcmp(cfg.ScanDir,'SSP_Mo')
    PT.TPT = T1;
    PT.CellP = E.M_AbsP_P; %cell pressure (in Torr) to use for fit
    % PT.Tavg = 273.15 + (E10.CCel1T + E10.CCel2T)/2; %gas temp (in K) to use for fit
     PT.Tavg = 273.15 + E.CH4_SamInT; %gas temp (in K) to use for fit
      PT.ScanNum = E.SSP_M_Num;
    PT.QCLI_Wave = E.QCLI_M_Wave; %for example QCLI_C_Wave
elseif strcmp(cfg.ScanDir,'SSP_I')
    PT.TPT = T1;
    PT.CellP = interp1(fastavg(T10,10),fastavg(E10.ICelLP,10),T1);
    PT.Tavg = 273.15 + mean([E.ICel1T,E.ICel2T,E.ISk1T,E.ISk3T]');
    if isfield(E10,'SSP_I_Num')
      PT.ScanNum = interp1(T10,E10.SSP_I_Num,T1,'nearest','extrap');
    else
      PT.ScanNum = E.SSP_I_Num;
    end
    PT.QCLI_Wave = E.QCLI_I_Wave;
else
    fprintf(1,'Unable to identify instrument from ScanDir "%s"\n', ...
        cfg.ScanDir);
    return;
end
save PT.mat -STRUCT PT

function E = load_eng(base, runs, run)
file = base;
if ~exist(file, 'file')
    file = [runs '/' run '/' file];
end
if exist(file, 'file')
    E = load(file);
else
    fprintf(1,'Unable to locate engineering data file "%s"\n', base);
    E = [];
end
