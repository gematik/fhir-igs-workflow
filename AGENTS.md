# AGENTS.md

Guidance for AI coding agents working in this repository. Read this before exploring the repo from scratch.

## Project Overview

This is gematik's **TI-Flow (TIFlow)** monorepo: a set of German-healthcare HL7 FHIR Implementation Guides (IGs), built with **SUSHI (FSH)** + the **HL7 FHIR IG Publisher**, orchestrated by gematik's own `fhirscripts` CLI (installed via pipx from `github.com/gematik/fhir-scripts`). Requirements management/traceability (Polarion sync, requirement tagging) uses `igtools`/`req-tooling` (pipx from `github.com/onyg/req-tooling`).

All IGs target **FHIR R4 (4.0.1)**. Canonical base: `https://gematik.de/fhir/tiflow` (core), with module IGs under related `tiflow-*` canonicals (e.g. `tiflow-erezept`, `tiflow-diga`, `tiflow-bfarm`).

> ⚠️ The root `README.md` and per-IG `README.md` files (e.g. `igs/core/README.md`) contain **generic/stale template text** (references to an "eFlow" project with `eflow-core`/`eflow-server` IGs and a `./_genonce.sh` script that don't exist here). Do not trust them for structure or build commands — trust `ig.ini`, `sushi-config.yaml`, and `fhirscripts.config.yaml` instead, and this file.

## Repository Structure

```
igs/<ig-name>/        One self-contained IG Publisher + SUSHI project per IG:
                       core, bfarm, diga, erp-chrg, rx
scripts/               Repo-wide build/QA tooling (bash + python)
qa/                    Generated QA reports (csv/json) produced by scripts/requirement-qa
spec_tools/            Polarion actor/test-procedure CSVs, API doc templates
all                    Runs a given command in every igs/*/ directory
.github/workflows/     CI (build, page generation, igtools commit hook)
.devcontainer/         Windows-friendly containerized build environment
```

Note: `.vscode/tasks.json` lists an `erp-eu` IG option, but no `igs/erp-eu/` directory currently exists — that entry is stale.

### Per-IG layout (`igs/<name>/`)

| Path | Purpose |
|------|---------|
| `ig.ini`, `sushi-config.yaml` | IG Publisher / SUSHI config (id, canonical, version, dependencies, pages, menu) |
| `fhirscripts.config.yaml` | Build pipeline steps run by `fhirscripts` |
| `fhir-ig-installer.conf` | External package `.tgz` URLs installed before build |
| `package.json`, `fhirpkg.lock.json` | FHIR package dependencies (used by SUSHI) |
| `scripts/pre-build.sh`, `scripts/post-build.sh`, `scripts/generate-heading-links-js.sh` | Per-IG build hooks |
| `sync_polarion.sh` | Pushes `input/content/polarion-requirements.json` to gematik Polarion (needs `POLARION_TOKEN`) |
| `Requirements-fromNarrative.json`, `build-record.yaml`, `publication-request.json`, `ReleaseNotes.md` | Metadata / release tracking |
| `input/fsh/` | FSH sources: `aliases.fsh`, `capabilitystatements/`, `codesystems/`, `conceptmaps/`, `examples/`, `legacy/`, `logicalmodels/`, `operationdefinition/`, `parameters/`, `profiles/`, `rulesets/`, `valuesets/` |
| `input/pagecontent/` | Narrative Markdown pages (see naming convention below) |
| `input/{content,data,includes,images,images-source,drawio-source,externalDependencies}` | Other IG source assets |
| `fsh-generated/`, `output/`, `temp/`, `input-cache/`, `template/` | Build artifacts/caches (git-ignored, don't hand-edit) |

### Repo-wide `scripts/`

- `ig-common.sh` — shared bash helpers; loads an IG's config via its `sushi-config.yaml` + `yq`
- `install-ig-packages.sh`, `collect-sushi-deps.sh`, `prepare-environment.sh` — dependency install helpers
- `merge-core-includes.sh` — copies `core-*.md`-tagged pagecontent from `igs/core` into a module's `input/includes/` (core is the single source of truth; see Conventions below)
- `merge-use-cases.sh`, `migrate-pre-requirements.sh`, `refresh-special-urls.py`, `remove_duplicate_requirement_keys.py`, `qa-for-requirements.py`, `export_latest_requirements_xlsx.py`, `install-hapi-validator.sh`, `build-drawio-images-local.sh`
- `ig-configs/` — per-IG shell config snippets (`core.sh`, `erpchrg.sh`, `server.sh`)
- `requirement-qa/` — Python (pytest) QA suite: `check_error_code_consistency`, `check_requirement_quality.py`, `check_telemetry_mapping_completeness.py`, `check_requirement_page_actor_alignment.py`, `check_sushi_pages_crosscheck.py`, `check_duplicate_old_requirements.py`, plus mapping generators (`generate_requirement_mapping.py`, `generate_old_to_new_requirements_guide.py`, `verify_requirement_mapping.py`). Reports land in top-level `qa/*.csv`/`*.json`.

## Build & Test

- **Per-IG build (recommended):**
  ```shell
  cd igs/<name>
  fhirscripts install
  fhirscripts build pipeline
  ```
  The pipeline (from `fhirscripts.config.yaml`) runs: `install-ig-packages.sh` → `generate-heading-links-js.sh` → `pre-build.sh` → `requirements` → `reqtools polarion` → `sushi` → `igpub` → `igpub_qa` → `post-build.sh`.
- **Run a command across all IGs:** `./all <command>` (e.g. `./all sushi`, `./all igtools process`). Iterates every `igs/*/ig.ini`.
- The `.vscode/tasks.json` "Build IG" task calls `./build-all.sh --ig <name>`, but **that script does not exist** in the repo currently. Use `./all` or the per-IG `fhirscripts` pipeline above instead.
- **Requirement/QA Python scripts:** `pip install -r requirements.txt` (openpyxl, pytest, pyyaml), then run individual `scripts/requirement-qa/check_*.py`, or `pytest scripts/requirement-qa` (see its `pytest.ini`).
- **Full local toolchain** (see `.github/workflows/build-changed-igs.yml` for exact versions/commands, or use the devcontainer): Java 17, Node 20 (`npm i -g fsh-sushi`), Python 3.12 (+ `pyyaml`), Ruby (Jekyll/bundler), .NET 8 (Firely Terminal), `yq`, `graphviz`, gematik `fhirscripts`, `igtools`/`req-tooling`.
- **CI:** `.github/workflows/build-changed-igs.yml` (push to `main` + manual dispatch, per-IG build), `generate-pages-readme.yml`, `igtools-process-commit.yml`. CI runs `./all igtools process` as a pre-check and fails if it errors or leaves uncommitted changes.

## Conventions

- **Actors** referenced throughout requirements/pagecontent (FD server = TI-Flow-Fachdienst):
  - `PVS` — Praxisverwaltungssystem (prescribing institution's primary/practice system, "verordnend")
  - `AVS` — Apothekenverwaltungssystem (dispensing pharmacy system, "abgebend")
  - `FDV` — Frontend des Versicherten (the insured person's app/frontend)
  - `KTR` — Kostenträger (payer/health insurance client system)
  - `FD` — TI-Flow-Fachdienst itself (server-side requirements)
  - `NCPeH` — National Contact Point for eHealth (cross-border, erp-eu related)
- **`input/pagecontent/` naming:** `op-<operation>.md` = operation overview/index; `op-<operation>-req-<actor>.md` = per-actor normative requirements page (actor = one of the suffixes above). Same pattern for `query-api-<resource>.md` / `query-api-<resource>-req-<actor>.md`.
- **Core → module includes:** module pagecontent references core snippets via `{% include core-<name>.md %}`. Run `scripts/merge-core-includes.sh` to sync `igs/core/input/pagecontent/<name>.md` → `igs/<module>/input/includes/core-<name>.md`. Core is the source of truth — never hand-edit the copied `core-*.md` files inside a module.
- **Fragments** (`{% fragment Type/id %}`) resolve by FHIR resource **type + id**, not FSH Instance name — keep an instance's `* id` aligned with any fragment reference to it.
- **Error codes:** the error-code consistency checker's `CODE_CLASSIFICATIONS` must check longer/module-specific prefixes (`TIFLOW_RX_`, `TIFLOW_DIGA_`, `TIFLOW_ERPCHRG_`, `TIFLOW_ERPEU_`) before the generic `TIFLOW_` prefix, or codes misclassify to core.
- **OperationDefinitions** are defined per-module only; there is no core→module sync script for them (intentionally removed).

## Known Gotchas

- **BFARM post-build StructureMap transform:** HAPI validator 6.5.26 (CI version) fails casting JSON when given a whole `fsh-generated/resources` dir (it tries to parse example bundles as resources). Fix pattern: isolate `StructureMap-*.json` into a temp dir and use the legacy `-transform` CLI flag (not the newer `transform` subcommand, which needs validator 6.8+).
- **RX KBV bundle transform:** fails on HAPI validator 6.8.2 for DE Basisprofil vital-signs snapshot generation; prefer `hapi_validator_6_5_26.jar`.
- **CapabilityStatement rendering:** setting `rest.resource.operation.extension[method]` crashes the IG Publisher's `CapabilityStatementRenderer` (NPE). Keep `extension[expectation].valueCode` instead (as in core rulesets).
- **DiGA ignoreWarnings:** `igs/diga/input/ignoreWarnings.txt` must use the `== Suppressed Messages ==` format or QA fails on `path-suppressed-warnings`.
- **CI FHIR package cache:** keep a single `HOME`/`FHIR_PACKAGE_CACHE_DIR` across all steps in `build-changed-igs.yml`; don't add per-step custom cache/install logic, and avoid writing under `/github/...` on GitHub-hosted runners (permission denied).
- **Python deps in CI:** any pipeline invoking `scripts/refresh-special-urls.py` needs `pyyaml` installed before running `./all` or a build pipeline.
- **GitHub Actions push events from `GITHUB_TOKEN`** commits don't reliably trigger other workflows — chain with `workflow_run` instead of relying on `push`.
