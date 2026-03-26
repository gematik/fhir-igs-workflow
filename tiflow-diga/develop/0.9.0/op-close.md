# Operation: $close - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v0.9.0

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* **Operation: $close**

## Operation: $close

Die FHIR-Operation `$close` überführt einen im Status `in-progress` befindlichen `Task` in den Status `completed`, wenn der Kostenträger des Workflow abschliesst.

### Nachricht

Die Operation $close wird als HTTP POST auf /Task/<id>/$close ausgeführt.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu `$close`](./op-close-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [Anforderungen für KTR zu `$close`](./op-close-req-ktr.md): Anforderungen an das Clientsystem des KTR zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

```

			{
  "resourceType": "OperationDefinition",
  "id": "CloseOperation",
  "url": "https://gematik.de/fhir/erp/OperationDefinition/CloseOperationDefinition",
  "status": "draft",
  "version": "1.6.1",
  "date": "2025-09-25",
  "name": "Close",
  "kind": "operation",
  "affectsState": true,
  "resource": [
    "Task"
  ],
  "system": false,
  "type": false,
  "instance": true,
  "description": "Die $close-Operation beendet den E-Rezept-Workflow und erstellt eine Quittung. Das Ergebnis dieses Vorgangs ist ein signiertes Bundle, das für weitere finanzielle Verarbeitung verwendet wird. Der Status der Aufgabe ändert sich anschließend in #completed.",
  "code": "close",
  "inputProfile": "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PAR_CloseOperation_Input",
  "outputProfile": "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PAR_CloseOperation_Output"
}

		
```

### Hinweise

Nach Abschluss der Workflows eines E-Rezeptes hat der Kostenträger die Möglichkeit dem Versicherten eine Antwort zur Zuweisung zu übermitteln. Hierfür erstellt der Kostenträger eine Communication vom ProfilGEM_ERP_PR_Communication_DiGA und ergänzt unter Communication.payload.contentString den Antworttext, der dem Nutzer im E-Rezept-FdV dargestellt werden soll.

