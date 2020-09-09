CUDA_DEV_PATH ?= /usr/local/cuda
CUDA_RT_PATH ?= /usr/local/cuda
INSTALL_PREFIX ?= /usr/local

BUILDDIR = build
BINARY = $(BUILDDIR)/cuda_memtest
LDFLAGS += -L$(CUDA_DEV_PATH)/lib{,64}/stubs -L$(CUDA_RT_PATH)/lib{,64} -ldl -lrt  -lnvidia-ml


all: dir $(BINARY)

dir:
	@mkdir -p $(BUILDDIR)

$(BINARY):
	nvcc -DENABLE_NVML=1 -o $(BINARY) cuda_memtest.cu tests.cu misc.cpp $(LDFLAGS)

install:
	install -d $(INSTALL_PREFIX)/bin/
	install -m 755 $(BUILDDIR)/cuda_memtest $(INSTALL_PREFIX)/bin

clean:
	rm $(BINARY)

