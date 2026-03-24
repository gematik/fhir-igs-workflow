# Operation: $activate - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v0.9.0

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* **Operation: $activate**

## Operation: $activate

Die FHIR-Operation `$activate` überführt einen im Status `draft` befindlichen `Task` in den Status `ready`, wenn das Primärsystem den qualifiziert elektronisch signierten Verordnungsdatensatz (QES) übermittelt.

Diese Operation basiert auf der $activate Operation des Basis-Workflow für E-Rezepte. Für DiGA-Verordnungen (Flowtype 162) gelten zusätzliche Payload-Prüfungen.

### Nachricht

Die Operation $activate wird als HTTP POST auf /Task/<id>/$activate ausgeführt.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu `$activate`](./op-activate-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [Anforderungen für PVS zu `$activate`](./op-activate-req-pvs.md): Anforderungen an das PVS zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

```

			{
  "resourceType": "OperationDefinition",
  "id": "ActivateOperation",
  "url": "https://gematik.de/fhir/erp/OperationDefinition/ActivateOperationDefinition",
  "status": "draft",
  "version": "1.6.1",
  "date": "2025-09-25",
  "name": "Activate",
  "kind": "operation",
  "affectsState": true,
  "resource": [
    "Task"
  ],
  "system": false,
  "type": false,
  "instance": true,
  "description": "Diese Operation aktiviert die erstellte Aufgabe für das Rezept. Der Eingabeparameter muss das qualifizierte signierte Bundle des Rezepts enthalten. Der E-Rezept-Fachdienst validiert das Rezept, aktualisiert die Task-ressource und startet den Workflow.",
  "code": "activate",
  "inputProfile": "http://hl7.org/fhir/StructureDefinition/Parameters",
  "outputProfile": "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PAR_ActivateOperation_Output"
}

		
```

