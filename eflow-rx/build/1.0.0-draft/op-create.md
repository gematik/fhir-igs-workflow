# Operation $create (Task erzeugen) - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* **Operation $create (Task erzeugen)**

## Operation $create (Task erzeugen)

### Task erzeugen ($create)

Die FHIR-Operation `$create` erzeugt einen neuen `Task` für ein E-Rezept. Die Operation steht ausschließlich verordnenden Leistungserbringern zur Verfügung.

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/$create` gesendet.

#### Auslösung

Das Primärsystem (PVS/KIS) ruft `$create` auf, um eine Rezept-ID (PrescriptionID) sowie einen AccessCode zu erhalten.

#### FHIR Operation API

Der E-Rezept-Fachdienst MUSS beim Erzeugen eines Tasks mittels HTTP-POST/$create-Operation die Rolle
*professionOID*des Aufrufenden im ACCESS_TOKEN im HTTP-RequestHeader
*Authorization*feststellen und sicherstellen, dass ausschließlich verordnende Leistungserbringer die Operation aufrufen dürfen.
* oid_praxis_arzt
* oid_zahnarztpraxis
* oid_praxis_psychotherapeut
* oid_krankenhaus
* oid_institution-vorsorge-reha

Der E-Rezept-Fachdienst MUSS die im Body der HTTP-POST-Operation auf die Ressource Task übertragenen Parameter gegen das Schema
*http://gematik.de/fhir/erp/OperationDefinition/CreateOperationDefinition*prüfen und bei Nicht-Konformität das Anlegen der Ressource im Fachdienst mit dem HTTP-Status-Code
*400*beantworten.

Der E-Rezept-Fachdienst MUSS beim Erzeugen eines Tasks mittels HTTP-POST/$create-Operation den Parameter
*workflowType*(Rezepttyp) aus dem HTTP-Body des POST-Requests entnehmen, als Attribut
*Task.extension:flowType*des zu erstellenden Tasks verwenden und bei Fehlen bzw. Nicht-Konformität des Parameters den Request als unzulässig abweisen.

Der E-Rezept-Fachdienst MUSS beim Erzeugen eines Tasks das Feld
*Task.performerType*aus dem übergebenen, gültigen Parameter
*Task.extension:flowType*gemäß der Prozessparameter übernehmen.

Der E-Rezept-Fachdienst MUSS beim Anlegen eines neuen Tasks eine Rezept-ID gemäß der Bildungsregel generieren, als Identifier mit Namingsystem
*https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PrescriptionId*dem Task hinzufügen und sicherstellen, dass diese Rezept-ID innerhalb von 11 Jahren nach ihrer Erzeugung nicht erneut vergeben wird.

Der E-Rezept-Fachdienst MUSS beim Erzeugen eines neuen Tasks die Rezept-ID, welche mit Task an das verordnende Primärsystem übermittelt wird, als Task-ID verwenden.

Der E-Rezept-Fachdienst MUSS beim Erzeugen eines Tasks mittels HTTP-POST/$create-Operation eine 256 Bit Zufallszahl (hexadezimal kodiert,
*[0-9a-f]{64}*) erzeugen und diese im zu speichernden Task als externe ID in
*Task.identifier:AccessCode*hinzufügen.

Der E-Rezept-Fachdienst MUSS die zulässige Anlage eines Tasks mittels HTTP-POST/$create-Operation im Status
*Task.status = draft*vollziehen und beim erfolgreichen Abschluss der Operation die angelegte Ressource Task im HTTP-Body der HTTP-Response zurückgeben.

```

      {"resourceType":"CapabilityStatement","id":"erp-fachdienst-server","meta":{"profile":["https://gematik.de/fhir/ti/StructureDefinition/ti-capability-statement"]},"extension":[{"url":"https://gematik.de/fhir/ti/StructureDefinition/extension-base-url","valueString":"http://todo"},{"extension":[{"url":"statusCode","valueString":"423"},{"url":"description","valueString":"If the insurant objected to the medication process or objected to the submission of prescription and dispensation data into the ePA system, the Medication Service is locked."},{"url":"responseType","valueString":"application/json"},{"url":"errorCode","valueString":"locked"}],"url":"https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"}],"url":"https://gematik.de/fhir/erp/CapabilityStatement/erp-fachdienst-server","version":"1.0.0-draft","name":"ERPFachdienstServer","title":"ERP CapabilityStatement für den E-Rezept-Fachdienst","status":"draft","date":"2025-12-15","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"ERP CapabilityStatement für den E-Rezept-Fachdienst","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"kind":"requirements","fhirVersion":"4.0.1","format":["application/fhir+json","application/fhir+xml"],"rest":[{"mode":"server"}]}
    
```

```

      {"resourceType":"OperationDefinition","id":"CreateOperation","text":{"status":"generated","div":"<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\">Generated Narrative: OperationDefinition CreateOperation</p><a name=\"CreateOperation\"> </a><a name=\"hcCreateOperation\"> </a>URL: [base]/Task/$createInput parameters Profile:<a href=\"http://hl7.org/fhir/R4/parameters.html\">Parameters</a>Output parameters Profile:<a href=\"StructureDefinition-eflow-rx-create-operation-output-parameters.html\">GEM ERP PR CreateOperation Output</a>Parameters<table class=\"grid\">UseNameScopeCardinalityTypeBindingDocumentationINworkflowType1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#Coding\">Coding</a><a href=\"ValueSet-eflow-rx-flowtype.html\">ValueSet der FlowType-Codes</a> (Required)Dieser Parameter fordert die Erstellung eines Tasks mit bestimmten Flowtype an.\nOUTreturn1..1<a href=\"http://hl7.org/fhir/R4/task.html\">Task</a>Der erstellte Task mit einer flowType-spezifischen Rezept-ID\n</table></div>"},"url":"https://gematik.de/fhir/erp/OperationDefinition/CreateOperation","version":"1.0.0-draft","name":"Create","status":"draft","kind":"operation","date":"2025-12-15","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"Diese Operation erstellt eine Aufgabe für die Verschreibung eines bestimmten Flowtypes.","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"affectsState":true,"code":"create","resource":["Task"],"system":false,"type":true,"instance":false,"inputProfile":"http://hl7.org/fhir/StructureDefinition/Parameters","outputProfile":"https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-create-operation-output-parameters","parameter":[{"name":"workflowType","use":"in","min":1,"max":"1","documentation":"Dieser Parameter fordert die Erstellung eines Tasks mit bestimmten Flowtype an.","type":"Coding","binding":{"strength":"required","valueSet":"https://gematik.de/fhir/erp/ValueSet/eflow-rx-flowtype"}},{"name":"return","use":"out","min":1,"max":"1","documentation":"Der erstellte Task mit einer flowType-spezifischen Rezept-ID","type":"Task"}]}
    
```

### Geschäftslogik

Das folgende Aktivitätsdiagramm illustriert die Geschäftslogik der Operation `$create`.

<?xml version=”1.0” encoding=”us-ascii” standalone=”no”?>

### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.md) festgehalten.

