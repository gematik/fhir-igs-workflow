# AVS-Anforderungen: Communication-Query - Abrechnungsinformationen für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: Communication**](query-api-communication.md)
* **AVS-Anforderungen: Communication-Query**

## AVS-Anforderungen: Communication-Query

Diese Seite beschreibt Anforderungen ein AVS zur Nutzung der `Communication`-Query-Endpunkte für “Bereitstellung von Abrechnungsinformationen für PKV-Versicherte”.

### Anforderungen aus der Core Spezifikation

Diese Seite beschreibt Anforderungen an Clients zur Nutzung der `Communication`-Query-Endpunkte.

#### Nachricht versenden

#### Nachricht löschen

Mit diesem Anwendungsfall kann die abgebende LEI von ihr versendete Nachrichten an einen Versicherten auf dem Fachdienst löschen.

Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, eine Nachricht zum Löschen auf dem Fachdienst auszuwählen.

Das PS der abgebenden LEI MUSS vom Nutzer eine Bestätigung einholen, dass die ausgewählte Nachricht gelöscht werden soll, und die Möglichkeit geben, das Löschen abzubrechen.

Das PS der abgebenden LEI MUSS im Anwendungsfall "Nachricht durch Abgebenden löschen" für die zu löschende Nachricht die HTTP-Operation DELETE /Communication/<id> mit
* ACCESS_TOKEN im Authorization-Header
* Communication-ID in URL <id> 
ausführen.
Der Fachdienst prüft anhand der Telematik-ID im ACCESS_TOKEN, ob die LEI der Absender der zu löschenden Nachricht ist.

Das PS der abgebenden LEI KANN im Anwendungsfall “Nachricht durch Abgebenden löschen” dem Nutzer ermöglichen, die Nachricht auch lokal im PS zu löschen.

Hinweis: Nachrichten an Versicherte sind immer an den Workflow des referenzierten E-Rezeptes gebunden. Wenn ein E-Rezept-Workflow, bspw. durch den Versicherten oder aufgrund von durch den Fachdienst durchgesetzte Löschfristen, auf dem Fachdienst gelöscht wird, dann werden auch alle zugehörigen Nachrichten gelöscht.

### Modulspezifische Anforderungen

