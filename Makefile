FC  = gfortran 
#FC  = ifx
#FC = nvfortran
RM  = rm -f
#RM  = del
CP  = cp -f
#CP  = copy /y
include OPTION_$(FC)
 
SRC_NG  = ng.f90
EXE_NG1 = ng_seq.exe
EXE_NG2 = ng_omp.exe

SRC_OK  = ok.f90
EXE_OK1 = ok_seq.exe
EXE_OK2 = ok_omp.exe

default: $(EXE_NG1) $(EXE_NG2) $(EXE_OK1) $(EXE_OK2)

$(EXE_NG1):
	$(FC) $(FFLAG) -o $@ $(SRC_NG) 
	$(RM) *.mod *.L *.o *.optrpt

$(EXE_NG2): 
	$(FC) $(FFLAG) $(FSMP) -o $@ $(SRC_NG)
	$(RM) *.mod *.L *.o *.optrpt

$(EXE_OK1):
	$(FC) $(FFLAG) -o $@ $(SRC_OK)
	$(RM) *.mod *.L *.o *.optrpt

$(EXE_OK2):
	$(FC) $(FFLAG) $(FSMP) -o $@ $(SRC_OK)
	$(RM) *.mod *.L *.o *.optrpt

clean:
	$(RM) *.exe *.mod *.L *.o *.optrpt

distclean:
	$(RM) *.exe *.mod *.L *.o *.optrpt *.txt
