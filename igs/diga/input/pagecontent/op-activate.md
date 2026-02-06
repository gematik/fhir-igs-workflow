Operation: $activate

Die FHIR-Operation `$activate` ueberfuehrt einen im Status `draft` befindlichen `Task` in den Status `ready`, nachdem das Primaersystem den qualifiziert elektronisch signierten Verordnungsdatensatz (QES) uebermittelt hat. Fuer DiGA (Flowtype 162) gelten zusaetzliche Payload-Pruefungen. Die allgemeinen Anforderungen des Basis-Workflows gelten unveraendert.

## DiGA-spezifische Pruefungen (Flowtype 162)

<requirement conformance="SHALL" key="IG-ERP-84" title="E-Rezept-Fachdienst - Task aktivieren - DiGA-spezifische Payload-Pruefung" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS fuer Flowtype 162 eine <i>DeviceRequest</i>-Ressource sowie <i>Composition.type = e16D</i> verlangen und bei Abweichungen mit HTTP 400 abbrechen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-85" title="E-Rezept-Fachdienst - Task aktivieren - PZN in KBV_PR_EVDGA_HealthAppRequest validieren" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS fuer Flowtype 162 die PZN in <i>KBV_PR_EVDGA_HealthAppRequest.code</i> gemaess den Technischen Hinweisen pruefen; Fehler fuehren zu HTTP 400.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-89" title="E-Rezept-Fachdienst - Task aktivieren - Alternative IK fuer Flowtype 162 verbieten" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS Verordnungen des Flowtype 162 mit <i>Coverage.payor.identifier.extension:alternativeID</i> mit HTTP 400 abweisen, um Unfallkassen auszuschliessen.
</requirement>
