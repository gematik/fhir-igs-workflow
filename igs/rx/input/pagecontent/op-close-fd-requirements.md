Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$close`.

<!-- A_19230-01 -->
<requirement conformance="SHALL" key="IG-TIFlow-RX-29" title="E-Rezept-Fachdienst - Task schließen - Flowtype 160/166/169/200/209 - Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mit Flowtype 160, 166, 169, 200 oder 209 mittels HTTP-POST/$close-Operation auf den in der URL referenzierten /Task/&lt;id&gt; sicherstellen, dass ausschließlich abgebende Institutionen in der Rolle
    <ul>
      <li>oid_oeffentliche_apotheke</li> 
      <li>oid_krankenhausapotheke</li>
    </ul>
    die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit der Workflow nicht durch einen Unberechtigten abgeschlossen werden kann.
</requirement>


<!-- A_26002-02 -->
<requirement conformance="SHALL" key="IG-TIFlow-RX-180" title="E-Rezept-Fachdienst - Task schließen - Flowtype 160/166/169/200/209 - Profilprüfung MedicationDispense" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks für ein E-Rezept mittels HTTP-POST/$close-Operation auf den in der URL referenzierten /Task/&lt;id&gt; mit Flowtype 160, 166, 169, 200, oder 209 sicherstellen, dass das in GEM_ERP_PR_PAR_CloseOperation_Input enthaltene MedicationDispense-Objekt dem Profil GEM_ERP_PR_MedicationDispense entspricht. Andernfalls ist die Operation mit einem Fehler abzubrechen, und im OperationOutcome muss der Text "Unzulässige Abgabeinformationen: Für diesen Workflow sind nur Abgabeinformationen für Arzneimittel zulässig." zurückgegeben werden.
</requirement>

<!-- A_27814 -->
<requirement conformance="SHALL" key="IG-TIFlow-RX-181" title="E-Rezept-Fachdienst - Task schließen - T-Rezept Daten an BfArM Webdienst bereitstellen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
        Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/&lt;id&gt;/$close mit Flowtype 166, wenn die Operation erfolgreich abgeschlossen werden kann, die Daten des digitalen Durchschlags E-T-Rezept dem BfArM Webdienst bereitstellen.
</requirement>
