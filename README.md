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

## Notes

- The publisher JAR is shared under tools/publisher/ and downloaded on first build.
- All IGs target FHIR R4 (4.0.1).
