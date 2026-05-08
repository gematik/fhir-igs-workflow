# Operation: $accept - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v1.0.0-draft

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* **Operation: $accept**

## Operation: $accept

Die FHIR-Operation `$acsept` überführt einen im Status `ready` befindlichen `Task` in den Status `in-progress`, nachdem der Kostenträger die Verordnung vom Fachdienst abgerufen hat.

### Nachricht

Die Operation $accept wird als HTTP POST auf /Task/<id>/$accept ausgeführt.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu `$accept`](./op-accept-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [Anforderungen für KTR zu `$accept`](./op-accept-req-ktr.md): Anforderungen an das Clientsystem des KTR zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

```

			{
  "resourceType": "OperationDefinition",
  "id": "AcceptOperation",
  "url": "https://gematik.de/fhir/erp/OperationDefinition/AcceptOperationDefinition",
  "status": "draft",
  "version": "1.6.1",
  "date": "2025-09-25",
  "name": "Accept",
  "kind": "operation",
  "affectsState": true,
  "resource": [
    "Task"
  ],
  "system": false,
  "type": false,
  "instance": true,
  "description": "Mit der $accept-Operation beansprucht eine Apotheke ein E-Rezept. Der Status der referenzierten Aufgabe ändert sich in 'in-progress'.",
  "code": "accept",
  "outputProfile": "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PAR_AcceptOperation_Output",
  "parameter": [
    {
      "name": "ac",
      "use": "in",
      "min": 1,
      "max": "1",
      "documentation": "Der Secret-Parameter, der es Benutzern ermöglicht, exklusiv über die URL und den Parameter ?ac auf die Aufgabe zuzugreifen.",
      "type": "string"
    }
  ]
}

		
```

