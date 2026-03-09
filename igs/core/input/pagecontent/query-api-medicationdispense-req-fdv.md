Diese Seite beschreibt Anforderungen ein E-Rezept-FdV zur Nutzung der `MedicationDispense`-Query-Endpunkte.

<!-- A_19345 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-278" title="E-Rezept-FdV: Abgabeinformationen abfragen - MedicationDispense abrufen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Abgabeinformationen abfragen" die HTTP-Operation GET /MedicationDispense mit
    <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
        <li>optional: Suchparameter gemäß https://www.hl7.org/fhir/medicationdispense.html#search</li>
    </ul>
    ausführen.
</requirement>