# focal.spec
TGTDIR = /home/focal
tmcbase = focal.tmc

Module TMbase mode=ignore
Module QCLI mode=noiseignore SUFFIX=_C RESET=# SSPRATE=1
# Module QCLI mode=noise SUFFIX=_M RESET= SSPRATE=1
Module Meerstetter mode=ignore name=Bay src=Bay_ME.txt
Module Meerstetter mode=ignore name=CO2 src=CO2_ME.txt
Module Meerstetter mode=ignore name=CH4 src=CH4_ME.txt

IGNORE = Makefile "*.o" "*.exe" "*.stackdump"

focaldisp : QCLI_C_conv.tmc focal.tbl me.tbl
focalalgo : focal.tma
