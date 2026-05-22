# Operation: $reject - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v1.0.0-draft

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* **Operation: $reject**

## Operation: $reject

Die FHIR-Operation `$reject` überführt einen im Status `in-progress` befindlichen `Task` in den Status `ready`, wenn der Kostenträger die Verordnung an den Versicherten zurückgibt, weil eine fehlerhafte Zuweisung vorliegt, d.h. der Kostenträger nicht zuständig ist.

Diese Operation basiert auf der $abort Operation des Basis-Workflow für E-Rezepte.

### Nachricht

Die Operation $reject wird als HTTP POST auf /Task/<id>/$reject ausgeführt.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu `$reject`](./op-reject-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [Anforderungen für KTR zu `$reject`](./op-reject-req-ktr.md): Anforderungen an das Clientsystem des KTR zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

```

			{
  "resourceType": "OperationDefinition",
  "id": "RejectOperation",
  "url": "https://gematik.de/fhir/erp/OperationDefinition/RejectOperationDefinition",
  "status": "draft",
  "version": "1.6.1",
  "date": "2025-09-25",
  "name": "Reject",
  "kind": "operation",
  "affectsState": true,
  "resource": [
    "Task"
  ],
  "system": false,
  "type": false,
  "instance": true,
  "description": "Lehnt die Ausgabe eines E-Rezepts ab. Die Aufgabe wird in einen aktiven Zustand zurückgesetzt, das secret wird gelöscht, und der Task wird für jeden anderen Apotheker zugänglich oder kann vom Patienten gelöscht werden.",
  "code": "reject",
  "parameter": [
    {
      "name": "secret",
      "use": "in",
      "min": 1,
      "max": "1",
      "documentation": "Der secret Parameter, der einer Apotheke den exklusiven Zugriff auf den Task als URL-Parameter ?secret ermöglicht.",
      "type": "string"
    }
  ]
}

		
```

### Hinweise

Falls es bei der Verarbeitung einer Zuweisung einer digitalen Gesundheitsanwendung zu einem Fehler kommt, bspw. wenn der Nutzer nicht beim Kostenträger versichert ist, muss das Clientsystem den Nutzer informieren und das E-Rezept zur weiteren Nutzung zurückgeben.

Hierzu führt der Kostenträger die TI-Flow-Fachdienst Operation “$reject” aus und übermittelt dem Nutzer eine Communication GEM_ERP_PR_Communication_DiGA in der der Kostenträger angeben kann, warum die Verordnung nicht bearbeitet werden kann.

