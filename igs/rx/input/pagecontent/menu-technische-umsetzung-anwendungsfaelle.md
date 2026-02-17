{% assign use_cases = site.data['use-cases'] %}
{% assign roles = site.data['roles'] %}

Diese Seite beschreibt die technischen Anwendungsfälle, die für das Modul der verordnung von Arzneimitteln genutzt werden.

#### Lesezugriffe

- Query auf Aufgabenlisten und Einzelaufgaben: [Query API: Task](./query-api-task.html)

<!-- UC 2.1 - E-Rezepte erzeugen -->
{% assign use_case = use_cases | where: "title", "UC 2.1 - E-Rezepte erzeugen" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

**Sequenzdiagramm:**

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-uc-2-1-e-rezepte-erzeugen.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>UC 2.1 - E-Rezepte erzeugen</figcaption>
</figure>

<!-- UC 2.3 - E-Rezept einstellen -->
{% assign use_case = use_cases | where: "title", "UC 2.3 - E-Rezept einstellen" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

**Sequenzdiagramm:**

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-uc-2-3-e-rezept-einstellen.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>UC 2.3 - E-Rezept einstellen</figcaption>
</figure>

<!-- UC 2.5 - E-Rezept durch Verordnenden loeschen -->
{% assign use_case = use_cases | where: "title", "UC 2.5 - E-Rezept durch Verordnenden loeschen" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

**Sequenzdiagramm:**

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-uc-2-5-e-rezept-durch-verordnenden-loeschen.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>UC 2.5 - E-Rezept durch Verordnenden loeschen</figcaption>
</figure>

<!-- UC 3.1 - E-Rezepte durch Versicherten abrufen -->
{% assign use_case = use_cases | where: "title", "UC 3.1 - E-Rezepte durch Versicherten abrufen" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

**Sequenzdiagramm:**

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-uc-3-1-e-rezepte-durch-versicherten-abrufen.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>UC 3.1 - E-Rezepte durch Versicherten abrufen</figcaption>
</figure>

<!-- UC 3.2 - E-Rezept durch Versicherten loeschen -->
{% assign use_case = use_cases | where: "title", "UC 3.2 - E-Rezept durch Versicherten loeschen" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

**Sequenzdiagramm:**

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-uc-3-2-e-rezept-durch-versicherten-loeschen.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>UC 3.2 - E-Rezept durch Versicherten loeschen</figcaption>
</figure>

<!-- UC 3.3 - Nachricht durch Versicherten uebermitteln -->
{% assign use_case = use_cases | where: "title", "UC 3.3 - Nachricht durch Versicherten uebermitteln" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

**Sequenzdiagramm:**

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-uc-3-3-nachricht-durch-versicherten-uebermitteln.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>UC 3.3 - Nachricht durch Versicherten uebermitteln</figcaption>
</figure>

<!-- UC 3.4 - Nachrichten durch Versicherten empfangen -->
{% assign use_case = use_cases | where: "title", "UC 3.4 - Nachrichten durch Versicherten empfangen" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

**Sequenzdiagramm:**

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-uc-3-4-nachrichten-durch-versicherten-empfangen.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>UC 3.4 - Nachrichten durch Versicherten empfangen</figcaption>
</figure>

<!-- UC 3.8 - Nachricht durch Versicherten loeschen -->
{% assign use_case = use_cases | where: "title", "UC 3.8 - Nachricht durch Versicherten loeschen" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

**Sequenzdiagramm:**

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-uc-3-8-nachricht-durch-versicherten-loeschen.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>UC 3.8 - Nachricht durch Versicherten loeschen</figcaption>
</figure>

<!-- UC 4.6 - Nachrichten durch Abgebenden empfangen -->
{% assign use_case = use_cases | where: "title", "UC 4.6 - Nachrichten durch Abgebenden empfangen" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

**Sequenzdiagramm:**

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-uc-4-6-nachrichten-durch-abgebenden-empfangen.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>UC 4.6 - Nachrichten durch Abgebenden empfangen</figcaption>
</figure>

<!-- UC 4.1 - E-Rezept durch Abgebenden abrufen -->
{% assign use_case = use_cases | where: "title", "UC 4.1 - E-Rezept durch Abgebenden abrufen" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

**Sequenzdiagramm:**

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-uc-4-1-e-rezept-durch-abgebenden-abrufen.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>UC 4.1 - E-Rezept durch Abgebenden abrufen</figcaption>
</figure>

<!-- UC 4.2 - E-Rezept durch Abgebenden zurueckgeben -->
{% assign use_case = use_cases | where: "title", "UC 4.2 - E-Rezept durch Abgebenden zurueckgeben" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

**Sequenzdiagramm:**

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-uc-4-2-e-rezept-durch-abgebenden-zurueckgeben.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>UC 4.2 - E-Rezept durch Abgebenden zurueckgeben</figcaption>
</figure>

<!-- UC 4.3 - E-Rezept durch Abgebenden loeschen -->
{% assign use_case = use_cases | where: "title", "UC 4.3 - E-Rezept durch Abgebenden loeschen" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

**Sequenzdiagramm:**

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-uc-4-3-e-rezept-durch-abgebenden-loeschen.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>UC 4.3 - E-Rezept durch Abgebenden loeschen</figcaption>
</figure>

<!-- UC 4.4 - Quittung abrufen -->
{% assign use_case = use_cases | where: "title", "UC 4.4 - Quittung abrufen" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

**Sequenzdiagramm:**

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-uc-4-4-quittung-abrufen.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>UC 4.4 - Quittung abrufen</figcaption>
</figure>

<!-- UC 4.5 - Abgabedatensatz durch Abgebenden signieren -->
{% assign use_case = use_cases | where: "title", "UC 4.5 - Abgabedatensatz durch Abgebenden signieren" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

**Sequenzdiagramm:**

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-uc-4-5-abgabedatensatz-signieren.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>UC 4.5 - Abgabedatensatz durch Abgebenden signieren</figcaption>
</figure>

<!-- UC 4.8 - Quittung erneut abrufen -->
{% assign use_case = use_cases | where: "title", "UC 4.8 - Quittung erneut abrufen" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

**Sequenzdiagramm:**

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-uc-4-8-quittung-erneut-abrufen.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>UC 4.8 - Quittung erneut abrufen</figcaption>
</figure>

<!-- UC 4.7 - Nachricht durch Abgebenden uebermitteln -->
{% assign use_case = use_cases | where: "title", "UC 4.7 - Nachricht durch Abgebenden uebermitteln" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

**Sequenzdiagramm:**

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-uc-4-7-nachricht-durch-abgebenden-uebermitteln.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>UC 4.7 - Nachricht durch Abgebenden uebermitteln</figcaption>
</figure>

<!-- UC 4.9 - Nachricht durch Abgebenden loeschen -->
{% assign use_case = use_cases | where: "title", "UC 4.9 - Nachricht durch Abgebenden loeschen" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

**Sequenzdiagramm:**

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-uc-4-9-nachricht-durch-abgebenden-loeschen.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>UC 4.9 - Nachricht durch Abgebenden loeschen</figcaption>
</figure>

<!-- E-Rezept erstellen -->
{% assign use_case = use_cases | where: "title", "E-Rezept erstellen" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

**Sequenzdiagramm:**

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-e-rezept-erstellen.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>E-Rezept erstellen</figcaption>
</figure>

<!-- E-Rezept qualifiziert signieren -->
{% assign use_case = use_cases | where: "title", "E-Rezept qualifiziert signieren" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

- Die QES-Erstellung erfolgt im Primaersystem (HBA/Konnektor) vor dem Aufruf von `$activate`.

**Sequenzdiagramm:**

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-e-rezept-qualifiziert-signieren.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>E-Rezept qualifiziert signieren</figcaption>
</figure>

<!-- E-Rezept vervollständigen und Task aktivieren -->
{% assign use_case = use_cases | where: "title", "E-Rezept vervollständigen und Task aktivieren" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

**Sequenzdiagramm:**

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-e-rezept-vervollstaendigen-aktivieren.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>E-Rezept vervollständigen und Task aktivieren</figcaption>
</figure>

<!-- E-Rezept abrufen (Apotheke) -->
{% assign use_case = use_cases | where: "title", "E-Rezept abrufen (Apotheke)" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

**Sequenzdiagramm:**

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-e-rezept-in-abgabe-nehmen.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>E-Rezept abrufen (Apotheke)</figcaption>
</figure>

<!-- E-Rezept erneut abrufen -->
{% assign use_case = use_cases | where: "title", "E-Rezept erneut abrufen" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

**Sequenzdiagramm:**

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-e-rezept-erneut-abrufen.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>E-Rezept erneut abrufen</figcaption>
</figure>

<!-- E-Rezept-Abgabe zeitnah dokumentieren -->
{% assign use_case = use_cases | where: "title", "E-Rezept-Abgabe zeitnah dokumentieren" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

**Sequenzdiagramm:**

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-e-rezept-abgabe-zeitnah-dokumentieren.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>E-Rezept-Abgabe zeitnah dokumentieren</figcaption>
</figure>

<!-- E-Rezept-Abgabe vollziehen -->
{% assign use_case = use_cases | where: "title", "E-Rezept-Abgabe vollziehen" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

**Sequenzdiagramm:**

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-e-rezept-abgabe-vollziehen.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>E-Rezept-Abgabe vollziehen</figcaption>
</figure>

<!-- E-Rezept loeschen -->
{% assign use_case = use_cases | where: "title", "E-Rezept löschen" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

**Sequenzdiagramm:**

<figure>
	<div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-e-rezept-loeschen.svg %}
	</div>
	<figcaption><strong>Abbildung: </strong>E-Rezept löschen</figcaption>
</figure>
