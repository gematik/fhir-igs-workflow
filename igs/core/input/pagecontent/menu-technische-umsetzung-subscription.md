Die Umsetzung der Subscription-Schnittstelle des TI-Flow-Fachdienstes folgt den Vorgaben des [FHIR-Standards](https://www.hl7.org/fhir/subscription.html#2.46.7.2).

Ein Client registriert zunächst eine Subscription über die ZETA-gesicherte FHIR-API des TI-Flow-Fachdienstes. Der TI-Flow-Fachdienst stellt dabei einen kurzlebigen Bearer-Token aus, mit dem der Client anschließend eine WebSocket-Verbindung zum Subscription-Endpunkt aufbaut. Über diese Verbindung erhält der Client je neu vorliegender Ressource ein `ping` als Trigger für den Abruf der Daten über die reguläre FHIR-Schnittstelle. Über die WebSocket-Verbindung selbst werden keine fachlichen Daten übertragen.

Der Subscription-Service ist eine eigenständige Cloud-Komponente des TI-Flow-Fachdienstes, die **nicht** über ZETA abgesichert ist: Der WebSocket-Upgrade-Request wird direkt TLS-verschlüsselt an den Subscription-Endpunkt übertragen und durch den vom TI-Flow-Fachdienst ausgestellten Bearer-Token authentisiert. Damit entfällt die Notwendigkeit, WebSocket-Verbindungen durch die ZETA-Infrastruktur zu führen.

### Ablauf zum Verbindungsaufbau

Der Aufbau der WebSocket-Verbindung erfolgt in drei Schritten:

1. **Subscription registrieren** – ZETA-gesicherter POST /Subscription an den TI-Flow-Fachdienst; dieser stellt einen Bearer-Token für den Subscription-Endpunkt aus
2. **WebSocket-Verbindung aufbauen** – TLS-verschlüsselter Upgrade-Request an den Subscription-Endpunkt mit dem FD-ausgestellten Bearer-Token
3. **Subscription binden** – Übermittlung der `Subscription.id` über die offene Verbindung; ab dann empfängt der Client bei jeder neu vorliegenden Ressource ein `ping` als Trigger für den Abruf über die FHIR-Schnittstelle

Request/Response-Beispiele und das vollständige Protokoll (bind/bound/ping) sind unter [Subscription-Schnittstelle](./query-api-subscription.html) beschrieben.

### Wichtige Hinweise zur Implementierung

<!-- TI-Flow-26_2 BSI_23 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A461" title="CS: Subscription - Handling häufiger Ping-Events" version="0">
    <meta lockversion="false"/>
    <actor name="PS_TI-Flow_Apotheke" description="PS-Schnittstelle für TI-Flow/Apotheke">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="CS_TI-Flow_KTR" description="CS-Schnittstelle für TI-Flow/Kostenträger">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Das Clientsystem des TI-Flow-Fachdienst MUSS bei der Verarbeitung eingehender Ressourcen berücksichtigen, dass jede Ressource zu einem `ping` führen kann, potentiell im Millisekundenbereich und eine Strategie implementieren, um eine Überlastung zu vermeiden (z.B. durch kurze Wartezeiten vor Abrufen), wobei zwischenzeitlich eingegangene Ressourcen bei nachfolgenden Abrufen gesammelt abgerufen werden können.
</requirement>

<!-- TI-Flow-26_2 BSI_23 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A462" title="CS: Subscription - Wiederverbindung nach WebSocket-Fehler" version="0">
    <meta lockversion="false"/>
    <actor name="PS_TI-Flow_Apotheke" description="PS-Schnittstelle für TI-Flow/Apotheke">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="CS_TI-Flow_KTR" description="CS-Schnittstelle für TI-Flow/Kostenträger">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Das Clientsystem des TI-Flow-Fachdienst MUSS im Fall, dass die WebSocket-Verbindung zu einem Subscription-Endpunkt unerwartet terminiert wird, vor dem Aufbau einer neuen WebSocket-Verbindung eine zufällig gewählte Wartezeit zwischen 5 und 60 Sekunden warten, bis eine neue Verbindung aufgebaut wird.
</requirement>

<!-- TI-Flow-26_2 BSI_23 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A463" title="CS: Subscription - Eine WebSocket-Verbindung pro Telematik-ID" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Der TI-Flow-Fachdienst MUSS pro Telematik-ID nur eine aktive WebSocket-Verbindung gleichzeitig zulassen.
</requirement>

<!-- TI-Flow-26_2 BSI_23 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A464" title="CS: Subscription - Automatisches Schließen nach 12 Stunden" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Der TI-Flow-Fachdienst MUSS WebSocket-Verbindungen zu Subscription-Endpunkten nach spätestens 12 Stunden automatisch schließen.
</requirement>

<!-- TI-Flow-26_2 BSI_23 -->
<requirement conformance="MAY" key="IG-TIFLOW-CORE-A465" title="CS: Subscription - Zulässige Verwendung von Verbindungsmetadaten" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Der TI-Flow-Fachdienst DARF anfallende Verbindungsmetadaten ausschließlich zur Sicherung der Schnittstelle (DDoS-Schutz, Fehleranalyse im sehr eingeschränkten Maß) verwenden.
</requirement>

<requirement conformance="SHALL NOT" key="IG-TIFLOW-CORE-A466" title="CS: Subscription - Verbot von Profilbildung" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
    </actor>
    Der TI-Flow-Fachdienst DARF NICHT Verbindungsmetadaten speichern, um eine Profilbildung der verbundenen Clients durchzuführen.
</requirement>
