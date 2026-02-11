Operation: $activate

Die FHIR-Operation `$activate` überführt einen im Status `draft` befindlichen `Task` in den Status `ready`, nachdem das Primärsystem den qualifiziert elektronisch signierten Verordnungsdatensatz (QES) übermittelt hat. Für DiGA Verordnungen (Flowtype 162) gelten zusätzliche Payload-Prüfungen. Die allgemeinen Anforderungen des Basis-Workflows gelten unverändert.

## DiGA-spezifische Prüfungen (Flowtype 162)

<!-- A_25990 - E-Rezept-Fachdienst - Task aktivieren - Flowtype 162 - QES durch berechtigte Berufsgruppe -->
<!-- A_23443-01 - E-Rezept-Fachdienst – Task aktivieren – Flowtype 160/162/169 - Prüfung Coverage Type -->
<!-- Splitten wir solche Afos auf, wenn sie in unterschiedlichen IGs landen? Erscheint mir sinnvoll -->
<!-- A_26372 - E-Rezept-Fachdienst – Task aktivieren – Flowtype 162 - Prüfung Coverage Alternative IK  -->

<!--  -->

<!-- A_25991 - E-Rezept-Fachdienst - Task aktivieren - Flowtype 162 - Prüfung Verordnung von DiGAs -->
<requirement conformance="SHALL" key="IG-ERP-84" title="E-Rezept-Fachdienst - Task aktivieren - DiGA-spezifische Payload-Prüfung" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS für Flowtype 162 eine <i>DeviceRequest</i>-Ressource sowie <i>Composition.type = e16D</i> verlangen und bei Abweichungen mit HTTP 400 abbrechen.
  <!-- Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mit Flowtype 162 mittels $activate prüfen, dass im Bundle eine <i>DeviceRequest</i>-Ressource und in der </i>Composition.type.coding.code=e16D</i> enthalten ist. Der E-Rezept-Fachdienst MUSS andernfalls mit dem HTTP-Fehlercode 400 abbrechen und in der <i>OperationOutcome</i> den Fehlertext "Für diesen Workflowtypen sind nur Verordnungen für Digitale Gesundheitsanwendungen zulässig" ausgeben. -->
</requirement>
\
<requirement conformance="SHALL" key="IG-ERP-85" title="E-Rezept-Fachdienst - Task aktivieren - PZN in KBV_PR_EVDGA_HealthAppRequest validieren" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS für Flowtype 162 die PZN in <i>KBV_PR_EVDGA_HealthAppRequest.code</i> gemäss den Technischen Hinweisen prüfen; Fehler führen zu HTTP 400.
</requirement>
\
<requirement conformance="SHALL" key="IG-ERP-89" title="E-Rezept-Fachdienst - Task aktivieren - Alternative IK für Flowtype 162 verbieten" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS Verordnungen des Flowtype 162 mit <i>Coverage.payor.identifier.extension:alternativeID</i> mit HTTP 400 abweisen, um Unfallkassen auszuschliessen.
</requirement>
