# FdV-Anforderungen: Communication-Query - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: Communication**](query-api-communication.md)
* **FdV-Anforderungen: Communication-Query**

## FdV-Anforderungen: Communication-Query

Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `Communication`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Diese Seite beschreibt Anforderungen an Clients zur Nutzung der `Communication`-Query-Endpunkte.

#### Nachrichten abrufen

Das E-Rezept-FdV MUSS im Anwendungsfall "Nachrichten von Apotheken anzeigen" zum Herunterladen von Nachrichten vom E-Rezept-Fachdienst die HTTP-Operation GET /Communication mit
* ACCESS_TOKEN im Authorization-Header
* optional: ?received=null für nur ungelesene Nachrichten
* optional: ?received=gtYYYY-MM-DD_sort=sent für Nachrichten jünger als Datum DD.MM.YYY
ausführen.
#### Nachricht versenden

Die für die Nachricht zu verwendende Communication-Ressource wird modul- und anwendungsfall-spezifisch festgelegt.

Das E-Rezept-FdV MUSS im Anwendungsfall "Nachricht senden" zum Übermitteln einer Nachricht über den E-Rezept-Fachdienst die HTTP-Operation POST /Communication mit
* ACCESS_TOKEN im Authorization-Header
* Communication Ressource in HTTP-Request-Body
ausführen.
#### Nachricht löschen

Das E-Rezept-FdV MUSS im Anwendungsfall “Nachricht löschen” es dem Nutzer ermöglichen, eine Nachricht zum Löschen auf dem E-Rezept-Fachdienst auszuwählen.

Das E-Rezept-FdV MUSS im Anwendungsfall “Nachricht löschen” vom Nutzer eine Bestätigung einholen, dass die selektierte Nachricht gelöscht werden sollen und die Möglichkeit geben, das Löschen abzubrechen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Nachrichten löschen" für die zu löschende Nachricht die HTTP-Operation DELETE /Communication/<id> des E-Rezept-Fachdienstes mit
* ACCESS_TOKEN im Authorization-Header
* Communication-ID in URL <id>
ausführen.
### Modulspezifische Anforderungen

Das E-Rezept-FdV KANN im Anwendungsfall "E-Rezept einer abgebenden Institution zuweisen" es dem Nutzer ermöglichen, für E-Rezepte mit dem Flowtype 162 einen Kostenträger zum Zuweisen einer DiGA auszuwählen.
Die Auswahl kann mit dem Anwendungsfall “Kostenträger suchen” erfolgen.

Beim Zuweisen einer DiGA-Verordnung ist keine freie Textnachricht vorgesehen, um eine maschinelle Verarbeitung zur Bereitstellung des Freischaltcodes zu ermöglichen.

