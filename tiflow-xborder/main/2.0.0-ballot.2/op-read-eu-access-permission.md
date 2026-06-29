# Operation API: Zugriffsberechtigung einsehen - Implementation Guide TIFlow - Grenzüberschreitender Datenaustausch v2.0.0-ballot.2

Implementation Guide

TIFlow - Grenzüberschreitender Datenaustausch

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* **Operation API: Zugriffsberechtigung einsehen**

## Operation API: Zugriffsberechtigung einsehen

Mit der FHIR-Operation kann die Zugriffsberechtigung für die in der Nutzerinformation (zeta-user-info.identifier) angegebene KVNR abgerufen werden. Diese Operation steht Versicherten zur Verfügung.

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

			{"resourceType":"OperationDefinition","id":"ReadEUAccessPermission","text":{"status":"generated","div":"<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\">Generated Narrative: OperationDefinition ReadEUAccessPermission</p><a name=\"ReadEUAccessPermission\"> </a><a name=\"hcReadEUAccessPermission\"> </a>URL: [base]/$read-eu-access-permissionOutput parameters Profile:<a href=\"StructureDefinition-GEM-ERPEU-PR-PAR-AccessAuthorization-Response.html\">GEM ERPEU PR PAR Access Authorization Response</a>Parameters<table class=\"grid\">UseNameScopeCardinalityTypeBindingDocumentationOUTcountryCode1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#Coding\">Coding</a>The country for which the patient wants to grant access.\nOUTaccessCode1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#Identifier\">Identifier</a>The access code for that country.\nOUTvalidUntil1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#instant\">instant</a>The instant until the access code is valid.\nOUTcreatedAt1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#instant\">instant</a>The instant when the record was created in the E-Rezept-Fachdienst.\n</table></div>"},"url":"https://gematik.de/fhir/tiflow-xborder/OperationDefinition/ReadEUAccessPermission","version":"2.0.0-ballot.2","name":"ReadEUAccessPermission","status":"draft","kind":"operation","date":"2026-06-30","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"This operation reads the currenty in the E-Rezept-Fachdienst registered Access Code for redeeming ePrescriptions in an EU country.","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"affectsState":false,"code":"read-eu-access-permission","system":true,"type":false,"instance":false,"outputProfile":"https://gematik.de/fhir/tiflow-xborder/StructureDefinition/GEM-ERPEU-PR-PAR-AccessAuthorization-Response","parameter":[{"name":"countryCode","use":"out","min":1,"max":"1","documentation":"The country for which the patient wants to grant access.","type":"Coding"},{"name":"accessCode","use":"out","min":1,"max":"1","documentation":"The access code for that country.","type":"Identifier"},{"name":"validUntil","use":"out","min":1,"max":"1","documentation":"The instant until the access code is valid.","type":"instant"},{"name":"createdAt","use":"out","min":1,"max":"1","documentation":"The instant when the record was created in the E-Rezept-Fachdienst.","type":"instant"}]}
		
```

