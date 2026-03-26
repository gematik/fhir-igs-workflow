# Query API: MedicationDispense - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* **Query API: MedicationDispense**

## Query API: MedicationDispense

Diese Seite beschreibt die modulübergreifende MedicationDispense-Query-Schnittstelle.

Dem Versicherten werden über die Ressource MedicationDispense Informationen über ein eingelöstes E-Rezept bereitgestellt. Im MedicationDispense ist dabei die Referenz auf das abgegebene Medikament enthalten. Diese Informationen unterstützen den Versicherten im Versorgungsprozess, indem ihm bspw. mittels dieser Informationen ein digitaler Beipackzettel oder weitere Informationen wie Applikationsanleitungen zur Verfügung gestellt werden können. Der Zugriff auf die Ressource MedicationDispense erfolgt ausschließlich lesend über die http-GET-Operation. Das Löschen erfolgt indirekt über das Löschen des der MedicationDispense zugrunde liegenden Tasks.

### Nachricht

Die Nachricht zur Interaktion mit Einlöseinformationen als FHIR-Ressource **MedicationDispense** wird über die folgenden HTTP-Methoden ermöglicht:

| | |
| :--- | :--- |
| GET | Einlöseinformation abrufen |

### Anforderungen an Schnittstelle

* [Server-Anforderungen zur MedicationDispense-Query](./query-api-medicationdispense-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zur MedicationDispense-Query](./query-api-medicationdispense-req-fdv.md): Anforderungen an das E-Rezept-FdV des TI-Flow-Fachdienstes zur Nutzung der Schnittstelle.

### Resource API

Als Versicherter möchte ich die Abgabeinformationen erhalten, um mir darüber einen digitalen Beipackzettel herunterzuladen und weitere Anwendungshinweise für mein Medikament zu erhalten. Die Rückgabe erfolgt als Liste im `Bundle` eines oder mehrerer MedicationDispenses, welche den ggfs. angegebenen Suchparametern entsprechen.

```
server
```

