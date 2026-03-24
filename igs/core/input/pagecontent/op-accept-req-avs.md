Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an das AVS für die Nutzung der Operation `$accept`.


<!-- A_19558-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-256" title="PS abgebende LEI: E-Rezept abrufen - Task herunterladen" version="0">
    <meta lockversion="true"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezept abrufen" zum Herunterladen des E-Rezepts die HTTP-Operation POST /Task/&#60;id&#62;/$accept mit
    <ul> 
        <li>ACCESS_TOKEN im Authorization-Header</li>
        <li>Task-ID in URL &#60;id&#62;</li>
        <li>AccessCode im X-AccessCode-Header oder als URL-Parameter ?ac=</li>
    </ul>
    ausführen.
</requirement>