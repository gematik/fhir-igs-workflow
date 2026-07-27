# Additional API: Subscription - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**Additional API**](menu-schnittstellen-additional-api.md)
* **Additional API: Subscription**

## Additional API: Subscription

Diese Seite beschreibt die Subscription-Schnittstelle des TI-Flow-Fachdienstes. Das konzeptuelle Pattern des Subscription-Mechanismus ist auf der Seite [Technische Umsetzung - Subscription](./menu-technische-umsetzung-subscription.md) beschrieben.

Die Subscription-Schnittstelle besteht aus zwei Endpunkten:

| | | | |
| :--- | :--- | :--- | :--- |
| `/Subscription` | POST | ZETA | Subscription registrieren, Bearer-Token erhalten |
| `/subscription` | GET (WebSocket Upgrade) | TLS + FD Bearer-Token | WebSocket-Verbindung aufbauen |

### Anforderungen

* [FD-Anforderungen zur Subscription-Query](./query-api-subscription-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [AVS-Anforderungen zur Subscription-Query](./query-api-subscription-req-avs.md): Anforderungen an AVS zur Nutzung der Schnittstelle.
* [KTR-Anforderungen zur Subscription-Query](./query-api-subscription-req-ktr.md): Anforderungen an Clientsysteme der Kostenträger zur Nutzung der Schnittstelle.

### POST /Subscription – Subscription registrieren

Der Client sendet eine FHIR-Subscription-Ressource über die ZETA-gesicherte FHIR-API. Der TI-Flow-Fachdienst generiert ein Pseudonym der Telematik-ID als `Subscription.id` und stellt einen Bearer-Token für den Subscription-Endpunkt aus.

```
server
```

### GET /subscription – WebSocket-Verbindung aufbauen

Nach der Registrierung baut der Client eine TLS-verschlüsselte WebSocket-Verbindung zum Subscription-Endpunkt auf. Dieser Request läuft **nicht** über ZETA, sondern direkt zum Subscription-Service.

**Request:**

```
GET /subscription HTTP/1.1
Host: <subscription-endpunkt>
Authorization: Bearer <vom TI-Flow-FD ausgestellter Bearer-Token>
Connection: Upgrade
Pragma: no-cache
Cache-Control: no-cache
Upgrade: websocket
Sec-WebSocket-Version: 13
Sec-WebSocket-Key: <Base64-kodierte Nonce (16 Byte)>

```

**Response (erfolgreicher Upgrade):**

```
HTTP/1.1 101 Switching Protocols
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Accept: <Hash>

```

Nach dem Upgrade sendet der Client eine `bind`-Nachricht mit der `Subscription.id`:

```
bind: <Subscription.id>

```

Der Subscription-Service bestätigt mit:

```
bound: <Subscription.id>

```

Ab diesem Zeitpunkt sendet der Subscription-Service bei jeder neu vorliegenden Ressource:

```
ping: <Subscription.id>

```

Der Client ruft die Ressourcen daraufhin über die reguläre ZETA-gesicherte FHIR-Schnittstelle ab. Über die WebSocket-Verbindung selbst werden keine fachlichen Daten übertragen.

**Hinweis:** Der Subscription-Service antwortet beim Schließen der Verbindung mit WebSocket-Status-Codes gemäß [RFC 6455, Section 7.4](https://datatracker.ietf.org/doc/html/rfc6455#section-7.4). Bei internen Fehlern liefert er HTTP-Status 502 Bad Gateway oder 504 Gateway Timeout.

**Hinweis:** Die Signaturschlüssel für Bearer-Tokens müssen nicht aus der Komponenten-PKI der TI abgeleitet werden. Es wird kein fester Wechsel-Turnus festgelegt; ein Schlüsselwechsel kann über betriebliche Prozesse initiiert werden. Der Schlüssel muss sicher gespeichert, jedoch nicht zwingend in einem HSM abgelegt werden.

