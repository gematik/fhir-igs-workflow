
<!-- Quelle: A_25990 - E-Rezept-Fachdienst - Task aktivieren - Flowtype 162 - QES durch berechtigte Berufsgruppe -->
<requirement conformance="SHALL" key="IG-TIFlow-DiGA-24" title="E-Rezept-Fachdienst - Task aktivieren - Flowtype 162 - QES durch berechtigte Berufsgruppe" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS die Aktivierung eines Tasks mit Flowtype 162 mit dem HTTP-Status-Code 400 abbrechen, wenn die QES gemäß der professionOID des Signaturzertifikats des Signierenden nicht von einer Berufsgruppe ausgestellt wurde, die der folgenden professionOID entspricht:
  -	oid_arzt
  -	oid_zahnarzt
  -	oid_psychotherapeut
  -	oid_ps_psychotherapeut
  -	oid_kuj_psychotherapeut
  damit nur solche Leistungserbringer ein signiertes E-Rezept einstellen, die zur Verordnung von DiGAs ermächtigt sind.
</requirement>

</br>

<!-- Quelle: A_25991 - E-Rezept-Fachdienst - Task aktivieren - Flowtype 162 - Prüfung Verordnung von DiGAs -->
<requirement conformance="SHALL" key="IG-TIFlow-DiGA-25" title="E-Rezept-Fachdienst - Task aktivieren - Flowtype 162 - Prüfung Verordnung von DiGAs" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mit Flowtype 162 mittels $activate prüfen, dass im Bundle eine <i>DeviceRequest</i>-Ressource und in der </i>Composition.type.coding.code=e16D</i> enthalten ist. Der E-Rezept-Fachdienst MUSS andernfalls mit dem HTTP-Fehlercode 400 abbrechen und in der <i>OperationOutcome</i> den Fehlertext "Für diesen Workflowtypen sind nur Verordnungen für Digitale Gesundheitsanwendungen zulässig" ausgeben.
</requirement>

</br>

<!-- Quelle: A_25992 - E-Rezept-Fachdienst - Task aktivieren – Überprüfung der PZN im Profil KBV_PR_EVDGA_HealthAppRequest -->
<requirement conformance="SHALL" key="IG-TIFlow-DiGA-26" title="E-Rezept-Fachdienst - Task aktivieren – Überprüfung der PZN im Profil KBV_PR_EVDGA_HealthAppRequest" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/&#60;id&#62;/$activate den im FHIR Profil KBV_PR_EVDGA_HealthAppRequest gespeicherten Wert für .code[x]:codeCodeableConcept.coding.code gemäß den "Technischen Hinweisen zur PZN-Codierung - Prüfziffernberechnungen der PZN, PPN und Basic UDI-DI" beschriebenen Prüfalgorithmus validieren.
  Der E-Rezept-Fachdienst MUSS bei einer fehlerhaften Prüfung mit einem Http-Fehler 400 (Bad Request) abbrechen, sowie die Fehlermeldung "Ungültige PZN: Die übergebene Pharmazentralnummer entspricht nicht den vorgeschriebenen Prüfziffer-Validierungsregeln." in Form eines OperationOutcome ausliefern.
</requirement>

</br>

<!-- Quelle: A_23443-01 - E-Rezept-Fachdienst – Task aktivieren – Flowtype 160/162/169 - Prüfung Coverage Type -->
<requirement conformance="SHALL" key="IG-TIFlow-DiGA-27" title="E-Rezept-Fachdienst – Task aktivieren – Flowtype 162 - Prüfung Coverage Type" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Task des Flowtype Task.extension:flowType = 162 mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate prüfen, obCoverage.type.coding.code nicht mit dem Wert "PKV" belegt ist und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen, um sicherzustellen, dass diese Workflows nicht für E-Rezepte für PKV-Versicherte genutzt werden.
</requirement>

</br>

<!-- Quelle: A_26372 - E-Rezept-Fachdienst – Task aktivieren – Flowtype 162 - Prüfung Coverage Alternative IK  -->
<requirement conformance="SHALL" key="IG-TIFlow-DiGA-28" title="E-Rezept-Fachdienst – Task aktivieren – Flowtype 162 - Prüfung Coverage Alternative IK" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Task des Flowtype Task.extension:flowType = 162 mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate prüfen, ob die Extension Coverage.payor.identifier.extension:alternativeID vorhanden ist und in diesem Fall die Operation mit Http-Fehlercode 400 abbrechen, um sicherzustellen, dass dieser Workflow nicht für Verordnungen genutzt wird, die zu Lasten von Unfallkassen oder Berufsgenossenschaften gehen.
</requirement>

Dieser Ausschluss erfolgt temporär. In einer späteren Version können Unfallkassen das Verordnen von DiGAs explizit unterstützen. Die konkreten Festlegungen dazu werden in einem Folgerelease getroffen.

<!-- Quelle: A_27845 -FHIR FLOWTYPE für Prozessparameter - Flowtype 162  -->
<requirement conformance="SHALL" key="IG-TIFlow-DiGA-29" title="E-Rezept-Fachdienst – Task aktivieren – Flowtype 162 - Prozessparameter" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS bei einem Task mit Task.flowType = 162 die Attribute in Task in Abhängigkeit des in der http-POST-Operation /Task/&#60;id&#62;/$activate übergebenen gültig signierte E-Rezept-Bundle gemäß TAB_eRpDM_005 belegen.
  *TAB_eRpDM_005 Prozessparameter Flowtype 162*
  | Feld in Task | Feldbelegung |
  |:-------------------|:--------------------------------|
  | Task.performerType.coding.system | "https://gematik.de/fhir/erp/CodeSystemGEM_ERP_CS_OrganizationType" |
  | Task.performerType.coding.code | "1.2.276.0.76.4.59" |
  | Task.performerType.coding.diplay | "Kostenträger" |
  | Task.PrescriptionType.valueCoding.display | "Flowtype für Digitale Gesundheitsanwendungen" |
  | Task.ExpiryDate | &#60;Datum der QES.Erstellung im Signaturobjekt&#62; + 3 Kalendermonate |
  | Task.AcceptDate | &#60;Datum der QES.Erstellung im Signaturobjekt&#62; + 3 Kalendermonate |
</requirement>