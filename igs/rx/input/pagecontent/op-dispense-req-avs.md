Diese Seite enthält die normativen Anforderungen an das AVS für die Operation `$dispense`.

### Anforderungen aus der Core Spezifikation

Für diese Seite bestehen keine Anforderungen aus der Core Spezifikation.

### Modulspezifische Anforderungen

Mit diesem Anwendungsfall stellt das PS der abgebenden LEI Dispensierinformationen für den Versicherten bereit, die dann vom Versicherten auf seinem E-Rezept-FdV heruntergeladen werden können. Das E-Rezept-FdV kann dem Versicherten außerdem darstellen, dass das E-Rezept beliefert wurde bevor der Workflow des E-Rezepts durch den Anwendungsfall "Quittung abrufen" beendet wird.

Dieser Anwendungsfall kann so lange wiederholt werden, so lange sich der Task zum E-Rezept im Status "in-progress" befindet. Bei der wiederholten Übermittlung wird die zuvor übermittelte Dispensierinformation überschrieben. D.h. es muss immer die vollständige Dispensierinformation übermittelt werden.

Das PS der abgebenden LEI erzeugt die Dispensierinformationen nach den Vorgaben aus [Erstellen von Dispensierinformationen](./menu-technische-umsetzung-dispensierinformationen.html).

<!-- A_26346 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-97" title="PS abgebende LEI: Dispensierinformationen bereitstellen - Dispensierinformation übermitteln" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das PS der abgebenden LEI MUSS im Anwendungsfall "Dispensierinformationen bereitstellen" für das abgegebene E-Rezept die HTTP-Operation POST /Task/&lt;id&gt;/$dispense mit 
    <ul>
        <li>ACCESS_TOKEN im Authorization-Header </li>
        <li>Task-ID in URL &lt;id&gt; </li>
        <li>Geheimnis in URL-Parameter ?secret= </li>
        <li>MedicationDispense bzw. Bundle Ressource </li>
    </ul>
    ausführen.
</requirement>
