
Diese Seite enthält die normativen Anforderungen an den Fachdienst für die Operation `$activate`.

### Anforderungen aus der Core Spezifikation

{% include core.op-activate-req-fd.md %}

### Modulspezifische Anforderungen


<!-- A_25990 -->
<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-15" title="TI-Flow-Fachdienst - Task aktivieren - Flowtype 162 - QES durch berechtigte Berufsgruppe" version="0">
  <meta lockversion="true"/>
  <actor name="eRp_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS die Aktivierung eines Tasks mit Flowtype 162 mit dem HTTP-Status-Code 400 abbrechen, wenn die QES gemäß der professionOID des Signaturzertifikats des Signierenden nicht von einer Berufsgruppe ausgestellt wurde, die der folgenden professionOID entspricht:
  <ul>
    <li>oid_arzt</li>
    <li>oid_zahnarzt</li>
    <li>oid_psychotherapeut</li>
    <li>oid_ps_psychotherapeut</li>
    <li>oid_kuj_psychotherapeut</li>
  </ul>
   damit nur solche Leistungserbringer ein signiertes E-Rezept einstellen, die zur Verordnung von DiGAs ermächtigt sind.
</requirement>

<br>

<!-- A_25991 -->
<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-16" title="TI-Flow-Fachdienst - Task aktivieren - Flowtype 162 - Prüfung Verordnung von DiGAs" version="0">
  <meta lockversion="true"/>
  <actor name="eRp_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aktivieren eines Tasks mit Flowtype 162 mittels $activate prüfen, dass im Bundle eine <i>DeviceRequest</i>-Ressource und in der <i>Composition.type.coding.code=e16D</i> enthalten ist. Der TI-Flow-Fachdienst MUSS andernfalls mit dem HTTP-Fehlercode 400 abbrechen und in der <i>OperationOutcome</i> den Fehlertext "Für diesen Workflowtypen sind nur Verordnungen für Digitale Gesundheitsanwendungen zulässig" ausgeben.
</requirement>

<br>

<!-- A_25992 -->
<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-17" title="TI-Flow-Fachdienst - Task aktivieren - Überprüfung der PZN im Profil KBV_PR_EVDGA_HealthAppRequest" version="0">
  <meta lockversion="true"/>
  <actor name="eRp_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/&#60;id&#62;/$activate den im FHIR Profil KBV_PR_EVDGA_HealthAppRequest gespeicherten Wert für .code[x]:codeCodeableConcept.coding.code gemäß den "Technischen Hinweisen zur PZN-Codierung - Prüfziffernberechnungen der PZN, PPN und Basic UDI-DI" beschriebenen Prüfalgorithmus validieren.<br>
  Der TI-Flow-Fachdienst MUSS bei einer fehlerhaften Prüfung mit einem Http-Fehler 400 (Bad Request) abbrechen, sowie die Fehlermeldung "Ungültige PZN: Die übergebene Pharmazentralnummer entspricht nicht den vorgeschriebenen Prüfziffer-Validierungsregeln." in Form eines OperationOutcome ausliefern.
</requirement>

<br>

<!-- A_23443-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-18" title="TI-Flow-Fachdienst - Task aktivieren - Flowtype 162 - Prüfung Coverage Type" version="0">
  <meta lockversion="true"/>
  <actor name="eRp_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aktivieren eines Task des Flowtype Task.extension:flowType = 162 mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate prüfen, obCoverage.type.coding.code nicht mit dem Wert "PKV" belegt ist und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen, um sicherzustellen, dass diese Workflows nicht für E-Rezepte für PKV-Versicherte genutzt werden.
</requirement>

<br>
<!-- A_26372 -->
<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-19" title="TI-Flow-Fachdienst - Task aktivieren - Flowtype 162 - Prüfung Coverage Alternative IK" version="0">
  <meta lockversion="true"/>
  <actor name="eRp_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aktivieren eines Task des Flowtype Task.extension:flowType = 162 mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate prüfen, ob die Extension Coverage.payor.identifier.extension:alternativeID vorhanden ist und in diesem Fall die Operation mit Http-Fehlercode 400 abbrechen, um sicherzustellen, dass dieser Workflow nicht für Verordnungen genutzt wird, die zu Lasten von Unfallkassen oder Berufsgenossenschaften gehen.
</requirement>

Dieser Ausschluss erfolgt temporär. In einer späteren Version können Unfallkassen das Verordnen von DiGAs explizit unterstützen. Die konkreten Festlegungen dazu werden in einem Folgerelease getroffen.

<!-- A_27845, A_19999 -->
<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-20" title="TI-Flow-Fachdienst - Task aktivieren - Flowtype 162 - Prozessparameter" version="0">
  <meta lockversion="true"/>
  <actor name="eRp_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS bei einem Task mit Task.flowType = 162 die Attribute in Task in Abhängigkeit des in der http-POST-Operation /Task/&#60;id&#62;/$activate übergebenen gültig signierte E-Rezept-Bundle gemäß TAB_eRpDM_005 belegen.<br>

  <table>
    <tr> 
      <th>Feld in Task</th>
      <th>Feldbelegung</th>
    </tr>
    <tr> 
      <td>Task.performerType.coding.system</td>
      <td>"https://gematik.de/fhir/erp/CodeSystemGEM_ERP_CS_OrganizationType"</td>
    </tr>
    <tr> 
      <td>Task.performerType.coding.code</td>
      <td>"1.2.276.0.76.4.59"</td>
    </tr>
    <tr> 
      <td>Task.performerType.coding.diplay</td>
      <td>"Kostenträger"</td>
    </tr>
    <tr> 
      <td>Task.PrescriptionType.valueCoding.display</td>
      <td>"Flowtype für Digitale Gesundheitsanwendungen"</td>
    </tr>
    <tr> 
      <td>Task.ExpiryDate</td>
      <td>&#60;Datum der QES.Erstellung im Signaturobjekt&#62; + 3 Kalendermonate</td>
    </tr>
    <tr> 
      <td>Task.AcceptDate</td>
      <td>&#60;Datum der QES.Erstellung im Signaturobjekt&#62; + 3 Kalendermonate</td>
    </tr>
  </table>
  <div><figcaption><strong>Tabelle: </strong>TAB_eRpDM_005 Prozessparameter Flowtype 162</figcaption></div>
</requirement>