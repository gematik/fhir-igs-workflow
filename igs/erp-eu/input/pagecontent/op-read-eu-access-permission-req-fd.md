### Anforderungen der Schnittstelle aus diesem Modul

<!-- A_27086 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-36" title="E-Rezept-Fachdienst - Zugriffsberechtigung lesen - Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /$read-eu-access-permission die Rolle professionOID des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am E-Rezept-Fachdienst aufrufen dürfen, damit die Information zur Einwilligung nicht durch Unberechtigte ausgelesen werden kann.
</requirement>

<!-- A_27087 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-37" title="E-Rezept-Fachdienst - Zugriffsberechtigung lesen - Response" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /$read-eu-access-permission die KVNR des Versicherten im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und im Response falls vorhanden eine Ressource des Profils [GEM_ERP_PR_PAR_EU_Access_Authorization_Response] mit zur KVNR gespeicherte zeitlich gültige Zugriffsberechtigung übermitteln.
</requirement>
