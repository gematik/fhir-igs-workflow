# Operation: $create - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.1

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* **Operation: $create**

## Operation: $create

Die FHIR-Operation `$create` erstellt einen Workflow im TI-Flow-Fachdienst.

Diese Operation basiert auf der $create Operation des Basis-Workflow für E-Rezepte.

### Nachricht

Die Operation $create wird als HTTP POST auf /Task/$create ausgeführt.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu `$create`](./op-create-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [Anforderungen für PVS zu `$create`](./op-create-req-pvs.md): Anforderungen an das PVS zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

```

			{"resourceType":"OperationDefinition","id":"tiflow-diga-create-op","text":{"status":"generated","div":"<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\">Generated Narrative: OperationDefinition tiflow-diga-create-op</p><a name=\"tiflow-diga-create-op\"> </a><a name=\"hctiflow-diga-create-op\"> </a>URL: [base]/Task/$createInput parameters Profile:<a href=\"StructureDefinition-ti-flow-di-ga-create-operation-input.html\">TIFlow DiGA Create Operation Input</a>Output parameters Profile:<a href=\"StructureDefinition-ti-flow-di-ga-create-operation-output.html\">TIFlow DiGA Create Operation Output</a>Parameters<table class=\"grid\">UseNameScopeCardinalityTypeBindingDocumentation</table></div>"},"url":"https://gematik.de/fhir/tiflow-diga/OperationDefinition/tiflow-diga-create-op","version":"2.0.0-ballot.1","name":"TIFlow-DIGA-OP-Create","title":"E-Rezept erstellen","status":"active","kind":"operation","date":"2028-04-01","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"Diese Operation erstellt eine Aufgabe für die Verschreibung eines bestimmten Flowtypes.","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"affectsState":true,"code":"create","resource":["Task"],"system":false,"type":true,"instance":false,"inputProfile":"https://gematik.de/fhir/tiflow-diga/StructureDefinition/ti-flow-di-ga-create-operation-input","outputProfile":"https://gematik.de/fhir/tiflow-diga/StructureDefinition/ti-flow-di-ga-create-operation-output"}
		
```

