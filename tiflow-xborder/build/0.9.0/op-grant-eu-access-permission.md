# Operation API: Zugriffsberechtigung erstellen - TIFlow - Grenzüberschreitender Datenaustausch v0.9.0

TIFlow - Grenzüberschreitender Datenaustausch

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* **Operation API: Zugriffsberechtigung erstellen**

## Operation API: Zugriffsberechtigung erstellen

Die FHIR-Operation führt zum Schreiben einer neuen Zugriffsberechtigung. Diese Operation steht Versicherten zur Verfügung.

### Nachricht

Die Nachricht wird als HTTP `POST` an `/$grant-eu-access-permission` gesendet.

### Anforderungen an Schnittstelle

* [Server Anforderungen zu `$grant-eu-access-permission`](./op-grant-eu-access-permission-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zu `$grant-eu-access-permission`](./op-grant-eu-access-permission-req-fdv.md): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

```

			{
  "resourceType": "OperationDefinition",
  "id": "Grant-EU-Access-Permission",
  "url": "https://gematik.de/fhir/erp-eu/OperationDefinition/Grant_Access_PermissionOperationDefinition",
  "status": "active",
  "version": "1.1.1",
  "date": "2026-01-08",
  "name": "Grant_Access_Permission",
  "kind": "operation",
  "description": "This operation receives the access code and the country that the patient wants to grant access to. The operation validates the country and creates registeres the Access Code.",
  "code": "grant-eu-access-permission",
  "system": true,
  "type": false,
  "instance": false,
  "affectsState": true,
  "inputProfile": "https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-PAR-AccessAuthorization-Request",
  "outputProfile": "https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-PAR-AccessAuthorization-Response",
  "parameter": [
    {
      "name": "countryCode",
      "use": "in",
      "min": 1,
      "max": "1",
      "documentation": "The country for which the patient wants to grant access.",
      "type": "Coding"
    },
    {
      "name": "accessCode",
      "use": "in",
      "min": 1,
      "max": "1",
      "documentation": "The access code for that country.",
      "type": "Identifier"
    },
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

