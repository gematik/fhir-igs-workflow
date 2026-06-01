# Operation: $reject - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* **Operation: $reject**

## Operation: $reject

Die FHIR-Operation `$reject` überführt einen im Status `in-progress` befindlichen `Task` in den Status `ready`, wenn der Kostenträger die Verordnung an den Versicherten zurückgibt, weil eine fehlerhafte Zuweisung vorliegt, d.h. der Kostenträger nicht zuständig ist.

Diese Operation basiert auf der $abort Operation des Basis-Workflow für E-Rezepte.

### Nachricht

Die Operation $reject wird als HTTP POST auf /Task/<id>/$reject ausgeführt.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu `$reject`](./op-reject-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [Anforderungen für KTR zu `$reject`](./op-reject-req-ktr.md): Anforderungen an das Clientsystem des KTR zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

```

			{"resourceType":"OperationDefinition","id":"tiflow-diga-reject-op","text":{"status":"generated","div":"<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\">Generated Narrative: OperationDefinition tiflow-diga-reject-op</p><a name=\"tiflow-diga-reject-op\"> </a><a name=\"hctiflow-diga-reject-op\"> </a>URL: [base]/Task/[id]/$rejectParameters<table class=\"grid\">UseNameScopeCardinalityTypeBindingDocumentationINsecret1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#string\">string</a>Der secret Parameter, der einem Kostenträger den exklusiven Zugriff auf den Task als URL-Parameter ?secret ermöglicht.\n</table></div>"},"url":"https://gematik.de/fhir/tiflow-diga/OperationDefinition/tiflow-diga-reject-op","version":"2.0.0-ballot.2","name":"TIFlow-DIGA-OP-Reject","title":"E-Rezept zurückgeben","status":"active","kind":"operation","date":"2028-04-01","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"Lehnt die Ausgabe einer DiGA-Verordnung ab. Die Aufgabe wird in einen aktiven Zustand zurückgesetzt, das secret wird gelöscht, und der Task wird für jeden anderen Kostenträger zugänglich oder kann vom Patienten gelöscht werden.","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"affectsState":true,"code":"reject","resource":["Task"],"system":false,"type":false,"instance":true,"parameter":[{"name":"secret","use":"in","min":1,"max":"1","documentation":"Der secret Parameter, der einem Kostenträger den exklusiven Zugriff auf den Task als URL-Parameter ?secret ermöglicht.","type":"string"}]}
		
```

### Hinweise

Falls es bei der Verarbeitung einer Zuweisung einer digitalen Gesundheitsanwendung zu einem Fehler kommt, bspw. wenn der Nutzer nicht beim Kostenträger versichert ist, muss das Clientsystem den Nutzer informieren und das E-Rezept zur weiteren Nutzung zurückgeben.

Hierzu führt der Kostenträger die TI-Flow-Fachdienst Operation “$reject” aus und übermittelt dem Nutzer eine Communication GEM_ERP_PR_Communication_DiGA in der der Kostenträger angeben kann, warum die Verordnung nicht bearbeitet werden kann.

