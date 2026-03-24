# Operation: $create - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v0.9.0

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* **Operation: $create**

## Operation: $create

Die FHIR-Operation `$create` erstellt einen Workflow im TI-Flow-Fachdienst.

Diese Operation basiert auf der $create Operation des Basis-Workflow für E-Rezepte.

### Nachricht

Die Operation $create wird als HTTP POST auf /Task/$create ausgeführt.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu `$create`](./op-create-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [Anforderungen für PVS zu `$create`](./op-create-req-pvs.md): Anforderungen an das PVS zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

```

			{
  "resourceType": "OperationDefinition",
  "id": "CreateOperation",
  "url": "https://gematik.de/fhir/erp/OperationDefinition/CreateOperationDefinition",
  "status": "draft",
  "version": "1.6.1",
  "date": "2025-09-25",
  "name": "Create",
  "kind": "operation",
  "affectsState": true,
  "resource": [
    "Task"
  ],
  "system": false,
  "type": true,
  "instance": false,
  "description": "Diese Operation erstellt eine Aufgabe für die Verschreibung eines bestimmten Flowtypes.",
  "code": "create",
  "inputProfile": "http://hl7.org/fhir/StructureDefinition/Parameters",
  "outputProfile": "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PAR_CreateOperation_Output"
}

		
```

