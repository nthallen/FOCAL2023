# focal.spec
TGTDIR = /home/focal
tmcbase = focal.tmc
tmcbase = digio.tmc
cmdbase = dccc.cmd
genuibase = focal.genui

Module TMbase mode=ignore Panel=HK:
Module QCLI mode=baseignore
Module QCLI mode=noiseignore SUFFIX=_C ADDR=0x1010 RESET= SSPRATE=1 Panel=QCLI:
Module QCLI mode=noiseignore SUFFIX=_M ADDR=0x1000 RESET= SSPRATE=1 Panel=QCLI: CMDTYPE=#

Module Meerstetter mode=ignore name=ME_Bay src=ME_Bay.txt Panel=HK:
Module Meerstetter mode=ignore name=ME_CO2 src=ME_CO2.txt Panel=HK:
Module Meerstetter mode=ignore name=ME_CH4 src=ME_CH4.txt Panel=HK:

Module alicat mode=ignore name=CPC src=CPC.txt Panel=HK:
Module alicat mode=ignore name=MPC src=MPC.txt Panel=HK:
Module alicat mode=ignore name=GD  src=GD.txt Panel=HK:

Module uDACS mode=COE Panel=COE:
Module uDACS mode=MOE Panel=MOE:
Module GDS Panel=GDS: SVC=GDS
Module GDS Panel=COE: SVC=GDS_COE SBMODE=col mode=col
Module GDS Panel=MOE: SVC=GDS_MOE SBMODE=col mode=col
# Module GDS Panel=Bay: SVC=GDS_BAY

IGNORE = Makefile "*.o" "*.exe" "*.stackdump"
DISTRIB = services interact runfile.flight
DISTRIB = dccc.dccc USB.id
IDISTRIB = doit

focalclt : -lsubbuspp
focalsrvr : -lsubbuspp
focaldisp : digio_conv.tmc $extbase \
            focal.tbl uD_COE.tbl uD_MOE.tbl ME.tbl \
            alicat.tbl GDS.tbl GDS_COE.tbl GDS_MOE.tbl
focalalgo : focal.tma
doit : focal.doit
