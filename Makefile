F90=mpif90

TESTFILES=$(wildcard *.pf)
TESTCODES=$(patsubst %.pf,%.F90,$(TESTFILES))
TESTOBJS=$(patsubst %.pf,%.o,$(TESTFILES))
SOURCES=$(wildcard *.f90)
OBJS=$(patsubst %.f90,%.o,$(SOURCES))

.SUFFIXES:
.SUFFIXES: .f90 .o .F90 .pf .inc

tests.x: $(OBJS) $(TESTOBJS) testSuites.inc
	$(F90) -o $@ -I$(PFUNIT)/mod -I$(PFUNIT)/include -I. \
		$(PFUNIT)/include/driver.F90 \
		$(filter-out testSuites.inc,$^) \
		-L$(PFUNIT)/lib/\
		$(LIBS) $(FFLAGS) -lpfunit 

testSuites.inc : $(TESTFILES) 
	rm -f $@
	for f in $(basename $^); do echo "ADD_TEST_SUITE($${f}_suite)" >> $@; done

$(OBJS) : %.o : %.f90
	$(F90) -c -o $@ $<

$(TESTCODES) : %.F90 : %.pf
	$(PFUNIT)/bin/pFUnitParser.py $< $@ -I$(PFUNIT)/include/

$(TESTOBJS) : %.o : %.F90 $(OBJS)
	$(F90) -c -o $@ -I$(PFUNIT)/mod/ $<

clean : 
	rm -rf $(OBJS) $(TESTOBJS) $(TESTCODES) tests.x testSuites.inc

.PHONY: clean

include $(PFUNIT)/include/base.mk
