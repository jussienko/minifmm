CC_NVCC=hipcc -x cu
CC_AMD=hipcc
CC=$(CC_$(COMPILER))

# ARCH=sm_70
ARCH=gfx908

CFLAGS_NVCC=-std=c++11 -O3 -Xcompiler -fopenmp -arch=$(ARCH)
CFLAGS_AMD=-std=c++11 -O3 -Xcompiler -fopenmp --offload-arch=$(ARCH)
CFLAGS=$(CFLAGS_$(COMPILER))

LIBS=-Xcompiler -fopenmp

