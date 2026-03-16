# FdV-Anforderungen: Task-Query - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Task**](query-api-task.md)
* **FdV-Anforderungen: Task-Query**

## FdV-Anforderungen: Task-Query

Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `Task`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `Task`-Query-Endpunkte.

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezepte abrufen" zum Herunterladen alle E-Rezepte des Nutzers die HTTP-Operation GET /Task mit
* ACCESS_TOKEN im Authorization-Header
ausführen.

Das E-Rezept-FdV KANN es dem Versicherten ermöglichen, die vom E-Rezept-Fachdienst heruntergeladenen E-Rezepte im lokalen Speicher persistent abzulegen.
#### Alternativer Ablauf 1: Ein spezifisches E-Rezept durch Nutzer abrufen

Die Alternative 1 wird genutzt, wenn nur die Informationen zu einem E-Rezept vom E-Rezept-Fachdienst heruntergeladen werden sollen, bspw. um zu prüfen, ob sich der Status geändert hat. Dafür muss die Task-ID dieses Rezepts im E-Rezept-FdV bekannt sein.

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezepte abrufen" zum Herunterladen eines spezifischen E-Rezepts des Nutzers die HTTP-Operation GET /Task/<id> mit
* ACCESS_TOKEN im Authorization-Header
* Task-ID in URL <id> 
ausführen.
Für weitere Informationen siehe Operation “Ein einzelnes E-Rezept abrufen” aus der API-Schnittstelle [E-Rezept API Dokumentation].

Der Response beinhaltet die Task Ressource des E-Rezepts.

#### Alternativer Ablauf 2: Ein spezifisches E-Rezept mit AccessCode abrufen

Die Alternative 2 wird genutzt, wenn der Nutzer als Vertreter eines Versicherten ein E-Rezept vom E-Rezept-Fachdienst herunterladen möchte. Dafür müssen die Task-ID und der AccessCode dieses Rezepts im E-Rezept-FdV bekannt sein. Die Informationen Task-ID und AccessCode werden im E-Rezept-Token übermittelt.

Das E-Rezept-FdV KANN im Anwendungsfall "E-Rezepte abrufen" zum Herunterladen eines E-Rezepts als Vertreter die HTTP-Operation GET /Task/<id> mit
* ACCESS_TOKEN im http-Header
* Task-ID in URL <id> 
* AccessCode im http-Header 
ausführen.
Für weitere Informationen siehe Operation “Ein einzelnes E-Rezept abrufen” aus der API-Schnittstelle [E-Rezept API Dokumentation].

Der Response beinhaltet die Task Ressource des E-Rezepts.

### Modulspezifische Anforderungen

#### GET /Task

##### Workflowspezifische Anforderungen

Das E-Rezept-FdV MUSS den Nutzer bei der Einsicht in ein E-Rezept mit dem Flowtype 166 darauf hinweisen, dass bei diesem Vorgang seine Einlösemöglichkeiten beschränkt sind und das Rezept eine verkürzte Gültigkeit aufweist.

