Diese Seite beschreibt Anforderungen an ein Clientsystem des Kostenträgers zur Nutzung der `Communication`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

{% include core.query-api-communication-req-ktr.md %}

### Modulspezifische Anforderungen


<!-- A_28540 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-DIGA-2" title="CS Kostenträger: Nachricht versenden - Flowtype 162 - Communication erstellen" version="0">
  <meta lockversion="false"/>
  <actor name="CS_E-Rezept_KTR">
    <testProcedure id="Konformitätsbestätigung"/>
  </actor>
  Das Clientsystem des Kostenträgers MUSS im Anwendungsfall "Nachricht an Versicherten versenden" eine FHIR-Ressource mit dem Profil GEM_ERP_PR_Communication_DiGA erstellen.
</requirement>