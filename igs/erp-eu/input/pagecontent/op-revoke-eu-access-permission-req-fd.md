### Anforderungen der Schnittstelle aus diesem Modul

<!-- A_27084 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-54" title="TI-Flow-Fachdienst - Zugriffsberechtigung löschen - Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf den Endpunkt /$revoke-eu-access-permission die Rolle professionOID des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am TI-Flow-Fachdienst aufrufen dürfen, damit die Information zur Zugriffsberechtigung nicht durch Unberechtigte gelöscht werden kann.
</requirement>

<!-- A_27085 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-55" title="TI-Flow-Fachdienst - Zugriffsberechtigung löschen - Löschen" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf den Endpunkt /$revoke-eu-access-permission die KVNR des Versicherten im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und, falls vorhanden, zu dieser KVNR gespeicherte Zugriffsberechtigungen löschen.
</requirement>
