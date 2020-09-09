CUDA_PATH ?= /usr/local/cuda

BUILDDIR = build
BINARY = $(BUILDDIR)/cuda_memtest
LDFLAGS += -L$(CUDA_PATH)/lib{,64}/stubs -ldl -lrt  -lnvidia-ml


all: dir $(BINARY)

dir:
	@mkdir -p $(BUILDDIR)

$(BINARY):
	nvcc -DENABLE_NVML=1 -o $(BINARY) cuda_memtest.cu tests.cu misc.cpp $(LDFLAGS)

clean:
	rm $(BINARY)

