# Operation: $activate - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* **Operation: $activate**

## Operation: $activate

Die FHIR-Operation `$activate` überführt einen im Status `draft` befindlichen `Task` in den Status `ready`, wenn das Primärsystem den qualifiziert elektronisch signierten Verordnungsdatensatz (QES) übermittelt. Für DiGA-Verordnungen (Flowtype 162) gelten zusätzliche Payload-Prüfungen. Die allgemeinen Anforderungen des Basis-Workflows gelten unverändert.

### Nachricht

Die Operation $activate wird als HTTP POST auf /Task//$activate ausgeführt.

### Anforderungen an Schnittstelle

Es gelten die übergreifenden Anforderungen an die $activate Operation. ToDo: link zu übergreifenden Anforderungen

[Workflow-spezifische Anforderungen für den E-Rezept-Fachdienst](./op-activate-req-server.md) [Workflowspezifische Anforderungen für das verordnende Primärsystem](./op-activate-req-client.md)

