{% assign use_cases = site.data['use-cases'] %}
{% assign roles = site.data['roles'] %}

### Ablaufdiagramm

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
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
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}


<!-- E-Rezept qualifiziert signieren -->
{% assign use_case = use_cases | where: "title", "E-Rezept qualifiziert signieren" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}


<!-- UC 2.3 - E-Rezept einstellen -->
{% assign use_case = use_cases | where: "title", "UC 2.3 - E-Rezept einstellen" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}


<!-- UC 2.5 - E-Rezept durch Verordnenden löschen -->
{% assign use_case = use_cases | where: "title", "UC 2.5 - E-Rezept durch Verordnenden löschen" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

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
- UC 3.4 - Nachrichten durch Versicherten empfangen
- UC 3.8 - Nachricht durch Versicherten löschen
- UC 3.5 - Protokolldaten abrufen
- Kostenträger suchen

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

#### Anwändungsfälle im Rahmen des Einlösens durch Kostenträger

Die Prozesse des Kostenträgers für das Abrufen und Verarbeiten der Verordnung orientieren sich an den
Prozessen der abgebenden Leistungserbringerinstitutionen bei Verordnungen für
apothekenpflichtige Arzneimitteln.

Folgende Anwendungsfälle werden genutzt:
- UC 4.6 - Nachrichten durch Abgebenden empfangen
- UC 4.7 Nachricht durch Abgebenden übermitteln
- UC 4.1 - E-Rezept durch Abgebenden abrufen
- UC 4.2 - E-Rezept durch Abgebenden zurückgeben
- UC 4.4 - Quittung abrufen
- Recovery Secret
- Quittung erneut abrufen

<!-- UC 4.6 - Nachrichten durch Abgebenden empfangen -->
{% assign use_case = use_cases | where: "title", "UC 4.6 - Nachrichten durch Abgebenden empfangen" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}


<!-- UC 4.7 - Nachricht durch Abgebenden übermitteln -->
{% assign use_case = use_cases | where: "title", "UC 4.7 - Nachricht durch Abgebenden übermitteln" | first %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!---

Diese Seite beschreibt die technischen Anwendungsfälle für den DiGA-Workflow. Sie ergänzt die Basis-Anwendungsfälle des E-Rezept-Workflows und fokussiert DiGA-spezifische Besonderheiten.

<a id="e-rezept-erstellen"></a>
#### Verordnung erstellen

Ein Task wird im Workflow-Fachdienst angelegt, um eine Rezept-ID (PrescriptionID) und einen AccessCode zu erhalten. Die technischen Details entsprechen dem Basis-Workflow.

<a id="e-rezept-qualifiziert-signieren"></a>
#### Verordnung qualifiziert signieren

Der Verordnungsdatensatz wird im Primärsystem mittels HBA qualifiziert elektronisch signiert (QES). Die QES-Erzeugung erfolgt über den Konnektor; der signierte Datensatz wird für die Aktivierung vorbereitet.

<a id="e-rezept-vervollstaendigen-und-task-aktivieren"></a>
#### Task aktivieren

Der QES-signierte Verordnungsdatensatz wird am referenzierten Task hinterlegt. Der Workflow-Fachdienst validiert Signatur und Schemakonformitaet und setzt bei Erfolg den Task-Status auf `ready`. DiGA-spezifische Prüfungen sind in [Operation $activate](./op-activate.html) beschrieben.

<a id="diga-e-rezept-zuweisen"></a>
#### DiGA-Verordnung zuweisen

Der Versicherte weist die Verordnung dem Kostenträger zu. Dazu wird eine Communication (GEM_ERP_PR_Communication_DispReq) erstellt. Bei DiGA kann `Communication.payload` entfallen (Kardinalität 0..1). Das E-Rezept-FdV ermittelt die Telematik-ID des Kostenträgers über das FHIR-VZD oder bietet dem Nutzer eine manuelle Auswahl der Kostenträger an.

<a id="diga-e-rezept-abrufen"></a>
#### DiGA-E-Rezept abrufen (Kostenträger)

<requirement conformance="MUST" key="IG-TIFlow-DiGA-18" title="Anwendungsfall E-Rezept durch Abgebenden abrufen (A_18511-01)" version="0">
    <meta lockversion="false"/>
    Der Kostenträger MUSS ein E-Rezept mit Rezept-ID und AccessCode abrufen können. Der E-Rezept-Fachdienst setzt den Status auf "in Abgabe (gesperrt)" und liefert ein Geheimnis zur Statusänderung.
</requirement>

<a id="diga-freischaltcode-bereitstellen"></a>
#### Freischaltcode bereitstellen oder Rückmeldung geben

<requirement conformance="MUST" key="IG-TIFlow-DiGA-19" title="Anwendungsfall Quittung abrufen (A_18514-02)" version="0">
    <meta lockversion="false"/>
    Der Kostenträger MUSS Abgabeinformationen übermitteln und eine Quittung erhalten können. Der E-Rezept-Fachdienst setzt den Status auf "quittiert" und stellt die Abgabeinformation dem Versicherten bereit.
</requirement>

#### Rückgabe bei fehlerhafter Zuweisung

<requirement conformance="MUST" key="IG-TIFlow-DiGA-20" title="Anwendungsfall E-Rezept durch Abgebenden zurückgeben (A_18512-01)" version="0">
    <meta lockversion="false"/>
    Der Kostenträger MUSS eine abgerufene Verordnung zurückgeben können, sodass der Status wieder "offen" ist und der Zugriff protokolliert wird.
</requirement>

#### Nachrichten zwischen Versicherten und Kostenträger

<requirement conformance="MUST" key="IG-TIFlow-DiGA-21" title="Anwendungsfall Nachrichten durch Abgebenden empfangen (A_18617-01)" version="0">
    <meta lockversion="false"/>
    Der Kostenträger MUSS Nachrichten zum Zuweisen vom E-Rezept-Fachdienst abrufen können. In der Nachricht ist der E-Rezept-Token enthalten, der den Abruf der Verordnung legitimiert.
</requirement>

<requirement conformance="MUST" key="IG-TIFlow-DiGA-22" title="Anwendungsfall Nachricht durch Abgebenden übermitteln (A_19013-01)" version="0">
    <meta lockversion="false"/>
    Der Kostenträger MUSS eine Antwortnachricht an den Versicherten einstellen können. Der Versand erfolgt über den E-Rezept-Fachdienst an den Absender der ursprünglichen Nachricht.
</requirement>

-->