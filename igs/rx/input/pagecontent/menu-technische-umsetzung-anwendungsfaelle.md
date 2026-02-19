{% assign use_cases = site.data['use-cases'] %}
{% assign roles = site.data['roles'] %}

Diese Seite beschreibt die technischen Anwendungsfälle, die für das Modul der verordnung von Arzneimitteln genutzt werden.




<!-- UC 2.1 - E-Rezepte erzeugen -->
{% assign use_case = use_cases | where: "title", "UC 2.1 - E-Rezepte erzeugen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 2.3 - E-Rezept einstellen -->
{% assign use_case = use_cases | where: "title", "UC 2.3 - E-Rezept einstellen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

#### Technische Aspekte für die Mehrfachverordnung (MVO)

Für jede Teilverordnung einer Mehrfachverordnung wird ein einzelnes E-Rezept erstellt. Im Verordnungsdatensatz wird das ERezept als Teil einer Mehrfachverordnung gekennzeichnet (`MedicationRequest: extension:Mehrfachverordnung.extension:Kennzeichen`).

Zusätzlich werden u.a. die Informationen
- Nummer des Rezepts der Mehrfachverordnung (`MedicationRequest.extension:Mehrfachverordnung.extension:Nummerierung.value[x]:valueRatio.numerator`)
- Gesamtzahl der Teilverordnungen in der Mehrfachverordnung (`MedicationRequest: extension Mehrfachverordnung.extension: Nummerierung.value[x]:valueRatio.denominator`)
- Start der Gültigkeit (`MedicationRequest.extension: Mehrfachverordnung extension: Zeitraum.value[x]:valuePeriod.start`)
- Ende der Gültigkeit (`MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end`) 

angegeben.

Jede Teilverordnung einer Mehrfachverordnung wird im E-Rezept-Fachdienst mit einem eigenen Workflow (Task) verwaltet. Dies ermöglicht den Versicherten und den Apotheken eine separate Verarbeitung jedes E-Rezepts einer Mehrfachverordnung.

<!-- UC 2.5 - E-Rezept durch Verordnenden loeschen -->
{% assign use_case = use_cases | where: "title", "UC 2.5 - E-Rezept durch Verordnenden loeschen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 3.1 - E-Rezepte durch Versicherten abrufen -->
{% assign use_case = use_cases | where: "title", "UC 3.1 - E-Rezepte durch Versicherten abrufen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 3.2 - E-Rezept durch Versicherten loeschen -->
{% assign use_case = use_cases | where: "title", "UC 3.2 - E-Rezept durch Versicherten loeschen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 3.3 - Nachricht durch Versicherten uebermitteln -->
{% assign use_case = use_cases | where: "title", "UC 3.3 - Nachricht durch Versicherten uebermitteln" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 3.4 - Nachrichten durch Versicherten empfangen -->
{% assign use_case = use_cases | where: "title", "UC 3.4 - Nachrichten durch Versicherten empfangen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 3.8 - Nachricht durch Versicherten loeschen -->
{% assign use_case = use_cases | where: "title", "UC 3.8 - Nachricht durch Versicherten loeschen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 4.6 - Nachrichten durch Abgebenden empfangen -->
{% assign use_case = use_cases | where: "title", "UC 4.6 - Nachrichten durch Abgebenden empfangen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 4.1 - E-Rezept durch Abgebenden abrufen -->
{% assign use_case = use_cases | where: "title", "UC 4.1 - E-Rezept durch Abgebenden abrufen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 4.2 - E-Rezept durch Abgebenden zurueckgeben -->
{% assign use_case = use_cases | where: "title", "UC 4.2 - E-Rezept durch Abgebenden zurueckgeben" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 4.3 - E-Rezept durch Abgebenden loeschen -->
{% assign use_case = use_cases | where: "title", "UC 4.3 - E-Rezept durch Abgebenden loeschen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 4.4 - Quittung abrufen -->
{% assign use_case = use_cases | where: "title", "UC 4.4 - Quittung abrufen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 4.5 - Abgabedatensatz durch Abgebenden signieren -->
{% assign use_case = use_cases | where: "title", "UC 4.5 - Abgabedatensatz durch Abgebenden signieren" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 4.8 - Quittung erneut abrufen -->
{% assign use_case = use_cases | where: "title", "UC 4.8 - Quittung erneut abrufen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 4.7 - Nachricht durch Abgebenden uebermitteln -->
{% assign use_case = use_cases | where: "title", "UC 4.7 - Nachricht durch Abgebenden uebermitteln" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 4.9 - Nachricht durch Abgebenden loeschen -->
{% assign use_case = use_cases | where: "title", "UC 4.9 - Nachricht durch Abgebenden loeschen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- E-Rezept erstellen -->
{% assign use_case = use_cases | where: "title", "E-Rezept erstellen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- E-Rezept qualifiziert signieren -->
{% assign use_case = use_cases | where: "title", "E-Rezept qualifiziert signieren" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

- Die QES-Erstellung erfolgt im Primaersystem (HBA/Konnektor) vor dem Aufruf von `$activate`.

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- E-Rezept vervollständigen und Task aktivieren -->
{% assign use_case = use_cases | where: "title", "E-Rezept vervollständigen und Task aktivieren" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- E-Rezept abrufen (Apotheke) -->
{% assign use_case = use_cases | where: "title", "E-Rezept abrufen (Apotheke)" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- E-Rezept erneut abrufen -->
{% assign use_case = use_cases | where: "title", "E-Rezept erneut abrufen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- E-Rezept-Abgabe zeitnah dokumentieren -->
{% assign use_case = use_cases | where: "title", "E-Rezept-Abgabe zeitnah dokumentieren" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- E-Rezept-Abgabe vollziehen -->
{% assign use_case = use_cases | where: "title", "E-Rezept-Abgabe vollziehen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- E-Rezept loeschen -->
{% assign use_case = use_cases | where: "title", "E-Rezept löschen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}
