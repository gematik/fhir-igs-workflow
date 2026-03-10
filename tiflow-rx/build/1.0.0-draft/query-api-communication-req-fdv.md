# FdV-Anforderungen: Communication-Query - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

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

Das E-Rezept-FdV MUSS im Anwendungsfall "Nachrichten von Apotheken anzeigen" zum Herunterladen von Nachrichten vom E-Rezept-Fachdienst die HTTP-Operation GET /Communication mit
* ACCESS_TOKEN im Authorization-Header
* optional: ?received=null für nur ungelesene Nachrichten
* optional: ?received=gtYYYY-MM-DD_sort=sent für Nachrichten jünger als Datum DD.MM.YYY
ausführen.

Das E-Rezept-FdV MUSS für den Anwendungsfall "Nachricht durch Abgebenden übermitteln" Nachrichten mit der folgenden Datenstruktur in der contentString-Eigenschaft des GEM_ERP_PR_Communication_Reply unterstützen.

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| version | ja | Gibt die Version des JSON an. Aktuell immer 3. Kann im weiteren Lebenszyklus verändert werden. | nummerisch, bis zu 6 Stellen | 3 |
| communicationType | ja | Beschreibt die Art der Nachricht. | text, link, reservationStatus, pickupCodeHR, pickupCodeDMC, deliveryStatus, paymentInfo | reservationStatus |
| text | Falls communicationType = text oder link: jaFalls communicationType = pickupCodeHR, pickupCodeDMC, deliveryStatus oder paymentInfo: neinFalls communicationType = reservationStatus: verboten | Zusätzlicher Freitext der Apotheke an den Versicherten. Falls communicationType gleich "link" ist, beschreibt dies das URL-Ziel, sodass der Versicherte vor dem Aufruf über das Ziel des Absprungs informiert wird. | 800 Stellen, keine URL | Wir möchten Sie informieren, dass Ihre bestellten Medikamente zur Abholung bereitstehen. Den Abholcode finden Sie anbei. |
| url | Falls communicationType = link: jaAnsonsten: verboten | Einbettung einer externen URL ausschließlich für das Einlösen von E-Rezepten in einer externen Bestellplattform. | 500 Stellen, URL gemäß RFC3986 | https://www.meine-apotheke.de/pickup/59b52340-7a6a-430d-99ea-45a8e5cd03f6 |
| transactionID | ja | Wiederholung aus der empfangenen Nachricht. Dient dazu, Nachrichten einer Transaktion zuordnen zu können. | 36 Stellen, UUID | 8196b610-9b77-47ab-936e-362cd92ef2aa |
| readyForCollection | Falls communicationType = reservationStatus: jaAnsonsten: verboten | Zeitpunkt der Verfügbarkeit | immediately, sameDay, nextDay, nextDayAM, nextDayPM, unknown, notAvailable | immediately |
| deliveryStatus | Falls communicationType = deliveryStatus: jaAnsonsten: verboten | Information zum Status der Lieferung (Bote, Versand) | preparedWaiting, inTransport, delivered, incident | inTransport |
| inTransportPosition | Falls communicationType = deliveryStatus: neinAnsonsten: verboten | GMS Position des Transporters | Lat, Long | ```{ "long": 13.387595793605172, "lat": 52.522529939635795 }``` |
| inTransportETA | Falls communicationType = deliveryStatus: neinAnsonsten: verboten | Erwartete Ankunft Zeitfenster von – bis | TIMESTAMP-TIMESTAMP | ```{ "from": 1735736400, "to": 1735741800 }``` |
| totalAmount | Falls communicationType = paymentInfo: jaAnsonsten: verboten | Zu zahlender Betrag in Eurocent, rein nummerisch | Nummerisch | 12550 |
| paymentMethods | Falls communicationType = paymentInfo: neinAnsonsten: verboten | Verfügbare Zahlungsarten | Array aus Objects: cash, bankaccount, creditcard, paypal (optional) | ```"paymentMethods": [ { "method": "cash" }, { "method": "bankaccount", "url": "https://my.payment.provider.de/pay/..." }, { "method": "paypal", "url": "https://paypal.me/<some_account>" } ]``` |
| pickUpCodeHR | Falls communicationType = pickupCodeHR und supplyOptionsType = onPremise: jaAnsonsten: verboten | Menschenlesbarer Abholcode | 1-8 Stellen | 12315615 |
| pickUpCodeDMC | Falls communicationType = pickupCodeDMC und supplyOptionsType = onPremise: jaAnsonsten: verboten | Maschinenlesbarer Abholcode (Data-Matrix-Code gemäß ISO/IEC 16022:2006) | 8-2000 Stellen | 5346a991-c5c6-49c8-b87b-4cdd255bbde4 |

**Tabelle: **Nachricht als Apotheke an einen Versicherten schicken

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

Das E-Rezept-FdV DARF es dem Nutzer NICHT ermöglichen, für ein E-Rezept mit dem Flowtype 162, 169 oder 209 eine Anfrage zur Belieferung an eine abgebende Institution zu senden.

Das E-Rezept-FdV DARF im Anwendungsfall "E-Rezept einer Apotheke zuweisen" es dem Nutzer NICHT ermöglichen, ein E-Rezept mit dem Flowtype 169 oder 209 an eine Apotheke zuzuweisen.

Das E-Rezept-FdV DARF im Anwendungsfall "E-Rezept einer Apotheke zuweisen" für ein E-Rezept mit dem Flowtype 166 es dem Nutzer NICHT ermöglichen ein E-T-Rezept mit der Belieferungsart "Postversand" an eine Apotheke zuzuweisen.

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen" prüfen, ob bei Teilverordnungen von Mehrfachverordnungen (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) der Beginn der Einlösefrist (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) erreicht ist und in diesem Fall den Anwendungsfall abbrechen.

Das E-Rezept-FdV DARF NICHT im Anwendungsfall "Vertreterkommunikation" es dem Nutzer ermöglichen, bezüglich einem E-Rezept mit dem Flowtype 169 oder 209 mit einem Vertreter zu kommunizieren.

Das E-Rezept-FdV MUSS für den Anwendungsfall "E-Rezept einer Apotheke zuweisen" Nachrichten mit der Datenstruktur gemäß der Tabelle in der contentString-Eigenschaft des GEM_ERP_PR_Communication_DispReq-Profils unterstützen.

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| version | ja | Gibt die Version des JSON an. Aktuell immer 3. Kann im weiteren Lebenszyklus verändert werden. | nummerisch, bis zu 6 Stellen | 3 |
| communicationType | ja | Beschreibt die Art der Nachricht. | order, text | order |
| supplyOptionsType | Falls communicationType = order: jaFalls communicationType = text: verboten | Wird gemäß des Servicerequests gesetzt, den der Nutzer wählt. Die für den Nutzer verfügbaren Services sind für die jeweilige Apotheke im FHIR-VZD hinterlegt. | onPremise, shipment, delivery | onPremise |
| firstname | Falls communicationType = order und supplyOptionsType = delivery oder shipment: jaAnsonsten: nein | Vorname des Versicherten bzw. Lieferungsempfänger | 45 Stellen | Maximilian |
| lastname | Falls communicationType = order und supplyOptionsType = delivery oder shipment: jaAnsonsten: nein | Name des Versicherten bzw. Lieferungsempfänger. | 45 Stellen | Dr. von Muster |
| address | Falls communicationType = order und supplyOptionsType = delivery oder shipment: jaAnsonsten: nein | Strasse und Hausnummer des Versicherten bzw. Lieferungsempfänger | 3-100 Stellen | Bundesallee 312 |
| postcode | Falls communicationType = order und supplyOptionsType = delivery oder shipment: jaAnsonsten: nein | PLZ des Versicherten bzw. Lieferungsempfänger | 3-10 Stellen | 12345 |
| city | Falls communicationType = order und supplyOptionsType = delivery oder shipment: jaAnsonsten: nein | Ort des Versicherten bzw. Lieferungsempfänger | 2-100 Stellen | Berlin |
| country | Falls communicationType = order und supplyOptionsType = delivery oder shipment: jaAnsonsten: nein | Land des Versicherten bzw. Lieferungsempfänger | ISO 3166-1 Alpha-2 Code | DE |
| hint | Falls communicationType = text: verbotenAnsonsten: nein | Lieferanweisung, die der Nutzer mit angeben kann. | 0-100 Stellen | Bitte im Morsecode klingeln: -.-. |
| text | Falls communicationType = text: jaAnsonsten: nein | Zusätzliche Anmerkungen des Nutzers zur Bestellung. | 0-800 Stellen, keine URL |  |
| phone | Falls communicationType = order: jaAnsonsten: nein | Telefonnummer. E-164 Format, jedoch anstelle des „+" mit „00" / rein nummerisch. | 32 Stellen | 004916094858168 |
| email | nein | E-Mail-Adresse des Nutzers. Format mit @ und Punkt. | 0-70 Stellen, RFC-5322-konforme E-Mail-Adresse | max@musterfrau.de |
| transactionID | ja | Dient dazu, Nachrichten einer Transaktion zuordnen zu können. | 36 Stellen, UUID | 8196b610-9b77-47ab-936e-362cd92ef2aa |

**Tabelle: **E-Rezept einer Apotheke zuweisen

