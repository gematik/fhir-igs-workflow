### Anforderungen der Schnittstelle aus der Core-Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/{{ site.data.constants.tiflow_core_version }}/menu-schnittstellen-query-api.html)

### Anforderungen der Schnittstelle aus diesem Modul

#### DELETE

<!-- A_27131 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A256" title="TI-Flow-Fachdienst - Consent löschen - EUDISPCONS - Löschen Zugriffsberechtigung" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt `/Consent` mit `?category=EUDISPCONS` alle dem Versicherten zugeordneten Zugriffsberechtigungen anhand des zeta-user-info.identifier des Nutzers (KVNR) identifizieren und löschen.
</requirement>
