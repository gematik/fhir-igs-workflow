Diese Seite beschreibt Anforderungen für das TI-Flow-FdV zur Nutzung des `$grant-eu-access-permission`-Endpunktes.

<!-- ToDo -->

Um zu bestimmen, welche europäischen Länder die Anwendung ePrescription/eDispensation Szenario Land A unterstützen, lädt das TI-Flow-FdV die Liste dieser Länder aus dem FHIR-VZD. Die Liste kann für 96h gecacht werden.

<!--A_27109 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A273" title="TI-Flow-FdV: Zugriffsberechtigung - Liste zulässiger Länder" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FdV" description="TI-Flow-Frontend des Versicherten">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Das TI-Flow-FdV MUSS Anwendungsfall "Zugriffsberechtigung erteilen" die Liste aller zulässigen Länder aus dem Verzeichnisdienst ermitteln, indem an den Verzeichnisdienst folgende Abfrage gestellt wird:
    <ul>
        <li>Abfrage der Ressource "HealthcareService"</li>
        <li>HealthcareServices, deren Speciality "57833-6" aus https://loinc.org enthalten</li>
        <li>HealthcareServices, deren Organisation aktiv sind</li>
        <li>HealthcareServices, deren Organisation den OrganizationProfessionOIDType "1.2.276.0.76.4.292" entspricht</li>
        <li>Einbeziehen der Organisation in das Rückgabeergebnis</li>
    </ul>
</requirement>

<!--A_27110 -->
<requirement conformance="SHALL NOT" key="IG-TIFLOW-ERP-A274" title="TI-Flow-FdV: Zugriffsberechtigung - Caching Liste zulässiger Länder" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FdV" description="TI-Flow-Frontend des Versicherten">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
   Das TI-Flow-FdV DARF NICHT Informationen zur Liste zulässiger Länder verwenden, welche länger als 96h lokal durch das TI-Flow-FdV gecacht wurden.
</requirement>

<!--A_27111 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A275" title="TI-Flow-FdV: Zugriffsberechtigung - Land auswählen" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FdV" description="TI-Flow-Frontend des Versicherten">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Das TI-Flow-FdV MUSS im Anwendungsfall "Zugriffsberechtigung erteilen" es dem Nutzer ermöglichen, ein Land aus der Liste der zulässigen Länder auszuwählen, für das der Nutzer die Zugriffsberechtigung erteilen möchte.
</requirement>

<!--A_27113 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A276" title="TI-Flow-FdV: Zugriffsberechtigung - Zugriffscode erzeugen" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FdV" description="TI-Flow-Frontend des Versicherten">
        <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
    </actor>
    Das TI-Flow-FdV MUSS im Anwendungsfall "Zugriffsberechtigung" einen eigens generierten Zugriffscode als Zufallswert erzeugen.
</requirement>

Der Zugriffscode muss ein sicherer Zufallswert sein und wird zur Berechtigung des NCPeH-Fachdienstes verwendet.
Für jede weitere Erteilung einer Zugriffsberechtigung für ePrescription/Dispensation Szenario Land A muss ein neuer Zugriffscode erzeugt werden.

<!--A_27114 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A277" title="TI-Flow-FdV: Zugriffsberechtigung - Zugriffsberechtigung am TI-Flow-Fachdienst speichern" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FdV" description="TI-Flow-Frontend des Versicherten">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Das TI-Flow-FdV MUSS im Anwendungsfall "Zugriffsberechtigung erteilen" zum Speichern der Information am TI-Flow-Fachdienst die HTTP-Operation POST /$grant-eu-access-permission mit:
    <ul>
        <li>Organization.extension:ncpehCountryEx.valueCodeableConcept.coding.code des vom Nutzer ausgewählten Landes in Parameters.parameter:countryCode</li>
        <li>erzeugter Zugriffscode in Parameters.parameter:accessCode</li>
    </ul>
    ausführen.
</requirement>

Im Response übermittelt der TI-Flow-Fachdienst in Parameters.parameter:validUntil die Gültigkeitsdauer der Zugriffsberechtigung.