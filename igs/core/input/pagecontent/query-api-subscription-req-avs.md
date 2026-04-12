Diese Seite beschreibt Anforderungen an Clients zur Nutzung der `Subscription`-Query-Endpunkte.

Um die Last am TI-Flow-Fachdienst zu kontrollieren, wurde festgelegt, dass ein AVS nicht öfter als alle 5 min nach neuen Nachrichten anfragen darf (A_21556). Die dadurch bis zu 5 min entstehende Verzögerung verlängert die Zeit, bis eine Apotheke auf die Nachricht des Versicherten reagieren kann. Aus dem Grund wird eine Funktionalität eingeführt, mit der AVS eine Notification erhalten, dass eine neue Nachricht für eine Telematik-ID vorliegt. Nach Erhalt einer Notification darf das AVS die neue Nachricht sofort abrufen.

<!-- A_22426 -->
<requirement conformance="SHALL NOT" key="IG-TIFLOW-CORE-305" title="PS abgebende LEI: Subscription für neue Communication - eine Subscription pro Telematik-ID" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI DARF NICHT mehr als eine Subscription pro Telematik-ID registrieren.
</requirement>

<!-- A_22373 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-307" title="PS abgebende LEI: Subscription für neue Communication - Subscription Ressource erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das PS der abgebenden LEI MUSS im Anwendungsfall "Subscription für neue Communication" eine Subscription Ressource mit Telematik-ID in Element criteria Attribut receipient erstellen.
</requirement>

<!-- A_22374 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-308" title="PS abgebende LEI: Subscription für neue Communication - Subscription registrieren" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das PS der abgebenden LEI MUSS im Anwendungsfall "Subscription für neue Communication" zum Registrieren im TI-Flow-Fachdienst die HTTP-Operation POST /v1/Subscription mit ACCESS_TOKEN im Authorization-Header ausführen.
</requirement>

<!-- A_22375 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-309" title="PS abgebende LEI: Subscription für neue Communication - Subscription" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das PS der abgebenden LEI MUSS im Anwendungsfall "Subscription für neue Communication" nach der Registrierung eine Web Socket Verbindung zum Subscription Service mit Authorization Header aufbauen und ein Upgrade durchführen.
</requirement>

Beispiel:
GET https://subscription.zentral.erp.splitdns.ti-dienste.de/subscription
Authorization: Bearer secret-token-abc-123
Connection: Upgrade
Pragma: no-cache
Cache-Control: no-cache
Upgrade: websocket
Sec-WebSocket-Version: 13
Sec-WebSocket-Key: q4xkcO32u266gldTuKaSOw==

Der Subscription Service antwortet mit dem Upgrade
HTTP/1.1 101 Switching Protocols
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Accept: fA9dggdnMPU79lJgAE3W4TRnyDM=

Das Upgrade erfolgt mit einer "bind" Text-Nachricht über die Web Socket-Verbindung an den Server.
bind: &lt;subscription id&gt;

Der Subscription Service antwortet mit einer "bound" um die Einrichtung der Subscription zu bestätigen.
bound: &lt;subscription id&gt;

Wenn eine neue Nachricht für die Telematik-ID des Clients eingestellt wird, dann sendet der TI-Flow-Fachdienst eine Nachricht ping: &lt;subscription-id&gt;. Das Clientsystem kann dann diese Nachricht mittels des Anwendungsfalls "Nachrichten von Versicherten empfangen" unter Nutzung des Requests 
GET /Communication?received=null&recipient=&lt;Telematik-ID&gt; 
abrufen.

Bei Nutzung des Subscription Services kann abweichend von der Anforderung "A_21556 - PS abgebende LEI: Häufigkeit des Abrufen von Nachrichten" die Operation GET /Communication häufiger als alle 5 Minuten, d.h. nach jeder Notification, mit den obigen Parametern angefragt werden.

<!-- A_22379 -->
<requirement conformance="MAY" key="IG-TIFLOW-CORE-310" title="PS abgebende LEI: Subscription für neue Communication - Wartezeit" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das PS der abgebenden LEI KANN eine beliebige Wartezeit bis zum Abruf der Nachrichten mit Anwendungsfall „Nachrichten von Versicherten empfangen“ umsetzen, wenn in einem Zeitraum sehr viele ping-Benachrichtigungen empfangen werden.
</requirement>

Hinweis: Jede eingestellte Nachricht führt zu einem Ping, ggfs. im Millisekundenbereich, wenn viele Nachrichten an einen Empfänger gerichtet werden. In Abhängigkeit von der Implementierung kann dieses Verhalten zu einer Überlastung des Clientsystems führen, wenn bspw. jedes einzelne Ping den Anwendungsfall „Nachrichten von Versicherten empfangen“ triggert.
