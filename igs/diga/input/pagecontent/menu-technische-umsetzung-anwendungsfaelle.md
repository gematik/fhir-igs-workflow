{% assign use_cases = site.data['gen-use-cases'] %}
{% assign roles = site.data['roles'] %}

### Ablaufdiagramm

<figure>
    <div class="gem-ig-img-container" style="--box-width: 400px; margin-bottom: 30px;">
    {% include diga-ablaufdiagramm.svg %}
    </div>
    <figcaption><strong>Abbildung: </strong>Ablaufdiagramm DiGA-Verordnung</figcaption>
</figure>


### Technische Anwendungsfälle

#### Anwendungsfälle im Rahmen der Verordnung

Die Prozesse des verordnenden Leistungserbringers, welche für die Übermittlung von
ärztlichen und zahnärztlichen Verordnungen für apothekenpflichtige Arzneimittel
konzipiert wurden, werden ebenso für die Verordnung von DiGAs genutzt.

Folgende Anwendungsfälle werden genutzt:
- UC 2.1 - E-Rezepte erzeugen
- E-Rezept qualifiziert signieren
- UC 2.3 - E-Rezept einstellen
- UC 2.5 - E-Rezept durch Verordnenden löschen

<!-- UC 2.1 - E-Rezepte erzeugen -->
{% assign use_case = use_cases | where: "title", "UC 2.1 - E-Rezepte erzeugen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}


<!-- E-Rezept qualifiziert signieren -->
{% assign use_case = use_cases | where: "title", "E-Rezept qualifiziert signieren" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}


<!-- UC 2.3 - E-Rezept einstellen -->
{% assign use_case = use_cases | where: "title", "UC 2.3 - E-Rezept einstellen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}


<!-- UC 2.5 - E-Rezept durch Verordnenden löschen -->
{% assign use_case = use_cases | where: "title", "UC 2.5 - E-Rezept durch Verordnenden löschen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}





#### Anwendungsfälle im Rahmen der Verwaltung durch den Versicherten

Die Prozesse des Versicherten für die Einsichtnahme in die Verordnungen, das
Übermitteln der Verordnung an den Kostenträger und die Kommunikation mit dem
Kostenträger, entsprechen denen welche für die Übermittlung von ärztlichen und
zahnärztlichen Verordnungen für apothekenpflichtige Arzneimittel konzipiert wurden.

Folgende Anwendungsfälle werden genutzt:
- UC 3.1 - E-Rezepte durch Versicherten abrufen
- UC 3.2 - E-Rezept durch Versicherten löschen
- UC 3.3 - Nachricht durch Versicherten übermitteln
- Kostenträger suchen
- UC 3.4 - Nachrichten durch Versicherten empfangen
- UC 3.8 - Nachricht durch Versicherten löschen
- UC 3.5 - Protokolldaten abrufen

<!-- UC 3.1 - E-Rezepte durch Versicherten abrufen -->
{% assign use_case = use_cases | where: "title", "UC 3.1 - E-Rezepte durch Versicherten abrufen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 3.2 - E-Rezept durch Versicherten löschen -->
{% assign use_case = use_cases | where: "title", "UC 3.2 - E-Rezept durch Versicherten löschen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 3.3 - Nachricht durch Versicherten übermitteln -->
{% assign use_case = use_cases | where: "title", "UC 3.3 - Nachricht durch Versicherten übermitteln" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

Für das Übermitteln der Verordnung wird als Adressat der Kostenträger ausgewählt. Bei
der Umsetzung im E-Rezept-FdV kann die Auswahl automatisiert erfolgen.

##### Ermitteln der Telematik-ID des Kostenträgers

Damit das E-Rezept-FdV der gematik "UC 3.3 - Nachricht durch Versicherten übermitteln"
ausführen kann, muss es zunächst die Telematik-ID des Kostenträgers als
Empfängeradresse der Nachricht ermitteln.

Das E-Rezept-FdV benötigt das Haupt-Institutionskennzeichen (IK) des Kostenträgers.
Dieses IK wird über die Authentifizierungsmethoden des E-Rezept-FdV bereitgestellt.
Das E-Rezept-FdV erhält sowohl bei der Authentifizierung mittels eGK, wie auch mittels
sektoralem IDP (GesundheitsID) einen ACCESS_TOKEN vom E-Rezept Authorization Server
(Teil des IDP-Dienstes) ausgestellt. Dieser ACCESS_TOKEN enthält das IK des Kostenträgers.

Sobald dem E-Rezept-FdV das IK vorliegt, sucht es im FHIR-VZD nach der Telematik-ID
des Kostenträgers mithilfe des IK.

Dieser Fall ist für die E-Rezept-FdVs der Krankenkassen nicht relevant, da diese die
korrekte Telematik-ID in ihren Apps vorab festlegen können. Sollte jedoch eine
Vertreterfunktion implementiert werden, wird dieser Fall auch für sie relevant.

##### Fallback bei Fehlern und fehlenden Informationen 

Falls es dem E-Rezept-FdV nicht möglich ist, das IK oder die Telematik-ID des
Kostenträgers zu bestimmen, soll der Versicherte dennoch die Möglichkeit haben, seine
DiGA Verordnung zuzuweisen.

Hierzu zeigt das E-Rezept-FdV dem Versicherten alle Kostenträgereinträge des FHIR-VZD
mit oid_kostentraeger, die eine IKNR und Telematik-ID haben. Der Versicherte wählt die
Krankenkasse aus, bei der er versichert ist und kann so die Einlösung vornehmen.

##### Zuweisen der Verordnung durch den Versicherten

Sobald die Telematik-ID im E-Rezept-FdV vorliegt, kann der Versicherte die Verordnung
seinem Kostenträger zuweisen. Hierzu wird eine Communication
(GEM_ERP_PR_Communication_DispReq) erstellt und der E-Rezept-Token eingebettet. 
Beim Zuweisen im Rahmen einer DiGA-Verordnung wird kein Payload mit Zusatzinformationen wie bspw. Kontaktdaten und Belieferungsoptionen übertragen.

<!-- UC 3.4 - Nachrichten durch Versicherten empfangen -->
{% assign use_case = use_cases | where: "title", "UC 3.4 - Nachrichten durch Versicherten empfangen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 3.8 - Nachricht durch Versicherten löschen -->
{% assign use_case = use_cases | where: "title", "UC 3.8 - Nachricht durch Versicherten löschen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}


#### Anwändungsfälle im Rahmen des Einlösens durch Kostenträger

Die Prozesse des Kostenträgers für das Abrufen und Verarbeiten der Verordnung orientieren sich an den Prozessen der abgebenden Leistungserbringerinstitutionen bei Verordnungen für
apothekenpflichtige Arzneimitteln.

Folgende Anwendungsfälle werden genutzt:
- UC 4.6 - Nachrichten durch Abgebenden empfangen
- UC 4.7 - Nachricht durch Abgebenden übermitteln
- UC 4.1 - E-Rezept durch Abgebenden abrufen
- UC 4.2 - E-Rezept durch Abgebenden zurückgeben
- UC 4.4 - Quittung abrufen
- Recovery Secret
- UC 4.8 - Quittung erneut abrufen

<!-- UC 4.6 - Nachrichten durch Abgebenden empfangen -->
{% assign use_case = use_cases | where: "title", "UC 4.6 - Nachrichten durch Abgebenden empfangen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}


<!-- UC 4.7 - Nachricht durch Abgebenden übermitteln -->
{% assign use_case = use_cases | where: "title", "UC 4.7 - Nachricht durch Abgebenden übermitteln" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 4.1 - E-Rezept durch Abgebenden abrufen -->
{% assign use_case = use_cases | where: "title", "UC 4.1 - E-Rezept durch Abgebenden abrufen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 4.2 - E-Rezept durch Abgebenden zurückgeben -->
{% assign use_case = use_cases | where: "title", "UC 4.2 - E-Rezept durch Abgebenden zurückgeben" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 4.4 - Quittung abrufen -->
{% assign use_case = use_cases | where: "title", "UC 4.4 - Quittung abrufen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 4.8 - Quittung erneut abrufen -->
{% assign use_case = use_cases | where: "title", "UC 4.8 - Quittung erneut abrufen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}
