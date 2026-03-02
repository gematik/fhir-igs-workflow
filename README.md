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

## License

Copyright 2026 gematik GmbH

Apache License, Version 2.0

See the [LICENSE](./LICENSE) for the specific language governing permissions 

## Additional Notes and Disclaimer from gematik GmbH

1. Copyright notice: Each published work result is accompanied by an explicit statement of the license conditions for use. These are regularly typical conditions in connection with open source or free software. Programs described/provided/linked here are free software, unless otherwise stated.
2. Permission notice: Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
    1. The copyright notice (Item 1) and the permission notice (Item 2) shall be included in all copies or substantial portions of the Software.
    2. The software is provided "as is" without warranty of any kind, either express or implied, including, but not limited to, the warranties of fitness for a particular purpose, merchantability, and/or non-infringement. The authors or copyright holders shall not be liable in any manner whatsoever for any damages or other claims arising from, out of or in connection with the software or the use or other dealings with the software, whether in an action of contract, tort, or otherwise.
    3. We take open source license compliance very seriously. We are always striving to achieve compliance at all times and to improve our processes. If you find any issues or have any suggestions or comments, or if you see any other ways in which we can improve, please reach out to: ospo@gematik.de
3. Please note: Parts of this code may have been generated using AI-supported technology. Please take this into account, especially when troubleshooting, for security analyses and possible adjustments.
