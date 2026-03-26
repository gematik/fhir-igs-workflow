# Operation: $abort - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v1.0.0-draft

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* **Operation: $abort**

## Operation: $abort

Die FHIR-Operation `$abort` überführt einen im Status `ready` befindlichen `Task` in den Status `cancelled`, nachdem der Verordnende die Verordnung gelöscht hat. Die FHIR-Operation `$abort` überführt einen im Status `ready` oder `completed` befindlichen `Task` in den Status `cancelled`, nachdem der Versicherte die Verordnung gelöscht hat.

Diese Operation basiert auf der $abort Operation des Basis-Workflow für E-Rezepte.

### Nachricht

Die Operation $abort wird als HTTP POST auf /Task//$abort ausgeführt.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu `$abort`](./op-abort-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [Anforderungen für PVS zu `$abort`](./op-abort-req-pvs.md): Anforderungen an das PVS zur Nutzung der Schnittstelle.
* [Anforderungen für FdV zu `$abort`](./op-abort-req-fdv.md): Anforderungen an das FdV zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

```

      {
  "resourceType": "OperationDefinition",
  "id": "AbortOperation",
  "url": "https://gematik.de/fhir/erp/OperationDefinition/AbortOperationDefinition",
  "status": "draft",
  "version": "1.6.1",
  "date": "2025-09-25",
  "name": "Abort",
  "kind": "operation",
  "affectsState": true,
  "resource": [
    "Task"
  ],
  "system": false,
  "type": false,
  "instance": true,
  "description": "Diese Operation bricht den Workflow eines E-Rezepts ab und löscht alle Daten, die mit dieser Aufgabe zusammenhängen.",
  "code": "abort",
  "parameter": [
    {
      "name": "ac",
      "use": "in",
      "min": 0,
      "max": "1",
      "documentation": "[Nur von Patienten und Anbietern (Ärzten/Zahnärzten) zu verwenden] Der secret Parameter, der es Benutzern ermöglicht, exklusiv über die URL und den Parameter ?ac auf die Aufgabe zuzugreifen.",
      "type": "string"
    },
    {
      "name": "secret",
      "use": "in",
      "min": 0,
      "max": "1",
      "documentation": "[Nur von der Apotheke zu verwenden] Der secret Parameter, der es einer Apotheke ermöglicht, exklusiv über die URL und den Parameter ?secret auf die Aufgabe zuzugreifen.",
      "type": "string"
    }
  ]
}

    
```

