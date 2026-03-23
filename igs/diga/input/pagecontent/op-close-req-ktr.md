Diese Seite enthält die normativen Anforderungen an ein Clientsystem des Kostenträgers für die Operation `$close`.

### Anforderungen aus der Core Spezifikation

{% include core.op-close-req-ktr.md %}

### Modulspezifische Anforderungen

<!-- A_26004-01 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-DIGA-27" title="CS Kostenträger: Dispensierinformationen - Flowtype 162 - MedicationDispense erstellen" version="0">
  <meta lockversion="false"/>
  <actor name="CS_E-Rezept_KTR">
    <testProcedure id="Konformitätsbestätigung"/>
  </actor>
  Das Clientsystem des Kostenträgers MUSS im Anwendungsfall "Quittung abrufen" eine FHIR-Ressource mit dem Profil GEM_ERP_PR_MedicationDispense_DiGA erstellen.
</requirement>

