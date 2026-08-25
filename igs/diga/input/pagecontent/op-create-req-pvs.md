Diese Seite enthält die normativen Anforderungen an ein PVS für die Operation `$create`.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/{{ site.data.constants.tiflow_core_version }}/menu-schnittstellen-operation-api.html)

### Modulspezifische Anforderungen

Zur Verordnung von DiGAs werden die DiGA-FHIR-Profile der KBV genutzt: https://simplifier.net/evdga.

Das PS der verordnenden LEI darf FHIR-Extensions nicht im Verordnungsdatensatz verwenden, die nicht explizit gemäß KBV-Profilversion "kbv.itv.evdga" beschrieben sind.

<!-- A_26373 -->
<requirement conformance="SHALL NOT" key="IG-TIFLOW-DIGA-A22" title="PS verordnende LEI: keine elektronische Verordnung einer DiGA zu Lasten BG/UK" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_verordnend" description="E-Rezept-Schnittstelle eines verordnenden PS (Leistungserbringer)">
    <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
  </actor>
  Das PS der verordnenden LEI DARF bei der Verordnung einer DiGA zu Lasten einer Berufsgenossenschaft oder Unfallkasse NICHT die elektronische Verordnung nutzen.
</requirement>

Das PS der verordnenden LEI DARF bei der Verordnung einer DiGA NICHT eine Mehrfachverordnung erstellen.

Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden erstellen" beim Verordnen einer DiGA die HTTP-Operation POST /Task/$create mit Parameter FlowType = 162 ausführen.
