Diese Seite beschreibt Anforderungen am E-Rezept-Fachdienst zur Nutzung der `Communication`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

{% include core.query-api-communication-req-fd.md %}

### Modulspezifische Anforderungen


<!--A_22734-01-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-161" title="E-Rezept-Fachdienst – Nachricht einstellen – Prüfung Existenz ChargeItem" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht der Profile GEM_ERPCHRG_PR_Communication_ChargChangeReq oder GEM_ERPCHRG_PR_Communication_ChargChangeReply über die HTTP-Operation POST auf den Endpunkt /Communication mit dem http-Status-Code 400 abbrechen, wenn das Pflichtfeld Communication.basedOn einen ChargeItem referenziert, der nicht existiert, um Spam und nicht-rezeptbezogene Kommunikation zu verhindern.
</requirement>

<!--A_22367-02-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-162" title="E-Rezept-Fachdienst – Nachricht einstellen – Notification Apotheke" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht der Profile GEM_ERP_PR_Communication_DispReq, GEM_ERP_PR_Communication_InfoReq oder GEM_ERPCHRG_PR_Communication_ChargChangeReq zur Versicherten-zu-Apotheken-Kommunikation über die HTTP-Operation POST auf den Endpunkt /Communication prüfen, ob für die Telematik-ID des Empfängers Subscriptions registriert sind und für Registrierungen über den Subscription Service eine Notification (ping : subscription-id) senden.
</requirement>