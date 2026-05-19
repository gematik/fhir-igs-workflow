Diese Seite beschreibt den Einstieg in die Subscription-Query-Schnittstelle.

### Nachricht

Die Nachricht zum Registrierungsanforderungen zur Benachrichtigungen über Communications wird als HTTP GET-Anfrage an den TI-Flow-Fachdienst gesendet.

Die Nachricht zur Interaktion mit Subscription als FHIR-Ressource _Subscription_ wird über die folgenden HTTP-Methoden ermöglicht:

|Akteur|HTTP-Methode|Ergebnis der Anfrage|
|---|---|---|
|Apotheke, Kostenträger|POST|Registrierung an der TI-Flow-Fachdienst Webschnittstelle|
|Apotheke, Kostenträger|GET|Websocket-Verbindung zum NotificationService|

### Anforderungen an Schnittstelle

- [FD-Anforderungen zur Subscription-Query](./query-api-subscription-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [AVS-Anforderungen zur Subscription-Query](./query-api-subscription-req-avs.html): Anforderungen an AVS zur Nutzung der Schnittstelle.
- [KTR-Anforderungen zur Subscription-Query](./query-api-subscription-req-ktr.html): Anforderungen an Clientsysteme der Kostenträger zur Nutzung der Schnittstelle.

### Resource API

Anfragen an die <i>Subscription</i>-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden. 

#### API Beschreibung

<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="Subscription"
  data-api-fhir-interaction="create">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-ti-flow-fachdienst-server.json %}
    </pre>
  </div>
  <div id="Request-Examples">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment Subscription/example-create-subscription-request JSON %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Subscription/example-create-subscription-request XML %}
    </div>
  </div>
  <div id="Response-Examples">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment Subscription/example-create-subscription-response JSON %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Subscription/example-create-subscription-response XML %}
    </div>
  </div>
</div>

#### Beispielhafter Ablauf

```http
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

```http
HTTP/1.1 101 Switching Protocols
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Accept: fA9dggdnMPU79lJgAE3W4TRnyDM=
```

Das Upgrade erfolgt mit einer "bind" Text-Nachricht über die Web Socket-Verbindung an den Server.

`bind: <subscription id>`

Der Subscription Service antwortet mit einer "bound" um die Einrichtung der Subscription zu bestätigen.

`bound: <subscription id>`

Wenn eine neue Nachricht für die Telematik-ID der Apotheke eingestellt wird, dann sendet der TI-Flow-Fachdienst eine Nachricht ping: &lt;subscription-id&gt;. Das AVS kann dann diese Nachricht mittels des Anwendungsfalls "Nachrichten von Versicherten empfangen" unter Nutzung des Requests GET /Communication?received=null&recipient=&lt;Telematik-ID&gt; abrufen.

Bei Nutzung des Subscription Services kann abweichend von der Anforderung "A_21556 - PS abgebende LEI: Häufigkeit des Abrufen von Nachrichten" die Operation GET /Communication häufiger als alle 5 Minuten, d.h. nach jeder Notification, mit den obigen Parametern angefragt werden.

Die Websocket-Verbindung kann bis zu 12 h bestehen. Danach muss das Clientsystem die Subscription neu registrieren.

#### Hinweise

- Das Signaturzertifikat muss nicht aus der Komponenten-PKI der TI abgeleitet werden.
- Es wird kein fester Turnus festgelegt, in dem der Schlüssel gewechselt wird. Ein Wechsel kann über betriebliche Prozesse initiiert werden.
- Der Schlüssel für die Signatur muss sicher gespeichert, jedoch nicht zwingend im HSM abgelegt werden.
- Jede eingestellte Nachricht führt zu einem Ping, ggfs. im Millisekundenbereich, wenn viele Nachrichten an einen Empfänger gerichtet werden. In Abhängigkeit von der Implementierung kann dieses Verhalten zu einer Überlastung des PS führen, wenn bspw. jedes einzelne Ping den Anwendungsfall „Nachrichten von Versicherten empfangen“ triggert.