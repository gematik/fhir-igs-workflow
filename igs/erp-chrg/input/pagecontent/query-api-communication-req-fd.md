Diese Seite beschreibt Anforderungen am TI-Flow-Fachdienst zur Nutzung der `Communication`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

{% include core.query-api-communication-req-fd.md %}

### Modulspezifische Anforderungen

#### POST /Communication

<!--A_22734-01-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-96" title="TI-Flow-Fachdienst – Nachricht einstellen – Prüfung Existenz ChargeItem" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Einstellen einer Nachricht der Profile GEM_ERPCHRG_PR_Communication_ChargChangeReq oder GEM_ERPCHRG_PR_Communication_ChargChangeReply über die HTTP-Operation POST auf den Endpunkt /Communication mit dem folgenden Fehler:
    <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>400 - Bad Request</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>invalid</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>TIFLOW_CHARGEITEM_NOT_FOUND</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table> 
    abbrechen, wenn das Pflichtfeld Communication.basedOn einen ChargeItem referenziert, der nicht existiert, um Spam und nicht-rezeptbezogene Kommunikation zu verhindern.
</requirement>
