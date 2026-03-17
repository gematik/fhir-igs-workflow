{% assign use_cases = site.data['gen-use-cases'] %}
{% assign roles = site.data['roles'] %}

### Umzusetzende Anwendungsfälle von Clients

#### E-Rezept-FdV 

<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-24" title="E-Rezept-FdV: TIFlow-EU - optionale Anwendungsfälle" version="0">
    <meta lockversion="false"/>
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

Nach der Bereitstellung der Dispensierinformationen im E-Rezept-Fachdienst kann der Versicherte diese mit seinem E-Rezept-FdV herunterladen und anzeigen lassen.

Eine Übermittlung der Dispensierinformationen an den ePA Medication Service ist perspektivisch vorgesehen. Die Funktionalität wird ergänzt, sobald die Voraussetzungen in den verwendeten Datenmodellen geschaffen wurden.