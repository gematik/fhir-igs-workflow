Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an das AVS für die Nutzung der Operation `$accept`.


<!-- A_19558-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-226" title="PS abgebende LEI:  E-Rezept abrufen - Task herunterladen" version="0">
    <meta lockversion="false"/>
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

<!-- A_21372 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-420" title="PS abgebende LEI: Übernahme Rezeptinformationen in Warenwirtschaftssystem" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS bei der Übernahme von E-Rezept-Informationen in ein Warenwirtschaftssystem die Integrität und Vertraulichkeit der personenbezogenen und medizinischen Daten sicherstellen und zusätzlich sicherstellen, dass der Umfang der übertragenen Daten nur auf das unmittelbare für die Einlösung erforderliche Maß beschränkt (Datenminimierung) ist und keine Verwendung der Daten über die unmittelbare Rezepteinlösung hinaus erfolgt (Zweckbindung).
</requirement>
