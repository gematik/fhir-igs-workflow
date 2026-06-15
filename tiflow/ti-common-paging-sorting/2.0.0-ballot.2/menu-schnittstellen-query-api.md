# Query API - TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* **Query API**

## Query API

Die folgenden Query APIs stellt der TI-Flow-Fachdienst den Clientsystemen zur Verfügung, um FHIR-Daten gezielt abrufen zu können.

Im Core-IG werden sowohl Endpunkte beschrieben, die in allen Modulen verwendet werden, wie auch Endpunkte die in mehreren IGs verwendet werden.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS die Suchparameter verarbeiten können, wie sie im CapabilityStatement festgelegt sind.
### Ressourcen in allen Modul IGs

* [Aufgabenverwaltung: Task](./query-api-task.md)
* [Protokollierung: AuditEvent](./query-api-auditevent.md)
* [Gerät: Device](./query-api-device.md)

#### Push-Notification APIs

* [Push: Pushers-API](./query-api-pushers.md)
* [Push: Channels-API](./query-api-channels.md)

### Ressourcen in mehreren Modul IGs

* [Einwilligung: Consent](./query-api-consent.md)
* [Nachrichten: Communication](./query-api-communication.md)
* [Nachrichten Benachrichtigung: Subscription](./query-api-subscription.md)
* [Dispensierinformationen: MedicationDispense](./query-api-medicationdispense.md)

