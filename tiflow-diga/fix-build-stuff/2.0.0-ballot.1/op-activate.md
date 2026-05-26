# Operation: $activate - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.1

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* **Operation: $activate**

## Operation: $activate

Die FHIR-Operation `$activate` überführt einen im Status `draft` befindlichen `Task` in den Status `ready`, wenn das Primärsystem den qualifiziert elektronisch signierten Verordnungsdatensatz (QES) übermittelt.

Diese Operation basiert auf der $activate Operation des Basis-Workflow für E-Rezepte. Für DiGA-Verordnungen (Flowtype 162) gelten zusätzliche Payload-Prüfungen.

### Nachricht

Die Operation $activate wird als HTTP POST auf /Task/<id>/$activate ausgeführt.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu `$activate`](./op-activate-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [Anforderungen für PVS zu `$activate`](./op-activate-req-pvs.md): Anforderungen an das PVS zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

```

			{"resourceType":"OperationDefinition","id":"tiflow-diga-activate-op","text":{"status":"generated","div":"<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\">Generated Narrative: OperationDefinition tiflow-diga-activate-op</p><a name=\"tiflow-diga-activate-op\"> </a><a name=\"hctiflow-diga-activate-op\"> </a>URL: [base]/Task/[id]/$activateInput parameters Profile:<a href=\"StructureDefinition-ti-flow-di-ga-activate-operation-input.html\">TIFlow DiGA Activate Operation Input</a>Output parameters Profile:<a href=\"StructureDefinition-ti-flow-di-ga-activate-operation-output.html\">TIFlow DiGA Activate Operation Output</a>Parameters<table class=\"grid\">UseNameScopeCardinalityTypeBindingDocumentation</table></div>"},"url":"https://gematik.de/fhir/tiflow-diga/OperationDefinition/tiflow-diga-activate-op","version":"2.0.0-ballot.1","name":"TIFlow-DIGA-OP-Activate","title":"E-Rezept aktivieren","status":"active","kind":"operation","date":"2028-04-01","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"Diese Operation aktiviert die erstellte Aufgabe für das Rezept. Der Eingabeparameter muss das qualifizierte signierte Bundle des Rezepts enthalten. Der TI-Flow-Fachdienst validiert das Rezept, aktualisiert die Task-ressource und startet den Workflow.","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"affectsState":true,"code":"activate","resource":["Task"],"system":false,"type":false,"instance":true,"inputProfile":"https://gematik.de/fhir/tiflow-diga/StructureDefinition/ti-flow-di-ga-activate-operation-input","outputProfile":"https://gematik.de/fhir/tiflow-diga/StructureDefinition/ti-flow-di-ga-activate-operation-output"}
		
```

