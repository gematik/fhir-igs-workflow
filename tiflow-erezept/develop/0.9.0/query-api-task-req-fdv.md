# FdV-Anforderungen: Task-Query - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Task**](query-api-task.md)
* **FdV-Anforderungen: Task-Query**

## FdV-Anforderungen: Task-Query

Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `Task`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `Task`-Query-Endpunkte.

#### Liste der Verordnungen des Nutzers abrufen

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezepte abrufen" zum Herunterladen alle E-Rezepte des Nutzers die HTTP-Operation GET /Task mit
* ACCESS_TOKEN im Authorization-Header
ausführen.

Das E-Rezept-FdV KANN es dem Versicherten ermöglichen, die vom TI-Flow-Fachdienst heruntergeladenen E-Rezepte im lokalen Speicher persistent abzulegen.
#### Eine spezifische Verordnung durch Nutzer abrufen

Der Aufruf wird genutzt, wenn die Informationen zu einer spezifischen Verordnung vom TI-Flow-Fachdienst heruntergeladen werden sollen, bspw. um zu prüfen, ob sich der Status geändert hat. Dafür muss die Task-ID dieser Verordnung im E-Rezept-FdV bekannt sein.

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezepte abrufen" zum Herunterladen einer spezifischen Verordnung des Nutzers die HTTP-Operation GET /Task/<id> mit
* ACCESS_TOKEN im Authorization-Header
* Task-ID in URL <id> 
ausführen.
Für weitere Informationen siehe Operation “Ein einzelnes E-Rezept abrufen” aus der API-Schnittstelle [E-Rezept API Dokumentation].

Der Response beinhaltet die Task Ressource des E-Rezepts.

### Modulspezifische Anforderungen

#### GET /Task

##### Workflowspezifische Anforderungen

Das E-Rezept-FdV MUSS den Nutzer bei der Einsicht in ein E-Rezept mit dem Flowtype 166 darauf hinweisen, dass bei diesem Vorgang seine Einlösemöglichkeiten beschränkt sind und das Rezept eine verkürzte Gültigkeit aufweist.

