Diese Seite enthält die normativen Anforderungen an das AVS für die Operation `$dispense`.

### Anforderungen aus der Core Spezifikation

Für diese Seite bestehen keine Anforderungen aus der Core Spezifikation.

### Modulspezifische Anforderungen

Mit diesem Anwendungsfall stellt das PS der abgebenden LEI Dispensierinformationen für den Versicherten bereit, die dann vom Versicherten auf seinem E-Rezept-FdV heruntergeladen werden können. Das E-Rezept-FdV kann dem Versicherten außerdem darstellen, dass das E-Rezept beliefert wurde bevor der Workflow des E-Rezepts durch den Anwendungsfall "Quittung abrufen" beendet wird.

Dieser Anwendungsfall kann so lange wiederholt werden, so lange sich der Task zum E-Rezept im Status "in-progress" befindet. Bei der wiederholten Übermittlung wird die zuvor übermittelte Dispensierinformation überschrieben. D.h. es muss immer die vollständige Dispensierinformation übermittelt werden.

<!-- A_24289 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-87" title="PS abgebende LEI: Dispensierinformationen bereitstellen - E-Rezept auswählen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI MUSS im Anwendungsfall "Dispensierinformationen bereitstellen" es dem Nutzer ermöglichen, ein E-Rezept als abgegeben auszuwählen.
</requirement>

<!-- A_24290 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-88" title="PS abgebende LEI: Dispensierinformationen bereitstellen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI MUSS den Anwendungsfall "UC 4.16- Dispensierinformationen bereitstellen" gemäß TAB_ILFERP_022 umsetzen. Tabelle # : TAB_ILFERP_022 - Dispensierinformationen bereitstellen Name Dispensierinformationen bereitstellen Auslöser Aufruf des Anwendungsfalls in der GUI Akteur Leistungserbringer, Mitarbeiter der abgebenden LEI Vorbedingung Die LEI hat das E-Rezept vom E-Rezept-Fachdienst heruntergeladen. Der Nutzer hat im AVS ein E-Rezept als abgegeben markiert. Die LEI hat sich gegenüber der TI authentisiert. Nachbedingung Der Vorgang zum E-Rezept ist weiterhin im AVS verfügbar. Der Anwendungsfall "Dispensierinformationen bereitstellen" kann erneut ausgeführt werden. Der Anwendungsfall "Quittung abrufen" kann ausgeführt werden. Standardablauf Informationen über das abgegebene Medikament erstellt Nur für Fertigarzneimittel, die einen Data-Matrix-Code gemäß securPharm-System besitzen: Chargeninfo und Verfallsdatum ergänzen. Task-ID und Geheimnis des E-Rezepts bestimmen Dispensierinformationen dem E-Rezept-Fachdienst bereitstellen
</requirement>

<!-- A_24291-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-89" title="PS abgebende LEI: Dispensierinformationen bereitstellen - Dispensierinformationen erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI MUSS im Anwendungsfall "Dispensierinformationen bereitstellen" die Dispensierinformationen nach den Vorgaben aus "Erstellen von Dispensierinformationen" erzeugen.
</requirement>

<!-- A_26346 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-90" title="PS abgebende LEI: Dispensierinformationen bereitstellen - Dispensierinformation übermitteln" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI MUSS im Anwendungsfall "Dispensierinformationen bereitstellen" für das abgegebene E-Rezept die HTTP-Operation POST /Task/&lt;id&gt;/$dispense mit ACCESS_TOKEN im Authorization-Header Task-ID in URL &lt;id&gt; Geheimnis in URL-Parameter ?secret= MedicationDispense bzw. Bundle Ressource ausführen.
</requirement>
