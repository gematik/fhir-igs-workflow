# Operation $activate (Task aktivieren) - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* **Operation $activate (Task aktivieren)**

## Operation $activate (Task aktivieren)

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$activate` gesendet.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu `$activate`](./op-activate-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [Client-Anforderungen zu `$activate`](./op-activate-req-pvs.md): Anforderungen an den Client des TI-Flow-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

```

      {"resourceType":"OperationDefinition","id":"ActivateOperation","url":"https://gematik.de/fhir/erp/OperationDefinition/ActivateOperationDefinition","version":"0.9.0","name":"Activate","status":"draft","kind":"operation","date":"2025-09-25","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"Diese Operation aktiviert die erstellte Aufgabe für das Rezept. Der Eingabeparameter muss das qualifizierte signierte Bundle des Rezepts enthalten. Der E-Rezept-Fachdienst validiert das Rezept, aktualisiert die Task-ressource und startet den Workflow.","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"affectsState":true,"code":"activate","resource":["Task"],"system":false,"type":false,"instance":true,"inputProfile":"http://hl7.org/fhir/StructureDefinition/Parameters","outputProfile":"https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PAR_ActivateOperation_Output"}
    
```

### Hinweise

* Der TI-Flow-Fachdienst prüft die Gültigkeit der qualifizierten Signatur des übergebenen FHIR-Bundles. Bei Gültigkeit wird der Task aktiviert und die Zuordnung des Task zum Patienten auf Basis der KVNR im Task unter dem value von  hinterlegt.
* Das signierte FHIR-Bundle wird als Ganzes gespeichert und steht inkl. der Signatur für den Abruf durch einen berechtigten, abgebenden Leistungserbringer zur Verfügung. Der Verweis erfolgt über die ID des Bundles unter `Task.input[coding.code = 1].reference`. Der Abruf erfolgt immer über den Task.
* Für den Versicherten wird eine Kopie des Bundles im JSON-Format inkl. serverseitiger Signatur bereitgestellt, die an der Stelle `Task.input[coding.code = 2].reference` referenziert wird.
* Für den Fall, dass das Clientsystem beim Aufruf der Operation keinen Response erhält, soll der Aufruf wiederholt werden. Wenn im Response des zweiten Aufrufs ein Fehler 403 mit dem OperationOutcome “Task not in status draft but in status ready” zurückkommt, wurde der erste Aufruf bereits erfolgreich durch den TI-Flow-Fachdienst verarbeitet. Wenn eine Response mit dem Status 200 zurückkommt, war der zweite Aufruf erfolgreich.

