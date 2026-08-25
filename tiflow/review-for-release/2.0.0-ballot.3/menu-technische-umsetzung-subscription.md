# Technische Umsetzung - Notifications für Clientsysteme - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.3

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* **Technische Umsetzung - Notifications für Clientsysteme**

## Technische Umsetzung - Notifications für Clientsysteme

Die Umsetzung der Subscription-Schnittstelle des TI-Flow-Fachdienstes folgt den Vorgaben des [FHIR-Standards](https://www.hl7.org/fhir/subscription.html#2.46.7.2).

Ein Client registriert zunächst eine Subscription über die ZETA-gesicherte FHIR-API des TI-Flow-Fachdienstes. Der TI-Flow-Fachdienst stellt dabei einen kurzlebigen Bearer-Token aus, mit dem der Client anschließend eine WebSocket-Verbindung zum Subscription-Endpunkt aufbaut. Über diese Verbindung erhält der Client je neu vorliegender Ressource ein `ping` als Trigger für den Abruf der Daten über die reguläre FHIR-Schnittstelle. Über die WebSocket-Verbindung selbst werden keine fachlichen Daten übertragen.

Der Subscription-Service ist eine eigenständige Cloud-Komponente des TI-Flow-Fachdienstes, die **nicht** über ZETA abgesichert ist: Der WebSocket-Upgrade-Request wird direkt TLS-verschlüsselt an den Subscription-Endpunkt übertragen und durch den vom TI-Flow-Fachdienst ausgestellten Bearer-Token authentisiert. Damit entfällt die Notwendigkeit, WebSocket-Verbindungen durch die ZETA-Infrastruktur zu führen.

### Ablauf zum Verbindungsaufbau

Der Aufbau der WebSocket-Verbindung erfolgt in drei Schritten:

1. **Subscription registrieren**– ZETA-gesicherter POST /Subscription an den TI-Flow-Fachdienst; dieser stellt einen Bearer-Token für den Subscription-Endpunkt aus
1. **WebSocket-Verbindung aufbauen**– TLS-verschlüsselter Upgrade-Request an den Subscription-Endpunkt mit dem FD-ausgestellten Bearer-Token
1. **Subscription binden**– Übermittlung der`Subscription.id`über die offene Verbindung; ab dann empfängt der Client bei jeder neu vorliegenden Ressource ein`ping`als Trigger für den Abruf über die FHIR-Schnittstelle

Request/Response-Beispiele und das vollständige Protokoll (bind/bound/ping) sind unter [Subscription-Schnittstelle](./query-api-subscription.md) beschrieben.

### Wichtige Hinweise zur Implementierung

funkt. Eignung: Herstellererklärung

funkt. Eignung: HerstellererklärungDas Clientsystem des TI-Flow-Fachdienst MUSS bei der Verarbeitung eingehender Ressourcen berücksichtigen, dass jede Ressource zu einem `ping` führen kann, potentiell im Millisekundenbereich und eine Strategie implementieren, um eine Überlastung zu vermeiden (z.B. durch kurze Wartezeiten vor Abrufen), wobei zwischenzeitlich eingegangene Ressourcen bei nachfolgenden Abrufen gesammelt abgerufen werden können.

funkt. Eignung: Herstellererklärung

funkt. Eignung: HerstellererklärungDas Clientsystem des TI-Flow-Fachdienst MUSS im Fall, dass die WebSocket-Verbindung zu einem Subscription-Endpunkt unerwartet terminiert wird, vor dem Aufbau einer neuen WebSocket-Verbindung eine zufällig gewählte Wartezeit zwischen 5 und 60 Sekunden warten, bis eine neue Verbindung aufgebaut wird.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS pro Telematik-ID nur eine aktive WebSocket-Verbindung gleichzeitig zulassen.

funkt. Eignung: HerstellererklärungDer TI-Flow-Fachdienst MUSS WebSocket-Verbindungen zu Subscription-Endpunkten nach spätestens 12 Stunden automatisch schließen.

funkt. Eignung: HerstellererklärungDer TI-Flow-Fachdienst DARF anfallende Verbindungsmetadaten ausschließlich zur Sicherung der Schnittstelle (DDoS-Schutz, Fehleranalyse im sehr eingeschränkten Maß) verwenden.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst DARF NICHT Verbindungsmetadaten speichern, um eine Profilbildung der verbundenen Clients durchzuführen.

