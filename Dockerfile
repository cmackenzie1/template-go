# syntax=docker/dockerfile:1
ARG NAME=template-go

FROM golang:1.27-trixie AS builder
ARG NAME
WORKDIR /src

COPY go.mod go.sum* ./
RUN --mount=type=cache,target=/go/pkg/mod go mod download

COPY . .
RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    CGO_ENABLED=0 go build -trimpath -ldflags="-s -w" -o /out/${NAME} ./cmd/${NAME}

FROM debian:trixie-slim
ARG NAME
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && useradd --system --uid 10001 --no-create-home app

COPY --from=builder /out/${NAME} /usr/local/bin/${NAME}
USER 10001:10001
# Exec form doesn't expand ARGs; keep this in sync with NAME.
ENTRYPOINT ["/usr/local/bin/template-go"]
