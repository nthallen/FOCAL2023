%%
% Bottle pressure sensors
% M3041-000005-05KPG
% Hi Pressure: 1-5V => 0-5000 psi
% M3041-000005-100PG
% Lo Pressure: 1-5V => 0-100  psi
%
% The voltage FSR is +/- 6.144 V which maps to
% +/- 2^15.
Vfs = 6.144;
Nfs = 2^15;
Vlsb = Vfs/Nfs;
%%
% Hi Pressure
Pfs = 5000;
%%
Pfs = 100;
%%
Vmax = 5;
Vmin = 1;
Vrange = Vmax-Vmin;
PVslope = Pfs/Vrange;
Plsb = PVslope * Vlsb;
% looks like 1 decimal place of precision for Hi (%6.1lf), 3 for Lo
% (%7.3lf)
%%
Nmin = Nfs*Vmin/Vfs;
Nmax = Nfs*Vmax/Vfs;
