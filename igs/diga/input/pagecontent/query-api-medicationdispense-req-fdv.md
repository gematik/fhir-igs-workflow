Diese Seite beschreibt Anforderungen an das TI-Flow-FdV zur Nutzung der `MedicationDispense`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/{{ site.data.constants.tiflow_core_version }}/menu-schnittstellen-query-api.html)

### Modulspezifische Anforderungen

Der Kostenträger stellt die Abgabeinformationen beim Abschluss des Workflows zur Verordnung ein. Der Task hat dann den Status "completed".

<!-- A_26013 -->
<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-A25" title="TI-Flow-FdV: Abgabeinformationen abfragen - Flowtyp 162 - Anzeige des Freischaltcodes" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FdV" description="TI-Flow-Frontend des Versicherten">
    <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
  </actor>
  Das TI-Flow-FdV MUSS im Anwendungsfall "Abgabeinformationen abfragen" für einen Task mit Flowtyp 162 dem Nutzer den Freischaltcode den Freischaltcode in geeigneter Weise darstellen.
</requirement>

<!-- A_26340 -->
<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-A26" title="TI-Flow-FdV: Abgabeinformationen abfragen - Flowtyp 162 - Supportinformationen für DiGA-App" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FdV" description="TI-Flow-Frontend des Versicherten">
    <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
  </actor>
  Das TI-Flow-FdV MUSS im Anwendungsfall "Abgabeinformationen abfragen" für einen Task mit Flowtyp 162 dem Nutzer Supportinformationen zu der DiGA-App zusammen mit dem Freischaltcode anzeigen.
</requirement>

Supportinformationen zu DiGA-Apps sind im BfArM-Verzeichnis verfügbar.