Diese Seite beschreibt Anforderungen an Clients zur Nutzung der `Subscription`-Query-Endpunkte.

Um die Last am E-Rezept-Fachdienst zu kontrollieren, wurde festgelegt, dass ein AVS nicht öfter als alle 5 min nach neuen Nachrichten anfragen darf (A_21556). Die dadurch bis zu 5 min entstehende Verzögerung verlängert die Zeit, bis eine Apotheke auf die Nachricht des Versicherten reagieren kann. Aus dem Grund wird eine Funktionalität eingeführt, mit der AVS eine Notification erhalten, dass eine neue Nachricht für eine Telematik-ID vorliegt. Nach Erhalt einer Notification darf das AVS die neue Nachricht sofort abrufen.

<!-- ToDo: um KTR erweitern -->

<!-- A_22426 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-243" title="PS abgebende LEI: Subscription für neue Communication - eine Subscription pro Telematik-ID" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI DARF NICHT mehr als eine Subscription pro Telematik-ID registrieren.
</requirement>

<!-- A_22372 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-244" title="PS abgebende LEI: Subscription für neue Communication" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI MUSS den Anwendungsfall "Subscription für neue Communication" gemäß TAB_ILFERP_017 umsetzen. Tabelle # : TAB_ILFERP_017 – Subscription für neue Communication Name Subscription für neue Communication Auslöser Periodischer Aufruf, wenn keine Websocket-Verbindung für die Notification besteht Akteur AVS Vorbedingung Die LEI hat sich gegenüber der TI authentisiert. Nachbedingung Es besteht eine Websocket-Verbindung zum Empfang der Notification Standardablauf Subscription Ressource erstellen Subscription registrieren Websocket-Verbindung zu Subscription Service aufbauen Listening
</requirement>

<!-- A_22373 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-245" title="PS abgebende LEI: Subscription für neue Communication - Subscription Ressource erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI MUSS im Anwendungsfall "Subscription für neue Communication" eine Subscription Ressource mit Telematik-ID in Element criteria Attribut receipient erstellen.
</requirement>

<!-- A_22374 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-246" title="PS abgebende LEI: Subscription für neue Communication - Subscription registrieren" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI MUSS im Anwendungsfall "Subscription für neue Communication" zum Registrieren im E-Rezept-Fachdienst die HTTP-Operation POST /v1/Subscription mit ACCESS_TOKEN im Authorization-Header ausführen.
</requirement>

<!-- A_22375 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-247" title="PS abgebende LEI: Subscription für neue Communication - Subscription" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI MUSS im Anwendungsfall "Subscription für neue Communication" nach der Registrierung eine Web Socket Verbindung zum Subscription Service mit Authorization Header aufbauen und ein Upgrade durchführen.
</requirement>

<!-- A_22379 -->
<requirement conformance="MAY" key="IG-TIFLOW-CORE-248" title="PS abgebende LEI: Subscription für neue Communication - Wartezeit" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der Primärsystem der abgebenden LEI KANN eine beliebige Wartezeit bis zum Abruf der Nachrichten mit Anwendungsfall „Nachrichten von Versicherten empfangen“ umsetzen, wenn in einem Zeitraum sehr viele ping-Benachrichtigungen empfangen werden.
</requirement>
