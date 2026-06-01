# KTR-Anforderungen: Task-Query - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: Task**](query-api-task.md)
* **KTR-Anforderungen: Task-Query**

## KTR-Anforderungen: Task-Query

Diese Seite beschreibt Anforderungen an das CS Kostenträger zur Nutzung der `Task`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Diese Seite beschreibt Anforderungen an das Clientsystem Kostenträger zur Nutzung der `Task`-Query-Endpunkte.

#### Recovery Secret

funkt. Eignung: HerstellererklärungDas Clientsystem Kostenträger MUSS im Anwendungsfall "Recovery Secret" für das E-Rezept die HTTP-Operation GET /Task/<id>/ mit
* Task-ID in URL <id> 
* AccessCode in URL-Parameter ?ac=
ausführen.
#### Quittung erneut abrufen

Mit diesem Anwendungsfall kann ein Clientsystem eines Kostenträgers die Quittung erneut abrufen, falls bei der Übermittlung vom TI-Flow-Fachdienst ein Fehler aufgetreten ist.

Der Anwendungsfall kann bei Bedarf wiederholt werden.

funkt. Eignung: HerstellererklärungDas Clientsystem Kostenträger MUSS im Anwendungsfall "Quittung erneut abrufen" für das E-Rezept die HTTP-Operation GET /Task/<id>/ mit
* Task-ID in URL <id> 
* Geheimnis in URL-Parameter ?secret=
ausführen.
### Modulspezifische Anforderungen

