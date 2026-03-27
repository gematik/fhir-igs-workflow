# Operation $close (Task schließen) - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* **Operation $close (Task schließen)**

## Operation $close (Task schließen)

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$close` gesendet.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu `$close`](./op-close-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [Client-Anforderungen zu `$close`](./op-close-req-avs.md): Anforderungen an den Client des TI-Flow-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

```

      {"resourceType":"OperationDefinition","id":"CloseOperation","url":"https://gematik.de/fhir/erp/OperationDefinition/CloseOperationDefinition","version":"1.0.0-draft","name":"Close","status":"draft","kind":"operation","date":"2025-09-25","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"Die $close-Operation beendet den E-Rezept-Workflow und erstellt eine Quittung. Das Ergebnis dieses Vorgangs ist ein signiertes Bundle, das für weitere finanzielle Verarbeitung verwendet wird. Der Status der Aufgabe ändert sich anschließend in #completed.","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"affectsState":true,"code":"close","resource":["Task"],"system":false,"type":false,"instance":true,"inputProfile":"https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PAR_CloseOperation_Input","outputProfile":"https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PAR_CloseOperation_Output"}
    
```

### Hinweise

* `$close` beendet den Workflow verbindlich; danach ist keine weitere inhaltliche Änderung der Dispensierdaten möglich.
* Falls ohne MedicationDispense aufgerufen wird, muss bereits eine gültige `$dispense`-Information gespeichert sein.
* Bei Stapelverarbeitung sind Lastverteilungsregeln einzuhalten.
* Die maximale Dateigröße für die Kommunikation am TI-Flow-Fachdienst beträgt derzeit 1MB. Dies meint den kompletten Request, daher muss der innere VAU-Request etwas kleiner als 1MB sein. Für Verordnungen, die mehrere Abgaben erfordern ist darauf zu achten, dass für mehrere Abgaben einer Charge nur eine MedicationDispense erstellt wird.

