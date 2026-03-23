Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `Pushers`-Query-Endpunkte.

Die Funktionalität zu Push Notification für FdVs ist anwendungsübergreifend in [gemF_PushNotification] beschrieben. In diesem Kapitel werden die zusätzlichen E-Rezept spezifischen Anforderungen beschrieben.

<!-- A_28122 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-CORE-374" title="E-Rezept-FdV: Push Notifications - Instanz registrieren - OpenAPI" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS, wenn es den Anwendungsfall "Push Notifications" umsetzt, für die Registrierung und Verwaltung der FdV-Instanzen am E-Rezept-Fachdienst die Operationen gemäß [OpenAPI_FD] verwenden.
</requirement>
