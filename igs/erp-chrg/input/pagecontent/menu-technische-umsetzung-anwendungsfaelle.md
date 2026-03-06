{% assign use_cases = site.data['gen-use-cases'] %} {% assign roles = site.data['roles'] %}

Diese Seite beschreibt die technischen Anwendungsfälle des Szenarios "Abrechnungsinformationen für PKV-Versicherte". 

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