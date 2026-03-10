# KTR-Anforderungen: Task-Query - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Task**](query-api-task.md)
* **KTR-Anforderungen: Task-Query**

## KTR-Anforderungen: Task-Query

Diese Seite beschreibt Anforderungen an das Clientsystem Kostenträger zur Nutzung der `Task`-Query-Endpunkte.

### Recovery Secret

Das Clientsystem Kostenträger MUSS im Anwendungsfall "Recovery Secret" für das E-Rezept die HTTP-Operation GET /Task/<id>/ mit
* ACCESS_TOKEN im Authorization-Header
* Task-ID in URL <id> 
* Access_Code in URL-Parameter ?ac=
ausführen.
### Quittung erneut abrufen

Mit diesem Anwendungsfall kann eine abgebende LEI die Quittung erneut abrufen, falls bei der Übermittlung vom E-Rezept-Fachdienst ein Fehler aufgetreten ist.

Der Anwendungsfall kann bei Bedarf wiederholt werden.

Das Clientsystem Kostenträger MUSS im Anwendungsfall "Quittung erneut abrufen" für das E-Rezept die HTTP-Operation GET /Task/<id>/ mit
* ACCESS_TOKEN im Authorization-Header
* Task-ID in URL <id> 
* Geheimnis in URL-Parameter ?secret=
ausführen.

