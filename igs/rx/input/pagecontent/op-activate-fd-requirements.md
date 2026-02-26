Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$activate`.

<!-- A_19225-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-58" title="E-Rezept-Fachdienst - Task aktivieren - Flowtype 160/169/200/209 - QES durch berechtigte Berufsgruppe" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS die Aktivierung eines Tasks mit Flowtype 160, 169, 200 oder 209 mit dem HTTP-Status-Code 400 abbrechen, wenn die QES gemäß der professionOID des Signaturzertifikats des Signierenden nicht von einer Berufsgruppe ausgestellt wurde, die der folgenden professionOID entspricht:
    <ul>
        <li>oid_arzt</li> 
        <li>oid_zahnarzt</li> 
    </ul>
    damit nur solche Leistungserbringer ein signiertes E-Rezept einstellen, die zur Verordnung von Medikamenten ermächtigt sind.
</requirement>

<!-- A_27812 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-59" title="E-Rezept-Fachdienst - Task aktivieren - Flowtype 166 - QES durch berechtigte Berufsgruppe" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
        Der E-Rezept-Fachdienst MUSS die Aktivierung eines Tasks mit Flowtype 166 mit dem HTTP-Status-Code 400 abbrechen, wenn die QES gemäß der professionOID des Signaturzertifikats des Signierenden nicht von einer Berufsgruppe ausgestellt wurde, die der folgenden professionOID entspricht: oid_arzt damit nur solche Leistungserbringer ein signiertes E-Rezept einstellen, die zur Verordnung von T-Rezepten ermächtigt sind.
</requirement>

<!-- A_25642 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-60" title="E-Rezept-Fachdienst - Task aktivieren - Flowtype 160/169/200/209 - Prüfung Arzneimittelverordnung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mit Workflowtypen 160, 169, 200 oder 209 mittels $activate prüfen, dass im Bundle eine MedicationRequest-Ressource und eine Medication mit Medication.extension:Arzneimittelkategorie = 00 enthalten ist. Der E-Rezept-Fachdienst MUSS andernfalls mit dem HTTP-Fehlercode 400 abbrechen und in der OperationOutcome den Fehlertext "Für diesen Workflowtypen sind nur Arzneimittelverordnungen zulässig" ausgeben.
</requirement>

<!-- A_27813 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-61" title="E-Rezept-Fachdienst - Task aktivieren - Flowtype 166 - Prüfung Arzneimittelverordnung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mit Workflowtyp 166 mittels $activate prüfen, dass im Bundle eine MedicationRequest-Ressource und eine Medication mit Medication.extension:Arzneimittelkategorie = 02 enthalten ist. Der E-Rezept-Fachdienst MUSS andernfalls mit dem HTTP-Fehlercode 400 abbrechen und in der OperationOutcome den Fehlertext "Für diesen Workflowtypen sind nur T-Rezept Verordnungen zulässig" ausgeben.
</requirement>
<!-- ToDo: Ist hier T-Rezept in einen eigenen IG zu separieren? (Dito für alle anderen 166 Afos) -->



<!-- A_28570 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-62" title="E-Rezept-Fachdienst - Task aktivieren - Flowtype 160/166/169/200/209 - Prüfung Coverage Type" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Task des Flowtype Task.extension:flowType = 160, 166, 169, 200 oder 209 mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Validierung von strukturierten Dosierungen anwenden.
</requirement>

<!-- A_23443-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-63" title="E-Rezept-Fachdienst – Task aktivieren – Flowtype 160/169 - Prüfung Coverage Type" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Task des Flowtype Task.extension:flowType = 160 oder 169 mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate prüfen, ob Coverage.type.coding.code nicht mit dem Wert "PKV" belegt ist und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen, um sicherzustellen, dass diese Workflows nicht für E-Rezepte für PKV-Versicherte genutzt werden.
</requirement>

<!-- A_22347-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-64" title="E-Rezept-Fachdienst - Task aktivieren - Flowtype 200/209 - Prüfung Coverage Type" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
        Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task des Flowtype Task.extension:flowType = 200 oder 209 mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate prüfen, ob Coverage.type.coding.code mit dem Wert "PKV" belegt ist und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen, um sicherzustellen, dass diese Workflows nur für E-Rezepte für PKV-Versicherte genutzt werden.
</requirement>

<!-- A_22231-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-65" title="E-Rezept-Fachdienst - Task aktivieren - Ausschluss Betäubungsmittel" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 und einem Hinweis auf den Ausschluss von Betäubungsmittel ("BTM nicht zulässig" im OperationOutcome) abbrechen, wenn der übergebene QES-Datensatz als Betäubungsmittel-Verordnung (Bundle.Medication.extension:KBV_EX_ERP_Medication_Category:code gleich "01") gekennzeichnet ist.
</requirement>

<!-- A_25925 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-66" title="E-Rezept-Fachdienst - Task aktivieren - Daten ePA Medication Service bereitstellen (Verordnungsdatensatz)" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Aufruf der Operation POST /Task/&lt;id&gt;/$activate auf einen Task des Flowtype Task.extension:flowType = 160, 166, 169, 200 oder 209 bei erfolgreichem Abschluss der Operation, die Daten des Verordnungsdatensatzes für die Übermittlung in den ePA Medication Service bereitstellen.
</requirement>

### Prozessparamter

<!-- A_27844 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-67" title="E-Rezept-Fachdienst - Task aktivieren - Flowtype 160 - Prozessparameter" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS bei einem Task mit Task.flowType = 160 die Attribute in Task in Abhängigkeit des in der http-POST-Operation /Task/&#60;id&#62;/$activate übergebenen gültig signierte E-Rezept-Bundle gemäß TAB_eRpDM_004 belegen.<br>

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
      <td>"1.2.276.0.76.4.54"</td>
    </tr>
    <tr> 
      <td>Task.performerType.coding.diplay</td>
      <td>"Öffentliche Apotheke"</td>
    </tr>
    <tr> 
      <td>Task.PrescriptionType.valueCoding.display</td>
      <td>"Flowtype für Apothekenpflichtige Arzneimittel"</td>
    </tr>
    <tr> 
      <td>Task.ExpiryDate</td>
      <td>
        wenn MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false:<br>
            Task.ExpiryDate = &#60;Datum der QES.Erstellung im Signaturobjekt&#62; + 3 Kalendermonate<br>
        sonst<br>
            wenn MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end angegeben<br>
                Task.ExpiryDate = MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end<br>
            sonst<br>
                Task.ExpiryDate = &#60;Datum der QES.Erstellung im Signaturobjekt&#62; + 365 Kalendertage 
      </td>
    </tr>
    <tr> 
      <td>Task.AcceptDate</td>
      <td>
        wenn MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false:<br>
            Task.AcceptDate = &#62;Datum der QES.Erstellung im Signaturobjekt&#62; + 28 Kalendertage<br>
        sonst<br>
            wenn MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end angegeben<br>
                Task.AcceptDate = MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end<br>
            sonst<br>
                Task.AcceptDate = &#60;Datum der QES.Erstellung im Signaturobjekt&#62; + 365 Kalendertage
      </td>
    </tr>
  </table>
  <div><figcaption><strong>Tabelle: </strong>TAB_eRpDM_004 Prozessparameter Flowtype 160</figcaption></div>
</requirement>

<!-- A_27846 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-68" title="E-Rezept-Fachdienst - Task aktivieren - Flowtype 166 - Prozessparameter" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS bei einem Task mit Task.flowType = 166 die Attribute in Task in Abhängigkeit des in der http-POST-Operation /Task/&#60;id&#62;/$activate übergebenen gültig signierte E-Rezept-Bundle gemäß TAB_eRpDM_006 belegen.<br>

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
      <td>"1.2.276.0.76.4.54"</td>
    </tr>
    <tr> 
      <td>Task.performerType.coding.diplay</td>
      <td>"Öffentliche Apotheke"</td>
    </tr>
    <tr> 
      <td>Task.PrescriptionType.valueCoding.display</td>
      <td>"Flowtype für Arzneimittel nach § 3a AMVV"</td>
    </tr>
    <tr> 
      <td>Task.ExpiryDate</td>
      <td>Task.ExpiryDate = &#60;Datum der QES.Erstellung im Signaturobjekt&#62; + 6 Kalendertage</td>
    </tr>
    <tr> 
      <td>Task.AcceptDate</td>
      <td>Task.ExpiryDate = &#60;Datum der QES.Erstellung im Signaturobjekt&#62; + 6 Kalendertage</td>
    </tr>
  </table>
  <div><figcaption><strong>Tabelle: </strong>TAB_eRpDM_006 Prozessparameter Flowtype 166</figcaption></div>
</requirement>

<!-- A_27847 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-69" title="E-Rezept-Fachdienst - Task aktivieren - Flowtype 169 - Prozessparameter" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS bei einem Task mit Task.flowType = 169 die Attribute in Task in Abhängigkeit des in der http-POST-Operation /Task/&#60;id&#62;/$activate übergebenen gültig signierte E-Rezept-Bundle gemäß TAB_eRpDM_007 belegen.<br>

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
      <td>"1.2.276.0.76.4.54"</td>
    </tr>
    <tr> 
      <td>Task.performerType.coding.diplay</td>
      <td>"Öffentliche Apotheke"</td>
    </tr>
    <tr> 
      <td>Task.PrescriptionType.valueCoding.display</td>
      <td>"Flowtype für Workflow-Steuerung durch Leistungserbringer"</td>
    </tr>
    <tr> 
      <td>Task.ExpiryDate</td>
      <td>
        wenn MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false:<br>
            Task.ExpiryDate = &#60;Datum der QES.Erstellung im Signaturobjekt&#62; + 3 Kalendermonate<br>
        sonst<br>
            wenn MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end angegeben<br>
                Task.ExpiryDate = MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end<br>
            sonst<br>
                Task.ExpiryDate = &#60;Datum der QES.Erstellung im Signaturobjekt&#62; + 365 Kalendertage 
      </td>
    </tr>
    <tr> 
      <td>Task.AcceptDate</td>
      <td>
        wenn MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false:<br>
            Task.AcceptDate = &#62;Datum der QES.Erstellung im Signaturobjekt&#62; + 28 Kalendertage<br>
        sonst<br>
            wenn MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end angegeben<br>
                Task.AcceptDate = MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end<br>
            sonst<br>
                Task.AcceptDate = &#60;Datum der QES.Erstellung im Signaturobjekt&#62; + 365 Kalendertage
      </td>
    </tr>
  </table>
  <div><figcaption><strong>Tabelle: </strong>TAB_eRpDM_007 Prozessparameter Flowtype 169</figcaption></div>
</requirement>

<!-- A_27848 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-70" title="E-Rezept-Fachdienst - Task aktivieren - Flowtype 200 - Prozessparameter" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS bei einem Task mit Task.flowType = 200 die Attribute in Task in Abhängigkeit des in der http-POST-Operation /Task/&#60;id&#62;/$activate übergebenen gültig signierte E-Rezept-Bundle gemäß TAB_eRpDM_008 belegen.<br>

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
      <td>"1.2.276.0.76.4.54"</td>
    </tr>
    <tr> 
      <td>Task.performerType.coding.diplay</td>
      <td>"Öffentliche Apotheke"</td>
    </tr>
    <tr> 
      <td>Task.PrescriptionType.valueCoding.display</td>
      <td>"Flowtype für Apothekenpflichtige Arzneimittel (PKV)"</td>
    </tr>
    <tr> 
      <td>Task.ExpiryDate</td>
      <td>
        wenn MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false:<br>
            Task.ExpiryDate = &#60;Datum der QES.Erstellung im Signaturobjekt&#62; + 3 Kalendermonate<br>
        sonst<br>
            wenn MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end angegeben<br>
                Task.ExpiryDate = MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end<br>
            sonst<br>
                Task.ExpiryDate = &#60;Datum der QES.Erstellung im Signaturobjekt&#62; + 365 Kalendertage 
      </td>
    </tr>
    <tr> 
      <td>Task.AcceptDate</td>
      <td>
        wenn MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false:<br>
            Task.AcceptDate = &#62;Datum der QES.Erstellung im Signaturobjekt&#62; + 3 Kalendermonate<br>
        sonst<br>
            wenn MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end angegeben<br>
                Task.AcceptDate = MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end<br>
            sonst<br>
                Task.AcceptDate = &#60;Datum der QES.Erstellung im Signaturobjekt&#62; + 365 Kalendertage
      </td>
    </tr>
  </table>
  <div><figcaption><strong>Tabelle: </strong>TAB_eRpDM_008 Prozessparameter Flowtype 200</figcaption></div>
</requirement>

<!-- A_27849 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-71" title="E-Rezept-Fachdienst - Task aktivieren - Flowtype 209 - Prozessparameter" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS bei einem Task mit Task.flowType = 209 die Attribute in Task in Abhängigkeit des in der http-POST-Operation /Task/&#60;id&#62;/$activate übergebenen gültig signierte E-Rezept-Bundle gemäß TAB_eRpDM_009 belegen.<br>

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
      <td>"1.2.276.0.76.4.54"</td>
    </tr>
    <tr> 
      <td>Task.performerType.coding.diplay</td>
      <td>"Öffentliche Apotheke"</td>
    </tr>
    <tr> 
      <td>Task.PrescriptionType.valueCoding.display</td>
      <td>"Flowtype für Workflow-Steuerung durch Leistungserbringer (PKV)"</td>
    </tr>
    <tr> 
      <td>Task.ExpiryDate</td>
      <td>
        wenn MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false:<br>
            Task.ExpiryDate = &#60;Datum der QES.Erstellung im Signaturobjekt&#62; + 3 Kalendermonate<br>
        sonst<br>
            wenn MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end angegeben<br>
                Task.ExpiryDate = MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end<br>
            sonst<br>
                Task.ExpiryDate = &#60;Datum der QES.Erstellung im Signaturobjekt&#62; + 365 Kalendertage 
      </td>
    </tr>
    <tr> 
      <td>Task.AcceptDate</td>
      <td>
        wenn MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false:<br>
            Task.AcceptDate = &#62;Datum der QES.Erstellung im Signaturobjekt&#62; + 3 Kalendermonate<br>
        sonst<br>
            wenn MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end angegeben<br>
                Task.AcceptDate = MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end<br>
            sonst<br>
                Task.AcceptDate = &#60;Datum der QES.Erstellung im Signaturobjekt&#62; + 365 Kalendertage
      </td>
    </tr>
  </table>
  <div><figcaption><strong>Tabelle: </strong>TAB_eRpDM_007 Prozessparameter Flowtype 209</figcaption></div>
</requirement>


<!-- A_19517-04 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-72" title="E-Rezept-Fachdienst - Task aktivieren - Entlassparameter - Prozessparameter" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS nach der Feststellung der Prozessparametern die folgenden Parameter mit abweichenden Werten belegen:
    <ul>
        <li>Task.AcceptDate = &#60;Datum der QES.ErstellungBundle.signature.when&#62; + 2 Werktage (Montag bis Samstag, ausgenommen bundeseinheitliche Feiertage) (Abweichende Regelungen durch denGemeinsamen Bundesausschuss (G-BA) sind zu beachten.)</li>
    </ul>
    wenn das in der http-POST-Operation /Task/&#60;id&#62;/$activate übergebene, gültig signierte E-Rezept-Bundle in der Extension https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_Legal_basis in Bundle.Composition den code="04" oder "14" des Code-Systems https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_STATUSKENNZEICHEN ("Entlassmanagement-Kennzeichen") enthält und die übrigen Prozessparameter unverändert übernehmen, damit der Prozess für das E-Rezept mit den abweichenden Festlegungen für das Entlassrezept gemäß Arzneimittelrichtlinie [AM-RL] umgesetzt wird.
</requirement>



### Prüfung von Mehrfachverordnungen

<!-- A_22627-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-73" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - zulässige Flowtype" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Flowtype ungleich 160, 169, 200 oder 209 ist, weil Mehrfachverordnungen nur für die Verordnungen von apothekenpflichtigen Arzneimittel (kein BtM, kein T-Rezept) zulässig sind.
</requirement>

<!-- A_22628 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-74" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Numerator-Denominator kleiner 5" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Numerator oder Denominator größer als 4 ist, weil eine Mehrfachverordnungen aus maximal 4 Teilverordnungen bestehen darf.
</requirement>

<!-- A_22704 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-75" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Numerator größer 0" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Numerator kleiner als 1 ist.
</requirement>

<!-- A_22629 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-76" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Denominator größer  1" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Denominator kleiner als 2 ist, weil eine Mehrfachverordnungen aus mindestens 2 Teilverordnungen bestehen muss.
</requirement>

<!-- A_22630 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-77" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Numerator kleiner / gleich Denominator" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Numerator größer als der Denominator ist.
</requirement>

<!-- A_22631 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-78" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Unzulässige Angaben" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung nicht als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false) gekennzeichnet ist, aber eine Extension Nummerierung oder Zeitraum enthält, weil normale Verordnungen keine MVO-Angaben enthalten dürfen.
</requirement>

<!-- A_22632 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-79" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - kein Entlassrezept" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) und als Entlassrezept ( code="04" oder "14" in Extension https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_Legal_basis in Bundle.Composition.extention:rechtsgrundlage) gekennzeichnet ist, weil für Entlassrezepte keine Mehrfachverordnungen zulässig sind.
</requirement>

<!-- A_22633 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-80" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - keine Ersatzverordnung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) und als Ersatzverordnung ( code="10" oder "11" oder "17" in Extension https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_Legal_basis in Bundle.Composition.extention:rechtsgrundlage) gekennzeichnet ist, weil für Ersatzverordnungen keine Mehrfachverordnungen zulässig sind.
</requirement>

<!-- A_22634 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-81" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Beginn Einlösefrist-Pflicht" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet ist und der Beginn der Einlösefrist (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) nicht angegeben ist, weil die Information des Beginns der Einlösefrist notwendig ist, um den Gültigkeitszeitraum zu ermitteln.
</requirement>

<!-- A_23537 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-82" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Startdatum nicht vor Ausstellungsdatum" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet ist und das Startdatum (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) vor dem Ausstellungsdatum (MedicationRequest.authoredOn) liegt.
</requirement>

<!-- A_23164 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-83" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Endedatum nicht vor Startdatum" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet, ein Endedatum (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end) angegeben ist und das Endedatum vor dem Startdatum (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) liegt.
</requirement>

<!-- A_24901 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-84" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Schema ID" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet ist und der dazugehörige value (MedicationRequest.extension:Mehrfachverordnung.extension:ID.value[x]:valueIdentifier.value) nicht dem Schema aus [KBV_ITA_VGEX_Technische_Anlage_ERP] entspricht.
</requirement>
