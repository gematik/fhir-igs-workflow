<!-- Quelle: A_19230-01 -E-Rezept-Fachdienst - Task schließen - Rollenprüfung -->
<requirement conformance="SHALL" key="IG-TIFlow-DiGA-15" title="E-Rezept-Fachdienst - Task schliessen - Flowtype 162 - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks für eine Verordnung mit Flowtype 162 mittels HTTP-POST/$close-Operation auf den in der URL referenzierten/Task/&#60;id&#60;  die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Institutionen in der Rolle
  -	oid_kostentraeger
  die Operation am Fachdienst aufrufen, damit der Workflow nicht durch einen Unberechtigten abgeschlossen werden kann.
</requirement>

</br>

<!-- Quelle: A_26003-01 -E-Rezept-Fachdienst - Task schließen - Flowtype 162 - Profilprüfung MedicationDispense -->
<requirement conformance="SHALL" key="IG-TIFlow-DiGA-16" title="E-Rezept-Fachdienst - Task schließen - Flowtype 162 - Profilprüfung MedicationDispense" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks für ein E-Rezept mittels HTTP-POST/$close-Operation auf den in der URL referenzierten/Task/&#60;id&#62; mit Flowtype 162 sicherstellen, dass das in GEM_ERP_PR_PAR_CloseOperation_Input enthaltene MedicationDispense-Objekt dem Profil GEM_ERP_PR_MedicationDispense_DiGA entspricht. Andernfalls ist die Operation mit einem Fehler abzubrechen, und im OperationOutcome muss der Text "Unzulässige Abgabeinformationen: Für diesen Workflow sind nur Abgabeinformationen für digitale Gesundheitsanwendungen zulässig." zurückgegeben werden.
</requirement>