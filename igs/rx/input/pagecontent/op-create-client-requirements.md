Diese Seite enthält die normativen Anforderungen an den Client des E-Rezept-Fachdienst für die Operation `$create`.
Es gelten weiterhin die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}/op-create-client-requirements.html).

<!-- A_19275 -->
<requirement conformance="SHALL" key="IG-TIFlow-RX-78" title="PS verordnende LEI: E-Rezept erstellen - E-Rezept-Bundle erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
     Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden erstellen" eine Bundle-FHIR-Ressource gemäß Profilierung https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle Rezept-ID aus der Task-Ressource als Identifier erstellen.
</requirement>
