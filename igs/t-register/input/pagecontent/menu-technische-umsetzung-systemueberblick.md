# Technische Umsetzung - Systemueberblick

Der digitale Durchschlag E-T-Rezept wird nach erfolgreichem Abschluss des
Workflows (FHIR-Operation $close) erstellt. Der relevante Workflow-Typ ist
Flowtype 166 (Arzneimittel nach § 3a AMVV).

Der E-Rezept-Fachdienst erzeugt den digitalen Durchschlag aus:

- Verordnungsdaten (KBV)
- Dispensierinformationen (E-Rezept-Workflow)
- Daten aus dem FHIR-VZD (Apothekeninformationen)

Der erzeugte Datensatz wird automatisiert und asynchron an den Webdienst
BfArM uebertragen. Bei Nicht-Erreichbarkeit erfolgt eine Wiederholung mit
Backoff.
