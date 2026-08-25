{% assign use_cases = site.data['gen-use-cases'] %}
{% assign roles = site.data['roles'] %}

Um den Prüfauftrag des BfArM zu unterstützen, erstellt der TI-Flow-Fachdienst den digitalen Durchschlag E-T-Rezept. Nach Abgabe wird dieser über eine Webschnittstelle an den BfArM Webdienst übertragen.

### Ablaufdiagramm Abgabe T-Rezept

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
    {% include techn-t-rezept-1.svg %}
    </div>
    <figcaption><strong>Abbildung: </strong>Ablaufdiagramm Abgabe T-Rezept</figcaption>
</figure>


### Daten des digitalen Durchschlags E-T-Rezept

#### Angaben zur Apotheke
Die abgebende Apotheke gibt im Dispensierdatensatz die Telematik-ID der Apotheke an, die die Abgabe vorgenommen hat. Für die Erstellung des digitalen Durchschlags und Auswertung im BfArM werden die Adress- und Kontaktinformationen der Apotheke benötigt. Diese bezieht der TI-Flow-Fachdienst über den FHIR-VZD und nutzt die Telematik-ID als Schlüssel der Organization zur Ermittlung der benötigten Informationen.

Die Telematik-ID der Apotheke wird ebenfalls an das BfArM übertragen, damit das BfArM in Zukunft falls gewünscht aktuelle Daten zur Apotheke über den FHIR-VZD ermitteln kann.

#### Fachliche Informationseinheiten des digitalen Durchschlags

Folgende Daten sind, sofern im jeweiligen Datensatz vorhanden, im digitalen Durchschlag E-T-Rezept enthalten:

{% include StructureDefinition-erp-tprescription-carbon-copy-logical-diff.xhtml %}

<div><figcaption><strong>Fachmodell: </strong>Daten des digitalen Durchschlags E-T-Rezept</figcaption></div>

### Übertragung des digitalen Durchschlags

Der TI-Flow-Fachdienst erstellt nach Abschluss des Workflows des E-T-Rezeptes ($close Operation) den Datensatz für den digitalen Durchschlag zur Übermittlung an den BfArM Webdienst. Analog zum Vorgehen bei der Übertragung der Daten an den Medicaton Service der ePA Aktensysteme wird eine Warteschlange verwendet, um den digitalen Durchschlag asynchron zum Abschluss des Workflows durch die Apotheke zu übertragen. Die asynchrone Übertragung gewährleistet, dass sich für die Apotheke beim Aufruf der $close Operation keine verlängerte Bearbeitungszeit des TI-Flow-Fachdienstes ergibt.

Für das Mapping zur Erstellung des digitalen Durchschlags wird die Seite [Erzeugen digitaler Durchschlag](./menu-technische-umsetzung-mapping.html) bereitgestellt.

Nach Erstellen des Datensatzes für den digitalen Durchschlag wird ein Übermittlungsauftrag in der Warteschlange eingestellt und die Übermittlung an den BfArM Webdienst via Webschnittstelle versucht. Nach erfolgreichem Übermitteln der Daten wird der Übermittlungsauftrag aus der Warteschlange gelöscht.

Bei Übermittlungsfehlern, bei denen ein Retry sinnvoll ist, wie z.B.

- Nicht Erreichbarkeit des Dienstes
- HTTP ErrorCodes 5xx: Serverfehler
- HTTP ErrorCodes 408 (Timeout) und 429 (Zu viele Anfragen pro Zeiteinheit durch Nutzer) wird ein Retry gemäß Exponential Backoff versucht, um die Daten einzustellen. Falls dies nach einem festgelegten Intervall nicht gelingt, werden diese Übermittlungsaufträge, sowie Übermittlungsaufträge mit HTTP ErrorCode 4xx in eine gesonderte Liste ausgesteuert, um nach Problemanalyse und ggf. einem Update des TI-Flow-Fachdienstes das Einstellen erneut zu versuchen.

Der technsiche Anwendungsfall für die Übertragung ist auf [UC 5.8 - Durchschlag E-T-Rezept beim BfArM einstellen](./menu-technische-umsetzung-anwendungsfaelle.html#166-uebertrag-t-register) dargestellt.
