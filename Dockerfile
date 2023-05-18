FROM quay.io/projectquay/golang:1.20 as builder

WORKDIR /go/src/app
COPY . .
RUN make build
ENTRYPOINT ["ls", "-l"]

FROM busybox
WORKDIR /home
COPY --from=builder /go/src/app/hello-* /home
ENTRYPOINT ["tail", "-f", "/dev/null"]

