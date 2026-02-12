# Implementierungsplan: Mapping KBV-Bundle -> EPA Provide-Prescription

## Hintergrund
Der E-Rezept-Fachdienst muss KBV_PR_ERP_Bundle (Quelle: https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle, weblink https://simplifier.net/packages/kbv.ita.erp/1.3.2/files/2880350) in die Parameter-Struktur https://gematik.de/fhir/epa-medication/StructureDefinition/epa-op-provide-prescription-erp-input-parameters transformieren. Die Transformation soll in Form von StructureMaps dokumentiert, getestet und später im IG veröffentlicht werden.

## Bestände Ressourcen
- StructureMaps: `input/content/structuremaps` (z. B. Medikament, MedicationRequest, Directory-Ressourcen)
- Eingabebeispiele: `input/content/kbv-bundles/*.json`
- Testskripte (zu adaptieren): `scripts/testscripts/*.py`
- Markdown-Tabellen für StructureMaps: `input/includes/StructureMap-*.md`

## Zielbild
1. Vollständige Dokumentation der Transformationslogik innerhalb des IG (deutschsprachig, inkl. Tabellen und Mappingbeschreibungen).
2. Manuelle Aggregations-StructureMap, die komplette KBV-Bundles in Provide-Prescription-Parameter überführt und vorhandene Teilmaps wiederverwendet.
3. Automatisierte Tests, die jede KBV-Beispieldatei gegen die Provide-Prescription-Ausgabe prüfen (inkl. Referenzdaten pro Testfall).

## Arbeitspakete

### 1. Aggregations-StructureMap erstellen
- **Ziel:** Neue StructureMap `StructureMap-KBVPrErpBundle-to-ProvidePrescriptionParameters` (Datei unter `input/content/structuremaps`).
- **Vorgehen:**
  - Festlegen, welche Ressourcen (Medication, MedicationRequest, Practitioner usw.) via vorhandener Maps transformiert werden.
  - Innerhalb der Map Sequenzen definieren, die die bestehenden Maps per `dependent` oder `group` Aufrufen einbinden.
  - Sicherstellen, dass Bundle-Metadaten (patient, prescriptionId usw.) korrekt auf Parameter-Einträge gemappt werden.
- **Abnahme:** JSON-StructureMap validiert gegen FHIR-Validator; erzeugte Markdown-Tabelle spiegelt die Kerntabellen wider.

### 2. Einzeltest für Referenzbundle
- **Ziel:** Nachweis, dass die Aggregations-Map für `Bundle-1f339db0-9e55-4946-9dfa-f1b30953be9b--47477033.json` funktioniert.
- **Vorgehen:**
  - Skript `scripts/testscripts/transform-bundle.py` (oder analog) anpassen, damit es KBV-Bundle + Aggregations-Map einliest und Provide-Prescription-Parameter ausgibt.
  - Ergebnis gegen manuell erstellte Erwartungsdatei vergleichen (z. B. `input/content/kbv-bundles/expected/Bundle-...-provide-parameters.json`).
  - Fehlerhafte Felder per `compare-mapping.py` visualisieren.
- **Abnahme:** Testlauf liefert valides Parameters-Resource und keine Vergleiche schlagen fehl.

### 3. Regressionstest für alle Bundles
- **Ziel:** Automatisierter Testrahmen für alle 5 Beispiel-Bundles.
- **Vorgehen:**
  - Shell-/Python-Testtreiber in `scripts/testscripts` erstellen (z. B. `run-all-tests.sh`).
  - Für jeden Bundle-Namen: Transformation ausführen, Ergebnis mit hinterlegtem Soll vergleichen, diff reporten.
  - Tests in CI integrieren (z. B. neues npm script oder GitHub Action Schritt).
- **Abnahme:** Ein Befehl prüft alle Bundles; Build schlägt fehl, sobald eine Abweichung auftaucht.

### 4. Dokumentation erweitern
- **Ziel:** Deutsche Beschreibungsseite im IG inkl. Tabellen und Testfall-Referenzen.
- **Vorgehen:**
  - Neue Markdown-Seiten unter `input/pagecontent` (z. B. "Transformation" + "Testfälle").
  - Inhalt: Kontext, Prozessbeschreibung, Links zu KBV- und Provide-Definitionen, Einbindung der generierten Tabellen (Beispiel: {% raw %}`{% include StructureMap-... %}`{% endraw %}).
  - Testfallabschnitt: Kurzbeschreibung je Bundle, Link zum erwarteten Output sowie Hinweis auf Testscripts.
- **Abnahme:** Seite erscheint im IG-Menü, Build läuft ohne Fehler, Inhalte sind auf Deutsch konsistent.

### 5. Governance & Nachverfolgbarkeit
- **Ziel:** Sicherstellen, dass neue StructureMaps und Tests leicht aktualisiert werden können.
- **Vorgehen:**
  - README-Abschnitt "Mapping & Tests" hinzufügen (Befehle, Ordnerstruktur, wie Markdown generiert wird).
  - Optional: Taskrunner (npm script oder Make) für `fml_table.sh` + Tests.

## Nächste Schritte
1. Strukturmap-Anforderungen sammeln (welche Ressource -> welcher Parameter) und ggf. Rückfragen klären.
2. Aggregations-StructureMap modellieren und lokal testen.
3. Erwartete Provide-Prescription-Beispiele definieren, Testskripte anpassen, Regression aufsetzen.
4. Dokumentationsseiten aufbauen und im Menü verlinken.
