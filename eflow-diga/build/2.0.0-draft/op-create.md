# Operation: $create - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* **Operation: $create**

## Operation: $create

Die FHIR-Operation `$create` erstellt einen Workflow im E-Rezept-Fachdienst.

Diese Operation basiert auf der $create Operation des Basis-Workflow für E-Rezepte.

### Nachricht

Die Operation $create wird als HTTP POST auf /Task/$create ausgeführt.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu `$create`](./op-create-req-fd.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [Anforderungen für PVS zu `$create`](./op-create-req-pvs.md): Anforderungen an das PVS zur Nutzung der Schnittstelle.

-API BEschreibung aus Cap Statement

### Hinweis

Es ist nicht zulässig Verordnungs-IDs “auf Vorrat” am E-Rezept-Fachdienst abzufragen.

### Geschäftslogik

ToDo: Diagram zum Ablauf

