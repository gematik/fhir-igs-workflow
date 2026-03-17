Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an das AVS für die Nutzung der Operation `$reject`.

Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, ein E-Rezept zum Zurückgeben auszuwählen.

Das PS der abgebenden LEI MUSS vom Nutzer eine Bestätigung einholen, dass das ausgewählte E-Rezept zurückgegeben werden soll und die Möglichkeit geben, das Zurückgeben abzubrechen.

<!-- A_19250 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-224" title="PS abgebende LEI: E-Rezept zurückgeben - Statusrequest" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezept durch Abgebenden zurückgeben" für das zurückzugebende E-Rezept die HTTP-Operation POST /Task/&lt;id&gt;/$reject mit 
  <ul>
    <li>ACCESS_TOKEN im Authorization-Header</li>
    <li>Task-ID in URL &lt;id&gt; </li>
    <li>Geheimnis in URL-Parameter ?secret=</li>
  </ul>
  ausführen.
</requirement>

<!-- A_19251 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-225" title="PS abgebende LEI: E-Rezept zurückgeben - E-Rezept löschen" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezept durch Abgebenden zurückgeben" für das zurückzugebende E-Rezept nach erfolgreichem Aufruf der Operation "Ein E-Rezept zurückweisen" die Daten zum E-Rezept, E-Rezept-Token und das Geheimnis im PS löschen.
</requirement>

<!-- A_19246 -->
<requirement conformance="SHALL" title="PS abgebende LEI: E-Rezepte zurückgeben - E-Rezept auswählen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, ein E-Rezept zum Zurückgeben auszuwählen.
</requirement>
<!-- A_19247 -->
<requirement conformance="SHALL" title="PS abgebende LEI: E-Rezept zurückgeben - Bestätigung">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS vom Nutzer eine Bestätigung einholen, dass das ausgewählte E-Rezept zurückgegeben werden soll und die Möglichkeit geben, das Zurückgeben abzubrechen.
</requirement>
<!-- A_19249 -->
<requirement conformance="SHALL" title="PS abgebende LEI: E-Rezept durch Abgebenden zurückgeben">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS den Anwendungsfall "UC 4.2 - E-Rezept durch Abgebenden zurückgeben" aus [gemSysL_eRp] gemäß TAB_ILFERP_008 umsetzen. Tabelle # : TAB_ILFERP_008 – E-Rezept durch Abgebenden zurückgeben Name E-Rezept durch Abgebenden zurückgeben Auslöser Aufruf des Anwendungsfalls in der GUI Akteur Leistungserbringer, Mitarbeiter der abgebenden LEI Vorbedingung Die LEI hat das E-Rezept vom E-Rezept-Fachdienst heruntergeladen und es befindet sich im Status "in Abgabe (gesperrt). Der Nutzer hat ein E-Rezept zum Zurückgeben markiert und das Zurückgeben bestätigt. Die LEI hat sich gegenüber der TI authentisiert. Nachbedingung Das ausgewählte E-Rezept hat auf dem E-Rezept-Fachdienst den Status "offen" Standardablauf Task-ID und Geheimnis des E-Rezepts bestimmen E-Rezept Status auf Fachdienst ändern E-Rezept und E-Rezept-Token in PS löschen
</requirement>
