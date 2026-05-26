# Operation: $close - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.1

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* **Operation: $close**

## Operation: $close

Die FHIR-Operation `$close` überführt einen im Status `in-progress` befindlichen `Task` in den Status `completed`, wenn der Kostenträger des Workflow abschliesst.

### Nachricht

Die Operation $close wird als HTTP POST auf /Task/<id>/$close ausgeführt.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu `$close`](./op-close-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [Anforderungen für KTR zu `$close`](./op-close-req-ktr.md): Anforderungen an das Clientsystem des KTR zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

```

			{"resourceType":"OperationDefinition","id":"tiflow-diga-close-op","text":{"status":"generated","div":"<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\">Generated Narrative: OperationDefinition tiflow-diga-close-op</p><a name=\"tiflow-diga-close-op\"> </a><a name=\"hctiflow-diga-close-op\"> </a>URL: [base]/Task/[id]/$closeInput parameters Profile:<a href=\"StructureDefinition-ti-flow-di-ga-close-operation-input.html\">TIFlow DiGA Close Operation Input</a>Output parameters Profile:<a href=\"StructureDefinition-ti-flow-di-ga-close-operation-output.html\">TIFlow DiGA Close Operation Output</a>Parameters<table class=\"grid\">UseNameScopeCardinalityTypeBindingDocumentation</table></div>"},"url":"https://gematik.de/fhir/tiflow-diga/OperationDefinition/tiflow-diga-close-op","version":"2.0.0-ballot.1","name":"TIFlow-DIGA-OP-Close","title":"E-Rezept Abgabe vollziehen","status":"active","kind":"operation","date":"2028-04-01","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"Die $close-Operation beendet den E-Rezept-Workflow und erstellt eine Quittung. Das Ergebnis dieses Vorgangs ist ein signiertes Bundle, das für weitere finanzielle Verarbeitung verwendet wird. Der Status der Aufgabe ändert sich anschließend in #completed.","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"affectsState":true,"code":"close","resource":["Task"],"system":false,"type":false,"instance":true,"inputProfile":"https://gematik.de/fhir/tiflow-diga/StructureDefinition/ti-flow-di-ga-close-operation-input","outputProfile":"https://gematik.de/fhir/tiflow-diga/StructureDefinition/ti-flow-di-ga-close-operation-output"}
		
```

### Hinweise

Nach Abschluss der Workflows eines E-Rezeptes hat der Kostenträger die Möglichkeit dem Versicherten eine Antwort zur Zuweisung zu übermitteln. Hierfür erstellt der Kostenträger eine Communication vom ProfilGEM_ERP_PR_Communication_DiGA und ergänzt unter Communication.payload.contentString den Antworttext, der dem Nutzer im E-Rezept-FdV dargestellt werden soll.

