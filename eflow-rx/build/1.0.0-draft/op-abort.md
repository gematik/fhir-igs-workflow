# Operation $abort (Task abbrechen) - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* **Operation $abort (Task abbrechen)**

## Operation $abort (Task abbrechen)

### Task abbrechen ($abort)

Diese Operation basiert auf der gleichnamigen Operation in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/eflow-core/latest/op-abort.html).

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$abort` gesendet.

### Anforderungen an Schnittstelle

* [FD-Anforderungen zu `$abort`](./op-abort-fd-requirements.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [Client-Anforderungen zu `$abort`](./op-abort-client-requirements.md): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

```

      {"resourceType":"CapabilityStatement","id":"erp-fachdienst-server","meta":{"profile":["https://gematik.de/fhir/ti/StructureDefinition/ti-capability-statement"]},"extension":[{"url":"https://gematik.de/fhir/ti/StructureDefinition/extension-base-url","valueString":"http://todo"},{"extension":[{"url":"statusCode","valueString":"423"},{"url":"description","valueString":"If the insurant objected to the medication process or objected to the submission of prescription and dispensation data into the ePA system, the Medication Service is locked."},{"url":"responseType","valueString":"application/json"},{"url":"errorCode","valueString":"locked"}],"url":"https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"}],"url":"https://gematik.de/fhir/erp/CapabilityStatement/erp-fachdienst-server","version":"1.0.0-draft","name":"ERPFachdienstServer","title":"ERP CapabilityStatement für den E-Rezept-Fachdienst","status":"draft","date":"2025-12-15","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"ERP CapabilityStatement für den E-Rezept-Fachdienst","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"kind":"requirements","fhirVersion":"4.0.1","format":["application/fhir+json","application/fhir+xml"],"rest":[{"mode":"server"}]}
    
```

### Hinweis

* Nach erfolgreichem `$abort` sind lokale Einloeseinformationen (`secret`, Token-Bezug) im Client zu bereinigen.
* Fehlercodes und OperationOutcome-Hinweise sollen dem Nutzer mit klarem Bezug zum Task-Status angezeigt werden.

### Geschaeftslogik

**Abbildung: **Ablauf Operation `$abort`
### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.md) festgehalten.

