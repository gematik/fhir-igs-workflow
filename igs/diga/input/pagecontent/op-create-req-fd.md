Diese Seite enthält die normativen Anforderungen an den Fachdienst für die Operation `$create`.

### Anforderungen aus der Core Spezifikation

{% include core.op-create-req-fd.md %}

### Modulspezifische Anforderungen

<!-- A_19214 -->
<requirement conformance="SHALL" key="" title="TI-Flow-Fachdienst - Task erzeugen - Flowtype 162 - Ergänzung Performer-Typ für Einlöseinstitutstyp" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Erzeugen eines Tasks die Felder Task.performerType und Task.PrescriptionType.valueCoding.display entsprechend dem übergebenen, gültigen Parameter Task.extension:flowType belegen.
</requirement>

Die Belegung ergibt sich workflow-typ abhängig aus den [Prozessparametern](./op-activate-req-fd.html).
