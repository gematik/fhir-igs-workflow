
Zur Verordnung von DiGAs werden die DiGA-FHIR-Profile der KBV genutzt: https://simplifier.net/evdga.

<!-- Quelle: A_26373 - PS verordnende LEI: keine elektronische Verordnung einer DiGA zu Lasten BG/UK -->
<requirement conformance="SHALL NOT" key="IG-TIFlow-DiGA-NEU" title="PS verordnende LEI: keine elektronische Verordnung einer DiGA zu Lasten BG/UK" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_verordnend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der verordnenden LEI DARF bei der Verordnung einer DiGA zu Lasten einer Berufsgenossenschaft oder Unfallkasse NICHT die elektronische Verordnung nutzen.
</requirement>

Das PS der verordnenden LEI DARF bei der Verordnung einer DiGA NICHT eine Mehrfachverordnung erstellen.

Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden erstellen" beim Verordnen einer DiGA die HTTP-Operation POST /Task/$create mit Parameter FlowType = 162 ausführen.
