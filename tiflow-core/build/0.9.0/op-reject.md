# Operation $reject (Task zurückweisen) - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* **Operation $reject (Task zurückweisen)**

## Operation $reject (Task zurückweisen)

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$reject` gesendet.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu `$reject`](./op-reject-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [AVS-Anforderungen zu `$reject`](./op-reject-req-avs.md): Anforderungen an ein Apothekenverwaltungssystem zur Nutzung der Schnittstelle.
* [KTR-Anforderungen zu `$reject`](./op-reject-req-ktr.md): Anforderungen an ein Clientsystem des Kostenträgers zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

```

      {"resourceType":"OperationDefinition","id":"RejectOperation","url":"https://gematik.de/fhir/erp/OperationDefinition/RejectOperationDefinition","version":"0.9.0","name":"Reject","status":"draft","kind":"operation","date":"2025-09-25","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"Lehnt die Ausgabe eines E-Rezepts ab. Die Aufgabe wird in einen aktiven Zustand zurückgesetzt, das secret wird gelöscht, und der Task wird für jeden anderen Apotheker zugänglich oder kann vom Patienten gelöscht werden.","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"affectsState":true,"code":"reject","resource":["Task"],"system":false,"type":false,"instance":true,"parameter":[{"name":"secret","use":"in","min":1,"max":"1","documentation":"Der secret Parameter, der einer Apotheke den exklusiven Zugriff auf den Task als URL-Parameter ?secret ermöglicht.","type":"string"}]}
    
```

### Hinweise

* `reject` und direktes erneutes `accept` sollen nicht als Übergabemechanismus zwischen Apotheken verwendet werden, da dies für Versicherte schwer nachvollziehbare Protokollierung/Notifications erzeugt.
* Im Ergebnis der `$reject`-Operation wird der referenzierte Task auf den aktiven Status ready zurückgesetzt und das `secret` gelöscht. Dementsprechend werden keine Daten an den aufrufenden Client zurückgegeben.

