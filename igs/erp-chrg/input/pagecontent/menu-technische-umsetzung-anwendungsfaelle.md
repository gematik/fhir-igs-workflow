{% assign use_cases = site.data['use-cases'] %} {% assign roles = site.data['roles'] %}

Diese Seite beschreibt die technischen Anwendungsfälle des Szenarios „E‑Rezepte für PKV‑Versicherte“. Im Fokus steht, was im E‑Rezept‑Fachdienst und in den beteiligten Clients (FdV/AdV, Primärsysteme, AVS) passiert, wenn die fachlichen Anwendungsfälle ausgeführt werden.

<!-- AF_10082 - Abrechnungsinformation durch Abgebenden bereitstellen -->
{% assign use_case = use_cases | where: "title", "Abrechnungsinformation durch Abgebenden bereitstellen" | first %}
<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- AF_10081 - Abrechnungsinformation durch Abgebenden abrufen -->
{% assign use_case = use_cases | where: "title", "Abrechnungsinformation durch Abgebenden abrufen" | first %}
<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- AF_10083 - PKV-Abgabedatensatz durch Abgebenden ändern -->
{% assign use_case = use_cases | where: "title", "PKV-Abgabedatensatz durch Abgebenden ändern" | first %}
<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- AF_10084 - Einwilligung zum Speichern der Abrechnungsinformationen erteilen -->
{% assign use_case = use_cases | where: "title", "Einwilligung zum Speichern der Abrechnungsinformationen erteilen" | first %}
<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- AF_10085 - Einwilligung zum Speichern der Abrechnungsinformationen widerrufen -->
{% assign use_case = use_cases | where: "title", "Einwilligung zum Speichern der Abrechnungsinformationen widerrufen" | first %}
<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- AF_10086 - Einwilligung zum Speichern der Abrechnungsinformationen einsehen -->
{% assign use_case = use_cases | where: "title", "Einwilligung zum Speichern der Abrechnungsinformationen einsehen" | first %}
<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- AF_10087 - Abrechnungsinformationen durch den Versicherten abrufen -->
{% assign use_case = use_cases | where: "title", "Abrechnungsinformationen durch den Versicherten abrufen" | first %}
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
{% assign use_case = use_cases | where: "title", "Abrechnungsinformationen durch den Versicherten markieren" | first %}
<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- AF_10090 - Abrechnungsinformationen durch den Versicherten löschen -->
{% assign use_case = use_cases | where: "title", "Abrechnungsinformationen durch den Versicherten löschen" | first %}
<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<a id="accesscode-an-apotheke-uebermitteln"></a>
## Berechtigen der Apotheke zum Ändern des PKV‑Abgabedatensatzes
Der Versicherte übermittelt der abgebenden LEI einen AccessCode, um die Apotheke zum Abruf und einmaligen Ändern zu berechtigen.

- Das FdV/AdV erzeugt einen Abrechnungsinformation‑Token.
- Der Versicherte übermittelt den Token per Nachricht (Communication) oder zeigt einen 2D‑Code.
- Das AVS nutzt den AccessCode für Abruf/Änderung der Abrechnungsinformation.

<em>Schnittstelle:</em> <i><a href="./query-api-communication.html">query-api-communication</a></i>

**Sequenzdiagramm (Platzhalter):**
<!-- TODO: SD AccessCode an Apotheke übermitteln -->
