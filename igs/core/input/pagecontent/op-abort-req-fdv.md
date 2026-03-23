Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an das E-Rezept-FdV für die Nutzung der Operation `$abort`.

<!-- A_26082 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-CORE-44" title="E-Rezept-FdV: E-Rezept löschen - Hinweis zu Daten in ePA" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
     Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept löschen" dem Nutzer einen Hinweis geben, wie sich das Löschen auf die Informationen zum E-Rezept in der elektronischen Patientenakte auswirkt.
</requirement>

<!-- A_19219-01 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-CORE-45" title="E-Rezept-FdV: E-Rezept löschen - E-Rezept zum Löschen auswählen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
     Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept löschen" es dem Nutzer ermöglichen, ein E-Rezept zum Löschen auszuwählen.
</requirement>

<!-- A_24023-03 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-CORE-46" title="E-Rezept-FdV:  E-Rezepte löschen - Coverage PKV - Warnung Abgabeinformationen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
     Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept löschen", falls das E-Rezept-FdV die Funktionalität für Abrechnungsinformationen unterstützt, wenn der Nutzer ein E-Rezept mit Kostenträgertyp (Coverage.type.coding.code) "PKV" zum Löschen ausgewählt hat und für das E-Rezept noch keine Abrechnungsinformationen bereitgestellt wurden, eine Warnung anzeigen, dass ein Bereitstellen der Abrechnungsinformationen zum E-Rezept nach dem Löschen des E-Rezepts nicht mehr möglich ist.
</requirement>

<!-- A_19220-01 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-CORE-47" title="E-Rezept-FdV: E-Rezept löschen - Bestätigung" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
     Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept löschen" vom Nutzer eine Bestätigung einholen, dass das ausgewählte E-Rezept gelöscht werden soll und die Möglichkeit geben, das Löschen abzubrechen.
</requirement>

<!-- A_19221-02 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-CORE-48" title="E-Rezept-FdV: E-Rezept löschen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
     Das E-Rezept-FdV MUSS den Anwendungsfall "UC 3.2 - E-Rezept durch Versicherten löschen" aus [gemSysL_eRp] gemäß TAB_FdVERP_008 umsetzen. Tabelle # : TAB_FdVERP_008 – E-Rezept löschen Name E-Rezept löschen Auslöser Aufruf des Anwendungsfalls in der GUI Akteur Versicherter Vorbedingung Der Nutzer hat ein zum Löschen markiert und das Löschen bestätigt. Der Nutzer hat sich gegenüber der TI authentisiert. Nachbedingung Das ausgewählte E-Rezept ist vom E-Rezept-Fachdienst unwiederbringlich gelöscht. Standardablauf Task-ID und AccessCode des E-Rezepts bestimmen E-Rezept löschen E-Rezept-Token löschen
</requirement>

<!-- A_19222-01 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-CORE-49" title="E-Rezept-FdV: E-Rezept löschen - Löschrequest" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
     Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezepte löschen" für das zu löschende E-Rezept die HTTP-Operation POST /Task/&lt;id&gt;/$abort des E-Rezept-Fachdienstes mit ACCESS_TOKEN im Authorization-Header Task-ID in URL &lt;id&gt; optional: AccessCode im x-AccessCode-Header ausführen.
</requirement>

<!-- A_19223-01 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-CORE-50" title="E-Rezept-FdV: E-Rezept löschen - E-Rezept-Token löschen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
     Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept löschen" für das zu löschende E-Rezept nach erfolgreichem Aufruf der Operation "Ein E-Rezept löschen" die Daten zum E-Rezept-Token lokal löschen.
</requirement>
