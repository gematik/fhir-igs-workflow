# FdV-Anforderungen: Communication-Query - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Communication**](query-api-communication.md)
* **FdV-Anforderungen: Communication-Query**

## FdV-Anforderungen: Communication-Query

Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `Communication`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Diese Seite beschreibt Anforderungen ein E-Rezept-FdV zur Nutzung der `Communication`-Query-Endpunkte.

#### Nachrichten abrufen

Das E-Rezept-FdV MUSS im Anwendungsfall "Nachrichten von Apotheken anzeigen" zum Herunterladen von Nachrichten vom E-Rezept-Fachdienst die HTTP-Operation GET /Communication mit
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

Das E-Rezept-FdV MUSS im Anwendungsfall "Nachricht senden" zum Übermitteln einer Nachricht über den E-Rezept-Fachdienst die HTTP-Operation POST /Communication mit
* ACCESS_TOKEN im Authorization-Header
* Communication Ressource in HTTP-Request-Body
ausführen.
##### Vertreterkommunikation

Das E-Rezept-FdV MUSS im Anwendungsfall “Vertreterkommunikation” es dem Nutzer ermöglichen, die KVNR des Empfängers der Nachricht zu erfassen.

Das Erfassen der KVNR eines Vertreters kann über eine Texterkennung durch Abscannen dessen eGK, manuelle Eingabe, durch Übernahme aus einer lokalen Vertreterliste oder auch durch die Übernahme aus einer vorherigen Kommunikation erfolgen.

Die Textnachricht ist optional. Der Textnachricht muss der Präfix “<Absendername> schreibt: “ vorangestellt werden.

Das E-Rezept-FdV MUSS im Anwendungsfall "Vertreterkommunikation" eine FHIR Ressource Communication des Profils https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Representative mit
* KVNR des Vertreters in recipient
* optional: Textnachricht in payload contentString
* E-Rezept-Token in basedOn reference auf Task inkl. AccessCode als "/Task/<id>?ac=..."
erstellen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Vertreterkommunikation" zur Übergabe des Tokens an den Vertreter die HTTP-Operation POST /Communication mit
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

#### Nachricht versenden

##### Zuweisen

Das E-Rezept-FdV DARF es dem Nutzer NICHT ermöglichen, für ein E-Rezept mit dem Flowtype 162, 169 oder 209 eine Anfrage zur Belieferung an eine abgebende Institution zu senden.

Das E-Rezept-FdV DARF im Anwendungsfall "E-Rezept einer Apotheke zuweisen" es dem Nutzer NICHT ermöglichen, ein E-Rezept mit dem Flowtype 169 oder 209 an eine Apotheke zuzuweisen.

Das E-Rezept-FdV DARF im Anwendungsfall "E-Rezept einer Apotheke zuweisen" für ein E-Rezept mit dem Flowtype 166 es dem Nutzer NICHT ermöglichen ein E-T-Rezept mit der Belieferungsart "Postversand" an eine Apotheke zuzuweisen.

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen" prüfen, ob bei Teilverordnungen von Mehrfachverordnungen (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) der Beginn der Einlösefrist (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) erreicht ist und in diesem Fall den Anwendungsfall abbrechen.

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen" prüfen, dass die durch den Nutzer erfasst Textnachricht keinen Internet-Link und keine Non-Printable-Characters enthält und die Textnachricht nur bei erfolgreicher Prüfung weiterverarbeiten.

Das E-Rezept-FdV DARF NICHT im Anwendungsfall "Vertreterkommunikation" es dem Nutzer ermöglichen, bezüglich einem E-Rezept mit dem Flowtype 169 oder 209 mit einem Vertreter zu kommunizieren.

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen" im Rahmen der Belieferung eines Arzneimittels für den payload_contentstring einen JSON Datensatz mit communicationType = "order" erstellen.

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen" im Rahmen der Belieferung eines Arzneimittels , wenn der Nutzer auf eine empfangene Nachricht einer Apotheke antwortet, für den payload_contentstring einen JSON Datensatz mit communicationType = "text" erstellen.
siehe [Datenmodell Payload für Communication-Query](./query-api-communication-req-data.md)

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen" eine FHIR Ressource Communication des Profils https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq mit 
* Telematik-ID der ausgewählten abgebenden LEI in recipient
* Textnachricht in payload contentString
* E-Rezept-Token in basedOn reference auf Task inkl. AccessCode als "/Task/<id>/$accept?ac=..." 
erstellen.

