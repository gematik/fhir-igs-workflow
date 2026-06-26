Diese Seite enthält die normativen Anforderungen an das AVS zur Nutzung der Subscription-Schnittstelle. 

<!-- A_22426 -->
<requirement conformance="SHALL NOT" key="IG-TIFLOW-CORE-A305" title="PS abgebende LEI: Subscription für neue Communication - eine Subscription pro Telematik-ID" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend" description="E-Rezept-Schnittstelle eines abgebenden PS (Apotheke)">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
     Das PS der abgebenden LEI DARF NICHT mehr als eine Subscription pro Telematik-ID registrieren.
</requirement>

<!-- A_22373 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A307" title="PS abgebende LEI: Subscription für neue Communication - Subscription Ressource erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend" description="E-Rezept-Schnittstelle eines abgebenden PS (Apotheke)">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Das PS der abgebenden LEI MUSS im Anwendungsfall "Subscription für neue Communication" eine Subscription Ressource mit Telematik-ID in Element criteria Attribut receipient erstellen.
</requirement>

<!-- A_22374 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A308" title="PS abgebende LEI: Subscription für neue Communication - Subscription registrieren" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend" description="E-Rezept-Schnittstelle eines abgebenden PS (Apotheke)">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Das PS der abgebenden LEI MUSS im Anwendungsfall "Subscription für neue Communication" zum Registrieren im TI-Flow-Fachdienst die HTTP-Operation POST /v1/Subscription ausführen.
</requirement>

<!-- A_22375 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A309" title="PS abgebende LEI: Subscription für neue Communication - Subscription" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend" description="E-Rezept-Schnittstelle eines abgebenden PS (Apotheke)">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Das PS der abgebenden LEI MUSS im Anwendungsfall "Subscription für neue Communication" nach der Registrierung eine Web Socket Verbindung zum Subscription Service mit Authorization Header aufbauen und ein Upgrade durchführen.
</requirement>

<!-- A_22379 -->
<requirement conformance="MAY" key="IG-TIFLOW-CORE-A310" title="PS abgebende LEI: Subscription für neue Communication - Wartezeit" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend" description="E-Rezept-Schnittstelle eines abgebenden PS (Apotheke)">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Das PS der abgebenden LEI KANN eine beliebige Wartezeit bis zum Abruf der Nachrichten mit Anwendungsfall "Nachrichten von Versicherten empfangen" umsetzen, wenn in einem Zeitraum sehr viele ping-Benachrichtigungen empfangen werden.
</requirement>
