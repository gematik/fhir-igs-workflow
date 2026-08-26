Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `Task`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/{{ site.data.constants.tiflow_core_version }}/menu-schnittstellen-query-api.html)

### Modulspezifische Anforderungen

#### GET /Task

##### Workflowspezifische Anforderungen

<!-- A_27832 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A103" title="E-Rezept-FdV: Flowtype 166 - Hinweis auf Workflow-Besonderheit" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FdV" description="TI-Flow-Frontend des Versicherten">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
     Das E-Rezept-FdV MUSS den Nutzer bei der Einsicht in ein E-Rezept mit dem Flowtype 166 darauf hinweisen, dass bei diesem Vorgang seine Einlösemöglichkeiten beschränkt sind und das Rezept eine verkürzte Gültigkeit aufweist.
</requirement>

#### PATCH /Task

Der Zugriff mittels der HTTP-Operation PATCH steht ausschließlich dem Versicherten zur Verfügung. Die PATCH-Operation führt zu keiner Statusänderung des Tasks.

<!-- A_27488 -->
<requirement conformance="MAY" key="IG-TIFLOW-ERP-A249" title="E-Rezept-FdV: E-Rezept zum Einlösen im EU-Ausland markieren" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FdV" description="TI-Flow-Frontend des Versicherten">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
     Das E-Rezept-FdV KANN es dem Nutzer ermöglichen, die Markierung eines E-Rezeptes zum Einlösen im EU-Ausland zu verwalten.
</requirement>

<!-- A_27617 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A250" title="E-Rezept-FdV: E-Rezept zum Einlösen im EU-Ausland markieren - Hinweis Belieferungsmöglichkeit" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FdV" description="TI-Flow-Frontend des Versicherten">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
     Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept markieren" dem Nutzer vor der Möglichkeit zum Markieren der E-Rezepte zum Einlösen im EU-Ausland einen Hinweis anzeigen, dass die Belieferungsmöglichkeit für die E-Rezepte mit der Apotheke vorab geklärt werden soll.
</requirement>

<!-- A_27489 -->
<requirement conformance="MAY" key="IG-TIFLOW-ERP-A251" title="E-Rezept-FdV: optional: E-Rezept markieren" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FdV" description="TI-Flow-Frontend des Versicherten">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
     Das E-Rezept-FdV KANN den Anwendungsfall "E-Rezept markieren" umsetzen.
</requirement>

<!-- A_27618 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A252" title="E-Rezept-FdV: E-Rezept markieren - E-Rezepte auswählen" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FdV" description="TI-Flow-Frontend des Versicherten">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
     Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept markieren" dem Nutzer ermöglichen, ein oder mehrere E-Rezepte auszuwählen.
</requirement>

<!-- A_27545 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A254" title="E-Rezept-FdV: E-Rezept markieren - FHIR Ressource erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FdV" description="TI-Flow-Frontend des Versicherten">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
     Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept markieren" eine Parameters Ressource des Profils [GEM ERPEU PR PAR PATCH Task Input] erstellen.
</requirement>

<!-- A_27491 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A255" title="E-Rezept-FdV: E-Rezept markieren - Speicherrequest" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FdV" description="TI-Flow-Frontend des Versicherten">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept markieren" zum Speichern der Information im TI-Flow-Fachdienst die HTTP-Operation PATCH /Task/&lt;id&gt; mit: 
    <ul> 
        <li>Prescription-ID in URL &lt;id&gt; </li>
        <li>FHIR-Ressource im HTTP-Request-Body </li>
    </ul>
    ausführen.
</requirement>
