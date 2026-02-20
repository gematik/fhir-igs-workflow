# Client-Anforderungen: MedicationDispense-Query - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: MedicationDispense**](query-api-medicationdispense.md)
* **Client-Anforderungen: MedicationDispense-Query**

## Client-Anforderungen: MedicationDispense-Query

# Client-Anforderungen: Query API MedicationDispense

Diese Seite beschreibt Anforderungen an Clients zur Nutzung der MedicationDispense-Query-Endpunkte.

## Normative Client-Anforderungen

In den vorliegenden Spezifikationen sind keine zusaetzlichen, ausschließlich auf `/MedicationDispense` bezogenen, normativen Client-Anforderungen ausgewiesen.

## Hinweise zur Nutzung

* Fuer die Suche nach Abgabeinformationen zu einer Verordnung ist `GET /MedicationDispense?identifier=https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId|<PrescriptionID>` zu verwenden.
* Rueckgaben sind als Bundle zu verarbeiten und koennen mehrere `MedicationDispense`-Eintraege enthalten.
* `OperationOutcome` aus Query-Aufrufen ist im Client als konkrete Handlungsanweisung darzustellen.

