{% assign use_cases = site.data['gen-use-cases'] %}
{% assign roles = site.data['roles'] %}

Diese Seite beschreibt die technischen Anwendungsfälle, die für das Modul der Verordnung von Arzneimitteln genutzt werden.

### Umzusetzende Anwendungsfälle von Clients

#### PS verordnende LEI

<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A71" title="PS verordnende LEI: TIFlow-RX - verpflichtende Anwendungsfälle" version="0">
    <meta lockversion="false"/>
    <actor name="PS_TI-Flow_verordnend" description="PS-Schnittstelle für TI-Flow/verordnendes System">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
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

#### TI-Flow-FdV 

<!-- A_19443 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A72" title="TI-Flow-FdV: TIFlow-RX - verpflichtende Anwendungsfälle" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FdV" description="TI-Flow-Frontend des Versicherten">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Das TI-Flow-FdV MUSS für die Umsetzung der Nutzung von E-Rezepten für Arzneimittel die Anwendungsfälle
    <ul>
        <li>UC 3.1 - E-Rezepte durch Versicherten abrufen</li>
        <li>UC 3.2 - E-Rezept durch Versicherten löschen</li>
        <li>UC 3.3 - Nachricht durch Versicherten übermitteln</li>
        <li>UC 3.4 - Nachricht durch Versicherten empfangen</li>
        <li>UC 3.8 - Nachricht durch Versicherten löschen</li>
        <li>UC 3.5 - Protokolldaten abrufen</li>
    </ul>
    umsetzen.
</requirement>

<!-- A_19443 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A247" title="TI-Flow-FdV: TIFlow-EU - optionale Anwendungsfälle" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FdV" description="TI-Flow-Frontend des Versicherten">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Das TI-Flow-FdV MUSS für die Umsetzung der Bedienung von E-Rezepten im EU Kontext die Anwendungsfälle

    <ul>
    <li>UC 3.13 - Einwilligung einsehen</li>
    <li>UC 3.14 - Einwilligung erteilen</li>
    <li>UC 3.15 - Einwilligung widerrufen</li>
    <li>UC 3.16 - Zugriffsberechtigung durch Versicherten erstellen</li>
    <li>UC 3.17 - Zugriffsberechtigung durch Versicherten löschen</li>
    <li>UC 3.18 - Zugriffsberechtigung durch Versicherten einsehen</li>
    <li>Zugriffsberechtigung anzeigen</li>
    <li>UC 3.19 - E-Rezept durch den Versicherten markieren</li>
    </ul>

    umsetzen.
</requirement>

#### PS abgebende LEI

<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A73" title="PS abgebende LEI: TIFlow-RX - verpflichtende Anwendungsfälle" version="0">
    <meta lockversion="false"/>
    <actor name="PS_TI-Flow_Apotheke" description="PS-Schnittstelle für TI-Flow/Apotheke">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
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

<requirement conformance="SHOULD" key="IG-TIFLOW-ERP-A74" title="PS abgebende LEI: TIFlow-RX - empfohlene Anwendungsfälle" version="0">
    <meta lockversion="false"/>
    <actor name="PS_TI-Flow_Apotheke" description="PS-Schnittstelle für TI-Flow/Apotheke">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
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

Jede Teilverordnung einer Mehrfachverordnung wird im TI-Flow-Fachdienst mit einem eigenen Workflow (Task) verwaltet. Dies ermöglicht den Versicherten und den Apotheken eine separate Verarbeitung jedes E-Rezepts einer Mehrfachverordnung.

<!-- UC 2.5 - E-Rezept durch Verordnenden löschen -->
{% assign use_case = use_cases | where: "title", "UC 2.5 - E-Rezept durch Verordnenden löschen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- 169 - E-Rezept erzeugen -->
{% assign use_case = use_cases | where: "title", "E-Rezept für Workflow 169 durch Verordnenden erzeugen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- 169 - E-Rezept übermitteln -->
{% assign use_case = use_cases | where: "title", "E-Rezept-Token an Apotheker übermitteln" | first %}

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

<!-- UC 3.9 - Dispensierinformationen durch Versicherten abrufen -->
{% assign use_case = use_cases | where: "title", "UC 3.9 - Dispensierinformationen durch Versicherten abrufen" | first %}

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

Wenn ein AVS eine Teilverordnung abruft, deren Einlösezeitraum noch nicht erreicht ist, dann liefert der TI-Flow-Fachdienst einen Fehler 403. Im OperationOutcome der Fehlermeldung liefert der TI-Flow-Fachdienst das Datum des Beginns der Einlösefrist.

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

#### Use Cases zur Verwaltung der Einwilligung durch den Versicherten

<!-- UC 3.13 - Einwilligung einsehen -->
{% assign use_case = use_cases | where: "id", "UC_3_13_Einwilligungen_einsehen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 3.14 - Einwilligung erteilen -->
{% assign use_case = use_cases | where: "id", "UC_3_14_Einwilligung_erteilen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 3.15 - Einwilligung widerrufen -->
{% assign use_case = use_cases | where: "id", "UC_3_15_Einwilligung_widerrufen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

#### Use Cases zur Verwaltung der Zugriffsberechtigung durch den Versicherten

<!-- UC 3.16 - Zugriffsberechtigung durch Versicherten erstellen -->
{% assign use_case = use_cases | where: "id", "UC_3_16_Zugriffsberechtigung_erstellen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 3.17 - Zugriffsberechtigung durch Versicherten löschen -->
{% assign use_case = use_cases | where: "id", "UC_3_17_Zugriffsberechtigung_loeschen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 3.18 - Zugriffsberechtigung durch Versicherten einsehen -->
{% assign use_case = use_cases | where: "id", "UC_3_18_Zugriffsberechtigung_einsehen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

#### Zugriffsberechtigung anzeigen


<!--A_27116 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A248" title="TI-Flow-FdV: Zugriffsberechtigung anzeigen" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FdV" description="TI-Flow-Frontend des Versicherten">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Das TI-Flow-FdV MUSS im Anwendungsfall "Zugriffsberechtigung anzeigen" folgende Informationen auf dem Display anzeigen: 
    <ul>
    <li>Name des Landes,</li>
    <li>Gültigkeitsende,</li>
    <li>Zugriffscode,</li>
    <li>KVNR des Versicherten.</li>
    </ul>
</requirement>

Für die Anzeige der Gültigkeitsdauer ist die Zeitzone zu beachten, in der der Nutzer sich befindet.

Das TI-Flow-FdV MUSS bei der Anzeige des Zugriffscodes die Lesbarkeit der Zeichen des Zugriffscodes sicherstellen.

Hinweis: Mit Lesbarkeit ist das Erkennen und Unterscheiden einzelner Buchstaben und Ziffern gemeint, d.h. die Unterscheidbarkeit von beispielsweise von 0 (Null) und O (Großbuchstabe O), sowie I (Großbuchstabe i) und l (Kleinbuchstabe L) und 1 (Ziffer Eins).

Das TI-Flow-FdV MUSS die Gültigkeitsdauer der Zugriffsberechtigung auf dem Display hervorheben, wenn die Gültigkeitsdauer 10 Minuten unterschreitet.

Das TI-Flow-FdV MUSS, wenn die Gültigkeit der Zugriffsberechtigung zeitlich abgelaufen ist, den Versicherten informieren.

Hinweis: Es reicht aus, dass die Information über den Ablauf der Zugriffsberechtigung nur angezeigt wird, während der Nutzer auf dem Gerät aktiv ist.

Der zeitliche Ablauf der Zugriffsberechtigung wird nicht durch den TI-Flow-Fachdienst signalisiert.


#### Use Cases zur Verwaltung der E-Rezepte durch den Versicherten

<!-- UC 3.19 - E-Rezept durch den Versicherten markieren -->
{% assign use_case = use_cases | where: "id", "UC_3_19_e_rezept_markieren" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

#### Use Cases im Rahmen der Belieferung durch eine Apotheke im europäischen Ausland

<!-- UC 4.19 - Demographische Daten eines Versicherten abrufen -->
{% assign use_case = use_cases | where: "id", "UC_4_19_Demographische_Daten_abrufen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 4.20 - Liste der einlösbaren E-Rezepte eines Versicherten abrufen -->
{% assign use_case = use_cases | where: "id", "UC_4_20_Liste_Einloesbare_Abrufen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 4.21 - Liste ausgewählter E-Rezepte eines Versicherten abrufen -->
{% assign use_case = use_cases | where: "id", "UC_4_21_Liste_Ausgewaehlte_Abrufen" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 4.22 - Abgabe eines E-Rezeptes im europäischen Ausland -->
{% assign use_case = use_cases | where: "id", "UC_4_22_Abgabe_EU" | first %}

<a id="{{ use_case.anchor }}"></a>
##### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

*Hinweis: Für den Anwendungsfall "Abgabe von E-Rezepten im europäischen Ausland" wird angenommen, dass die vollständigen Dispensierinformationen zu einer ePrescription (E-Rezept) in genau einem eDispensation Dokument (CDA) vom LE-EU übermittelt werden.*

Nach der Bereitstellung der Dispensierinformationen im TI-Flow-Fachdienst kann der Versicherte diese mit seinem TI-Flow-FdV herunterladen und anzeigen lassen.

Eine Übermittlung der Dispensierinformationen an den ePA Medication Service ist perspektivisch vorgesehen. Die Funktionalität wird ergänzt, sobald die Voraussetzungen in den verwendeten Datenmodellen geschaffen wurden.
