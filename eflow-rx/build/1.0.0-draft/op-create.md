# Operation $create (Task erzeugen) - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* **Operation $create (Task erzeugen)**

## Operation $create (Task erzeugen)

### Task erzeugen ($create)

Diese Operation basiert auf der gleichnamigen Operation in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/eflow-core/latest/op-create.html).

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/$create` gesendet.

### Anforderungen an Schnittstelle

* [FD-Anforderungen zu `$create`](./op-create-fd-requirements.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [Client-Anforderungen zu `$create`](./op-create-client-requirements.md): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

```

      {"resourceType":"CapabilityStatement","id":"erp-fachdienst-server","meta":{"profile":["https://gematik.de/fhir/ti/StructureDefinition/ti-capability-statement"]},"extension":[{"url":"https://gematik.de/fhir/ti/StructureDefinition/extension-base-url","valueString":"http://todo"},{"extension":[{"url":"statusCode","valueString":"423"},{"url":"description","valueString":"If the insurant objected to the medication process or objected to the submission of prescription and dispensation data into the ePA system, the Medication Service is locked."},{"url":"responseType","valueString":"application/json"},{"url":"errorCode","valueString":"locked"}],"url":"https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"}],"url":"https://gematik.de/fhir/erp/CapabilityStatement/erp-fachdienst-server","version":"1.0.0-draft","name":"ERPFachdienstServer","title":"ERP CapabilityStatement für den E-Rezept-Fachdienst","status":"draft","date":"2025-12-15","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"ERP CapabilityStatement für den E-Rezept-Fachdienst","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"kind":"requirements","fhirVersion":"4.0.1","format":["application/fhir+json","application/fhir+xml"],"rest":[{"mode":"server"}]}
    
```

```

      {"resourceType":"OperationDefinition","id":"CreateOperation","text":{"status":"generated","div":"<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\">Generated Narrative: OperationDefinition CreateOperation</p><a name=\"CreateOperation\"> </a><a name=\"hcCreateOperation\"> </a>URL: [base]/Task/$createInput parameters Profile:<a href=\"http://hl7.org/fhir/R4/parameters.html\">Parameters</a>Output parameters Profile:<a href=\"StructureDefinition-eflow-rx-create-operation-output-parameters.html\">GEM ERP PR CreateOperation Output</a>Parameters<table class=\"grid\">UseNameScopeCardinalityTypeBindingDocumentationINworkflowType1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#Coding\">Coding</a><a href=\"ValueSet-GEM-ERP-VS-FlowType.html\">ValueSet der FlowType-Codes</a> (Required)Dieser Parameter fordert die Erstellung eines Tasks mit bestimmten Flowtype an.\nOUTreturn1..1<a href=\"http://hl7.org/fhir/R4/task.html\">Task</a>Der erstellte Task mit einer flowType-spezifischen Rezept-ID\n</table></div>"},"url":"https://gematik.de/fhir/erp/OperationDefinition/CreateOperation","version":"1.0.0-draft","name":"Create","status":"draft","kind":"operation","date":"2025-12-15","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"Diese Operation erstellt eine Aufgabe für die Verschreibung eines bestimmten Flowtypes.","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"affectsState":true,"code":"create","resource":["Task"],"system":false,"type":true,"instance":false,"inputProfile":"http://hl7.org/fhir/StructureDefinition/Parameters","outputProfile":"https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-create-operation-output-parameters","parameter":[{"name":"workflowType","use":"in","min":1,"max":"1","documentation":"Dieser Parameter fordert die Erstellung eines Tasks mit bestimmten Flowtype an.","type":"Coding","binding":{"strength":"required","valueSet":"https://gematik.de/fhir/erp/ValueSet/GEM-ERP-VS-FlowType"}},{"name":"return","use":"out","min":1,"max":"1","documentation":"Der erstellte Task mit einer flowType-spezifischen Rezept-ID","type":"Task"}]}
    
```

### Hinweis

* Task-IDs duerfen nicht auf Vorrat erzeugt bzw. bevorratet werden.
* `$create` ist nur fuer konkrete, unmittelbar folgende Verordnungsprozesse zu verwenden.
* Quelle: [api-erp: E-Rezept erstellen](https://github.com/gematik/api-erp/blob/master/docs/erp_bereitstellen.adoc#e-rezept-erstellen).

### Geschaeftslogik

**Abbildung: **Ablauf Operation `$create`
### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.md) festgehalten.

