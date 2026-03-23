Diese Seite beschreibt Anforderungen am E-Rezept-Fachdienst zur Nutzung der `Communication`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

{% include core.query-api-communication-req-fd.md %}

### Modulspezifische Anforderungen

#### POST /Communication

<!--A_22734-01-->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-CHRG-96" title="E-Rezept-Fachdienst – Nachricht einstellen – Prüfung Existenz ChargeItem" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht der Profile GEM_ERPCHRG_PR_Communication_ChargChangeReq oder GEM_ERPCHRG_PR_Communication_ChargChangeReply über die HTTP-Operation POST auf den Endpunkt /Communication mit dem http-Status-Code 400 abbrechen, wenn das Pflichtfeld Communication.basedOn einen ChargeItem referenziert, der nicht existiert, um Spam und nicht-rezeptbezogene Kommunikation zu verhindern.
</requirement>
