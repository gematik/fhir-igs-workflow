### Anforderungen der Schnittstelle aus der Core-Spezifikation

//TODO: Include Core AFOs

### Anforderungen der Schnittstelle aus diesem Modul

#### DELETE

<!-- A_27131 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-29" title="E-Rezept-Fachdienst - Consent löschen - EUDISPCONS - Löschen Zugriffsberechtigung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt `/Consent` mit `?category=EUDISPCONS` alle dem Versicherten zugeordneten Zugriffsberechtigungen anhand der KVNR des Versicherten im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren und löschen.
</requirement>
