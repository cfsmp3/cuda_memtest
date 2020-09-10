FROM nvidia/cuda:11.0-devel-ubuntu18.04 as builder
WORKDIR /app
COPY . .
RUN make
FROM nvidia/cuda:11.0-base-ubuntu18.04
COPY --from=builder /app/build/cuda_memtest /usr/local/bin/cuda_memtest
ENTRYPOINT ["/usr/local/bin/cuda_memtest"]
