Diese Seite beschreibt Anforderungen für das E-Rezept-FdV zur Nutzung des `$grant-eu-access-permission`-Endpunktes.

<!-- ToDo -->

Um zu bestimmen, welche europäischen Länder die Anwendung ePrescription/eDispensation Szenario Land A unterstützen, lädt der E-Rezept-FdV die Liste
dieser Länder aus dem FHIR-VZD. Die Liste kann für 96h gecacht werden.

<!--A_27109 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-48" title="E-Rezept-FdV: Zugriffsberechtigung - Liste zulässiger Länder" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS Anwendungsfall "Zugriffsberechtigung erteilen" die Liste aller zulässigen Länder aus dem Verzeichnisdienst ermitteln, indem an den Verzeichnisdienst folgende Abfrage gestellt wird:
    <ul>
        <li>Abfrage der Ressource "HealthcareService"</li>
        <li>HealthcareServices, deren Speciality "57833-6" aus https://loinc.org enthalten</li>
        <li>HealthcareServices, deren Organisation aktiv sind</li>
        <li>HealthcareServices, deren Organisation den OrganizationProfessionOIDType "1.2.276.0.76.4.292" entspricht</li>
        <li>Einbeziehen der Organisation in das Rückgabeergebnis</li>
    </ul>
</requirement>

<!--A_27110 -->
<requirement conformance="SHALL NOT" key="IG-TIFLOW-EU-49" title="E-Rezept-FdV: Zugriffsberechtigung - Caching Liste zulässiger Länder" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
   Das E-Rezept-FdV DARF NICHT Informationen zur Liste zulässiger Länder verwenden, welche länger als 96h lokal durch das E-Rezept-FdV gecacht wurden.
</requirement>

<!--A_27111 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-50" title="E-Rezept-FdV: Zugriffsberechtigung - Land auswählen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Zugriffsberechtigung erteilen" es dem Nutzer ermöglichen, ein Land aus der Liste der zulässigen Länder auszuwählen, für das der Nutzer die Zugriffsberechtigung erteilen möchte.
</requirement>

<!--A_27113 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-51" title="E-Rezept-FdV: Zugriffsberechtigung - Zugriffscode erzeugen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Zugriffsberechtigung" einen eigens generierten Zugriffscode als Zufallswert erzeugen.
</requirement>

Das Format für den Zugriffscode ist in [gemSpec_DM_eRp#A_27097-*] beschrieben.
Für jede weitere Erteilung einer Zugriffsberechtigung für ePrescription/Dispensation Szenario Land A muss ein neuer Zugriffscode erzeugt werden.

<!-- ToDo: Afo Zugriffscode in IG übernehmen -->

<!--A_27114 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-52" title="E-Rezept-FdV: Zugriffsberechtigung - Zugriffsberechtigung am E-Rezept-Fachdienst speichern" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Zugriffsberechtigung erteilen" zum Speichern der Information am E-Rezept-Fachdienst die HTTP-Operation POST /$grant-eu-access-permission mit:
    <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
        <li>Organization.extension:ncpehCountryEx.valueCodeableConcept.coding.code des vom Nutzer ausgewählten Landes in Parameters.parameter:countryCode</li>
        <li>erzeugter Zugriffscode in Parameters.parameter:accessCode</li>
    </ul>
    ausführen.
</requirement>

Im Response übermittelt der E-Rezept-Fachdienst in Parameters.parameter:validUntil die Gültigkeitsdauer der Zugriffsberechtigung.