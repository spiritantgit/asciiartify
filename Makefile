BINARY=hello
APP=$(shell basename $(shell git remote get-url origin))
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
REGISTRY=spiritant
TARGETOS=linux #linux #windows or #macos

linux:
	GOARCH=amd64 GOOS=linux go build -o ${BINARY}-linux main.go

windows:
	GOARCH=arm64 GOOS=windows go build -o ${BINARY}-windows main.go

macos:
	GOARCH=amd64 GOOS=darwin go build -o ${BINARY}-darwin main.go

build: linux windows macos

image:
	docker build --build-arg MY_ARCH=${TARGETOS} -t ${REGISTRY}/${APP}:${VERSION}-${TARGETOS} .

push:
	docker push ${REGISTRY}/${APP}:${VERSION}

clean: 
	docker rmi -f $(docker image list --format "table {{.CreatedAt}}\t{{.ID}}" | sort -n | tail -n 1 |  awk '{ print $5 }')