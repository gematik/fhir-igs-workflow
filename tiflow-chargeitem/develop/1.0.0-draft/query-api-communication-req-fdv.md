# FdV-Anforderungen: Communication-Query - TIFlow - Abrechnungsinformationen v1.0.0-draft

TIFlow - Abrechnungsinformationen

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: Communication**](query-api-communication.md)
* **FdV-Anforderungen: Communication-Query**

## FdV-Anforderungen: Communication-Query

Diese Seite beschreibt Anforderungen an Clients zur Nutzung der `Communication`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Diese Seite beschreibt Anforderungen ein E-Rezept-FdV zur Nutzung der `Communication`-Query-Endpunkte.

#### Nachrichten abrufen

Das E-Rezept-FdV MUSS im Anwendungsfall "Nachrichten von Apotheken anzeigen" zum Herunterladen von Nachrichten vom TI-Flow-Fachdienst die HTTP-Operation GET /Communication mit
* ACCESS_TOKEN im Authorization-Header
* optional: ?received=null für nur ungelesene Nachrichten
* optional: ?received=gtYYYY-MM-DD_sort=sent für Nachrichten jünger als Datum DD.MM.YYY
ausführen.
#### Nachricht versenden

##### Zuweisen

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen" den aktuellen Status des E-Rezepts ermitteln, prüfen ob Task.status = ready ist und anderenfalls den Anwendungsfall abbrechen.

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen"  prüfen, ob das Ende der Einlösefrist (Task.ExpiryDate) zu einem früherem Zeitpunkt als das aktuelle Datum liegt und in diesem Fall den Anwendungsfall abbrechen.
Die für die Nachricht zu verwendende Communication-Ressource wird modul- und anwendungsfall-spezifisch festgelegt.

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen" im Rahmen der Belieferung eines Arzneimittels für den payload_contentstring eine TransactionID erzeugen, um Nachrichten zu dem Vorgang zuordnen zu können.

Das E-Rezept-FdV MUSS im  Anwendungsfall "E-Rezept einer Apotheke zuweisen" im Rahmen der Belieferung eines Arzneimittels, wenn der Nutzer auf eine empfangene Nachricht einer Apotheke antwortet, die TransactionID aus der empfangenen Nachricht der Apotheke unverändert im payload contentString der Textnachricht an die Apotheke zurückgeben.

Das E-Rezept-FdV MUSS im Anwendungsfall "Nachricht senden" zum Übermitteln einer Nachricht über den TI-Flow-Fachdienst die HTTP-Operation POST /Communication mit
* ACCESS_TOKEN im Authorization-Header
* Communication Ressource in HTTP-Request-Body
ausführen.
#### Nachricht löschen

Das E-Rezept-FdV MUSS im Anwendungsfall “Nachricht löschen” es dem Nutzer ermöglichen, eine Nachricht zum Löschen auf dem TI-Flow-Fachdienst auszuwählen.

Das E-Rezept-FdV MUSS im Anwendungsfall “Nachricht löschen” vom Nutzer eine Bestätigung einholen, dass die selektierte Nachricht gelöscht werden sollen und die Möglichkeit geben, das Löschen abzubrechen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Nachrichten löschen" für die zu löschende Nachricht die HTTP-Operation DELETE /Communication/<id> des TI-Flow-Fachdienstes mit
* ACCESS_TOKEN im Authorization-Header
* Communication-ID in URL <id>
ausführen.
### Modulspezifische Anforderungen

#### Nachricht versenden

##### Abrechnungsinformation-Token übermitteln

Mit dem Anwendungsfall kann die Apotheke , welche den PKV-Abgabedatensatz bereitgestellt hat, für das Ändern des PKV-Abgabedatensatzes berechtigt werden. Die Berechtigung erfolgt mit der Übermittlung des zugehörigen Abrechnungsinformation-Token

Das E-Rezept-FdV KANN den Anwendungsfall “Abrechnungsinformations-Token einer Apotheke übermitteln” umsetzen.

Die Korrektur des PKV-Abgabedatensatzes wird durch die Apotheke durchgeführt, welche die ursprünglichen Abrechnungsinformation erstellt hat. Daher ist keine freie Apothekenwahl für den Nutzer notwendig. Es ist ausreichend, die Apotheke aus den vorliegenden Abrechnungsinformationen zu ermitteln und dem Nutzer als Adressat der Nachricht anzuzeigen.

Eine Textnachricht ist optional. Innerhalb der Textnachricht sind keine Internet-Links und keine Non-Printable-Characters zulässig.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation-Token einer Apotheke übermitteln" eine FHIR Ressource Communication des Profils https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReq mit
* Telematik-ID der ausgewählten abgebenden LEI in recipient
* Textnachricht in payload contentString
* E-Rezept-Token in basedOn reference auf Task inkl. AccessCode als "/ChargeItem/<id>?ac=..."
erstellen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation-Token einer Apotheke übermitteln" zum Einstellen der Nachricht die HTTP-Operation POST /Communication mit
* ACCESS_TOKEN im Authorization-Header
* Communication Ressource in HTTP-Request-Body
ausführen.

