# Operation $close (Task schließen) - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* **Operation $close (Task schließen)**

## Operation $close (Task schließen)

### Task schliessen ($close)

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$close` gesendet.

### Anforderungen an Schnittstelle

* [FD-Anforderungen zu `$close`](./op-close-fd-requirements.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [Client-Anforderungen zu `$close`](./op-close-client-requirements.md): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

```

      {"resourceType":"CapabilityStatement","id":"erp-fachdienst-server","meta":{"profile":["https://gematik.de/fhir/ti/StructureDefinition/ti-capability-statement"]},"extension":[{"url":"https://gematik.de/fhir/ti/StructureDefinition/extension-base-url","valueString":"http://todo"},{"extension":[{"url":"statusCode","valueString":"423"},{"url":"description","valueString":"If the insurant objected to the medication process or objected to the submission of prescription and dispensation data into the ePA system, the Medication Service is locked."},{"url":"responseType","valueString":"application/json"},{"url":"errorCode","valueString":"locked"}],"url":"https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"}],"url":"https://gematik.de/fhir/erp/CapabilityStatement/erp-fachdienst-server","version":"1.0.0-draft","name":"ERPFachdienstServer","title":"ERP CapabilityStatement für den E-Rezept-Fachdienst","status":"draft","date":"2025-12-15","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"ERP CapabilityStatement für den E-Rezept-Fachdienst","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"kind":"requirements","fhirVersion":"4.0.1","format":["application/fhir+json","application/fhir+xml"],"rest":[{"mode":"server"}]}
    
```

### Hinweis

* `$close` beendet den Workflow verbindlich; danach ist keine weitere inhaltliche Aenderung der Dispensierdaten moeglich.
* Falls ohne MedicationDispense aufgerufen wird, muss bereits eine gueltige `$dispense`-Information gespeichert sein.
* Bei Stapelverarbeitung sind Lastverteilungsregeln einzuhalten.

### Geschaeftslogik

**Abbildung: **Ablauf Operation `$close`
### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.md) festgehalten.

