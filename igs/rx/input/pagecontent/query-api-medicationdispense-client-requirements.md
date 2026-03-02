# Client-Anforderungen: Query API MedicationDispense

Diese Seite beschreibt Anforderungen an Clients zur Nutzung der MedicationDispense-Query-Endpunkte.

## Normative Client-Anforderungen

In den vorliegenden Spezifikationen sind keine zusätzlichen, ausschließlich auf `/MedicationDispense` bezogenen, normativen Client-Anforderungen ausgewiesen.

## Hinweise zur Nutzung

- Für die Suche nach Abgabeinformationen zu einer Verordnung ist `GET /MedicationDispense?identifier=https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId|<PrescriptionID>` zu verwenden.
- Rückgaben sind als Bundle zu verarbeiten und koennen mehrere `MedicationDispense`-Eintraege enthalten.
- `OperationOutcome` aus Query-Aufrufen ist im Client als konkrete Handlungsanweisung darzustellen.
