Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für den Consent-Endpunkt.

<!-- A_22153 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Consent - unzulässige Operationen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS alle Zugriffe auf die Ressource Consent mittels der HTTP-Operationen PUT, PATCH, oder HEAD unterbinden, damit keine unzulässigen Operationen auf die Informationen zur Einwilligung ausgeführt werden können.
</requirement>

<!-- ToDo: Neue Anforderung aller zu verwaltenden Einwilligungen? (Oder wird das durch die Profilierung der Ressource festgelegt)  -->
<!-->
  Der E-Rezept-Fachdienst MUSS Consent Ressourcen mit den folgenden Categorien verwalten:
  <ul>
        <li>https://gematik.de/fhir/erpchrg/CodeSystem/GEM_ERPCHRG_CS_ConsentType </li>
        <li>https://gematik.de/fhir/erp-eu/CodeSystem/GEM_ERPEU_CS_ConsentType </li>
  </ul>
-->
  


#### POST /Consent
<!-- A_22161 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Consent schreiben - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Einwilligung nicht durch Unberechtigte erteilt werden kann.
</requirement>

<!-- A_22289 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Consent schreiben - Prüfung KVNR" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent sicherstellen, dass die KVNR im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests und die KVNR in Consent.patient.identifier übereinstimmen, damit eine Einwilligung für einen Versicherten nicht durch Dritte erteilt werden kann. Im Fehlerfall muss der Http-Request mit dem Http-Fehlercode 403 abgewiesen werden.
</requirement>

<!-- A_22351 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Consent schreiben - FHIR-Validierung" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS die im HTTP-POST-Operation auf die Ressource Consent übertragene Consent Ressource gegen das FHIR-Profil Consent prüfen und bei Nicht-Konformität das Anlegen der Ressource im E-Rezept-Fachdienst mit dem http-Status-Code 400 ablehnen, damit nur FHIR-valide Ressourcen in den E-Rezept-Fachdienst hochgeladen werden.
</requirement>

<!-- A_22162-01 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Consent schreiben - nur eine Einwilligung pro KVNR und Einwilligungstyp" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent sicherstellen, dass noch keine Consent Ressource für die KVNR im ACCESS_TOKEN und Consent.category.coding.code = &lt;Einwilligungstyp&gt; aus URL-Parameter category gespeichert ist, um maximal eine Einwilligung für den Versicherten für jeden Einwilligungstypen zu speichern. Im Fehlerfall muss der HTTP-Request mit dem HTTP-Fehlercode 409 abgewiesen werden.
</requirement>

<!-- A_27143 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Consent schreiben - Zeitstempel setzen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent den Zeitpunkt des erfolgreichen Operationsaufrufs in der Consent-Ressource unter .dateTime mit Sekundengenauigkeit hinterlegen.
</requirement>

A_22350 - E-Rezept-Fachdienst - Consent schreiben – Persistieren<=

<!-- A_27143 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Consent schreiben - Persistieren" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent, falls bei den Prüfungen keine Fehler aufgetreten sind, welche zum Abbruch der Operation führen, die übermittelte Ressource persistieren.
</requirement>

#### GET /Consent
<!-- A_22159 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Consent lesen - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Consent sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit die Information zur Einwilligung nicht durch Unberechtigte ausgelesen werden kann.
</requirement>

<!-- A_22160 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Consent lesen - Filter KVNR" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Consent die dem Versicherten zugeordneten Consent-Ressourcen anhand der KVNR des Versicherten im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren und in den Response aufnehmen, die in Consent.Patient.identifier die entsprechende KVNR des Versicherten referenziert haben, damit ausschließlich Versicherte ihre eigenen Information zu Einwilligungen einsehen können.
</requirement>


#### DELETE /Consent
<!-- A_22154 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Consent löschen - alles Löschen verbieten" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent ohne Angabe ?category mit dem HTTP-Fehlercode 405 ablehnen, um das Löschen mehrerer Ressourcen über einen Request zu verhindern.
</requirement>

<!-- A_22155 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Consent löschen - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am E-Rezept-Fachdienst aufrufen dürfen, damit die Information zur Einwilligung nicht durch Unberechtigte gelöscht werden kann.
</requirement>

<!-- A_22874-02 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Consent löschen - Prüfung category" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent prüfen, dass der für ?category angegebene Wert in den CodeSystemen 
  <ul>
    <li>https://gematik.de/fhir/erpchrg/CodeSystem/GEM_ERPCHRG_CS_ConsentType</li>
    <li>https://gematik.de/fhir/erp-eu/CodeSystem/GEM_ERPEU_CS_ConsentType</li>
  </ul>
  enthalten ist und bei fehlerhafter Prüfung den Request mit dem Fehler 400 abbrechen, damit nur Löschrequests für definierte Consent Typen ausgeführt werden.
</requirement>

Es bestehen anwendungsfall-spezifische Anforderungen, welche Inhalte beim Widerruf einer Einwilligung zu löschen sind.
<!-- ToDo: A_22157 -> CHRG IG -->
<!-- ToDo: A_27131 -> EU IG -->

<!-- A_22158 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Consent löschen - Ressource löschen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent die Ressource löschen, bei der Consent.patient.identifier der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests sowie Consent.category.coding.code dem in ?category übermittelten Wert entspricht.
</requirement>
