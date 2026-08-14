# Query API: Task - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* **Query API: Task**

## Query API: Task

Für die Nutzung verschiedener im Rahmen der Anwendung E-Rezept angebotenen Funktionalitäten zu Verordnungen werden verschiednen Workflows genutzt. Für die Verwaltung der Workflows wird die FHIR Ressource Task verwendet.

### Nachricht

Die Nachricht zur Interaktion mit Aufgaben am TI-Flow-Fachdienst als FHIR-Ressource **Task** wird über den `/Task` Endpunkt für das jeweilige Modul unterstützt.

### Anforderungen an Schnittstelle

Übergreifend gelten für die `/Task`-Endpunkte die folgenden Anforderungen:

* [FD-Anforderungen zur Task-Query](./query-api-task-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zur Task-Query](./query-api-task-req-fdv.md): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.
* [AVS-Anforderungen zur Task-Query](./query-api-task-req-avs.md): Anforderungen an das AVS zur Nutzung der Schnittstelle.
* [KTR-Anforderungen zur Task-Query](./query-api-task-req-ktr.md): Anforderungen an den KTR zur Nutzung der Schnittstelle.

### API

Die Beschreibung und Definition der konkreten API ist den jeweiligen Modulen, die diese Schnittstelle nutzen, zu entnehmen.

