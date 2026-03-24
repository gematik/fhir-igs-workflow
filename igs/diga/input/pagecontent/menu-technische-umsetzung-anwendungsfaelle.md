{% assign use_cases = site.data['gen-use-cases'] %}
{% assign roles = site.data['roles'] %}

### Ablaufdiagramm Verordnung von DiGAs

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
    {% include diga-ablaufdiagramm.svg %}
    </div>
    <figcaption><strong>Abbildung: </strong>Ablaufdiagramm DiGA-Verordnung</figcaption>
</figure>


### Umzusetzende Anwendungsfälle von Clients

Die folgenden Abschnitte beschreiben die technischen Anwendungsfälle, die für das Modul der Verordnung von digitalen Gesundheitsanwendungen genutzt werden.

#### PS verordnende LEI

<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-12" title="PS verordnende LEI: TIFlow-DIGA - verpflichtende Anwendungsfälle" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das PS der verordnenden LEI MUSS für die Umsetzung der Verordnung von DiGAs die Anwendungsfälle
    <ul>
        <li>UC 2.1 - E-Rezepte erzeugen</li>
        <li>E-Rezept qualifiziert signieren</li>
        <li>UC 2.3 - E-Rezept einstellen</li>
        <li>UC 2.5 - E-Rezept durch Verordnenden löschen</li>
    </ul>
    umsetzen.
</requirement>

#### E-Rezept-FdV 

<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-13" title="E-Rezept-FdV: TIFlow-DIGA - verpflichtende Anwendungsfälle" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das E-Rezept-FdV MUSS für die Umsetzung der Nutzung von Verordnungen von DiGAs die Anwendungsfälle
    <ul>
        <li>UC 3.1 – E-Rezepte durch Versicherten abrufen</li>
        <li>UC 3.2 – E-Rezept durch Versicherten löschen</li>
        <li>Kostenträger suchen</li>
        <li>UC 3.3 – Nachricht durch Versicherten übermitteln</li>
        <li>UC 3.4 – Nachricht durch Versicherten empfangen</li>
        <li>UC 3.8 – Nachricht durch Versicherten löschen</li>
        <li>UC 3.5 - Protokolldaten abrufen</li>
    </ul>
    umsetzen.
</requirement>

#### Clientsystem Kostenträger

<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-14" title="CS Kostenträger: TIFlow-DIGA - verpflichtende Anwendungsfälle" version="0">
    <meta lockversion="false"/>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das Clientsystem des Kostenträgers MUSS für die Umsetzung der Verordnung von DiGAs die Anwendungsfälle
    <ul>
        <li>UC 4.1 - E-Rezept durch Abgebenden abrufen</li>
        <li>UC 4.2 - E-Rezept durch Abgebenden zurückgeben</li>
        <li>UC 4.4 - Quittung abrufen</li>
        <li>UC 4.17 - Verordnung erneut abrufen</li>
        <li>UC 4.8 - Quittung erneut abrufen</li>
        <li>UC 4.6 - Nachrichten durch Abgebenden empfangen</li>
        <li>UC 4.7 - Nachricht durch Abgebenden übermitteln</li>
        <li>UC 4.9 - Nachricht durch Abgebenden löschen</li>
    </ul>
    umsetzen.
</requirement>


### Technische Use Cases

#### Verordnende Leistungserbringerinstitution

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

#### Versicherter

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
{% assign use_case = use_cases | where: "id", "UC_3_3_Nachricht_durch_Versicherten_uebermitteln" | first %}

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
korrekte Telematik-ID in ihren Apps vorab festlegen können. 

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


#### Kostenträger

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

<!-- UC 4.17 - Verordnung erneut abrufen -->
{% assign use_case = use_cases | where: "title", "UC 4.17 - Verordnung erneut abrufen" | first %}

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

<!-- UC 4.9 - Nachricht durch Abgebenden löschen -->
{% assign use_case = use_cases | where: "title", "UC 4.9 - Nachricht durch Abgebenden löschen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}