Diese Seite beschreibt die Subscription-Schnittstelle des TI-Flow-Fachdienstes. Das konzeptuelle Pattern des Subscription-Mechanismus ist auf der Seite [Technische Umsetzung - Subscription](./menu-technische-umsetzung-subscription.html) beschrieben.

Die Subscription-Schnittstelle besteht aus zwei Endpunkten:

| Endpunkt | HTTP-Methode | Absicherung | Zweck |
|---|---|---|---|
| `/Subscription` | POST | ZETA | Subscription registrieren, Bearer-Token erhalten |
| `/subscription` | GET (WebSocket Upgrade) | TLS + FD Bearer-Token | WebSocket-Verbindung aufbauen |

### Anforderungen

- [FD-Anforderungen zur Subscription-Query](./query-api-subscription-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [AVS-Anforderungen zur Subscription-Query](./query-api-subscription-req-avs.html): Anforderungen an AVS zur Nutzung der Schnittstelle.
- [KTR-Anforderungen zur Subscription-Query](./query-api-subscription-req-ktr.html): Anforderungen an Clientsysteme der Kostenträger zur Nutzung der Schnittstelle.

### POST /Subscription – Subscription registrieren

Der Client sendet eine FHIR-Subscription-Ressource über die ZETA-gesicherte FHIR-API. Der TI-Flow-Fachdienst generiert ein Pseudonym der Telematik-ID als `Subscription.id` und stellt einen Bearer-Token für den Subscription-Endpunkt aus.

<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="Subscription"
  data-api-fhir-interaction="create">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-ti-flow-fachdienst-server.json %}
    </pre>
  </div>
<!--
  <div id="Request-Examples">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment Subscription/erp-notification-avs-01-request-PostSubscriptionPseudo JSON %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Subscription/erp-notification-avs-01-request-PostSubscriptionPseudo XML %}
    </div>
  </div>
-->
<!--
  <div id="Response-Examples">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment Subscription/erp-notification-avs-02-response-PostSubscriptionPseudo JSON %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Subscription/erp-notification-avs-02-response-PostSubscriptionPseudo XML %}
    </div>
  </div>
-->
</div>


### GET /subscription – WebSocket-Verbindung aufbauen

Nach der Registrierung baut der Client eine TLS-verschlüsselte WebSocket-Verbindung zum Subscription-Endpunkt auf. Dieser Request läuft **nicht** über ZETA, sondern direkt zum Subscription-Service.

**Request:**

```http
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

```http
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

*Hinweis:* Der Subscription-Service antwortet beim Schließen der Verbindung mit WebSocket-Status-Codes gemäß [RFC 6455, Section 7.4](https://datatracker.ietf.org/doc/html/rfc6455#section-7.4). Bei internen Fehlern liefert er HTTP-Status 502 Bad Gateway oder 504 Gateway Timeout.

*Hinweis:* Die Signaturschlüssel für Bearer-Tokens müssen nicht aus der Komponenten-PKI der TI abgeleitet werden. Es wird kein fester Wechsel-Turnus festgelegt; ein Schlüsselwechsel kann über betriebliche Prozesse initiiert werden. Der Schlüssel muss sicher gespeichert, jedoch nicht zwingend in einem HSM abgelegt werden.
