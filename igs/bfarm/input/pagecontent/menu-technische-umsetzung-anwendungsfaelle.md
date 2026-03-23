{% assign use_cases = site.data['gen-use-cases'] %}
{% assign roles = site.data['roles'] %}

Diese Seite dokumentiert die technischen Anwendungsfälle für die in diesem IG beschriebenen fachlichen Szenarien.

<!-- UC 5.8 - Durchschlag E-T-Rezept beim BfArM einstellen -->
{% assign use_case = use_cases | where: "id", "166-uebertrag-t-register" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}