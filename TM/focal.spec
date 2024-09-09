# focal.spec
TGTDIR = /home/focal
tmcbase = focal.tmc
tmcbase = digio.tmc
cmdbase = dccc.cmd
genuibase = focal.genui

Module TMbase mode=ignore Panel=HK:
Module QCLI mode=baseignore
Module QCLI mode=noiseignore SUFFIX=_C ADDR=0x1010 ACQCFG=ABC3R RESET= SSPRATE=1 Panel=QCLI:
Module QCLI mode=noiseignore SUFFIX=_M ADDR=0x1000 ACQCFG=AB3R  RESET= SSPRATE=1 Panel=QCLI: CMDTYPE=#

Module Meerstetter mode=ignore name=ME_Bay src=ME_Bay.txt Panel=HK:
Module Meerstetter mode=ignore name=ME_CO2 src=ME_CO2.txt Panel=HK:
Module Meerstetter mode=ignore name=ME_CH4 src=ME_CH4.txt Panel=HK:

Module alicat mode=ignore name=CPC src=CPC.txt Panel=HK:
Module alicat mode=ignore name=MPC src=MPC.txt Panel=HK:
Module alicat mode=ignore name=GD  src=GD.txt Panel=HK:

Module uDACS mode=COE Panel=COE: TBLNAME=CH4_default
Module uDACS mode=MOE Panel=MOE: TBLNAME=CH4_default
Module GDS Panel=GDS: SVC=GDS TBLNAME=GDS
Module GDS Panel=COE: SVC=GDS_COE SBMODE=col mode=col TBLNAME=GDS_COE
# Module GDS Panel=MOE: SVC=GDS_MOE SBMODE=col mode=col
Module GDS Panel=Bay: SVC=GDS_Bay TBLNAME=GDS_Bay
Module WindMaster Panel=Wind: SVC=Wind TBLNAME=Wind
Module GPS Panel=GPS: TBLNAME=GPS

IGNORE = Makefile "*.o" "*.exe" "*.stackdump"
DISTRIB = services interact runfile.flight
DISTRIB = dccc.dccc USB.id
IDISTRIB = doit

focalclt : -lsubbuspp
focalsrvr : -lsubbuspp
focaldisp : digio_conv.tmc $extbase \
            focal.tbl uDACS.tbl ME.tbl \
            alicat.tbl GDSes.tbl Wind_GPS_Accel.tbl
focaljsonext : digio_conv.tmc $extbase $genuibase
focalalgo : focal.tma
doit : focal.doit
%%
CXXFLAGS=-g
