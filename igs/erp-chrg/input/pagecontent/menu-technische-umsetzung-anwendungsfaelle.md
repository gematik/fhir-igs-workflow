{% assign use_cases = site.data['gen-use-cases'] %} 
{% assign roles = site.data['roles'] %}

Diese Seite beschreibt die technischen Anwendungsfälle des Szenarios "Abrechnungsinformationen für PKV-Versicherte".

### Umzusetzende Anwendungsfälle von Clients

#### E-Rezept-FdV 

<!-- A_19443 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-CHRG-33" title="E-Rezept-FdV: TIFlow-CHRG - verpflichtende Anwendungsfälle" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das E-Rezept-FdV MUSS für die Umsetzung der Nutzung von Abrechnungsinformationen für PKV-Versicherte die Anwendungsfälle
    <ul>
        <li>UC 3.14 - Einwilligung durch Versicherten erteilen</li>
        <li>UC 3.15 - Einwilligung durch Versicherten widerrufen</li>
        <li>UC 3.13 - Einwilligungen durch Versicherten einsehen</li>
        <li>UC 3.10 - Abrechnungsinformationen durch Versicherten abrufen</li>
        <li>Abrechnungsinformationen durch den Versicherten weitergeben</li>
        <li>UC 3.12 - Abrechnungsinformationen durch den Versicherten markieren</li>
        <li>UC 3.11 - Abrechnungsinformationen durch den Versicherten löschen</li>
        <li>Berechtigen der Apotheke zum Ändern des PKV-Abgabedatensatzes</li>
    </ul>
    umsetzen.
</requirement>

#### PS abgebende LEI

<requirement conformance="SHALL" key="IG-PRE-TIFLOW-CHRG-34" title="PS abgebende LEI: TIFlow-CHRG - verpflichtende Anwendungsfälle" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das PS der abgebenden LEI MUSS für die Umsetzung der Abrechnungsinformationen für PKV-Versicherte die Anwendungsfälle
    <ul>
        <li>UC 4.5 - Abgabedatensatz durch Abgebenden signieren</li>
        <li>UC 4.11 - Abrechnungsinformation durch Abgebenden bereitstellen</li>
        <li>UC 4.10 - Abrechnungsinformationen durch Abgebenden abrufen</li>
        <li>UC 4.13 - PKV-Abgabedatensatz durch Abgebenden ändern</li>
    </ul>
    umsetzen.
</requirement>


### Technische Use Cases

#### Versicherter

<!-- AF_10084 - Einwilligung zum Speichern der Abrechnungsinformationen erteilen -->
{% assign use_case = use_cases | where: "title", "UC 3.14 - Einwilligung durch Versicherten erteilen" | first %}
<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- AF_10085 - Einwilligung zum Speichern der Abrechnungsinformationen widerrufen -->
{% assign use_case = use_cases | where: "id", "UC_3_15_Einwilligung_widerrufen" | first %}
<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- AF_10086 - Einwilligung zum Speichern der Abrechnungsinformationen einsehen -->
{% assign use_case = use_cases | where: "title", "UC 3.13 - Einwilligungen durch Versicherten einsehen" | first %}
<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- AF_10087 - Abrechnungsinformationen durch den Versicherten abrufen -->
{% assign use_case = use_cases | where: "title", "UC 3.10 - Abrechnungsinformationen durch Versicherten abrufen" | first %}
<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- AF_10088 - Abrechnungsinformationen durch den Versicherten weitergeben -->
{% assign use_case = use_cases | where: "title", "Abrechnungsinformationen durch den Versicherten weitergeben" | first %}
<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- AF_10089 - Abrechnungsinformationen durch den Versicherten markieren -->
{% assign use_case = use_cases | where: "title", "UC 3.12 - Abrechnungsinformationen durch den Versicherten markieren" | first %}
<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- AF_10090 - Abrechnungsinformationen durch den Versicherten löschen -->
{% assign use_case = use_cases | where: "title", "UC 3.11 - Abrechnungsinformationen durch den Versicherten löschen" | first %}
<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- Berechtigen der Apotheke zum Ändern des PKV-Abgabedatensatzes -->
{% assign use_case = use_cases | where: "id", "chrg-accesscode-an-apotheke-übermitteln" | first %}
<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

#### Apotheke

<!-- AF_10082 - Abrechnungsinformation durch Abgebenden bereitstellen -->
{% assign use_case = use_cases | where: "title", "UC 4.11 - Abrechnungsinformation durch Abgebenden bereitstellen" | first %}
<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- AF_10081 - Abrechnungsinformation durch Abgebenden abrufen -->
{% assign use_case = use_cases | where: "title", "UC 4.10 - Abrechnungsinformationen durch Abgebenden abrufen" | first %}
<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- AF_10083 - PKV-Abgabedatensatz durch Abgebenden ändern -->
{% assign use_case = use_cases | where: "title", "UC 4.13 - PKV-Abgabedatensatz durch Abgebenden ändern" | first %}
<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}