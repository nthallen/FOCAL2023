include /usr/local/share/monarch/appgen.mk

CXXFLAGS+=-g -Wall -std=c++11 $(CPPFLAGS)
LDFLAGS=$(AG_LDFLAGS) -ldasio -lnl -lpthread

.PHONY : all
all : windmaster
OBJ = *.stackdump *.o

SPATIALDUALOBJ = windmaster.o wm_drvoui.o
OBJ += windmaster wm_drvoui.cc

windmaster : $(SPATIALDUALOBJ)
	$(CXX) -o windmaster $(CPPFLAGS) $(CXXFLAGS) $(SPATIALDUALOBJ) $(LDFLAGS)
windmaster.o : windmaster.cc windmaster.h wm_drv.h
wm_drvoui.o : wm_drvoui.cc
wm_drvoui.cc : wm_drv.oui
	oui -o wm_drvoui.cc wm_drv.oui

clean :
	rm -f $(OBJ)
