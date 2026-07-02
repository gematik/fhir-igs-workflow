# Deployment-Sequenz (Multi-IG)

Dieses Dokument beschreibt die empfohlene Abfolge für den Publish von Implementation Guides (IGs) in diesem Multi-IG-Repository.

## Ziel und Kontext

- Das Repository enthält mehrere IGs unter `igs/` (z. B. `igs/core`, `igs/erp-chrg`, `igs/bfarm`).
- Die Veröffentlichung umfasst in der Regel drei Orte:
	- dieses IG-Repository,
	- das Registry-Repository `fhir-ig-registry`,
	- den finalen Deploy (dev/prod).

## Voraussetzungen

- `fhirscripts` ist installiert und lauffähig.
- Du befindest dich auf einem sauberen Arbeitsstand (keine unbeabsichtigten lokalen Änderungen).
- Für den Ziel-IG sind alle Metadaten (Version, URL, Status, Sequenz etc.) geklärt.
- `fhir-ig-registry` ist lokal verfügbar (z. B. als Nachbarverzeichnis).

## 1. Publication Request erstellen oder anpassen

Lege die Publication-Request-Datei für den betreffenden IG an bzw. aktualisiere sie. Beispiel:

```json
{
	"package-id": "de.gematik.eflow-rx",
	"version": "2.0.0-ballot.1",
	"path": "https://gematik.de/fhir/tiflow-erezept/2.0.0-ballot.1",
	"status": "draft",
	"mode": "working",
	"sequence": "TIFlow - Verordnungen für Arzneimittel 2.0.0-ballot.1",
	"desc": "Implementation Guide für den E-Rezept-Fachdienst in Version 2.0.0-ballot.1",
	"first": true,
	"title": "TIFlow - Verordnungen für Arzneimittel",
	"registry-description": "Implementation Guide TIFlow - Verordnungen für Arzneimittel",
	"registry-country": "DE",
	"registry-authority": "gematik GmbH",
	"category": "gematik",
	"ci-build": "https://gematik.de/fhir/tiflow-erezept/build",
	"introduction": "Dieser IG beschreibt FHIR-Profile und Schnittstellen für den E-Rezept-Fachdienst im TIFlow-Kontext"
}
```

Hinweise für Multi-IG:

- Achte darauf, dass `package-id`, `path`, `sequence`, `title` und `c›-build` eindeutig zum Ziel-IG passen.
- Wenn mehrere IGs parallel veröffentlicht werden, pro IG eine eigene, konsistente Request pflegen.
- Im Terminal wechsle in das working directory des IGs `cd igs/<ig>`

## 2. Build ausführen

Führe den Build für die Pipeline aus:

```bash
fhirscripts build pipeline
```

Empfehlung:

- Build-Output prüfen (Fehler, Warnings, QA-Resultate).
- Bei mehreren IGs sicherstellen, dass der richtige IG-Kontext aktiv ist (Konfiguration, Branch, Arbeitsverzeichnis).

## 3. Publish vorbereiten und Registry-Metadaten erzeugen

### 3a. Registry-Repository vorbereiten

- Sicherstellen, dass `fhir-ig-registry` lokal ausgecheckt ist.
- Einen neuen Branch in `fhir-ig-registry` für die anstehende Änderung erstellen.

### 3b. Publish-Befehl ausführen

```bash
fhirscripts publish project --ig-registry ../../../fhir-ig-registry
```

Erwartetes Ergebnis:

- Metadaten werden im aktuellen IG-Projekt erzeugt/aktualisiert.
- Entsprechende Metadaten-Aenderungen werden auch im Repository `fhir-ig-registry` erzeugt.

### 3c. Registry-Änderungen prüfen und PR erstellen

- Änderungen in `fhir-ig-registry` fachlich und technisch prüfen.
- Committen, Pushen und Pull Request in `fhir-ig-registry` erstellen.

## 4. Deploy im IG-Repository ausführen (dev/prod)

Je nach Zielumgebung:

```bash
fhirscripts deploy dev
```

oder

```bash
fhirscripts deploy prod
```

Hinweis:

- Für produktive Releases nur mit freigegebenen Artefakten arbeiten.

## 5. Registry deployen (nach Merge des PRs)

Nachdem der PR in `fhir-ig-registry` gemerged wurde, das Registry-Repo deployen:

```bash
fhirscripts deploy prod --ig-registry
```

Damit werden die Registry-Änderungen veröffentlicht.

## 6. Git-Tag erstellen

Nach erfolgreichem Publish/Deploy einen Git-Tag für den Release-Stand setzen und pushen.

Empfehlung:

- Tag-Name konsistent nach eurer Release-Konvention wählen.
- Vor dem Tagging final prüfen, dass Version, Changelog und veröffentlichte Artefakte zusammenpassen.

## Kompaktablauf

1. Publication Request erstellen/anpassen.
2. `fhirscripts build pipeline`.
3. `fhir-ig-registry` vorbereiten, dann `fhirscripts publish project --ig-registry ../fhir-ig-registry`.
4. Registry-Änderungen prüfen und PR erstellen.
5. `fhirscripts deploy dev` oder `fhirscripts deploy prod`.
6. Nach PR-Merge: `fhirscripts deploy prod --ig-registry`.
7. Git-Tag erstellen und pushen.
