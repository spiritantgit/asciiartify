BINARY=hello

linux:
	GOARCH=amd64 GOOS=linux go build -o ${BINARY}-linux main.go

windows:
	GOARCH=amd64 GOOS=windows go build -o ${BINARY}-windows main.go

mac:
	GOARCH=amd64 GOOS=darwin go build -o ${BINARY}-darwin main.go

clean: 
	rm -rf ./hello-*