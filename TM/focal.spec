# focal.spec
TGTDIR = /home/focal
tmcbase = focal.tmc
genuibase = focal.genui

Module TMbase mode=ignore
Module QCLI mode=noiseignore SUFFIX=_C RESET=# SSPRATE=1
# Module QCLI mode=noise SUFFIX=_M RESET= SSPRATE=1
Module Meerstetter mode=ignore name=Bay src=Bay_ME.txt
Module Meerstetter mode=ignore name=CO2 src=CO2_ME.txt
Module Meerstetter mode=ignore name=CH4 src=CH4_ME.txt

Module alicat mode=ignore name=CPC src=CPC.txt
Module alicat mode=ignore name=GD  src=GD.txt

IGNORE = Makefile "*.o" "*.exe" "*.stackdump"

focaldisp : QCLI_C_conv.tmc focal.tbl me.tbl alicat.tbl
focalalgo : focal.tma
