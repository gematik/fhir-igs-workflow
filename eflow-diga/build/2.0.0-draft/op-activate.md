# Operation: $activate - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* **Operation: $activate**

## Operation: $activate

Die FHIR-Operation `$activate` überführt einen im Status `draft` befindlichen `Task` in den Status `ready`, wenn das Primärsystem den qualifiziert elektronisch signierten Verordnungsdatensatz (QES) übermittelt.

Diese Operation basiert auf der $activate Operation des Basis-Workflow für E-Rezepte. Für DiGA-Verordnungen (Flowtype 162) gelten zusätzliche Payload-Prüfungen.

### Nachricht

Die Operation $activate wird als HTTP POST auf /Task/<id>/$activate ausgeführt.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu `$activate`](./op-activate-req-fd.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [Anforderungen für PVS zu `$activate`](./op-activate-req-pvs.md): Anforderungen an das PVS zur Nutzung der Schnittstelle.

