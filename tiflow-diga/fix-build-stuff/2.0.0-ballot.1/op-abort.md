# Operation: $abort - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.1

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* **Operation: $abort**

## Operation: $abort

Die FHIR-Operation `$abort` überführt einen im Status `ready` befindlichen `Task` in den Status `cancelled`, nachdem der Verordnende die Verordnung gelöscht hat. Die FHIR-Operation `$abort` überführt einen im Status `ready` oder `completed` befindlichen `Task` in den Status `cancelled`, nachdem der Versicherte die Verordnung gelöscht hat.

Diese Operation basiert auf der $abort Operation des Basis-Workflow für E-Rezepte.

### Nachricht

Die Operation $abort wird als HTTP POST auf /Task//$abort ausgeführt.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu `$abort`](./op-abort-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [Anforderungen für PVS zu `$abort`](./op-abort-req-pvs.md): Anforderungen an das PVS zur Nutzung der Schnittstelle.
* [Anforderungen für FdV zu `$abort`](./op-abort-req-fdv.md): Anforderungen an das FdV zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

```

      {"resourceType":"OperationDefinition","id":"tiflow-diga-abort-op","text":{"status":"generated","div":"<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\">Generated Narrative: OperationDefinition tiflow-diga-abort-op</p><a name=\"tiflow-diga-abort-op\"> </a><a name=\"hctiflow-diga-abort-op\"> </a>URL: [base]/Task/[id]/$abortParameters<table class=\"grid\">UseNameScopeCardinalityTypeBindingDocumentationINac0..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#string\">string</a>[Nur von Patienten und Anbietern (Ärzten/Zahnärzten) zu verwenden] Der secret Parameter, der es Benutzern ermöglicht, exklusiv über die URL und den Parameter ?ac auf die Aufgabe zuzugreifen.\nINsecret0..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#string\">string</a>[Nur von der Apotheke zu verwenden] Der secret Parameter, der es einer Apotheke ermöglicht, exklusiv über die URL und den Parameter ?secret auf die Aufgabe zuzugreifen.\n</table></div>"},"url":"https://gematik.de/fhir/tiflow-diga/OperationDefinition/tiflow-diga-abort-op","version":"2.0.0-ballot.1","name":"TIFlow-DIGA-OP-Abort","title":"E-Rezept abbrechen","status":"active","kind":"operation","date":"2028-04-01","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"Diese Operation bricht den Workflow einer DiGA-Verordnung ab und löscht alle Daten, die mit dieser Aufgabe zusammenhängen.","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"affectsState":true,"code":"abort","resource":["Task"],"system":false,"type":false,"instance":true,"parameter":[{"name":"ac","use":"in","min":0,"max":"1","documentation":"[Nur von Patienten und Anbietern (Ärzten/Zahnärzten) zu verwenden] Der secret Parameter, der es Benutzern ermöglicht, exklusiv über die URL und den Parameter ?ac auf die Aufgabe zuzugreifen.","type":"string"},{"name":"secret","use":"in","min":0,"max":"1","documentation":"[Nur von der Apotheke zu verwenden] Der secret Parameter, der es einer Apotheke ermöglicht, exklusiv über die URL und den Parameter ?secret auf die Aufgabe zuzugreifen.","type":"string"}]}
    
```

