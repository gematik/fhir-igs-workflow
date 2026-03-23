Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an Clientsysteme für die Nutzung der Operation `$activate`.


<!-- A_19558-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-406" title="CS Kostenträger:  E-Rezept abrufen - Task herunterladen" version="0">
    <meta lockversion="false"/>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das Clientsystem Kostenträger MUSS im Anwendungsfall "Verordnung abrufen" zum Herunterladen des E-Rezepts die HTTP-Operation POST /Task/&#60;id&#62;/$accept mit
    <ul> 
        <li>ACCESS_TOKEN im Authorization-Header</li>
        <li>Task-ID in URL &#60;id&#62;</li>
        <li>AccessCode im X-AccessCode-Header oder als URL-Parameter ?ac=</li>
    </ul>
    ausführen.
</requirement>