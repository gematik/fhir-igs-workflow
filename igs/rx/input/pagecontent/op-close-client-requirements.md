Diese Seite enthält die normativen Anforderungen an den Client des E-Rezept-Fachdienst für die Operation `$close`.
Es gelten weiterhin die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}/op-close-client-requirements.html).

<!-- A_19288-03 -->
<requirement conformance="SHALL" title="PS abgebende LEI:  Quittung abrufen - Dispensierinformationen erstellen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS im Anwendungsfall "Quittung abrufen" die Dispensierinformationen nach den Vorgaben aus "Erstellen von Dispensierinformationen" erzeugen, wenn sie übermittelt werden sollen.
</requirement>
