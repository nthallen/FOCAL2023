# focal.spec
TGTDIR = /home/focal
tmcbase = focal.tmc

Module TMbase mode=ignore
Module QCLI mode=noiseignore SUFFIX=_C RESET=# SSPRATE=1
# Module QCLI mode=noise SUFFIX=_M RESET= SSPRATE=1

IGNORE = Makefile "*.o" "*.exe" "*.stackdump"

focaldisp : QCLI_C_conv.tmc focal.tbl
