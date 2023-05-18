BINARY=hello
PROJECT=spiritant/makefile
VERSION=$(shell git rev-parse --short HEAD)
REGISTRY=gcr.io
TARGETOS=linux #linux #windows or #macos

linux:
	GOARCH=amd64 GOOS=linux go build -o ${BINARY}-linux main.go

windows:
	GOARCH=arm64 GOOS=windows go build -o ${BINARY}-windows main.go

macos:
	GOARCH=amd64 GOOS=darwin go build -o ${BINARY}-darwin main.go

build: linux windows macos

image:
	docker build --build-arg MY_ARCH=${TARGETOS} -t ${REGISTRY}/${PROJECT}:${VERSION}-${TARGETOS} .

push:
	docker push ${REGISTRY}/${PROJECT}:${VERSION}-${TARGETOS}

clean: 
	docker image list --format "table {{.CreatedAt}}\t{{.ID}}" | sort -n | tail -n 1 |  awk '{ print $$5 }' | xargs docker rmi -f 
	