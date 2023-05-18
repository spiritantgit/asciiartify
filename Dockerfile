FROM quay.io/projectquay/golang:1.20 as builder
WORKDIR /go/src/app
COPY . .
RUN make build

FROM busybox
WORKDIR /home
ARG MY_ARCH
COPY --from=builder /go/src/app/hello-$MY_ARCH /home
ENTRYPOINT ["tail", "-f", "/dev/null"] 

