BUILDDIR = build
BINARY = $(BUILDDIR)/cuda_memtest
all: dir $(BINARY)

dir:
	@mkdir -p $(BUILDDIR)

$(BINARY):
	nvcc -DENABLE_NVML=1 -o $(BINARY) cuda_memtest.cu tests.cu misc.cpp -lnvidia-ml

clean:
	rm $(BINARY)

