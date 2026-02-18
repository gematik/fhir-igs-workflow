# Operation: $close - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* **Operation: $close**

## Operation: $close

Die FHIR-Operation `$close` überführt einen im Status `in-progress` befindlichen `Task` in den Status `completed`, wenn der Kostenträger des Workflow abschliesst.

### Nachricht

Die Operation $close wird als HTTP POST auf /Task/<id>/$close ausgeführt.

### Anforderungen an Schnittstelle

Es gelten die übergreifenden Anforderungen an die $close Operation. ToDo: link zu übergreifenden Anforderungen

[Workflow-spezifische Anforderungen für den E-Rezept-Fachdienst](./op-close-req-server.md)

[Workflow-spezifische Anforderungen für das Clientsystem des Kostenträgers](./op-close-req-client.md)

### Hinweis

Nach Abschluss der Workflows eines E-Rezeptes hat der Kostenträger die Möglichkeit dem Versicherten eine Antwort zur Zuweisung zu übermitteln. Hierfür erstellt der Kostenträger eine Communication vom ProfilGEM_ERP_PR_Communication_DiGA und ergänzt unter Communication.payload.contentString den Antworttext, der dem Nutzer im E-Rezept-FdV dargestellt werden soll.

### Geschäftslogik

ToDo: Diagram zum Ablauf

