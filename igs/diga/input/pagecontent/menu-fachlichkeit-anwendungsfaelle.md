### Fachliche Anwendungsfaelle

{% assign use_cases = site.data['use-cases'] %}
{% assign roles = site.data['roles'] %}

Die folgenden fachlichen Anwendungsfaelle beschreiben die Schritte zur Verordnung und Bereitstellung eines DiGA-E-Rezepts.

#### Uebergreifende Vorbedingungen

- Der Leistungserbringer ist gegenueber der TI authentisiert (Institutionsidentitaet via SMC-B ueber IdP/Konnektor).
- Fuer die QES steht ein freigeschalteter HBA zur Verfuegung.
- Der Verordnungsdatensatz wird als KBV-konformes FHIR-Bundle im Primaersystem gefuehrt.

{% for use_case in use_cases %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% endfor %}
