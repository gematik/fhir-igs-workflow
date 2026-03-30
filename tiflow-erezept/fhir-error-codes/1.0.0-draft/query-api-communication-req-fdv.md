# FdV-Anforderungen: Communication-Query - TIFlow - Verordnungen für Arzneimittel v1.0.0-draft

TIFlow - Verordnungen für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Communication**](query-api-communication.md)
* **FdV-Anforderungen: Communication-Query**

## FdV-Anforderungen: Communication-Query

Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `Communication`-Query-Endpunkte.

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

##### Zuweisen

Das E-Rezept-FdV DARF es dem Nutzer NICHT ermöglichen, für ein E-Rezept mit dem Flowtype 162, 169 oder 209 eine Anfrage zur Belieferung an eine abgebende Institution zu senden.

Das E-Rezept-FdV DARF im Anwendungsfall "E-Rezept einer Apotheke zuweisen" es dem Nutzer NICHT ermöglichen, ein E-Rezept mit dem Flowtype 169 oder 209 an eine Apotheke zuzuweisen.

Das E-Rezept-FdV DARF im Anwendungsfall "E-Rezept einer Apotheke zuweisen" für ein E-Rezept mit dem Flowtype 166 es dem Nutzer NICHT ermöglichen ein E-T-Rezept mit der Belieferungsart "Postversand" an eine Apotheke zuzuweisen.

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen" prüfen, ob bei Teilverordnungen von Mehrfachverordnungen (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) der Beginn der Einlösefrist (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) erreicht ist und in diesem Fall den Anwendungsfall abbrechen.

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen" prüfen, dass die durch den Nutzer erfasst Textnachricht keinen Internet-Link und keine Non-Printable-Characters enthält und die Textnachricht nur bei erfolgreicher Prüfung weiterverarbeiten.

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen" im Rahmen der Belieferung eines Arzneimittels für den payload_contentstring einen JSON Datensatz mit communicationType = "order" erstellen.

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen" im Rahmen der Belieferung eines Arzneimittels , wenn der Nutzer auf eine empfangene Nachricht einer Apotheke antwortet, für den payload_contentstring einen JSON Datensatz mit communicationType = "text" erstellen.
siehe [Datenmodell Payload für Communication-Query](./query-api-communication-req-data.md)

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen" eine FHIR Ressource Communication des Profils https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq mit 
* Telematik-ID der ausgewählten abgebenden LEI in recipient
* Textnachricht in payload contentString
* E-Rezept-Token in basedOn reference auf Task inkl. AccessCode als "/Task/<id>/$accept?ac=..." 
erstellen.
**Apotheke suchen**

Die Anfrage zur Suche von Apotheken, richtet sich an das FHIR-Directory des Verzeichnisdienstes der TI (FHIR-VZD TI). 

Der Ablauf der Authentisierung und Suche ist in [gemSpec_VZD_FHIR_Directory#Versicherter sucht Einträge im FHIR-Directory] beschrieben.

Für weitere Informationen siehe Anwendungsfall “Suche nach Apotheken im FHIR VZD” aus der API-Schnittstelle [E-Rezept API Dokumentation].

Für weitere Informationen siehe “Eine Apotheke aus dem Apotheken-Verzeichnis auswählen” in der API-Schnittstelle [VZD API Dokumentation].

Das E-Rezept-FdV MUSS im Anwendungsfall "Apotheke suchen" sicherstellen, dass dem Nutzer nur Einträge aus dem Verzeichnisdienst mit OrganizationProfessionOID = 1.2.276.0.76.4.54 zur Auswahl gestellt werden.
Das E-Rezept-FdV MUSS im Anwendungsfall “Apotheke suchen” sicherstellen, dass dem Nutzer nur Einträge aus dem Verzeichnisdienst zur Auswahl gestellt werden, welche mindestens eine Belieferungsoption im Feld specialization angegeben haben.

Der Wertebereich für specialization ist in https://simplifier.net/vzd-fhir-directory/pharmacyhealthcarespecialtycs beschrieben. Belieferungsoptionen sind:

* 10 - Handverkauf
* 30 - Botendienst
* 40 - Versand

Das E-Rezept-FdV MUSS es dem Versicherten ermöglichen, sich alle Einträge aus einem Suchergebnis anzeigen zu lassen.

Das E-Rezept-FdV MUSS ein Suchergebnis so darstellen, dass einzelne Apotheken nicht hervorgehoben oder bevorzugt werden.

Das E-Rezept-FdV MUSS die Apothekensuche und die Suchergebnisse so darstellen, dass Belieferungsoptionen nicht hervorgehoben oder bevorzugt werden.

