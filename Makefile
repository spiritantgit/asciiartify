BINARY=hello
APP=$(shell basename $(shell git remote get-url origin))
REGISTRY=spiritant

linux:
	GOARCH=amd64 GOOS=linux go build -o ${BINARY}-linux main.go

windows:
	GOARCH=arm64 GOOS=windows go build -o ${BINARY}-windows main.go

mac:
	GOARCH=amd64 GOOS=darwin go build -o ${BINARY}-darwin main.go

build: linux windows mac

image:
	docker build . -t ${REGISTRY}/${APP}:${VERSION}

push:
	docker push ${REGISTRY}/${APP}:${VERSION}

clean: 
	rm -rf ./hello-*