Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$reject`.

<requirement conformance="SHALL" key="IG-TIFlow-RX-333" title="E-Rezept-Fachdienst - Task zurückweisen - Löschmarkierungen Medikationsliste bereitstellen (Dispensierinformationen)" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Zurückweisen eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$reject , wenn bereits Dispensierinformationen im E-Rezept-Fachdienst zum Task gespeichert wurden, die Daten für die Löschinformation dieser Dispensierinformationen für die Übermittlung in den ePA Medication Service bereitstellen.
    </Beschreibung>
    <!-- A_25926 -->
</requirement>
