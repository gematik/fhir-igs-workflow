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

<!-- A_22187 -->
<requirement conformance="SHALL" title="PS abgebende LEI: Abrechnungsinformation bereitstellen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS den Anwendungsfall "Abrechnungsinformation durch Abgebenden bereitstellen" gemäß TAB_ILFERP_xxx umsetzen. Tabelle # : TAB_ILFERP_xxx – Abrechnungsinformation bereitstellen Name Abrechnungsinformation bereitstellen Auslöser Aufruf des Anwendungsfalls in der GUI Akteur Leistungserbringer, Mitarbeiter der abgebenden LEI Vorbedingung Die abgebende LEI hat den Workflow zum E-Rezept mit dem Anwendungsfall „Quittung abrufen“ abgeschlossen. Die Information Task-ID und dem Secret zum E-Rezept sind bekannt. Im PS liegt die Information vor, dass der Versicherte die Einwilligung zum Speichern der Abrechnungsinformationen auf dem E-Rezept-Fachdienst erteilt hat. Die LEI hat sich gegenüber der TI authentisiert. Nachbedingung Der PKV-Abgabedatensatz ist auf dem E-Rezept-Fachdienst gespeichert. Standardablauf PKV-Abgabedatensatz erstellen PKV-Abgabedatensatz mit Konnektor signieren ChargeItem erstellen Task-ID und Geheimnis des E-Rezepts bestimmen PKV-Abgabedatensatz speichern
</requirement>
<!-- A_22192 -->
<requirement conformance="SHALL" title="PS abgebende LEI: PKV-Abgabedatensatz ändern">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS den Anwendungsfall "PKV-Abgabedatensatz durch Abgebenden ändern" gemäß TAB_ILFERP_xxx umsetzen. Tabelle # : TAB_ILFERP_xxx – Abrechnungsinformation ändern Name PKV-Abgabedatensatz ändern Auslöser Aufruf des Anwendungsfalls in der GUI Akteur Leistungserbringer, Mitarbeiter der abgebenden LEI Vorbedingung Der Versicherte hat den AccessCode übermittelt. Die abgebende LEI hat die Abrechnungsinformation für das E-Rezept auf dem E-Rezept-Fachdienst bereitgestellt. Die Information zur Prescription-ID ist bekannt. Die LEI hat sich gegenüber der TI authentisiert. Nachbedingung Der geänderte PKV-Abgabedatensatz ist auf dem E-Rezept-Fachdienst gespeichert. Standardablauf PKV-Abgabedatensatz erstellen PKV-Abgabedatensatz mit Konnektor signieren Prescription-ID und AccessCode der Abrechnungsinformation bestimmen Abrechnungsinformation speichern
</requirement>
<!-- A_22202 -->
<requirement conformance="SHALL" title="PS abgebende LEI: Abrechnungsinformation abrufen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS den Anwendungsfall "Abrechnungsinformation durch Abgebenden abrufen" gemäß TAB_ILFERP_xxx umsetzen. Tabelle # : TAB_ILFERP_xxx – Abrechnungsinformation abrufen Name Abrechnungsinformation abrufen Auslöser Aufruf des Anwendungsfalls in der GUI Akteur Leistungserbringer, Mitarbeiter der abgebenden LEI Vorbedingung Der Versicherte hat den AccessCode übermittelt. Die Prescription-ID der Abrechnungsinformation ist im Primärsystem bekannt Die LEI hat sich gegenüber der TI authentisiert. Nachbedingung Die Informationen zum PKV-Abgabedatensatz liegen im PS vor Standardablauf Prescription-ID und AccessCode der Abrechnungsinformation bestimmen Abrechnungsinformation abrufen
</requirement>
<!-- A_24289 -->
<requirement conformance="SHOULD" title="PS abgebende LEI: Dispensierinformationen bereitstellen - E-Rezept auswählen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS im Anwendungsfall "Dispensierinformationen bereitstellen" es dem Nutzer ermöglichen, ein E-Rezept als abgegeben auszuwählen.
</requirement>
<!-- A_24290 -->
<requirement conformance="SHALL" title="PS abgebende LEI: Dispensierinformationen bereitstellen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS den Anwendungsfall "UC 4.16- Dispensierinformationen bereitstellen" gemäß TAB_ILFERP_022 umsetzen. Tabelle # : TAB_ILFERP_022 - Dispensierinformationen bereitstellen Name Dispensierinformationen bereitstellen Auslöser Aufruf des Anwendungsfalls in der GUI Akteur Leistungserbringer, Mitarbeiter der abgebenden LEI Vorbedingung Die LEI hat das E-Rezept vom E-Rezept-Fachdienst heruntergeladen. Der Nutzer hat im AVS ein E-Rezept als abgegeben markiert. Die LEI hat sich gegenüber der TI authentisiert. Nachbedingung Der Vorgang zum E-Rezept ist weiterhin im AVS verfügbar. Der Anwendungsfall "Dispensierinformationen bereitstellen" kann erneut ausgeführt werden. Der Anwendungsfall "Quittung abrufen" kann ausgeführt werden. Standardablauf Informationen über das abgegebene Medikament erstellt Nur für Fertigarzneimittel, die einen Data-Matrix-Code gemäß securPharm-System besitzen: Chargeninfo und Verfallsdatum ergänzen. Task-ID und Geheimnis des E-Rezepts bestimmen Dispensierinformationen dem E-Rezept-Fachdienst bereitstellen
</requirement>
<!-- A_24291-01 -->
<requirement conformance="SHALL" title="PS abgebende LEI: Dispensierinformationen bereitstellen - Dispensierinformationen erstellen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS im Anwendungsfall "Dispensierinformationen bereitstellen" die Dispensierinformationen nach den Vorgaben aus "Erstellen von Dispensierinformationen" erzeugen.
</requirement>
