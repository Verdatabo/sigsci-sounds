# sigsci-sounds Makefile

all: deps build

deps:
	go get github.com/hajimehoshi/go-mp3
	go get github.com/hajimehoshi/oto
	go get github.com/pkg/errors
	go get github.com/faiface/beep
	go get -u golang.org/x/lint/golint
	go get github.com/faiface/beep
	go get github.com/signalsciences/go-sigsci

build:
	go build -i sigsci-sounds.go

install:
	export GOBIN=$GOPATH/bin
	go install sigsci-sounds.go

lint:
	find . -name '*.go' | xargs gofmt -w -s
	golint sigsci-sounds.go
	go vet

run:
	go run sigsci-sounds.go

test:
	go run sigsci-sounds.go test

clean:
	-rm sigsci-sounds