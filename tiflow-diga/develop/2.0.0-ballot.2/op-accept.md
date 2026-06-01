# Operation: $accept - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* **Operation: $accept**

## Operation: $accept

Die FHIR-Operation `$acsept` überführt einen im Status `ready` befindlichen `Task` in den Status `in-progress`, nachdem der Kostenträger die Verordnung vom Fachdienst abgerufen hat.

### Nachricht

Die Operation $accept wird als HTTP POST auf /Task/<id>/$accept ausgeführt.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu `$accept`](./op-accept-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [Anforderungen für KTR zu `$accept`](./op-accept-req-ktr.md): Anforderungen an das Clientsystem des KTR zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

```

			{"resourceType":"OperationDefinition","id":"tiflow-diga-accept-op","text":{"status":"generated","div":"<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\">Generated Narrative: OperationDefinition tiflow-diga-accept-op</p><a name=\"tiflow-diga-accept-op\"> </a><a name=\"hctiflow-diga-accept-op\"> </a>URL: [base]/Task/[id]/$acceptOutput parameters Profile:<a href=\"StructureDefinition-ti-flow-di-ga-accept-operation-output.html\">TIFlow DiGA Accept Operation Output</a>Parameters<table class=\"grid\">UseNameScopeCardinalityTypeBindingDocumentationINac1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#string\">string</a>Der Secret-Parameter, der es Benutzern ermöglicht, exklusiv über die URL und den Parameter ?ac auf die Aufgabe zuzugreifen.\n</table></div>"},"url":"https://gematik.de/fhir/tiflow-diga/OperationDefinition/tiflow-diga-accept-op","version":"2.0.0-ballot.2","name":"TIFlow-DIGA-OP-Accept","title":"E-Rezept abrufen","status":"active","kind":"operation","date":"2028-04-01","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"Mit der $accept-Operation beansprucht eine Apotheke ein E-Rezept. Der Status der referenzierten Aufgabe ändert sich in 'in-progress'.","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"affectsState":true,"code":"accept","resource":["Task"],"system":false,"type":false,"instance":true,"outputProfile":"https://gematik.de/fhir/tiflow-diga/StructureDefinition/ti-flow-di-ga-accept-operation-output","parameter":[{"name":"ac","use":"in","min":1,"max":"1","documentation":"Der Secret-Parameter, der es Benutzern ermöglicht, exklusiv über die URL und den Parameter ?ac auf die Aufgabe zuzugreifen.","type":"string"}]}
		
```

