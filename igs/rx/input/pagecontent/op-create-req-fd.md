Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$create`.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/{{ site.data.constants.tiflow_core_version }}/index.html)

### Modulspezifische Anforderungen

<!-- A_19214 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A217" title="TI-Flow-Fachdienst - Task erzeugen - Flowtype 160/166/169/200/209 - Ergänzung Performer-Typ für Einlöseinstitutstyp" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Erzeugen eines Tasks die Felder Task.performerType und Task.PrescriptionType.valueCoding.display entsprechend dem übergebenen, gültigen Parameter Task.extension:flowType belegen.
</requirement>

Die Belegung ergibt sich workflow-typ abhängig aus den [Prozessparametern](./op-activate-req-fd.html).
