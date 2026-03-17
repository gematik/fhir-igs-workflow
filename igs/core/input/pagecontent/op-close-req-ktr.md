Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an Clientsysteme für die Nutzung der Operation `$close`.

Die Erstellung der MedicationDispense erfolgt modulspezifisch.

<!-- A_19289-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-304" title="CS Kostenträger: Quittung abrufen - Statusrequest" version="0">
    <meta lockversion="false"/>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das Clientsystem Kostenträger MUSS im Anwendungsfall "Quittung abrufen" für zum Abschliessen des Workflows für die Verordnung die HTTP-Operation POST /Task/&#60;id&#62;/$close mit
    <ul> 
        <li>ACCESS_TOKEN im Authorization-Header</li>
        <li>Task-ID in URL &#60;id&#62;</li>
        <li>Geheimnis in URL-Parameter ?secret=</li>
        <li>MedicationDispense</li>
    </ul>
    ausführen.
</requirement>