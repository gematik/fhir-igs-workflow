# Query API: MedicationDispense - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v0.9.0

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* **Query API: MedicationDispense**

## Query API: MedicationDispense

Query API: MedicationDispense

MedicationDispense wird für die Abgabeinformation der DiGA genutzt. Der Freischaltcode sowie die DiGA-Bezeichnung werden in der Abgabeinformation bereitgestellt. Falls kein Freischaltcode bereitgestellt werden kann, enthält die Abgabeinformation eine begründende Rückmeldung.

### Nachricht

Die Interaktion mit Nachrichten als FHIR-Ressource **MedicationDispense** wird über die folgenden HTTP-Methoden ermöglicht:

| | |
| :--- | :--- |
| GET | Freischaltcodes abrufen |

### Anforderungen an Schnittstelle

* [FD-Anforderungen zu MedicationDispense](./query-api-medicationdispense-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zu MedicationDispense](./query-api-medicationdispense-req-fdv.md): Anforderungen an ein E-Rezept-FdV zur Nutzung der Schnittstelle.

### Resource API

```
server
```

