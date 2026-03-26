# Operation API: Abgabe von E-Rezepten im EU-Ausland - TIFlow - Grenzüberschreitender Datenaustausch v0.9.0

TIFlow - Grenzüberschreitender Datenaustausch

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* **Operation API: Abgabe von E-Rezepten im EU-Ausland**

## Operation API: Abgabe von E-Rezepten im EU-Ausland

Die FHIR-Operation $eu-close beendet den E-Rezept-Workflow des unter der  geführten Tasks und speichert die von der europäischen Apotheke übermittelten Dispensierinformationen für den Versicherten. Diese Operation steht ausschließlich dem NCPeH-FD zur Verfügung.

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/$eu-close` gesendet.

### Anforderungen an Schnittstelle

* [Server Anforderungen zu `$eu-close`](op-eu-close-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [NCPeH Anforderungen zu `$eu-close`](./op-eu-close-req-ncpeha.md): Anforderungen an den NCPeH-FD zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

```

			{
  "resourceType": "OperationDefinition",
  "id": "EUCloseOperation",
  "url": "https://gematik.de/fhir/erp-eu/OperationDefinition/EUCloseOperationDefinition",
  "status": "active",
  "version": "1.1.1",
  "date": "2026-01-08",
  "name": "EUClose",
  "kind": "operation",
  "description": "The operation $close finishes the e-prescription workflow and creates a receipt. The Output of this operation is a signed Bundle, to be used for further financial processing. The status of the Task then changes into #completed",
  "code": "eu-close",
  "system": false,
  "type": false,
  "instance": true,
  "resource": [
    "Task"
  ],
  "inputProfile": "https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-PAR-Close-Operation-Input",
  "parameter": [
    {
      "name": "requestData",
      "use": "in",
      "min": 1,
      "max": "1",
      "documentation": "Additional request information",
      "part": [
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
      "name": "practitionerData",
      "use": "in",
      "type": "Practitioner",
      "min": 1,
      "max": "1",
      "documentation": "Information on the practitioner who dispensed"
    },
    {
      "name": "organizationData",
      "use": "in",
      "type": "Organization",
      "min": 1,
      "max": "1",
      "documentation": "Information on the organization where the dispensation happened"
    },
    {
      "name": "practitionerRoleData",
      "type": "PractitionerRole",
      "use": "in",
      "min": 1,
      "max": "1"
    },
    {
      "name": "rxDispensation",
      "use": "in",
      "min": 1,
      "max": "*",
      "documentation": "Information on dispensed Medication(s)",
      "part": [
        {
          "name": "medicationDispense",
          "type": "MedicationDispense",
          "use": "in",
          "min": 1,
          "max": "1"
        },
        {
          "name": "medication",
          "type": "Medication",
          "use": "in",
          "min": 1,
          "max": "1"
        }
      ]
    }
  ]
}

		
```

