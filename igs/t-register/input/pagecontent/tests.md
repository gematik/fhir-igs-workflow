## Beispiele für Digitale Durchschläge E-T-Rezept

Diese Seite dokumentiert die automatisierten Erzeugungen von digitalen Durchschlägen durch die StructureMap-Transformationen, die im Rahmen der E-T-Rezept Spezifikation erstellt wurden.

### Übersicht

Die einzelnen Pakete validieren die Transformation von Quellressourcen in den digitalen Durchschlag mithilfe der StructureMap `ERPTPrescriptionStructureMapCarbonCopy`. Jeder Testfall zeigt detailliert, welche Felder aus den Quellressourcen in die Zielressourcen gemappt werden.

Die folgenden Beispiele demonstrieren verschiedene Mapping-Szenarien:

- [Beispiel 1: PZN Verordnung](test-case-01.html)
- [Beispiel 2: Wirkstoff Verordnung](test-case-02.html)
- [Beispiel 3: Freitext Verordnung](test-case-03.html)
- [Beispiel 4: Absolute Referenzierung](test-case-04.html)

#### Aufbau

Jedes Paket enthält:

- **Quellressourcen**: KBV-Bundle (Verordnung), MedicationDispense-Parameters (Abgabe), Task und VZD-SearchSet (Apothekenverzeichnis)
- **Transformation**: Automatische Umwandlung durch HAPI FHIR Validator mit der StructureMap
- **Zielressourcen**: Parameters-Ressource mit dem digitalen Durchschlag
- **Vergleichsbericht**: Feldweise Gegenüberstellung von Quelle und Ziel

#### Mapping-Details

Die Berichte zeigen für jede Ressource:

- **Mapped Fields (✅)**: Felder, die erfolgreich von Quelle zu Ziel übertragen wurden
- **Unmapped Fields (⚠️)**: Felder, die in der Quelle vorhanden sind, aber nicht gemappt werden
- **New Fields (🆕)**: Felder, die nur im Ziel existieren (neu erstellt oder berechnet)

### Testfälle

