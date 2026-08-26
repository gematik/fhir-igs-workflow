Diese Seite beschreibt Anforderungen an das TI-Flow-FdV zur Nutzung der `Pushers`-Query-Endpunkte.

Die Funktionalität zu Push Notification für FdVs ist anwendungsübergreifend in [gemF_PushNotification] beschrieben. In diesem Kapitel werden die zusätzlichen E-Rezept spezifischen Anforderungen beschrieben.

<!-- A_28122 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A374" title="TI-Flow-FdV: Push Notifications - Instanz registrieren - OpenAPI" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FdV" description="TI-Flow-Frontend des Versicherten">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Das TI-Flow-FdV MUSS, wenn es den Anwendungsfall "Push Notifications" umsetzt, für die Registrierung und Verwaltung der FdV-Instanzen am TI-Flow-Fachdienst die Operationen gemäß [OpenAPI_PUSH_FD] verwenden.
</requirement>
