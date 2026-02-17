### Ablaufdiagramm

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
    {% include ablaufdiagramm-diga.svg %}
    </div>
    <figcaption><strong>Abbildung: Ablaufdiagramm DiGA-Verordnung</strong>ablaufdiagramm-diga</figcaption>
</figure>


### Technische Anwendungsfälle

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
