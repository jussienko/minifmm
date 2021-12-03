CC_CLANG=clang++
CC_CRAY=CC
CC_AMD=amdclang++
CC=$(CC_$(COMPILER))

ifeq ($(TARGET), NVIDIA)
CFLAGS_CLANG=-Ofast -mllvm --nvptx-f32ftz -fopenmp -fopenmp-targets=nvptx64-nvidia-cuda -Xopenmp-target -march=$(ARCH) 
LIBS_CLANG=-fopenmp -fopenmp-targets=nvptx64-nvidia-cuda -Xopenmp-target -march=$(ARCH)
else ifeq ($(TARGET), AMD)
CFLAGS_CRAY=-O3 -fopenmp -fopenmp-targets=amdgcn-amd-amdhsa -Xopenmp-target=amdgcn-amd-amdhsa -march=gfx908
CFLAGS_AMD=-Ofast -fopenmp -fopenmp-targets=amdgcn-amd-amdhsa -Xopenmp-target=amdgcn-amd-amdhsa -march=gfx908
LIBS_CRAY=-fopenmp -fopenmp-targets=amdgcn-amd-amdhsa -Xopenmp-target=amdgcn-amd-amdhsa -march=gfx908
LIBS_AMD=-fopenmp -fopenmp-targets=amdgcn-amd-amdhsa -Xopenmp-target=amdgcn-amd-amdhsa -march=gfx908
else
CFLAGS_CLANG=-Ofast -fopenmp -fopenmp-targets=x86_64 -march=$(ARCH) 
LIBS_CLANG=-fopenmp -fopenmp-targets=x86_64 -march=$(ARCH) 
endif

CFLAGS=$(CFLAGS_$(COMPILER))
LIBS=$(LIBS_$(COMPILER))
