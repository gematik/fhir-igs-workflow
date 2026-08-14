Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für den Consent-Endpunkt.

<!-- A_22153 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A201" title="TI-Flow-Fachdienst - Consent - unzulässige Operationen" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS alle Zugriffe auf die Ressource Consent mittels der HTTP-Operationen PUT, PATCH, oder HEAD unterbinden und mit mit dem HTTP-Code "405 - Method Not Allowed" abbrechen, damit keine unzulässigen Operationen ausgeführt werden können.
</requirement>

<!-- ToDo: Neue Anforderung aller zu verwaltenden Einwilligungen? (Oder wird das durch die Profilierung der Ressource festgelegt)  -->
<!--
  Der TI-Flow-Fachdienst MUSS Consent Ressourcen mit den folgenden Categorien verwalten:
  <ul>
        <li>https://gematik.de/fhir/erpchrg/CodeSystem/GEM_ERPCHRG_CS_ConsentType</li>
        <li>https://gematik.de/fhir/erp-eu/CodeSystem/GEM_ERPEU_CS_ConsentType</li>
  </ul>
-->
  


### POST /Consent

<!-- A_22161 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A202" title="TI-Flow-Fachdienst - Consent schreiben - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent die zeta-user-info.professionOID des Nutzers bestimmen und sicherstellen, dass ausschließlich Nutzer in der Rolle 
  <ul>
    <li>oid_versicherter</li>
  </ul> 
  die Operation am TI-Flow-Fachdienst aufrufen, und bei Abweichungen die Operation mit dem folgenden Fehler:
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
            <td>Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern</td>
        </tr>
    </table> 
    abbrechen, damit eine Einwilligung nicht durch Unberechtigte erteilt werden kann.
</requirement>

<!-- A_22289 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A203" title="TI-Flow-Fachdienst - Consent schreiben - Prüfung KVNR" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent sicherstellen, dass der zeta-user-info.identifier des Nutzers (KVNR) und die KVNR in Consent.patient.identifier übereinstimmen und im Fehlerfall die Operation mit dem folgenden Fehler:
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
        <td>SVC_IDENTITY_MISMATCH</td>
    </tr>
    <tr>
        <th>Details Text</th>
        <td>FHIR Profile Validation Failed</td>
    </tr>
  </table> 
  abbrechen, damit eine Einwilligung für einen Versicherten nicht durch Dritte erteilt werden kann.
</requirement>

<!-- A_22351 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A204" title="TI-Flow-Fachdienst - Consent schreiben - FHIR-Validierung" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS die im HTTP-POST-Operation auf die Ressource Consent übertragene Consent Ressource gegen das FHIR-Profil Consent prüfen und bei Nicht-Konformität die Operation mit dem folgenden Fehler:
  <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
    <tr>
        <th>HTTP-Code</th>
        <td>400 - Bad Request</td>
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
        <td>SVC_VALIDATION_FAILED</td>
    </tr>
    <tr>
        <th>Details Text</th>
        <td>FHIR Profile Validation Failed</td>
    </tr>
  </table> 
  abbrechen, damit nur FHIR-valide Ressourcen in den TI-Flow-Fachdienst hochgeladen werden.
</requirement>

<!-- A_22162-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A205" title="TI-Flow-Fachdienst - Consent schreiben - nur eine Einwilligung pro KVNR und Einwilligungstyp" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent sicherstellen, dass noch keine Consent Ressource für den zeta-user-info.identifier des Nutzers (KVNR) und Consent.category.coding.code = &lt;Einwilligungstyp&gt; aus URL-Parameter category gespeichert ist und im Fehlerfall die Operation mit dem folgenden Fehler:
  <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
    <tr>
        <th>HTTP-Code</th>
        <td>409 - Conflict</td>
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
        <td>TIFLOW_CONSENT_ALREADY_EXISTS</td>
    </tr>
    <tr>
        <th>Details Text</th>
        <td>-</td>
    </tr>
  </table> 
  abbrechen, um maximal eine Einwilligung für den Versicherten für jeden Einwilligungstypen zu speichern.
</requirement>

<!-- A_27143 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A206" title="TI-Flow-Fachdienst - Consent schreiben - Zeitstempel setzen" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent den Zeitpunkt des erfolgreichen Operationsaufrufs in der Consent-Ressource unter .dateTime mit Sekundengenauigkeit hinterlegen.
</requirement>

<!-- A_22350 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A207" title="TI-Flow-Fachdienst - Consent schreiben - Persistieren" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent - falls bei den Prüfungen keine Fehler aufgetreten sind, welche zum Abbruch der Operation führen - die übermittelte Ressource persistieren.
</requirement>

<!-- A_27143 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A208" title="TI-Flow-Fachdienst - Consent schreiben - Persistieren" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent, falls bei den Prüfungen keine Fehler aufgetreten sind, welche zum Abbruch der Operation führen, die übermittelte Ressource persistieren.
</requirement>

### GET /Consent

<!-- A_22159 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A209" title="TI-Flow-Fachdienst - Consent lesen - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Consent die zeta-user-info.professionOID des Nutzers bestimmen und sicherstellen, dass ausschließlich Nutzer in der Rolle 
  <ul>
    <li>oid_versicherter</li>
  </ul>  
  die Operation am TI-Flow-Fachdienst aufrufen, und bei Abweichungen die Operation mit dem folgenden Fehler:
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
            <td>Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern</td>
        </tr>
    </table> 
    abbrechen, damit die Information zur Einwilligung nicht durch Unberechtigte ausgelesen werden kann.
</requirement>

<!-- A_22160 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A210" title="TI-Flow-Fachdienst - Consent lesen - Filter KVNR" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Consent die dem Versicherten zugeordneten Consent-Ressourcen anhand des zeta-user-info.identifier des Nutzers (KVNR) identifizieren und in den Response aufnehmen, die in Consent.Patient.identifier die entsprechende KVNR des Versicherten referenziert haben, damit ausschließlich Versicherte ihre eigenen Information zu Einwilligungen einsehen können.
</requirement>


### DELETE /Consent

<!-- A_22154 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A211" title="TI-Flow-Fachdienst - Consent löschen - alles Löschen verbieten" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent prüfen, dass der URL-Parameter ?category angegeben ist und bei Abweichung die Operation mit dem folgenden Fehler:
    <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
      <tr>
          <th>HTTP-Code</th>
          <td>405 - Method Not Allowed</td>
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
          <td>TIFLOW_CONSENT_CATEGORY_REQUIRED</td>
      </tr>
      <tr>
          <th>Details Text</th>
          <td>-</td>
      </tr>
    </table> 
  abbrechen, um das Löschen mehrerer Ressourcen über einen Request zu verhindern.
</requirement>

<!-- A_22155 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A212" title="TI-Flow-Fachdienst - Consent löschen - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent die zeta-user-info.professionOID des Nutzers bestimmen und sicherstellen, dass ausschließlich Nutzer in der Rolle 
  <ul>
    <li>oid_versicherter</li>
  </ul> 
  die Operation am TI-Flow-Fachdienst aufrufen und bei Abweichungen die Operation mit dem folgenden Fehler:
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
            <td>Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern</td>
        </tr>
    </table> 
    abbrechen, damit die Information zur Einwilligung nicht durch Unberechtigte gelöscht werden kann.
</requirement>

<!-- A_22874-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A213" title="TI-Flow-Fachdienst - Consent löschen - Prüfung category" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent prüfen, dass der für ?category angegebene Wert in den CodeSystemen 
  <ul>
    <li>https://gematik.de/fhir/erpchrg/CodeSystem/GEM_ERPCHRG_CS_ConsentType</li>
    <li>https://gematik.de/fhir/erp-eu/CodeSystem/GEM_ERPEU_CS_ConsentType</li>
  </ul>
  enthalten ist und bei fehlerhafter Prüfung die Operation mit dem folgenden Fehler:
  <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
    <tr>
        <th>HTTP-Code</th>
        <td>400 - Bad Request</td>
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
        <td>TIFLOW_CONSENT_CATEGORY_INVALID</td>
    </tr>
    <tr>
        <th>Details Text</th>
        <td>-</td>
    </tr>
  </table> 
  abbrechen, damit nur Löschrequests für definierte Consent Typen ausgeführt werden.
</requirement>

Es bestehen anwendungsfall-spezifische Anforderungen, welche Inhalte beim Widerruf einer Einwilligung zu löschen sind.
<!-- ToDo: A_27131 -> EU IG -->

<!-- A_22158 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A214" title="TI-Flow-Fachdienst - Consent löschen - Ressource löschen" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent die Consent-Ressource löschen, bei der Consent.patient.identifier dem zeta-user-info.identifier des Nutzers (KVNR) sowie Consent.category.coding.code dem in ?category übermittelten Wert entspricht.
</requirement>
