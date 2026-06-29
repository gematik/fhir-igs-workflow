# Operation API: Zugriffsberechtigung erstellen - Implementation Guide TIFlow - Grenzüberschreitender Datenaustausch v2.0.0-ballot.2

Implementation Guide

TIFlow - Grenzüberschreitender Datenaustausch

Version 2.0.0-ballot.2 - ballot 

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

			{"resourceType":"OperationDefinition","id":"GrantEUAccessPermission","text":{"status":"generated","div":"<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\">Generated Narrative: OperationDefinition GrantEUAccessPermission</p><a name=\"GrantEUAccessPermission\"> </a><a name=\"hcGrantEUAccessPermission\"> </a>URL: [base]/$grant-eu-access-permissionInput parameters Profile:<a href=\"StructureDefinition-GEM-ERPEU-PR-PAR-AccessAuthorization-Request.html\">GEM ERPEU PR PAR Access Authorization Request</a>Output parameters Profile:<a href=\"StructureDefinition-GEM-ERPEU-PR-PAR-AccessAuthorization-Response.html\">GEM ERPEU PR PAR Access Authorization Response</a>Parameters<table class=\"grid\">UseNameScopeCardinalityTypeBindingDocumentationOUTcountryCode1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#Coding\">Coding</a>The country for which the patient wants to grant access.\nOUTaccessCode1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#Identifier\">Identifier</a>The access code for that country.\nOUTvalidUntil1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#instant\">instant</a>The instant until the access code is valid.\nOUTcreatedAt1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#instant\">instant</a>The instant when the record was created in the E-Rezept-Fachdienst.\n</table></div>"},"url":"https://gematik.de/fhir/tiflow-xborder/OperationDefinition/GrantEUAccessPermission","version":"2.0.0-ballot.2","name":"GrantEUAccessPermission","status":"draft","kind":"operation","date":"2026-06-30","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"This operation receives the access code and the country that the patient wants to grant access to. The operation validates the country and creates registeres the Access Code.","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"affectsState":true,"code":"grant-eu-access-permission","system":true,"type":false,"instance":false,"inputProfile":"https://gematik.de/fhir/tiflow-xborder/StructureDefinition/GEM-ERPEU-PR-PAR-AccessAuthorization-Request","outputProfile":"https://gematik.de/fhir/tiflow-xborder/StructureDefinition/GEM-ERPEU-PR-PAR-AccessAuthorization-Response","parameter":[{"name":"countryCode","use":"out","min":1,"max":"1","documentation":"The country for which the patient wants to grant access.","type":"Coding"},{"name":"accessCode","use":"out","min":1,"max":"1","documentation":"The access code for that country.","type":"Identifier"},{"name":"validUntil","use":"out","min":1,"max":"1","documentation":"The instant until the access code is valid.","type":"instant"},{"name":"createdAt","use":"out","min":1,"max":"1","documentation":"The instant when the record was created in the E-Rezept-Fachdienst.","type":"instant"}]}
		
```

