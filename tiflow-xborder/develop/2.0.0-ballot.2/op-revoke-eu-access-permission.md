# Operation API: Zugriffsberechtigung löschen - TIFlow - Grenzüberschreitender Datenaustausch v2.0.0-ballot.2

TIFlow - Grenzüberschreitender Datenaustausch

Version 2.0.0-ballot.2 - ci-build 

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

			{"resourceType":"OperationDefinition","id":"Revoke-EU-Access-Permission","text":{"status":"generated","div":"<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\">Generated Narrative: OperationDefinition Revoke-EU-Access-Permission</p><a name=\"Revoke-EU-Access-Permission\"> </a><a name=\"hcRevoke-EU-Access-Permission\"> </a>URL: [base]/$revoke-eu-access-permissionParameters<table class=\"grid\">UseNameScopeCardinalityTypeBindingDocumentation</table></div>"},"url":"https://gematik.de/fhir/tiflow-xborder/OperationDefinition/Revoke-EU-Access-Permission","version":"2.0.0-ballot.2","name":"Revoke-EU-Access-Permission","status":"draft","kind":"operation","date":"2026-05-26","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"This operation revokes the currently registered access code for redeeming prescriptions in an EU country.","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"affectsState":true,"code":"revoke-eu-access-permission","system":true,"type":false,"instance":false}
		
```

