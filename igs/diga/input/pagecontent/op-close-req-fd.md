
Diese Seite enthält die normativen Anforderungen an den Fachdienst für die Operation `$close`.

### Anforderungen aus der Core Spezifikation

{% include core.op-close-req-fd.md %}

### Modulspezifische Anforderungen


<!-- A_19230-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-3" title="TI-Flow-Fachdienst - Task schliessen - Flowtype 162 - Rollenprüfung" version="0">
  <meta lockversion="true"/>
  <actor name="eRp_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Beenden eines Tasks für eine Verordnung mit Flowtype 162 mittels HTTP-POST/$close-Operation auf den in der URL referenzierten/Task/&#60;id&#60;  die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Institutionen in der Rolle
  <ul>
    <li>oid_kostentraeger</li>
  </ul>
  die Operation am Fachdienst aufrufen, damit der Workflow nicht durch einen Unberechtigten abgeschlossen werden kann.
</requirement>

</br>

  <!-- A_26003-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-4" title="TI-Flow-Fachdienst - Task schließen - Flowtype 162 - Profilprüfung MedicationDispense" version="0">
  <meta lockversion="true"/>
  <actor name="eRp_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Beenden eines Tasks für ein E-Rezept mittels HTTP-POST/$close-Operation auf den in der URL referenzierten/Task/&#60;id&#62; mit Flowtype 162 sicherstellen, dass das in GEM_ERP_PR_PAR_CloseOperation_Input enthaltene MedicationDispense-Objekt dem Profil GEM_ERP_PR_MedicationDispense_DiGA entspricht. Andernfalls ist die Operation mit einem Fehler abzubrechen, und im OperationOutcome muss der Text "Unzulässige Abgabeinformationen: Für diesen Workflow sind nur Abgabeinformationen für digitale Gesundheitsanwendungen zulässig." zurückgegeben werden.
</requirement>