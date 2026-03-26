# Operation API: E-Rezepte zur Einlösung im EU-Ausland abrufen - TIFlow - Grenzüberschreitender Datenaustausch v0.9.0

TIFlow - Grenzüberschreitender Datenaustausch

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* **Operation API: E-Rezepte zur Einlösung im EU-Ausland abrufen**

## Operation API: E-Rezepte zur Einlösung im EU-Ausland abrufen

Der abgebenden Apotheke im europäischen Ausland werden Ressourcen des MedicationRequest sowie die darin verknüpften Ressourcen mit Informationen über im europäischen Ausland einlösbare Verordnungen bereitgestellt. Der Zugriff auf diese Ressourcen erfolgt ausschließlich lesend durch den deutschen NCPeH-FD, der die Informationen entsprechend aufbereitet und weiterleitet.

### Nachricht

Die Nachricht wird als HTTP `POST` an `/$get-eu-prescriptions` gesendet.

### Anforderungen an Schnittstelle

* [Server Anforderungen zu `$get-eu-prescriptions`](./op-get-eu-prescriptions-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [NCPeH Anforderungen zu `$get-eu-prescriptions`](./op-get-eu-prescriptions-req-ncpeha.md): Anforderungen an den NCPeH-FD zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

```

			{
  "resourceType": "OperationDefinition",
  "id": "GET-Prescription-EU",
  "url": "https://gematik.de/fhir/erp-eu/OperationDefinition/GET-Prescription-EUOperationDefinition",
  "status": "active",
  "version": "1.1.1",
  "date": "2026-01-08",
  "name": "GET-Prescription-EU",
  "kind": "operation",
  "description": "The Operation gets Presciption Information from the ERP System for usage in the e-prescription workflow for EU countries",
  "code": "get-eu-prescriptions",
  "affectsState": false,
  "system": true,
  "type": false,
  "instance": false,
  "inputProfile": "https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-PAR-EU-GET-Prescription-Input",
  "outputProfile": "https://gematik.de/fhir/tiflow/xborder/StructureDefinition/gem-erpeu-pr-par-get-prescription-output",
  "parameter": [
    {
      "name": "requestData",
      "use": "in",
      "min": 1,
      "max": "1",
      "documentation": "Additional request information",
      "part": [
        {
          "name": "requesttype",
          "use": "in",
          "min": 1,
          "max": "1",
          "type": "Coding"
        },
        {
          "name": "kvnr",
          "use": "in",
          "min": 1,
          "max": "1",
          "type": "Identifier"
        },
        {
          "name": "accessCode",
          "use": "in",
          "min": 1,
          "max": "1",
          "type": "Identifier"
        },
        {
          "name": "countryCode",
          "use": "in",
          "min": 1,
          "max": "1",
          "type": "Coding"
        },
        {
          "name": "prescription-id",
          "use": "in",
          "min": 0,
          "max": "*",
          "type": "Identifier"
        },
        {
          "name": "practitionerName",
          "use": "in",
          "min": 1,
          "max": "1",
          "type": "string"
        },
        {
          "name": "practitionerRole",
          "use": "in",
          "min": 1,
          "max": "1",
          "type": "Coding"
        },
        {
          "name": "pointOfCare",
          "use": "in",
          "min": 1,
          "max": "1",
          "type": "string"
        },
        {
          "name": "healthcare-facility-type",
          "use": "in",
          "min": 1,
          "max": "1",
          "type": "Coding"
        }
      ]
    },
    {
      "name": "return",
      "use": "out",
      "min": 0,
      "max": "1",
      "type": "Bundle",
      "documentation": "Depending on the requesttype this operation returns a Bundle containing eRezept KBV_PR_ERP_Bundle Prescription-Bundles."
    }
  ]
}

		
```

