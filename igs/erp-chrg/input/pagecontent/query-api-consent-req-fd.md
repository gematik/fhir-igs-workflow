Diese Seite beschreibt Anforderungen am TI-Flow-Fachdienst zur Nutzung der `Consent`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/{{ site.data.constants.tiflow_core_version }}/menu-schnittstellen-query-api.html)


### Modulspezifische Anforderungen

#### DELETE /Consent (Einwilligung widerrufen)

<!-- A_22157 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-A43" title="TI-Flow-Fachdienst - Consent löschen - Löschen der bestehenden Abrechnungsinformationen" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent mit ?category=CHARGCONS alle dem Versicherten zugeordneten ChargeItem-Ressourcen (ChargeItem.subject.identifier) anhand des zeta-user-info.identifier des Nutzers (KVNR) identifizieren und löschen.
</requirement>

