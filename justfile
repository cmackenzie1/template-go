name := "template-go"

default:
    @just --list

fmt:
    go fmt ./...

build:
    go build -trimpath -o bin/{{name}} ./cmd/{{name}}

test:
    go test -race ./...

image:
    docker build --build-arg NAME={{name}} -t {{name}} .
