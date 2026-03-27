
Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für den Device-Query-Endpunkt.

<!-- A_19400 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-130" title="TI-Flow-Fachdienst - MedicationDispense - unzulässige Operationen" version="0">
  <meta lockversion="false"/>
  <actor name="TI_Flow_FD">
   	<testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS alle Zugriffe auf die Ressource MedicationDispense mittels der HTTP-Operationen PUT, PATCH, HEAD und DELETE sowie POST unterbinden, damit keine unzulässigen Operationen auf den Rezeptdaten ausgeführt werden können.
</requirement>

### GET /MedicationDispense

<!-- A_19405-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-131" title="TI-Flow-Fachdienst - MedicationDispense abrufen - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="TI_Flow_FD">
    	<testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /MedicationDispense sicherstellen, dass ausschließlich Nutzer in der Rolle 
  <ul>
    <li>oid_versicherter</li>
  </ul>
  die Operation am TI-Flow-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, und bei Abweichungen mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>403 - Forbidden</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>invalid</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>TIFLOW_AUTH_ROLE_NOT_ALLOWED</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern</td>
        </tr>
    </table> 
    abrechen, damit Dispensierinformationen nicht durch Unberechtigte ausgelesen werden können.
</requirement>

 <!-- A_19406-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-132" title="TI-Flow-Fachdienst - MedicationDispense abrufen - Filter MedicationDispense auf KVNR des Versicherten" version="0">
  <meta lockversion="false"/>
  <actor name="TI_Flow_FD">
   	<testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /MedicationDispense die dem Versicherten zugeordneten MedicationDispense-Ressourcen anhand der KVNR des Versicherten im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, die in MedicationDispense.subject die entsprechende KVNR des begünstigten Patienten referenziert haben, damit ausschließlich Versicherte ihre eigenen Dispensierinformationen einsehen können.
</requirement>

<!-- A_26527 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-133" title="TI-Flow-Fachdienst - MedicationDispense abrufen - Referenzierung MedicationDispense und Medication" version="0">
  <meta lockversion="false"/>
  <actor name="TI_Flow_FD">
   	<testProcedure id="Produkttest"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /MedicationDispense sicherstellen, dass alle im zurückgegebenen Search-Bundle enthaltenen Ressourcen mit eindeutig identifizierbaren IDs versehen sind und Referenzen innerhalb des Bundles auf eine Ressource mit einer eindeutigen ID verweisen.
</requirement>

<!-- A_22070-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-134" title="TI-Flow-Fachdienst - MedicationDispense abrufen - Rückgabe mehrerer MedicationDispenses" version="0">
  <meta lockversion="false"/>
  <actor name="TI_Flow_FD">
   	<testProcedure id="Produkttest"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS im Anwendungsfall "Abgabeinformationen abrufen" die Suche aller Abgabeinformationen zu einer Verordnung mit dem Aufruf GET /MedicationDispense?identifier=https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId|&lt;PrescriptionID&gt; unterstützten und dabei eines oder mehrere MedicationDispense-Objekte in einem Bundle an den Aufrufenden zurückgeben.
</requirement>

Der TI-Flow-Fachdienst soll eine mögliche Konstellation von Bundles im Ergebnis-Bundle auflösen, sodass das Ergebnis-Bundle ausschließlich MedicationDispense-Objekte enthält, unabhängig davon, ob ein oder mehrere dieser Objekte zu je einem Task gehören.