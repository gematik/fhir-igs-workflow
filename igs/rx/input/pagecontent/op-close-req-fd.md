Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$close`.

### Anforderungen aus der Core Spezifikation

{% include core.op-close-req-fd.md %}

### Modulspezifische Anforderungen

<!-- A_19230-01 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-ERP-17" title="E-Rezept-Fachdienst - Task schließen - Flowtype 160/166/169/200/209 - Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
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
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-ERP-18" title="E-Rezept-Fachdienst - Task schließen - Flowtype 160/166/169/200/209 - Profilprüfung MedicationDispense" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks für ein E-Rezept mittels HTTP-POST/$close-Operation auf den in der URL referenzierten /Task/&lt;id&gt; mit Flowtype 160, 166, 169, 200, oder 209 sicherstellen, dass das in GEM_ERP_PR_PAR_CloseOperation_Input enthaltene MedicationDispense-Objekt dem Profil GEM_ERP_PR_MedicationDispense entspricht. Andernfalls ist die Operation mit einem Fehler abzubrechen, und im OperationOutcome muss der Text "Unzulässige Abgabeinformationen: Für diesen Workflow sind nur Abgabeinformationen für Arzneimittel zulässig." zurückgegeben werden.
</requirement>

<!-- A_24287-01 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-ERP-19" title="E-Rezept-Fachdienst - Task schließen - Aufruf ohne MedicationDispense" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels POST /Task/&lt;id&gt;/$close erlauben, dass der Aufruf ohne Übergabe einer MedicationDispense im Request Body stattfindet.Der E-Rezept-Fachdienst MUSS in dem Fall sicherstellen, dass eine MedicationDispense für diesen Task existiert. <br>
    Der E-Rezept-Fachdienst MUSS, falls keine MedicationDispense zum dazugehörigen Task existiert, mit dem Fehler 403 abbrechen. Im Fehlerfall ist die Meldung "Abschluss des Workflows konnte nicht durchgeführt werden. Dispensierinformationen wurden nicht bereitgestellt." im OperationOutcome zu übermitteln.
</requirement>

<!-- A_26481 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-ERP-20" title="E-Rezept-Fachdienst - Task schließen - Überschreiben vorheriger MedicationDispenses" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/&lt;id&gt;/$close sicherstellen, dass alle vorhandenen MedicationDispenses und ihre referenzierten Medications gelöscht werden, wenn der Client im Aufruf eine neue MedicationDispense übermittelt, sodass nach Abschluss der Operation nur die neu übermittelten MedicationDispenses gespeichert sind.
</requirement>

<!-- A_22069-01 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-ERP-21" title="E-Rezept-Fachdienst - Task schließen - Speicherung mehrerer MedicationDispenses" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/&lt;id&gt;/$close auch die Übergabe mehrerer MedicationDispense-Objekte in einem validen Standard-FHIR Bundle im http-Body des Requests ermöglichen.
</requirement>

<!-- A_25928-01 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-ERP-22" title="E-Rezept-Fachdienst - Task schließen - Daten ePA Medication Service bereitstellen (Dispensierinformationen)" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/&lt;id&gt;/$close, wenn die Operation erfolgreich abgeschlossen werden kann, die Daten der Dispensierinformationen mit Status = "completed" für die Übermittlung in den ePA Medication Service bereitstellen.
</requirement>

<!-- A_27814 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-ERP-23" title="E-Rezept-Fachdienst - Task schließen - T-Rezept Daten an BfArM Webdienst bereitstellen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/&lt;id&gt;/$close mit Flowtype 166, wenn die Operation erfolgreich abgeschlossen werden kann, die Daten des digitalen Durchschlags E-T-Rezept dem BfArM Webdienst bereitstellen.
</requirement>

Der Implementation Guide zur Übermittlung des digitalen Durchschlags an den BfArM Webdienst ist im [gemIG_TIFlow_bfarm] beschrieben.
