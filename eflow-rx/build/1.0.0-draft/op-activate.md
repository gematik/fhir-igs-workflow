# Operation $activate (Task aktivieren) - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* **Operation $activate (Task aktivieren)**

## Operation $activate (Task aktivieren)

### Task aktivieren ($activate)

Diese Operation basiert auf der gleichnamigen Operation in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/eflow-core/latest/op-activate.html).

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$activate` gesendet.

### Anforderungen an Schnittstelle

* [FD-Anforderungen zu `$activate`](./op-activate-fd-requirements.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [Client-Anforderungen zu `$activate`](./op-activate-client-requirements.md): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

```

      {"resourceType":"CapabilityStatement","id":"erp-fachdienst-server","meta":{"profile":["https://gematik.de/fhir/ti/StructureDefinition/ti-capability-statement"]},"extension":[{"url":"https://gematik.de/fhir/ti/StructureDefinition/extension-base-url","valueString":"http://todo"},{"extension":[{"url":"statusCode","valueString":"423"},{"url":"description","valueString":"If the insurant objected to the medication process or objected to the submission of prescription and dispensation data into the ePA system, the Medication Service is locked."},{"url":"responseType","valueString":"application/json"},{"url":"errorCode","valueString":"locked"}],"url":"https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"}],"url":"https://gematik.de/fhir/erp/CapabilityStatement/erp-fachdienst-server","version":"1.0.0-draft","name":"ERPFachdienstServer","title":"ERP CapabilityStatement für den E-Rezept-Fachdienst","status":"draft","date":"2025-12-15","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"ERP CapabilityStatement für den E-Rezept-Fachdienst","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"kind":"requirements","fhirVersion":"4.0.1","format":["application/fhir+json","application/fhir+xml"],"rest":[{"mode":"server"}]}
    
```

```

      {"resourceType":"OperationDefinition","id":"ActivateOperation","text":{"status":"generated","div":"<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\">Generated Narrative: OperationDefinition ActivateOperation</p><a name=\"ActivateOperation\"> </a><a name=\"hcActivateOperation\"> </a>URL: [base]/Task/[id]/$activateInput parameters Profile:<a href=\"http://hl7.org/fhir/R4/parameters.html\">Parameters</a>Output parameters Profile:<a href=\"StructureDefinition-eflow-rx-activate-operation-output-parameters.html\">GEM ERP PR ActivateOperation Output</a>Parameters<table class=\"grid\">UseNameScopeCardinalityTypeBindingDocumentationINePrescription1..1<a href=\"http://hl7.org/fhir/R4/binary.html\">Binary</a>Das qualifizierte unterzeichnete Verordnung (QES) zur Aktivierung des E-Rezept-Workflows.\nOUTreturn1..1<a href=\"http://hl7.org/fhir/R4/task.html\">Task</a>Geben Sie die aktualisierte und aktivierte Aufgabe zurück.\n</table></div>"},"url":"https://gematik.de/fhir/erp/OperationDefinition/ActivateOperation","version":"1.0.0-draft","name":"Activate","status":"draft","kind":"operation","date":"2025-12-15","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"Diese Operation aktiviert die erstellte Aufgabe für das Rezept. Der Eingabeparameter muss das qualifizierte signierte Bundle des Rezepts enthalten. Der E-Rezept-Fachdienst validiert das Rezept, aktualisiert die Task-ressource und startet den Workflow.","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"affectsState":true,"code":"activate","resource":["Task"],"system":false,"type":false,"instance":true,"inputProfile":"http://hl7.org/fhir/StructureDefinition/Parameters","outputProfile":"https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-activate-operation-output-parameters","parameter":[{"name":"ePrescription","use":"in","min":1,"max":"1","documentation":"Das qualifizierte unterzeichnete Verordnung (QES) zur Aktivierung des E-Rezept-Workflows.","type":"Binary"},{"name":"return","use":"out","min":1,"max":"1","documentation":"Geben Sie die aktualisierte und aktivierte Aufgabe zurück.","type":"Task"}]}
    
```

### Hinweis

* Bei ausbleibender Antwort soll der Client den Aufruf wiederholen.
* Wenn ein wiederholter Aufruf mit `403` und “Task not in status draft but in status ready” antwortet, war ein vorheriger Aufruf bereits erfolgreich.

### Geschaeftslogik

**Abbildung: **Ablauf Operation `$activate`
### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.md) festgehalten.

