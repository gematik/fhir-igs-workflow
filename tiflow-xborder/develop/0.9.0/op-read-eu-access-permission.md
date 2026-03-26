# Operation API: Zugriffsberechtigung einsehen - TIFlow - Grenzüberschreitender Datenaustausch v0.9.0

TIFlow - Grenzüberschreitender Datenaustausch

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* **Operation API: Zugriffsberechtigung einsehen**

## Operation API: Zugriffsberechtigung einsehen

Mit der FHIR-Operation kann die Zugriffsberechtigung für die im ACCESS_TOKEN angegebene KVNR abgerufen werden. Diese Operation steht Versicherten zur Verfügung.

### Nachricht

Die Nachricht wird als HTTP `GET` an `/$read-eu-access-permission` gesendet.

### Anforderungen an Schnittstelle

* [Server Anforderungen zu `$read-eu-access-permission`](./op-read-eu-access-permission-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zu `$read-eu-access-permission`](./op-read-eu-access-permission-req-fdv.md): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

```

			{
  "resourceType": "OperationDefinition",
  "id": "Read-EU-Access-Permission",
  "url": "https://gematik.de/fhir/erp-eu/OperationDefinition/Read_Access_PermissionOperationDefinition",
  "status": "active",
  "version": "1.1.1",
  "date": "2026-01-08",
  "name": "Read_Access_Permission",
  "kind": "operation",
  "description": "This operation reads the currenty in the E-Rezept-Fachdienst registered Access Code for redeeming ePrescriptions in an EU country.",
  "code": "read-eu-access-permission",
  "system": true,
  "type": false,
  "instance": false,
  "affectsState": false,
  "outputProfile": "https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-PAR-AccessAuthorization-Response",
  "parameter": [
    {
      "name": "countryCode",
      "use": "out",
      "min": 1,
      "max": "1",
      "documentation": "The country for which the patient wants to grant access.",
      "type": "Coding"
    },
    {
      "name": "accessCode",
      "use": "out",
      "min": 1,
      "max": "1",
      "documentation": "The access code for that country.",
      "type": "Identifier"
    },
    {
      "name": "validUntil",
      "use": "out",
      "min": 1,
      "max": "1",
      "documentation": "The instant until the access code is valid.",
      "type": "instant"
    },
    {
      "name": "createdAt",
      "use": "out",
      "min": 1,
      "max": "1",
      "documentation": "The instant when the record was created in the E-Rezept-Fachdienst.",
      "type": "instant"
    }
  ]
}

		
```

