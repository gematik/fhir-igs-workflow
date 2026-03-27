# KTR-Anforderungen: Communication-Query - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Communication**](query-api-communication.md)
* **KTR-Anforderungen: Communication-Query**

## KTR-Anforderungen: Communication-Query

Diese Seite beschreibt Anforderungen ein Clientsystem des Kostenrägers zur Nutzung der `Communication`-Query-Endpunkte.

### Nachrichten abrufen

Das Clientsystem Kostenträger MUSS im Anwendungsfall "Nachrichten von Versicherten empfangen" zwischen den Aufrufen der Operation GET /Communication mindestens 5 Minuten warten. Der Zeitraum zwischen den Aufrufen muss um eine zufällige Zeitspanne zwischen 0 und 10.000 Millisekunden verlängert werden, um eine Gleichverteilung der Anfragen am TI-Flow-Fachdienst über alle Apotheken zu erreichen.

Das Clientsystem Kostenträger MUSS im Anwendungsfall "Nachrichten von Versicherten empfangen" die HTTP-Operation GET /Communication mit
* ACCESS_TOKEN im Authorization-Header
* optional: ?received=null für nur ungelesene Nachrichten
* optional: ?received=gtYYYY-MM-DD für Nachrichten nach Datum DD.MM.YYYY
ausführen.
Falls eine oder mehrere E-Rezept-Nachrichten für die abgebende LEI auf dem TI-Flow-Fachdienst bereitstehen, übermittelt der TI-Flow-Fachdienst ein Bundle von Communication Ressourcen. 

### Nachricht versenden

Die für die Nachricht zu verwendende Communication-Ressource wird modul- und anwendungsfall-spezifisch festgelegt.

Das Clientsystem Kostenträger MUSS im Anwendungsfall "Nachricht an Versicherten versenden" die HTTP-Operation POST /Communication mit
* ACCESS_TOKEN im Authorization-Header
* Communication Ressource im HTTP-Request-Body
ausführen.
### Nachricht löschen

Mit diesem Anwendungsfall kann die abgebende LEI von ihr versendete Nachrichten an einen Versicherten auf dem Fachdienst löschen.

Das CS Kostenträger MUSS es dem Nutzer ermöglichen, eine Nachricht zum Löschen auf dem Fachdienst auszuwählen.

Das CS Kostenträger MUSS vom Nutzer eine Bestätigung einholen, dass die ausgewählte Nachricht gelöscht werden soll, und die Möglichkeit geben, das Löschen abzubrechen.

Das Clientsystem Kostenträger MUSS im Anwendungsfall "Nachricht durch Abgebenden löschen" für die zu löschende Nachricht die HTTP-Operation DELETE /Communication/<id> mit
* ACCESS_TOKEN im Authorization-Header
* Communication-ID in URL <id> 
ausführen.
Der Fachdienst prüft anhand der Telematik-ID im ACCESS_TOKEN, ob die LEI der Absender der zu löschenden Nachricht ist.

Das CS Kostenträger KANN im Anwendungsfall “Nachricht durch Abgebenden löschen” dem Nutzer ermöglichen, die Nachricht auch lokal im PS zu löschen.

Hinweis: Nachrichten an Versicherte sind immer an den Workflow des referenzierten E-Rezeptes gebunden. Wenn ein E-Rezept-Workflow, bspw. durch den Versicherten oder aufgrund von durch den Fachdienst durchgesetzte Löschfristen, auf dem Fachdienst gelöscht wird, dann werden auch alle zugehörigen Nachrichten gelöscht.

