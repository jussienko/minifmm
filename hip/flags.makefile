CC_HIPCC=hipcc
CC=$(CC_$(COMPILER))

ifneq ($(COMPILER), HIPCC)
	$(error Only HIPCC support for this version of MiniFMM)
endif

ARCH=sm_70

CFLAGS_HIPCC=-std=c++11 -O3 -x cu -Xcompiler -fopenmp -arch=$(ARCH)
CFLAGS=$(CFLAGS_$(COMPILER))

LIBS=-Xcompiler -fopenmp

