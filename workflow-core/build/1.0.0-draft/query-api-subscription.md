# Query API: Subscription - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* **Query API: Subscription**

## Query API: Subscription

Diese Seite beschreibt den Einstieg in die Subscription-Query-Schnittstelle.

### Nachricht

Die Nachricht zum Registrierungsanforderungen zur Benachrichtigungen über Communications wird als HTTP GET-Anfrage an den E-Rezept-Fachdienst gesendet.

Die Nachricht zur Interaktion mit Subscription als FHIR-Ressource **Subscription** wird über die folgenden HTTP-Methoden ermöglicht:

| | | |
| :--- | :--- | :--- |
| Apotheke, Kostenträger | POST | Registrierung an der E-Rezept-Fachdienst Webschnittstelle |
| Apotheke, Kostenträger | GET | Websocket-Verbindung zum NotificationService |

### Anforderungen an Schnittstelle

* [FD-Anforderungen zur Subscription-Query](./query-api-subscription-req-fd.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [Client-Anforderungen zur Subscription-Query](./query-api-subscription-req-avs.md): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### Resource API

Anfragen an die *Subscription*-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden.

#### API Beschreibung

* [API-ERP: Benachrichtigungen für Apotheken](https://github.com/gematik/api-erp/blob/master/docs/erp_notification_avs.adoc)

#### Beispielhafter Ablauf

```
GET https://subscription.zentral.erp.splitdns.ti-dienste.de/subscription
Authorization: Bearer secret-token-abc-123
Connection: Upgrade
Pragma: no-cache
Cache-Control: no-cache
Upgrade: websocket
Sec-WebSocket-Version: 13
Sec-WebSocket-Key: q4xkcO32u266gldTuKaSOw==

```

Der Subscription Service antwortet mit dem Upgrade

```
HTTP/1.1 101 Switching Protocols
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Accept: fA9dggdnMPU79lJgAE3W4TRnyDM=

```

Das Upgrade erfolgt mit einer “bind” Text-Nachricht über die Web Socket-Verbindung an den Server.

`bind: <subscription id>`

Der Subscription Service antwortet mit einer “bound” um die Einrichtung der Subscription zu bestätigen.

`bound: <subscription id>`

Wenn eine neue Nachricht für die Telematik-ID der Apotheke eingestellt wird, dann sendet der E-Rezept-Fachdienst eine Nachricht ping: . Das AVS kann dann diese Nachricht mittels des Anwendungsfalls "Nachrichten von Versicherten empfangen" unter Nutzung des Requests GET /Communication?received=null&recipient= abrufen.

Bei Nutzung des Subscription Services kann abweichend von der Anforderung “A_21556 - PS abgebende LEI: Häufigkeit des Abrufen von Nachrichten” die Operation GET /Communication häufiger als alle 5 Minuten, d.h. nach jeder Notification, mit den obigen Parametern angefragt werden.

Die Websocket-Verbindung kann bis zu 12 h bestehen. Danach muss das AVS die Subscription neu registrieren.

#### Hinweis

* Das Signaturzertifikat muss nicht aus der Komponenten-PKI der TI abgeleitet werden.
* Es wird kein fester Turnus festgelegt, in dem der Schlüssel gewechselt wird. Ein Wechsel kann über betriebliche Prozesse initiiert werden.
* Der Schlüssel für die Signatur muss sicher gespeichert, jedoch nicht zwingend im HSM abgelegt werden.
* Jede eingestellte Nachricht führt zu einem Ping, ggfs. im Millisekundenbereich, wenn viele Nachrichten an einen Empfänger gerichtet werden. In Abhängigkeit von der Implementierung kann dieses Verhalten zu einer Überlastung des PS führen, wenn bspw. jedes einzelne Ping den Anwendungsfall „Nachrichten von Versicherten empfangen“ triggert.

