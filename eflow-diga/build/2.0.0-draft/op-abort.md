# Operation: $abort - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* **Operation: $abort**

## Operation: $abort

Die FHIR-Operation `$abort` überführt einen im Status `ready` befindlichen `Task` in den Status `cancelled`, nachdem der Verordnende die Verordnung gelöscht hat. Die FHIR-Operation `$abort` überführt einen im Status `ready` oder `completed` befindlichen `Task` in den Status `cancelled`, nachdem der Versicherte die Verordnung gelöscht hat.

Diese Operation basiert auf der $abort Operation des Basis-Workflow für E-Rezepte.

### Nachricht

Die Operation $abort wird als HTTP POST auf /Task//$abort ausgeführt.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu `$abort`](./op-abort-req-fd.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [Anforderungen für PVS zu `$abort`](./op-abort-req-pvs.md): Anforderungen an das PVS zur Nutzung der Schnittstelle.
* [Anforderungen für FdV zu `$abort`](./op-abort-req-fdv.md): Anforderungen an das FdV zur Nutzung der Schnittstelle.

-API BEschreibung aus Cap Statement

### Hinweis

keine

### Geschäftslogik

ToDo: Diagram zum Ablauf

