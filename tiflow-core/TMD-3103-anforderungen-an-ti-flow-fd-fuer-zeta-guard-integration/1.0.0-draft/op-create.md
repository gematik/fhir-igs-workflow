# Operation $create (Task erzeugen) - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* **Operation $create (Task erzeugen)**

## Operation $create (Task erzeugen)

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/$create` gesendet.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu `$create`](./op-create-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [Client-Anforderungen zu `$create`](./op-create-req-pvs.md): Anforderungen an den Client des TI-Flow-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

```

      {"resourceType":"OperationDefinition","id":"CreateOperation","url":"https://gematik.de/fhir/erp/OperationDefinition/CreateOperationDefinition","version":"1.0.0-draft","name":"Create","status":"draft","kind":"operation","date":"2025-09-25","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"Diese Operation erstellt eine Aufgabe für die Verschreibung eines bestimmten Flowtypes.","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"affectsState":true,"code":"create","resource":["Task"],"system":false,"type":true,"instance":false,"inputProfile":"http://hl7.org/fhir/StructureDefinition/Parameters","outputProfile":"https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PAR_CreateOperation_Output"}
    
```

### Hinweise

* Der Parameter `` steuert den Typ des dem Task zugrunde liegenden Workflows.
* Die Operation `POST /Task/$create` ist nicht zum Aufbau von Vorräten (Prefetch) oder zum „Vorbereiten” von Rezept-Hüllen ohne konkrete Verordnungsabsicht vorgesehen. Jeder `create`-Aufruf führt serverseitig zur Vergabe einer neuen, fortlaufenden und über lange Zeit eindeutig zu haltenden Rezept-/Task-ID. Nicht aktivierte bzw. verworfene Tasks „verbrauchen“ diese IDs dauerhaft und reduzieren den verfügbaren Nummernraum. Ein `create` sollte daher erst dann erfolgen, wenn das Primärsystem tatsächlich ein E-Rezept erzeugen und im Anschluss zeitnah mit `activate` starten will. Insbesondere ist das Generieren des maximal möglichen Kontingents pro Formular-/Maskenöffnung oder „auf Verdacht“ zu unterlassen.
* Der unter dem Identifier `GEM_ERP_NS_PrescriptionId` hinterlegte Wert stellt die 10 Jahre lang eineindeutige Rezept-ID dar.
* An Identifier unter `GEM_ERP_NS_AccessCode` ist der serverseitig generierte AccessCode, der für nachfolgende Zugriffe auf diesen Task in einem http-Request für die Berechtigungsprüfung mitgegeben werden muss.
* Unter `GEM_ERP_CS_FlowType` hat der TI-Flow-Fachdienst den Übergabeparameter zur Konfiguration des des Workflows übernommen.
* Der Wert in performer entspricht dem intendierten Institutionstyp, in welchen der Versicherte für die Einlösung der Verordnung gelenkt werden soll.

