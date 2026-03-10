# AVS-Anforderungen: Communication-Query - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Communication**](query-api-communication.md)
* **AVS-Anforderungen: Communication-Query**

## AVS-Anforderungen: Communication-Query

Diese Seite beschreibt Anforderungen an Clients zur Nutzung der `Communication`-Query-Endpunkte.

### Nachrichten abrufen

Das PS der abgebenden LEI MUSS im Anwendungsfall "Nachrichten von Versicherten empfangen" zwischen den Aufrufen der Operation GET /Communication mindestens 5 Minuten warten. Der Zeitraum zwischen den Aufrufen muss um eine zufällige Zeitspanne zwischen 0 und 10.000 Millisekunden verlängert werden, um eine Gleichverteilung der Anfragen am E-Rezept-Fachdienst über alle Apotheken zu erreichen.

Das PS der abgebenden LEI MUSS im Anwendungsfall "Nachrichten von Versicherten empfangen" die HTTP-Operation GET /Communication mit
* ACCESS_TOKEN im Authorization-Header
* optional: ?received=null für nur ungelesene Nachrichten
* optional: ?received=gtYYYY-MM-DD für Nachrichten nach Datum DD.MM.YYYY
ausführen.
Falls eine oder mehrere E-Rezept-Nachrichten für die abgebende LEI auf dem E-Rezept-Fachdienst bereitstehen, übermittelt der E-Rezept-Fachdienst ein Bundle von Communication Ressourcen. 

### Nachricht versenden

Die für die Nachricht zu verwendende Communication-Ressource wird modul- und anwendungsfall-spezifisch festgelegt.

Das PS der abgebenden LEI MUSS im Anwendungsfall "Nachricht an Versicherten versenden" die HTTP-Operation POST /Communication mit
* ACCESS_TOKEN im Authorization-Header
* Communication Ressource im HTTP-Request-Body
ausführen.

Das PS abgebende LEI MUSS für den Anwendungsfall "Nachricht durch Abgebenden übermitteln" Nachrichten mit der folgenden Datenstruktur in der contentString-Eigenschaft des GEM_ERP_PR_Communication_Reply unterstützen.

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

### Nachricht löschen

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

