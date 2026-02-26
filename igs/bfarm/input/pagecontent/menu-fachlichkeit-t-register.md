{% assign use_cases = site.data['gen-use-cases'] %}
{% assign roles = site.data['roles'] %}

Gemäß §3a Abs. 7 AMVV übernimmt der E-Rezept-Fachdienst die Aufgabe die vom BfArM benötigten Informationen aus den E-T-Rezepten über den BfArM Webdienst an das BfArM T-Register zu übermitteln. Die Übermittlung der strukturierten Daten, im Folgenden "digitaler Durchschlag E-T-Rezept" genannt, findet statt, unverzüglich nachdem die Quittung für das E-T-Rezept durch die abgebende Apotheke abgerufen wurde. Im BfArM können die Daten dann zur Erfüllung gesetzlich zugewiesener Aufgaben in geeigneter Form dargestellt und archiviert werden.

Disclaimer: aktuell wird mit dem BMG und dem BfArM abgestimmt, wie der "digitale Durchschlag E-T-Rezept" in der AMVV noch passender definiert werden kann.

### User Stories des BfArM

Als BfArM möchte ich ...

- ... sichergehen, dass nur approbierte Humanmediziner (nicht Tier- und Zahnärzte) T-Rezepte verschreiben können, sodass keine unbefugten Ärzte Arzneimittel nach §3a Abs. 1 Satz 1 AMVV verordnen.
- ... die Informationen der "digitalen Durchschläge" in strukturierte Form erhalten, damit ich meine gesetzlichen Aufträge erfüllen kann.
- ... die Apotheke bei einem fachlichen Fehler oder einer Nachfrage (z.B. Überschreiten der zulässigen Höchstmenge) kontaktieren können, sodass diese den Patienten und den Arzt informieren können.
- ... keine neuen IT-Systeme anschaffen müssen, um die "digitalen Durchschläge" ansehen und auswerten zu können, sodass ich geringe finanziellen Aufwände habe.


### Übermittlung digitaler Durchschlag E-T-Rezept

Unverzüglich nachdem die Apotheke die Quittung erhalten hat, wird der digitaler Durchschlag E-T-Rezept im E-Rezept-Fachdienst erstellt und an den BfArM Webdienst übertragen.

Die Daten werden asynchron zum Abschluss des Workflows in einer Warteschlange übermittelt, sodass die Apotheke den Vorgang abschließen kann, selbst wenn der BfArM Webdienst nicht erreichbar ist. In diesem Fall nutzt der E-Rezept-Fachdienst ein exponentielles Backoff-Retry, bis die Übertragung zum BfArM Webdienst erfolgreich durchgeführt werden konnte.

Das technische Konzept zur Übermittlung ist auf [Technisches Konzept T-Register](./menu-technische-umsetzung-t-register.html) bereitgestellt.

#### Technische Anwendungsfälle

**Beteiligte Systeme:** E-Rezept-Fachdienst, BfArM Webdienst: T-Register

{% assign scenario_use_cases = "166-uebertrag-t-register" %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Technische Anwendungsfälle mit Bezug zu Anwendungsfall <i>Übermittlung des digitalen Durchschlags E-T-Rezepten</i>" %}
