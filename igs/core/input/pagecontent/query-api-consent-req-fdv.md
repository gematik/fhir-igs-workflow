{% assign use_cases = site.data['gen-use-cases'] %}

Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `Consent`-Query-Endpunkte.

### Einwilligung erteilen

<!-- Ablaufdiagramm Anwendungsfall -->
{% assign use_case = use_cases | where: "title", "UC 3.14 - Einwilligung durch Versicherten erteilen" | first %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- A_22709-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-745" title="E-Rezept-FdV: Einwilligung erteilen - Einwilligungstext" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Einwilligung erteilen" den Text für die Einwilligung derart gestalten, dass dem Nutzer eine informierte Einwilligung möglich ist. Insbesondere MÜSSEN enthalten sein: der Verwendungszweck, die konkreten Informationen über die Art der erhobenen Daten, die Speicherdauer, Hinweis auf Freiwilligkeit, auf Widerrufsrecht, Hinweis auf die Folgen bei Verweigerung oder Widerruf.
</requirement>

<!-- A_22163-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-746" title="E-Rezept-FdV: Einwilligung erteilen - Einwilligung eingeben" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Einwilligung erteilen" es dem Nutzer ermöglichen, die Einwilligung einzugeben.
</requirement>

<!-- A_22165-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-747" title="E-Rezept-FdV: Einwilligung erteilen - Consent Ressource erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Einwilligung erteilen" eine Consent Ressource mit:
    <ul>
        <li>Versicherten-ID in Consent.patient.identifier</li>
        <li>Einwilligungstyp in Consent.category.coding.code</li>
    </ul>
    erstellen.
</requirement>

<!-- A_22166-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-748" title="E-Rezept-FdV: Einwilligung erteilen - Speicherrequest" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Einwilligung erteilen" zum Speichern der Information im E-Rezept-Fachdienst die HTTP-Operation POST /Consent mit:
    <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
    </ul>
    ausführen.
</requirement>

### Einwilligungen einsehen

<!-- Ablaufdiagramm Anwendungsfall -->
{% assign use_case = use_cases | where: "title", "UC 3.13 - Einwilligungen durch Versicherten einsehen" | first %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- A_22168-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-749" title="E-Rezept-FdV: Einwilligungsinformation abrufen - Abfragerequest" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Einwilligungsinformation abrufen" zum Abrufen der Information vom E-Rezept-Fachdienst die HTTP-Operation GET /Consent mit:
    <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
    </ul>
    ausführen.
</requirement>

In der Response können mehrere Consent Ressourcen enthalten sein. Der Einwilligungstyp des Consent ist in Consent.category.coding.code angegeben. Die Werte können sich auf folgende Codesysteme beziehen: [GEM_ERPCHRG_CS_ConsentType], [GEM_ERPEU_CS_ConsentType].

### Einwilligung widerrufen

<!-- Ablaufdiagramm Anwendungsfall -->
{% assign use_case = use_cases | where: "title", "UC 3.15 - Einwilligung durch Versicherten widerrufen" | first %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- A_22169-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-750" title="E-Rezept-FdV: Einwilligung widerrufen - Widerruf eingeben" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Einwilligung widerrufen" es dem Nutzer ermöglichen, den Widerruf zu erfassen.
</requirement>

<!-- A_22330-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-751" title="E-Rezept-FdV: Einwilligung widerrufen - Bestätigung" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Einwilligung widerrufen" vom Nutzer eine Bestätigung einholen, dass die Einwilligung widerrufen werden soll, somit ggf. korrespondierende Daten gelöscht werden und die Möglichkeit geben, das Widerrufen abzubrechen.
</requirement>

<!-- A_22171-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-752" title="E-Rezept-FdV: Einwilligung widerrufen - Löschrequest" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Einwilligung widerrufen" zum Löschen der Information im E-Rezept-Fachdienst die HTTP-Operation DELETE /Consent/?category=&lt;Einwilligungstyp&gt; mit:
    <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
        <li>Einwilligungstyp in ?category</li>
    </ul>
    ausführen.
</requirement>

Der Einwilligungstyp ist entsprechend dem Codesystem [GEM_ERPCHRG_CS_ConsentType] oder [GEM_ERPEU_CS_ConsentType] anzugeben.