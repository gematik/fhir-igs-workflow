Übersicht der fachlichen Anwendungsfälle im PKV‑Szenario.

{% assign use_cases = site.data['use-cases'] %}
{% assign roles = site.data['roles'] %}

Die folgenden fachlichen Anwendungsfälle beschreiben – aus Sicht der beteiligten Rollen – die Schritte zur Bereitstellung und Nutzung der Abrechnungsinformation.

### Übergreifende Vorbedingungen

- Der Versicherte ist als PKV-Versicherter identifiziert.
- Die beteiligten Systeme sind gegenüber der TI authentisiert.

**Technische Anwendungsfälle**
{% assign scenario_use_cases = "AF_10081, AF_10082, AF_10083, AF_10084, AF_10085, AF_10086, AF_10087, AF_10088, AF_10089, AF_10090" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Technische Anwendungsfälle mit Bezug zu Anwendungsfall <i>Verordnung apothekenpflichtiger Arzneimittel (160/200)</i>" %}

<!--
{% for use_case in use_cases %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% endfor %}
-->