### Fachliche Anwendungsfälle

{% assign use_cases = site.data['use-cases'] %}
{% assign roles = site.data['roles'] %}

Die folgenden fachlichen Anwendungsfälle beschreiben die Schritte zur Verordnung und Bereitstellung einer DiGA-Verordnung.

#### Übergreifende Vorbedingungen

- Der Leistungserbringer ist gegenüber der TI authentisiert (Institutionsidentitaet via SMC-B über IdP/Konnektor).
- Für die QES steht ein freigeschalteter HBA zur Verfuegung.
- Der Verordnungsdatensatz wird als KBV-konformes FHIR-Bundle im Primaersystem geführt.

{% for use_case in use_cases %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% endfor %}
