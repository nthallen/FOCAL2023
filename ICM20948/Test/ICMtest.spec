prefix = icmt
tmcbase = base.tmc
cmdbase = ICMtest.cmd
genuibase = ICMtest.genui

Module TMbase mode=ignore
Module ../TM/ICM20948 mode=nopeaks

TGTDIR = /home/focal/ICMtest
SCRIPT = VERSION Experiment.config
DISTRIB = interact services
IGNORE = Makefile "*.exe"

icmtdisp : $extbase ICMtest.tbl
icmtjsonext : $extbase $genuibase
icmtalgo : ICMtest.tma
doit : ICMtest.doit
%%
GENUI_ENG_DIR=eng
