# eFlow FHIR IG Monorepo

This repository is a clean, minimal, reproducible workspace for multiple HL7 FHIR IG Publisher + SUSHI projects.

## Structure

- igs/eflow-core – cross-cutting patterns (security/audit/errors + base operations)
- igs/eflow-server – umbrella server contract (CapabilityStatement + conformance matrix)
- igs/eflow-rx – module IG
- igs/eflow-diga – module IG
- igs/eflow-patrech – module IG
- igs/eflow-eu – module IG
- igs/eflow-transfer – module IG

Each IG is a self-contained IG Publisher project with its own ig.ini, sushi-config.yaml, and input/ folder. Build artifacts are ignored by git.

## Build one IG

Example:

```shell
./build-all.sh --ig [list of ig names]

# Beispiel
- ./build-all.sh --ig rx erp-eu
```

## Build all IGs

```shell
./build-all.sh
```

## Devcontainer (Windows-friendly)

This repo includes a VS Code devcontainer so Windows users can build without local installs.

Steps:

1) Install Docker Desktop and VS Code.
2) Install the VS Code "Dev Containers" extension.
3) Open this repo in VS Code and choose "Reopen in Container".
4) Build an IG inside the container:

```shell
./build-all.sh --ig rx
```

Notes:

- The container installs Java, `yq`, `fsh-sushi`, `igtools`, draw.io (headless), Google Cloud CLI, and Firely Terminal.
- Optional steps are enabled by default inside the container:
	- `BUILD_USE_IGTOOLS=true`
	- `BUILD_GENERATE_DRAWIO_IMAGES=true`
- draw.io runs via `xvfb` and uses `DRAWIO_APP=/usr/local/bin/drawio`.

## Notes

- The publisher JAR is shared under tools/publisher/ and downloaded on first build.
- All IGs target FHIR R4 (4.0.1).
