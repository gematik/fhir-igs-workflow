Diese Seite enthält die workflowtyp-spezifischen normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$reject`.

### Anforderungen aus der Core Spezifikation

{% include core.op-reject-req-fd.md %}

### Modulspezifische Anforderungen

<!-- A_19170-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-4" title="E-Rezept-Fachdienst - Task zurückweisen - Flowtype 160/169/200/209 - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Zurückweisen eines Tasks mit Flowtype 160, 169, 200 oder 209 mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$reject die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Institutionen in der Rolle
  <ul>
    <li>oid_oeffentliche_apotheke</li>
    <li>oid_krankenhausapotheke</li>
  </ul>
  die Operation am Fachdienst aufrufen, damit das E-Rezept nicht durch einen Unberechtigten zurückgewiesen werden kann.
</requirement>

<!-- A_24286-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-5" title="E-Rezept-Fachdienst - Task zurückweisen - Flowtype 160/169/200/209 - Dispensierinformationen löschen" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Zurückweisen eines Tasks mit Flowtype 160, 169, 200 oder 209 mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$reject die Dispensierinformationen, falls welche vorhanden sind, löschen: 
  <ul>
    <li>Medication, die aus der MedicationDispense referenziert wird --> löschen</li>
    <li>MedicationDispense zum dazugehörigen Task --> löschen</li>
    <li>Task.extension:lastMedicationDispense --> löschen</li>
  </ul>
</requirement>

<!-- A_25926 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-6" title="E-Rezept-Fachdienst - Task zurückweisen - Flowtype 160/169/200/209 - Löschmarkierungen Medikationsliste bereitstellen (Dispensierinformationen)" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Zurückweisen eines Tasks mit Flowtype 160, 169, 200 oder 209 mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$reject, wenn bereits Dispensierinformationen im E-Rezept-Fachdienst zum Task gespeichert wurden, die Daten für die Löschinformation dieser Dispensierinformationen für die Übermittlung in den ePA Medication Service bereitstellen.
</requirement>
