# focal.spec
TGTDIR = /home/focal
tmcbase = focal.tmc
tmcbase = digio.tmc
cmdbase = dccc.cmd
genuibase = focal.genui

Module TMbase mode=ignore Panel=HK
Module QCLI mode=noiseignore SUFFIX=_C ADDR=0x1010 RESET= SSPRATE=1 Panel=QCLI
# Module QCLI mode=noiseignore SUFFIX=_M RESET= SSPRATE=1
Module Meerstetter mode=ignore name=ME_Bay src=ME_Bay.txt Panel=HK
Module Meerstetter mode=ignore name=ME_CO2 src=ME_CO2.txt Panel=HK
Module Meerstetter mode=ignore name=ME_CH4 src=ME_CH4.txt Panel=HK

Module alicat mode=ignore name=CPC src=CPC.txt Panel=HK
Module alicat mode=ignore name=GD  src=GD.txt Panel=HK

Module uDACS Panel=uDACS

IGNORE = Makefile "*.o" "*.exe" "*.stackdump"
DISTRIB = services interact runfile.flight
DISTRIB = dccc.dccc
IDISTRIB = doit

focalsrvr : -lsubbuspp
focaldisp : digio_conv.tmc QCLI_C_conv.tmc uDACS_CO2_conv.tmc \
            focal.tbl uDACS.tbl ME.tbl alicat.tbl
focalalgo : focal.tma
doit : focal.doit
