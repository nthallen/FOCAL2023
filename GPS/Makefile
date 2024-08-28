include /usr/local/share/monarch/appgen.mk

CXXFLAGS+=-g -Wall -std=c++11 $(CPPFLAGS)
LDFLAGS=$(AG_LDFLAGS) -ldasio -lnl -lpthread

.PHONY : all
all : focalgps
OBJ = *.stackdump *.o

SPATIALDUALOBJ = focalgps.o gps_drvoui.o
OBJ += focalgps gps_drvoui.cc

focalgps : $(SPATIALDUALOBJ)
	$(CXX) -o focalgps $(CPPFLAGS) $(CXXFLAGS) $(SPATIALDUALOBJ) $(LDFLAGS)
focalgps.o : focalgps.cc focalgps.h gps_drv.h
gps_drvoui.o : gps_drvoui.cc
gps_drvoui.cc : gps_drv.oui
	oui -o gps_drvoui.cc gps_drv.oui

clean :
	rm -f $(OBJ)
