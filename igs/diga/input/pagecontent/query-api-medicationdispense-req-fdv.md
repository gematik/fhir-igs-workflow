Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `MedicationDispense`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

{% include core.query-api-medicationdispense-req-fdv.md %}

### Modulspezifische Anforderungen

Der Kostenträger stellt die Abgabeinformationen beim Abschluss des Workflows zur Verordnung ein. Der Task hat dann den Status "completed".

<!-- A_26013 -->
<requirement conformance="MAY" key="IG-TIFlow-DiGA-31" title="E-Rezept-FdV: Abgabeinformationen abfragen - Flowtyp 162 - Anzeige des Freischaltcodes" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FdV">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das E-Rezept-FdV MUSS im Anwendungsfall "Abgabeinformationen abfragen" dem Nutzer Abgabeinformationen eines Tasks mit Flowtyp 162 den Freischaltcode in geeigneter Weise darstellen.
</requirement>

<!-- A_26340 -->
<requirement conformance="MAY" key="IG-TIFlow-DiGA-31" title="E-Rezept-FdV: Abgabeinformationen abfragen - Flowtyp 162 - Supportinformationen für DiGA-App" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FdV">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das E-Rezept-FdV MUSS im Anwendungsfall "Abgabeinformationen abfragen" dem Nutzer zusammen mit den Abgabeinformationen zu einer DiGA-App Supportinformationen zu der DiGA-App anzeigen.
</requirement>

Supportinformationen zu DiGA-Apps sind im BfArM-Verzeichnis verfügbar.