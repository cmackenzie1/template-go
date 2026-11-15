# template-go

Minimal Go project template.

- `cmd/template-go` – entrypoint
- `internal/` – private packages
- `Dockerfile` – multi-stage build (Debian trixie)
- `justfile` – `fmt`, `lint`, `build`, `test`, `run`, `image`
- `.github/` – CI and weekly Dependabot

## Using this template

Rename `template-go` in:

- `go.mod` (module path) and the import in `cmd/template-go/main.go`
- the `cmd/template-go` directory
- `name` in `justfile`
- `NAME` default and `ENTRYPOINT` in `Dockerfile`
