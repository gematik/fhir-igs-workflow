Der Subscription Service wird außerhalb der VAU betrieben.

<!-- A_22368 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-163" title="TI-Flow-Fachdienst - Subscription Service - Webschnittstelle" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS eine Webschnittstelle anbieten, welche Websocket-Verbindungen mit einer Dauer von bis zu 12 h unterstützt.
</requirement>

<!-- A_22369 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-164" title="TI-Flow-Fachdienst - Subscription Service - Prüfung Bearer-Token" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS an der Webschnittstelle des Subscription Service beim Verbindungsaufbau prüfen, dass der Client einen zeitlich und kryptographisch gültigen Bearer-Token der Schnittstelle GET /Subscription übermittelt und bei nicht-erfolgreicher Prüfung die Verbindung mit dem Fehler 403 ablehnen.
</requirement>

<!-- A_22370 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-165" title="TI-Flow-Fachdienst - Subscription Service - Upgrade" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS an der Webschnittstelle des Subscription Service beim Verbindungsaufbau ein Upgrade durchführen.
</requirement>

<!-- A_22371 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-166" title="TI-Flow-Fachdienst - Subscription Service - abgelaufene Verbindungen schließen" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS an der Webschnittstelle des Subscription Service sicherstellen, dass Verbindungen nach Überschreiten des Timestamp Ablauf der Subscription geschlossen werden.
</requirement>

<!-- A_22378 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-167" title="TI-Flow-Fachdienst - Subscription Service - Verbot Profilbildung" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst DARF in der Verbindung zum Subscription Service anfallende Metadaten (Client-IP-Adresse, etc.) NICHT für eine unbefugte Profilbildung der verbundenen Clients verwenden.
</requirement>

Hinweis: Eine Verwendung zur Sicherung der Schnittstelle (DDoS-Schutz, Fehleranalyse in sehr eingeschränktem Maß) ist zulässig (im Sinne einer befugten Profilbildung).
