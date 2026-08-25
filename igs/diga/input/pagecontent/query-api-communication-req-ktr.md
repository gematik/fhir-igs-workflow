Diese Seite beschreibt Anforderungen an ein Clientsystem des Kostenträgers zur Nutzung der `Communication`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/{{ site.data.constants.tiflow_core_version }}/index.html)

### Modulspezifische Anforderungen


<!-- A_28540 -->
<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-A2" title="CS Kostenträger: Nachricht versenden - Flowtype 162 - Communication erstellen" version="0">
  <meta lockversion="false"/>
  <actor name="CS_E-Rezept_KTR" description="CS-Schnittstelle für E-Rezept/Kostenträger">
    <testProcedure id="Konformitätsbestätigung">funkt. Eignung: Konformitätsbestätigung</testProcedure>
  </actor>
  Das Clientsystem des Kostenträgers MUSS im Anwendungsfall "Nachricht an Versicherten versenden" eine FHIR-Ressource mit dem Profil GEM_ERP_PR_Communication_DiGA erstellen.
</requirement>