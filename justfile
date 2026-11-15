name := "template-go"

default:
    @just --list

fmt:
    go fmt ./...

build:
    go build -trimpath -o bin/{{name}} ./cmd/{{name}}

lint:
    golangci-lint run

run:
    go run ./cmd/{{name}}

test:
    go test -race ./...

image:
    docker build --build-arg NAME={{name}} -t {{name}} .
