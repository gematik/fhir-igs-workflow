# Operation API: Zugriffsberechtigung löschen - TIFlow - Grenzüberschreitender Datenaustausch v1.0.0-draft

TIFlow - Grenzüberschreitender Datenaustausch

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* **Operation API: Zugriffsberechtigung löschen**

## Operation API: Zugriffsberechtigung löschen

Die Operation führt zum Löschen der für den Versicherten gespeicherten Zugriffsberechtigung. Diese Operation steht dem Versicherten, der die Zugriffsberechtigung erteilt hat, zur Verfügung.

### Nachricht

Die Nachricht wird als HTTP `DELETE` an `/$revoke-eu-access-permission` gesendet.

### Anforderungen an die Schnittstelle

* [Server Anforderungen zu `$revoke-eu-access-permission`](./op-revoke-eu-access-permission-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zu `$revoke-eu-access-permission`](./op-revoke-eu-access-permission-req-fdv.md): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

```

			{
  "resourceType": "OperationDefinition",
  "id": "Revoke-EU-Access-Permission",
  "url": "https://gematik.de/fhir/erp-eu/OperationDefinition/Revoke_Access_PermissionOperationDefinition",
  "status": "active",
  "version": "1.1.1",
  "date": "2026-01-08",
  "name": "Revoke_Access_Permission",
  "kind": "operation",
  "description": "This operation revokes the currently registered access code for redeeming prescriptions in an EU country.",
  "code": "revoke-eu-access-permission",
  "system": true,
  "type": false,
  "instance": false,
  "affectsState": true
}

		
```

