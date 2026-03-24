# Operation $accept (Task akzeptieren) - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* **Operation $accept (Task akzeptieren)**

## Operation $accept (Task akzeptieren)

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$accept` gesendet.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu `$accept`](./op-accept-fd-requirements.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [AVS-Anforderungen zu `$accept`](./op-accept-req-avs.md): Anforderungen an das Apothekenverwaltungssystem zur Nutzung der Schnittstelle.
* [AVS-Anforderungen zu `$accept`](./op-accept-req-ktr.md): Anforderungen an das Clientsystem des Kostenträgers zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

```

      {"resourceType":"OperationDefinition","id":"AcceptOperation","url":"https://gematik.de/fhir/erp/OperationDefinition/AcceptOperationDefinition","version":"0.9.0","name":"Accept","status":"draft","kind":"operation","date":"2025-09-25","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"Mit der $accept-Operation beansprucht eine Apotheke ein E-Rezept. Der Status der referenzierten Aufgabe ändert sich in 'in-progress'.","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"affectsState":true,"code":"accept","resource":["Task"],"system":false,"type":false,"instance":true,"outputProfile":"https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PAR_AcceptOperation_Output","parameter":[{"name":"ac","use":"in","min":1,"max":"1","documentation":"Der Secret-Parameter, der es Benutzern ermöglicht, exklusiv über die URL und den Parameter ?ac auf die Aufgabe zuzugreifen.","type":"string"}]}
    
```

### Hinweise

* Das generierte `secret` stellt den Zugriffscode der abrufenden Apotheke dar und muss in allen folgenden Workflowschritten in `Task.identifier[GEM_ERP_NS_Secret].value` angegeben werden, damit nicht eine fremde Apotheke den Prozess übernehmen kann.
* Der `Task.status` ist in Bearbeitung (in-progress).
* Das Objekt `Binary` enthält den qualifiziert signierten Verordnungsdatensatz als PKCS#7-Datei in Base64-codierter Form. Innerhalb des Signaturobjekts ist das E-Rezept-Bundle enthalten (Enveloping-Signatur) und muss vom Apothekensystem für die Bearbeitung des E-Rezepts verarbeitet werden. Der codierte Base64-String ist hier aus Gründen der Lesbarkeit nicht vollständig dargestellt.

