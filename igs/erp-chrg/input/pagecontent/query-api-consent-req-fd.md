Diese Seite beschreibt Anforderungen am TI-Flow-Fachdienst zur Nutzung der `Consent`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

{% include core.query-api-consent-req-fd.md %}

### Modulspezifische Anforderungen

#### DELETE /Consent (Einwilligung widerrufen)

<!-- A_22157 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-43" title="TI-Flow-Fachdienst – Consent löschen – Löschen der bestehenden Abrechnungsinformationen" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent mit ?category=CHARGCONS alle dem Versicherten zugeordneten ChargeItem-Ressourcen (ChargeItem.subject.identifier) anhand der KVNR des Versicherten im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren und löschen.
</requirement>

