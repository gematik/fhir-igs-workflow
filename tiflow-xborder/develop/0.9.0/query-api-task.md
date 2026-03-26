# Query API: Task - TIFlow - Grenzüberschreitender Datenaustausch v0.9.0

TIFlow - Grenzüberschreitender Datenaustausch

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Query API**](menu-schnittstellen-query-api.md)
* **Query API: Task**

## Query API: Task

Diese Seite beschreibt den Einstieg in die Task-Query-Schnittstelle.

### Nachricht

Die Nachricht zur Interaktion mit E-Rezepten als FHIR-Ressource **Task** wird über die folgenden HTTP-Methoden ermöglicht:

| | |
| :--- | :--- |
| PATCH | Task markieren |

### Anforderungen an Schnittstelle

* [Server Anforderungen zur Task-Query](./query-api-task-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [Client-Anforderungen zur Task-Query](./query-api-task-req-fdv.md): Anforderungen an den Client des TI-Flow-Fachdienstes zur Nutzung der Schnittstelle.

### Resource API

Anfragen an die *Task*-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden.

Durch Angabe des URL-Parameter `?ac=` bei der GET-Operation kann eine abgebende Institution den Anwendungsfall “Recovery Secret” ausführen.

Durch Angabe des URL-Parameter `?secret=` bei der GET-Operation kann eine abgebende Institution den Anwendungsfall “UC 4.8 - Quittung erneut abrufen” ausführen.

#### Task abrufen

```
server
```

Error processing command: Unable to find fragment resource Bundle/example-searchset-task pointed to in file /home/runner/work/fhir-igs-workflow/fhir-igs-workflow/igs/erp-eu/input/pagecontent/query-api-task </div> 

Error processing command: Unable to find fragment resource Bundle/example-searchset-task pointed to in file /home/runner/work/fhir-igs-workflow/fhir-igs-workflow/igs/erp-eu/input/pagecontent/query-api-task </div> </div> </div> ### Instance API Um spezifische Details zu einem einzelnen _Task_ mittels der RESTful API zu erhalten, wird die _Task Instance API_ verwendet, indem eine HTTP GET-Anfrage an den Endpunkt */Task/[id]* gestellt wird. #### Task abrufen 

```
server
```

Error processing command: Unable to find fragment resource Task/TaskInReadyState pointed to in file /home/runner/work/fhir-igs-workflow/fhir-igs-workflow/igs/erp-eu/input/pagecontent/query-api-task </div> 

Error processing command: Unable to find fragment resource Task/TaskInReadyState pointed to in file /home/runner/work/fhir-igs-workflow/fhir-igs-workflow/igs/erp-eu/input/pagecontent/query-api-task </div> </div> </div> #### Task markieren 

```
server
```

Error processing command: Unable to find fragment resource Task/TaskInReadyState pointed to in file /home/runner/work/fhir-igs-workflow/fhir-igs-workflow/igs/erp-eu/input/pagecontent/query-api-task </div> 

Error processing command: Unable to find fragment resource Task/TaskInReadyState pointed to in file /home/runner/work/fhir-igs-workflow/fhir-igs-workflow/igs/erp-eu/input/pagecontent/query-api-task </div> </div> </div> 






