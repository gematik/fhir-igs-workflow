{% assign use_cases = site.data['gen-use-cases'] %}
{% assign roles = site.data['roles'] %}

Diese Seite beschreibt die technischen Anwendungsfälle, die für das Modul der Verordnung von Arzneimitteln genutzt werden.

### Umzusetzende Anwendungsfälle von Clients

#### PS verordnende LEI

<requirement conformance="SHALL" key="IG-TIFLOW-ERP-71" title="PS verordnende LEI: TIFlow-RX - verpflichtende Anwendungsfälle" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das PS der verordnenden LEI MUSS für die Umsetzung der Verordnung von E-Rezepten für Arzneimittel die Anwendungsfälle

    <ul>
    <li>UC 2.1 - E-Rezepte erzeugen</li>
    <li>E-Rezept qualifiziert signieren</li>
    <li>UC 2.3 - E-Rezept einstellen</li>
    <li>UC 2.5 - E-Rezept durch Verordnenden löschen</li>
    </ul>

    umsetzen.
</requirement>

#### E-Rezept-FdV 

<!-- A_19443 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-72" title="E-Rezept-FdV: TIFlow-RX - verpflichtende Anwendungsfälle" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das E-Rezept-FdV MUSS für die Umsetzung der Nutzung von E-Rezepten für Arzneimittel die Anwendungsfälle
    <ul>
        <li>UC 3.1 – E-Rezepte durch Versicherten abrufen</li>
        <li>UC 3.6 – E-Rezept durch Vertreter abrufen</li>
        <li>UC 3.2 – E-Rezept durch Versicherten löschen</li>
        <li>UC 3.3 – Nachricht durch Versicherten übermitteln</li>
        <li>UC 3.4 – Nachricht durch Versicherten empfangen</li>
        <li>UC 3.8 – Nachricht durch Versicherten löschen</li>
        <li>UC 3.5 - Protokolldaten abrufen</li>
    </ul>
    umsetzen.
</requirement>

#### PS abgebende LEI

<requirement conformance="SHALL" key="IG-TIFLOW-ERP-73" title="PS abgebende LEI: TIFlow-RX - verpflichtende Anwendungsfälle" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das PS der abgebenden LEI MUSS für die Umsetzung der Belieferung von E-Rezepten für Arzneimittel die Anwendungsfälle
    <ul>
        <li>UC 4.15 - Einlösbare E-Rezepte durch Abgebenden abrufen</li>
        <li>UC 4.1 - E-Rezept durch Abgebenden abrufen</li>
        <li>UC 4.2 - E-Rezept durch Abgebenden zurückgeben</li>
        <li>UC 4.3 - E-Rezept durch Abgebenden löschen</li>
        <li>UC 4.4 - Quittung abrufen</li>
        <li>UC 4.5 - Abgabedatensatz durch Abgebenden signieren</li>
        <li>UC 4.17 - Verordnung erneut abrufen</li>
        <li>UC 4.8 - Quittung erneut abrufen</li>
        <li>UC 4.6 - Nachrichten durch Abgebenden empfangen</li>
        <li>UC 4.7 - Nachricht durch Abgebenden übermitteln</li>
        <li>UC 4.9 - Nachricht durch Abgebenden löschen</li>
    </ul>
    umsetzen.
</requirement>

<requirement conformance="SHOULD" key="IG-TIFLOW-ERP-74" title="PS abgebende LEI: TIFlow-RX - empfohlene Anwendungsfälle" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das PS der abgebenden LEI SOLL für die Umsetzung der Belieferung von E-Rezepten für Arzneimittel den Anwendungsfall
    <ul>
    <li>UC 4.16 - Dispensierinformationen bereitstellen</li>
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

- Die QES-Erstellung erfolgt im Primärsystem (HBA/Konnektor) vor dem Aufruf von `$activate`.

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 2.3 - E-Rezept einstellen -->
{% assign use_case = use_cases | where: "title", "UC 2.3 - E-Rezept einstellen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<b>Technische Aspekte für die Mehrfachverordnung (MVO)</b>

Für jede Teilverordnung einer Mehrfachverordnung wird ein einzelnes E-Rezept erstellt. Im Verordnungsdatensatz wird das E-Rezept als Teil einer Mehrfachverordnung gekennzeichnet (`MedicationRequest: extension:Mehrfachverordnung.extension:Kennzeichen`).

Zusätzlich werden u.a. die Informationen
- Nummer des Rezepts der Mehrfachverordnung (`MedicationRequest.extension:Mehrfachverordnung.extension:Nummerierung.value[x]:valueRatio.numerator`)
- Gesamtzahl der Teilverordnungen in der Mehrfachverordnung (`MedicationRequest: extension Mehrfachverordnung.extension: Nummerierung.value[x]:valueRatio.denominator`)
- Start der Gültigkeit (`MedicationRequest.extension: Mehrfachverordnung extension: Zeitraum.value[x]:valuePeriod.start`)
- Ende der Gültigkeit (`MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end`) 
angegeben.

Jede Teilverordnung einer Mehrfachverordnung wird im E-Rezept-Fachdienst mit einem eigenen Workflow (Task) verwaltet. Dies ermöglicht den Versicherten und den Apotheken eine separate Verarbeitung jedes E-Rezepts einer Mehrfachverordnung.

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
{% assign use_case = use_cases | where: "title", "UC 3.3 - Nachricht durch Versicherten übermitteln" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

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

#### Apotheke

<!-- UC 4.6 - Nachrichten durch Abgebenden empfangen -->
{% assign use_case = use_cases | where: "title", "UC 4.6 - Nachrichten durch Abgebenden empfangen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 4.15 - Einlösbare E-Rezepte durch Abgebenden abrufen -->
{% assign use_case = use_cases | where: "id", "UC_4_15_E_Rezepte_durch_Abgebenden_abrufen_PoPP" | first %}

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

<b>Technische Aspekte für die Mehrfachverordnung (MVO)</b>

Wenn ein AVS eine Teilverordnung abruft, deren Einlösezeitraum noch nicht erreicht ist, dann liefert der E-Rezept-Fachdienst einen Fehler 403. Im OperationOutcome der Fehlermeldung liefert der E-Rezept-Fachdienst das Datum des Beginns der Einlösefrist.

Für die QES-Prüfung wird die PKCS#7-Datei verwendet. Die Verordnungsdaten des E-Rezepts sind innerhalb der PKCS#7-Datei enthalten und müssen für die Weiterverarbeitung extrahiert werden.

<!-- UC 4.2 - E-Rezept durch Abgebenden zurückgeben -->
{% assign use_case = use_cases | where: "title", "UC 4.2 - E-Rezept durch Abgebenden zurückgeben" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 4.3 - E-Rezept durch Abgebenden löschen -->
{% assign use_case = use_cases | where: "title", "UC 4.3 - E-Rezept durch Abgebenden löschen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 4.16 - Dispensierinformationen bereitstellen -->
{% assign use_case = use_cases | where: "title", "UC 4.16 - Dispensierinformationen bereitstellen" | first %}

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

<!-- UC 4.5 - Abgabedatensatz durch Abgebenden signieren -->
{% assign use_case = use_cases | where: "title", "UC 4.5 - Abgabedatensatz durch Abgebenden signieren" | first %}

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

