{% assign use_cases = site.data['gen-use-cases'] %}
{% assign roles = site.data['roles'] %}

### Umzusetzende Anwendungsfälle von Clients

#### E-Rezept-FdV 

<!-- A_19443 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-24" title="E-Rezept-FdV: TIFlow-EU - optionale Anwendungsfälle" version="0">
    <meta lockversion="true"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das E-Rezept-FdV MUSS für die Umsetzung der Bedienung von E-Rezepten im EU Kontext die Anwendungsfälle

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

### Use Cases zur Verwaltung der Einwilligung durch den Versicherten

<!-- UC 3.13 - Einwilligung einsehen -->
{% assign use_case = use_cases | where: "id", "UC_3_13_Einwilligungen_einsehen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 3.14 - Einwilligung erteilen -->
{% assign use_case = use_cases | where: "id", "UC_3_14_Einwilligung_erteilen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 3.15 - Einwilligung widerrufen -->
{% assign use_case = use_cases | where: "id", "UC_3_15_Einwilligung_widerrufen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

### Use Cases zur Verwaltung der Zugriffsberechtigung durch den Versicherten

<!-- UC 3.16 - Zugriffsberechtigung durch Versicherten erstellen -->
{% assign use_case = use_cases | where: "id", "UC_3_16_Zugriffsberechtigung_erstellen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 3.17 - Zugriffsberechtigung durch Versicherten löschen -->
{% assign use_case = use_cases | where: "id", "UC_3_17_Zugriffsberechtigung_loeschen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 3.18 - Zugriffsberechtigung durch Versicherten einsehen -->
{% assign use_case = use_cases | where: "id", "UC_3_18_Zugriffsberechtigung_einsehen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

### Zugriffsberechtigung anzeigen


<!--A_27116 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-25" title="E-Rezept-FdV: Zugriffsberechtigung anzeigen" version="0">
    <meta lockversion="true"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Zugriffsberechtigung anzeigen" folgende Informationen auf dem Display anzeigen: 
    <ul>
    <li>Name des Landes,</li>
    <li>Gültigkeitsende,</li>
    <li>Zugriffscode,</li>
    <li>KVNR des Versicherten.</li>
    </ul>
</requirement>

Für die Anzeige der Gültigkeitsdauer ist die Zeitzone zu beachten, in der der Nutzer sich befindet.

Das E-Rezept-FdV MUSS bei der Anzeige des Zugriffscodes die Lesbarkeit der Zeichen des Zugriffscodes sicherstellen.

Hinweis: Mit Lesbarkeit ist das Erkennen und Unterscheiden einzelner Buchstaben und Ziffern gemeint, d.h. die Unterscheidbarkeit von beispielsweise von 0 (Null) und O (Großbuchstabe O), sowie I (Großbuchstabe i) und l (Kleinbuchstabe L) und 1 (Ziffer Eins).

Das E-Rezept-FdV MUSS die Gültigkeitsdauer der Zugriffsberechtigung auf dem Display hervorheben, wenn die Gültigkeitsdauer 10 Minuten unterschreitet.

Das E-Rezept-FdV MUSS, wenn die Gültigkeit der Zugriffsberechtigung zeitlich abgelaufen ist, den Versicherten informieren.

Hinweis: Es reicht aus, dass die Information über den Ablauf der Zugriffsberechtigung nur angezeigt wird, während der Nutzer auf dem Gerät aktiv ist.

Der zeitliche Ablauf der Zugriffsberechtigung wird nicht durch den TI-Flow-Fachdienst signalisiert.


### Use Cases zur Verwaltung der E-Rezepte durch den Versicherten

<!-- UC 3.19 - E-Rezept durch den Versicherten markieren -->
{% assign use_case = use_cases | where: "id", "UC_3_19_e_rezept_markieren" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

### Use Cases im Rahmen der Belieferung durch eine Apotheke im europäischen Ausland

<!-- UC 4.19 - Demographische Daten eines Versicherten abrufen -->
{% assign use_case = use_cases | where: "id", "UC_4_19_Demographische_Daten_abrufen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 4.20 - Liste der einlösbaren E-Rezepte eines Versicherten abrufen -->
{% assign use_case = use_cases | where: "id", "UC_4_20_Liste_Einloesbare_Abrufen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 4.21 - Liste ausgewählter E-Rezepte eines Versicherten abrufen -->
{% assign use_case = use_cases | where: "id", "UC_4_21_Liste_Ausgewaehlte_Abrufen" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<!-- UC 4.22 - Abgabe eines E-Rezeptes im europäischen Ausland -->
{% assign use_case = use_cases | where: "id", "UC_4_22_Abgabe_EU" | first %}

<a id="{{ use_case.anchor }}"></a>
### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

*Hinweis: Für den Anwendungsfall "Abgabe von E-Rezepten im europäischen Ausland" wird angenommen, dass die vollständigen Dispensierinformationen zu einer ePrescription (E-Rezept) in genau einem eDispensation Dokument (CDA) vom LE-EU übermittelt werden.*

Nach der Bereitstellung der Dispensierinformationen im TI-Flow-Fachdienst kann der Versicherte diese mit seinem E-Rezept-FdV herunterladen und anzeigen lassen.

Eine Übermittlung der Dispensierinformationen an den ePA Medication Service ist perspektivisch vorgesehen. Die Funktionalität wird ergänzt, sobald die Voraussetzungen in den verwendeten Datenmodellen geschaffen wurden.