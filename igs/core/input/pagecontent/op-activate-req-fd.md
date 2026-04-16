Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$activate`.



<!-- A_19022-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-173" title="TI-Flow-Fachdienst - Task aktivieren - Rollenprüfung" version="1">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aktivieren eines Tasks für ein E-Rezept mittels HTTP-POST/$activate-Operation auf den in der URL referenzierten /Task/&#60;id&#62; die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Leistungserbringerinstitutionen in der Rolle
  <ul>
    <li>oid_praxis_arzt</li>
    <li>oid_zahnarztpraxis</li>
    <li>oid_praxis_psychotherapeut</li>
    <li>oid_krankenhaus</li>
    <li>oid_institution-vorsorge-reha</li> 
  </ul>
  die Operation am Fachdienst aufrufen und bei Abweichungen die Operation mit dem folgenden Fehler:
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
    abbrechen, damit E-Rezepte nicht durch Unberechtigte eingestellt werden können.
</requirement>

<!-- A_19024-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-174" title="TI-Flow-Fachdienst - Task aktivieren - Prüfung AccessCode" version="1">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate den im HTTP-RequestHeader "X-AccessCode" oder URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten Task gespeicherten AccessCode Task.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode prüfen und bei Ungleichheit oder Fehlen des AccessCodes die Operation mit dem folgenden Fehler:
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
            <td>TIFLOW_ACCESSCODE_MISMATCH</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table> 
    abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.
</requirement>

<!-- A_19024-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-175" title="TI-Flow-Fachdienst - Task aktivieren - Prüfung Status" version="1">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate den im referenzierten Task gespeicherten Status Task.status prüfen und, wenn Task.status ungleich "draft" ist, die Operation mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>412 - Precondition Failed</td>
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
            <td>TIFLOW_TASK_STATUS_MISMATCH</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Task has invalid status.</td>
        </tr>
    </table> 
    abbrechen.
</requirement>


<!-- A_19020 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-176" title="TI-Flow-Fachdienst - Task aktivieren - Schemavalidierung" version="1">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate den im Aufrufparameter übergebenen FHIR-Operationsparameter des QES-Datensatzes als PKCS#7-Datei einer Enveloping CAdES-Signatur entgegennehmen und verarbeiten und bei Fehlen oder ungültiger ASN.1 Datenstruktur die Operation mit dem folgenden Fehler:
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
            <td>FHIR Profile validation failed.</td>
        </tr>
    </table> 
    abbrechen, damit kein Schadcode und keine "fachfremden" Daten in den TI-Flow-Fachdienst hochgeladen werden.
</requirement>

<!-- A_20159-04 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-177" title="TI-Flow-Fachdienst - Task aktivieren - QES Prüfung Signaturzertifikat des HBA" version="1">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
    Der TI-Flow-Fachdienst MUSS das QES-Signaturzertifikat C.HP.QES in der Signatur des übergebenen QES-Datensatzes gemäß [gemSpec_PKI#TUC_PKI_030] mit folgenden Parametern auf Gültigkeit prüfen:
    <table>
        <tr>
            <th>Parameter</th>
            <th>Wert</th>
        </tr>
        <tr>
            <td>Zertifikat</td>
            <td>
                Signaturzertifikat des HBA (eingebettet in Signatur-Objekt des QES-Datensatzes):
                <ul>
                    <li>C.HP.QES (oid_hba_qes = 1.2.276.0.76.4.72 gemäß gemSpec_OID)</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>Referenzzeitpunkt</td>
            <td>Zeitpunkt der QES-Erstellung gemäß signingTime im QES-Datensatz</td>
        </tr>
        <tr>
            <td>Offline-Modus</td>
            <td>nein</td>
        </tr>
        <tr>
            <td>OCSP-Response</td>
            <td>eingebettet in QES-Datensatz</td>
        </tr>
    </table>
    <div><figcaption><strong>Tabelle: </strong>TAB_eRPFD_006 Parameter Prüfung Signaturzertifikat QES des HBA</figcaption></div>

    <br>
    
    Der TI-Flow-Fachdienst MUSS, wenn keine OCSP-Response eingebettet oder die eingebettete OCSP Response nicht gültig ist, eine gecachte OCSP-Response verwenden, wenn die gecachte OCSP-Response nach den Signaturzeitpunkt erstellt wurde, oder eine OCSP-Response beim zugehörigen TSP anfragen.

    <br>

    Der TI-Flow-Fachdienst MUSS das Signaturzertifikat prüfen, für [mathematisch gültig UND zeitlich gültig UND online gültig ] befinden und andernfalls die Operation mit dem folgenden Fehler:
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
            <td>TIFLOW_CERTIFICATE_INVALID</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table>
    abbrechen, damit sichergestellt wird, dass ausschließlich Verordnungen verwaltet werden, die von einer gültigen, nicht gesperrten Heilberufsidentität eines HBA signiert wurden.
</requirement>
<!-- ToDo: Ist die Fehlermeldung umfassend genug? Was passiert wenn TUC_PKI_030 fehlschlägt? -->

<!-- A_20159-04 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-408" title="TI-Flow-Fachdienst - Task aktivieren - QES Prüfung Signaturzertifikat des HBA - fehlender OCSP-Response" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
    Der TI-Flow-Fachdienst MUSS, wenn im Rahmen der Prüfung der Gültigkeit eines QES-Signuturzertifikates C.HP.QES die Abfrage des OCSP-Response für das Signaturzertifikat fehlschlägt, die Operation mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>512 - OCSP Backend Error</td>
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
            <td>TIFLOW_OCSP_BACKEND_ERROR</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>OCSP Backend Error</td>
        </tr>
    </table>
    abgelehnt werden.
</requirement>

<!-- A_20159-04 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-411" title="TI-Flow-Fachdienst - Task aktivieren - QES Prüfung Signaturzertifikat des HBA - OCSP-Response einbetten" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
    Der TI-Flow-Fachdienst MUSS, wenn im Rahmen der Prüfung der Gültigkeit eines QES-Signuturzertifikates C.HP.QES keine OCSP-Response eingebettet oder die eingebettete OCSP Response nicht gültig ist, die die Prüfung genutzte OCSP-Response in den QES-Datensatz einbetten.
</requirement>

<!-- A_19025-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-178" title="TI-Flow-Fachdienst - Task aktivieren - Verordnung QES prüfen" version="1">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD">
    <testProcedure id="Produkttest"/>
  </actor>
    Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate die qualifizierte Signatur des QES-Datensatzes gemäß [ETSI_QES] prüfen und bei nicht gültiger qualifizierter Signatur die Operation mit dem folgenden Fehler:
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
            <td>TIFLOW_SIGNATURE_INVALID</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table>
    abbrechen, damit der nachfolgende Workflow ausschließlich auf Basis vom Leistungserbringer mittels Signatur freigegebener Daten erfolgt.
</requirement>

<!-- A_19025-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-409" title="TI-Flow-Fachdienst - Task aktivieren - Verordnung FHIR Validierung" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD">
    <testProcedure id="Produkttest"/>
  </actor>
    Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate das innerhalb des PKCS#7-Datensatz enveloping-enthaltene FHIR-Bundle einer FHIR-Validierung gegen die eRezept-Schema-Definition der KBV kbv.ita.erp oder kbv.itv.evdga unterziehen und bei Invalidität die Operation mit dem folgenden Fehler:
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
    abbrechen.
</requirement>
<!-- ToDo: Muss in der Afo das FHIR-Schema vorgegeben werden oder ergibt sich das aus dem FHIR-Datensatz oder muss es zusätzlich noch mit dem WF-Type abgeglichen werden? -->

<!-- A_19025-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-410" title="TI-Flow-Fachdienst - Task aktivieren - Verordnung speichern" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
    Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate den Datensatz als PKCS#7-Datei  speichern und in Task.input mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 1 über eine interne, eindeutige UUID referenzieren, damit der nachfolgende Workflow auf Basis vom Leistungserbringer mittels Signatur freigegebener Daten erfolgt.
</requirement>

<!-- Diese Afo wurde nicht zugewiesen, da die Konnektoren sich nicht so verhalten. -->
<!-- A_23172 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-179" title="TI-Flow-Fachdienst - Task aktivieren - Mimetype Signatur" version="1">
    <meta lockversion="false"/>
    Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate die Angabe zum Mimetype des signierten Dokumentes prüfen und, wenn dieser ungleich "text/plain; charset=utf-8" ist, die Operation mit dem folgenden Fehler:
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
            <td>TIFLOW_SIGNATURE_INVALID</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table> 
    abbrechen.
</requirement>

<!-- A_21370 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-180" title="TI-Flow-Fachdienst - Task aktivieren - Prüfung Rezept-ID in Task gegen Verordnungsdatensatz" version="1">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate prüfen, dass die PrescriptionID des Tasks mit der PrescriptionID im übergebenen QES-Datensatz übereinstimmt und andernfalls die Operation mit dem folgenden Fehler:
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
            <td>TIFLOW_FLOWTYPE_MISMATCH</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table> 
    abbrechen.
</requirement>
<!-- ToDo: Abrenzung Fehlercode zu folgender Afo ? -->

<!-- A_21370 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-412" title="TI-Flow-Fachdienst - Task aktivieren - Prüfung Präfix Rezept-ID gegen Flowtype" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate prüfen, dass der Präfix der PrescriptionID gleich dem Flowtype des zu aktivierenden Tasks ist und andernfalls die Operation mit dem folgenden Fehler:
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
            <td>TIFLOW_FLOWTYPE_MISMATCH</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table> 
    abbrechen.
</requirement>

<!-- A_23936-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-181" title="TI-Flow-Fachdienst - Task aktivieren - Versicherten-ID als Identifikator von Versicherten" version="1">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate prüfen, dass Patient.identifier.system gleich "http://fhir.de/sid/gkv/kvid-10" ist und andernfalls die Operation mit dem folgenden Fehler:
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
            <td>TIFLOW_KVNR_INVALID</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Als Identifier für den Patienten muss eine VersichertenID (KVNR) angegeben werden.</td>
        </tr>
    </table> 
    abbrechen.
</requirement>

<!-- A_22487 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-182" title="TI-Flow-Fachdienst - Task aktivieren - Prüfregel Ausstellungsdatum" version="1">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate, wenn das Datum authoredOn zur Gültigkeitsberechnung der Verordnung nicht dem Datum in QES.Erstellung im Signaturobjekt entspricht, die Operation mit dem folgenden Fehler:
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
            <td>TIFLOW_SIGNATURE_AUTHOREDON_MISMATCH</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Ausstellungsdatum und Signaturzeitpunkt weichen voneinander ab, müssen aber taggleich sein</td>
        </tr>
    </table> 
    abbrechen.
</requirement>

<!-- A_19127-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-183" title="TI-Flow-Fachdienst - Task aktivieren - Übernahme der Versicherten-ID" version="1">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate die KVNR des Patienten dem Identifier http://fhir.de/sid/gkv/kvid-10 der Patient-Ressource im E-Rezept-Bundle entnehmen und diesen als Identifier in Task.for mit system http://fhir.de/sid/gkv/kvid-10 hinzufügen, damit ausschließlich eine gültige, vom Arzt signierte Patientenreferenz im Workflow verwendet wird.
</requirement>

<!-- A_28126 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-184" title="TI-Flow-Fachdienst - Task aktivieren - Push Notification Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate bei erfolgreichem Abschluss der Operation, den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.activate" und den Versicherten mit der KVNR = Task.for initiieren.
</requirement>

<!-- A_19128 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-185" title="TI-Flow-Fachdienst - Task aktivieren - Status ready" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS die zulässige Aktivierung eines Tasks mittels /Task/&#60;id&#62;/$activate-Operation im Status Task.status = ready vollziehen und bei erfolgreichem Abschluss der Operation die Ressource Task im HTTP-Body der HTTP-Response zurückgeben, damit die verordnende Leistungserbringerinstitution über den erfolgreichen Abschluss der Operation in Kenntnis gesetzt wird.
</requirement>
<!-- ToDo: Afo unter Beachtung von A_19029-06 trennen -->

<!-- A_19029-06 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-186" title="TI-Flow-Fachdienst - Task aktivieren - Serversignatur" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS das bei der Operation /Task/&#60;id&#62;/$activate im QES-Datensatz enthaltene Verordnung in ein Bundle gleichen Typs in JSON-Repräsentation beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task/&#60;id&#62; zurück liefern. Dies gilt für folgende Bundles: https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundlehttps://fhir.kbv.de/StructureDefinition/KBV_PR_EVDGA_Bundle <br>
    Der TI-Flow-Fachdienst MUSS für diese Bundles 
    <ul>
        <li>einen neuen, eindeutigen Identifier für die Bundle.id als UUID generieren,</li>
        <li>das Bundle entsprechend der Kanonisierungsregeln http://hl7.org/fhir/canonicalization/json#static normalisieren (Bundle.text und Bundle.meta im "root-Element" entfernen),</li>
        <li>mit der Signaturidentität des Fachdienstes ID.FD.OSIG gemäß [FHIR-Sig] signieren und</li>
        <li>das signierte Bundle mit Referenz in Task.input mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 2 zurück liefern,</li>
    </ul>
    damit der Versicherte einen Nachweis über die Integrität der gespeicherten Daten einsehen kann.
</requirement>

Die Festlegungen in [FHIR-Sig] sind in Teilen unspezifisch, konkrete Beispiele finden sich in der gematik-API-Beschreibung für das E-Rezept auf https://github.com/gematik/api-erp .<br>
Die Signatur soll als JSON Web Signature [JWS] detached erstellt werden, dementsprechend bleibt das data-Feld der JWS-Struktur leer. Im JWS-Header muss das Zertifikat C.FD.SIG eingebettet werden, mit dessen zugehörigen privaten Signaturschlüssel signiert wurde. Als Wert für targetFormat ist der MimeType application/fhir+json und für sigFormat ist der MimeType application/jose zu verwenden.

### Verifizieren von Prüfziffern

<!-- A_23888 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-187" title="TI-Flow-Fachdienst - Task aktivieren - Überprüfung der IK Nummer im Profil KBV_PR_FOR_Coverage" version="1">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/&#60;id&#62;/$activate einen im FHIR Profil KBV_PR_FOR_Coverage gespeicherten Wert für payor.identifier.value gemäß dem im "Gemeinsames Rundschreiben Institutionskennzeichen (IK)" vom 01.06.2020 unter Kapitel 1.2.5 "Prüfziffer" beschriebenen Prüfalgorithmus validieren, und bei einer fehlerhaften Prüfung die Operation mit dem folgenden Fehler:
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
            <td>TIFLOW_IKNR_INVALID</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Ungültiges Institutionskennzeichen (IKNR): Das übergebene Institutionskennzeichen im Versicherungsstatus entspricht nicht den Prüfziffer-Validierungsregeln.</td>
        </tr>
    </table> 
    abbrechen.
</requirement>

<!-- A_24030 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-188" title="TI-Flow-Fachdienst - Task aktivieren - Überprüfung der IK Nummer im Profil KBV_PR_FOR_Coverage - AlternativeID" version="1">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/&#60;id&#62;/$activate die im FHIR Profil KBV_PR_FOR_Coverage gespeicherten Werte für payor.identifier.extension:alternativeID.value[x]:valueIdentifier gemäß dem "Gemeinsames Rundschreiben Institutionskennzeichen (IK)" vom 01.06.2020 unter Kapitel 1.2.5 "Prüfziffer" beschriebenen Prüfalgorithmus validieren, und bei einer fehlerhaften Prüfung die Operation mit dem folgenden Fehler:
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
            <td>TIFLOW_IKNR_INVALID</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Ungültiges Institutionskennzeichen (IKNR): Das übergebene Institutionskennzeichen des Kostenträgers entspricht nicht den Prüfziffer-Validierungsregeln.</td>
        </tr>
    </table> 
    abbrechen.
</requirement>

<!-- A_23890-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-189" title="TI-Flow-Fachdienst - Task aktivieren - Überprüfung KVNR im Profil KBV_PR_FOR_Patient" version="1">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/&#60;id&#62;/$activate einen im FHIR Profil KBV_PR_FOR_Patient gespeicherten Wert für Patient.identifier:versichertenId.value gemäß der Anlage 1 der "Prüfziffernberechnung für die Krankenversichertennummer nach § 290 SGB V" vom 26.02.2019 beschriebenen Prüfalgorithmus validieren, und bei einer fehlerhaften Prüfung die Operation mit dem folgenden Fehler:
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
            <td>TIFLOW_KVNR_INVALID</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Ungültige Versichertennummer (KVNR): Die übergebene Versichertennummer des Patienten entspricht nicht den Prüfziffer-Validierungsregeln.</td>
        </tr>
    </table> 
    abbrechen.
</requirement>

<!-- A_23891-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-190" title="TI-Flow-Fachdienst - Task aktivieren - Überprüfung der ANR und ZANR im Profil KBV_PR_FOR_Practitioner" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/&#60;id&#62;/$activate einen im FHIR Profil KBV_PR_FOR_Practitioner hinterlegten Wert für identifier:ANR.value bzw. identifier:ZANR.value gemäß der Anlage 6 BMV-Ä der "Technischen Anlage zum Vertrag über den Datenaustausch zwischen dem GKV-Spitzenverband (Spitzenverband Bund der Krankenkassen) und der Kassenärztlichen Bundesvereinigung" unter "Aufbau der lebenslangen Arztnummer – LANR" beschriebenen Prüfalgorithmus unter Beachtung der folgenden zulässigen Ausnahmen validieren, und bei einer fehlerhaften Prüfung auf diese Auffälligkeit gemäß der Konfiguration reagieren.
    <table>
        <tr> 
            <th>ANR/ZANR</th>
            <th>Ursache</th>
        </tr>
        <tr> 
            <td>555555 plus Ordnungsnummer für die Reihenfolge in der Anzeige an die ASV-Verzeichnisstelle (KH-Zähler) plus Fachgruppencode</td>
            <td>Verordnungen im Rahmen der Versorgung nach § 116b Abs. 1 SGB</td>
        </tr>
    </table>
    <div><figcaption><strong>Tabelle: </strong>TAB_eRPFD_016 Zulässige Ausnahmen in Form von Pseudoarztnummern</figcaption></div>
</requirement>

Hinweis: Folgende weitere Pseudoarztnummern werden genutzt. Sie sind Prüfziffernkonform:
<table>
    <tr> 
        <th>ANR/ZANR</th>
        <th>Ursache</th>
    </tr>
    <tr> 
        <td>4444444 plus Fachgruppencode</td>
        <td>Pseudoarztnummer im Rahmen des Reha-Entlassmanagements</td>
    </tr>
    <tr> 
        <td>999999900</td>
        <td>Ambulanzen in Krankenhäusern gemäß §§ 115b, 116, 116a, 117, 118, 118a, 119, 119c und 140a SGB V - insbesondere Hochschulambulanzen sowie psychiatrische und psychosomatische Institutsambulanzen; Privatärzte ohne LANR, Ärzte in Weiterbildung, Leistungserbringung im Rahmen der gesetzlichen Unfallversicherung - insbesondere gemäß § 33 und 34 SGB VII</td>
    </tr>
    <tr> 
        <td>000000000</td>
        <td>Ausnahme der Verordnungen im Rahmen der Versorgung nach § 116b Abs. 1 SGB V</td>
    </tr>
    <tr> 
        <td>999999991</td>
        <td>Zahnärzte z.B. in zahnärztlichen Hochschulambulanzen</td>
    </tr>
    <tr> 
        <td>333333300</td>
        <td>Verordnungen von Arznei, Heil- und Hilfsmitteln im Rahmen der spezialisierten ambulanten Palliativversorgung (SAPV)</td>
    </tr>
</table>
<div><figcaption><strong>Tabelle: </strong>TAB_eRPFD_017 Zulässige Ausnahmen in Form von Pseudoarztnummern (Prüfzifferkonform)</figcaption></div>

Hinweis: Im Rahmen der ambulanten spezialfachärztlichen Versorgung (ASV) nach § 116b SGB V wird gemäß der ASV-Vereinbarung von Krankenhausärzten die sog. Fachgruppennummer statt der LANR verwendet. Die Fachgruppennummer wird ein einem separaten Element hinterlegt. In diesem Fall muss keine ANR angegeben werden.

<!-- A_24031 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-191" title="TI-Flow-Fachdienst - Task aktivieren - Überprüfung der ANR und ZANR - Konfiguration bei Auffälligkeiten" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS für die Überprüfung der ANR/ZANR eine Möglichkeit der Konfiguration vorsehen und bei der Durchführung einer Vergleichsoperation je nach Konfiguration bei Auffälligkeit die Operation mit einer Warnung fortführen oder mit einer Fehlermeldung abbrechen.
</requirement>

<!-- A_24032 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-192" title="TI-Flow-Fachdienst - Task aktivieren - Überprüfung der ANR und ZANR - Konfiguration Fehler" version="1">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS für die Überprüfung der ANR/ZANR, wenn bei der Prüfung eine Auffälligkeit auftritt und die Konfiguration Fehler aktiv ist, die Operation mit dem folgenden Fehler:
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
            <td>TIFLOW_LANR_ZANR_INVALID</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Ungültige Arztnummer (LANR oder ZANR): Die übergebene Arztnummer entspricht nicht den Prüfziffer-Validierungsregeln.</td>
        </tr>
    </table> 
    abbrechen.
</requirement>

<!-- A_24033 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-193" title="TI-Flow-Fachdienst - Task aktivieren - Überprüfung der ANR und ZANR - Konfiguration Warning" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS für die Überprüfung der ANR/ZANR, wenn bei der Prüfung eine Auffälligkeit auftritt und die Konfiguration Warning aktiv ist, mit dem Http-Responsecode 252 antworten und den Response für die Auffälligkeit mit einem Http-Header "Warning" mit
    <ul>
        <li>warning-code: 252</li>
        <li>warning-agent: "erp-server"</li>
        <li>warning-text: "Ungültige Arztnummer (LANR oder ZANR): Die übergebene Arztnummer entspricht nicht den Prüfziffer-Validierungsregeln."</li>
    </ul>
    erweitern.
</requirement>

<!-- A_23892 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-194" title="TI-Flow-Fachdienst - Task aktivieren - Überprüfung der PZN im Profil KBV_PR_ERP_Medication_PZN" version="1">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/&#60;id&#62;/$activate den im FHIR Profil KBV_PR_ERP_Medication_PZN gespeicherten Wert für code.coding:pznCode.code gemäß den "Technischen Hinweisen zur PZN-Codierung - Prüfziffernberechnungen der PZN, PPN und Basic UDI-DI" beschriebenen Prüfalgorithmus validieren, und bei einer fehlerhaften Prüfung die Operation mit dem folgenden Fehler:
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
            <td>TIFLOW_EREZEPT_PZN_INVALID</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Ungültige PZN: Die übergebene Pharmazentralnummer entspricht nicht den vorgeschriebenen Prüfziffer-Validierungsregeln.</td>
        </tr>
    </table> 
    abbrechen.
</requirement>
<!-- ToDo: ggf. nach IG rx verschieben -->

<!-- A_24034 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-195" title="TI-Flow-Fachdienst - Task aktivieren - Überprüfung der PZN im Profil KBV_PR_ERP_Medication_Compounding" version="1">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/&#60;id&#62;/$activate den im FHIR Profil KBV_PR_ERP_Medication_Compounding gespeicherten Wert für ingredient.item[x]:itemCodeableConcept.coding:pznCode.code gemäß den "Technischen Hinweisen zur PZN-Codierung - Prüfziffernberechnungen der PZN, PPN und Basic UDI-DI" beschriebenen Prüfalgorithmus validieren, und bei einer fehlerhaften Prüfung die Operation mit dem folgenden Fehler:
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
            <td>TIFLOW_EREZEPT_PZN_INVALID</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Ungültige PZN: Die übergebene Pharmazentralnummer entspricht nicht den vorgeschriebenen Prüfziffer-Validierungsregeln.</td>
        </tr>
    </table> 
    abbrechen.
</requirement>
<!-- ToDo: ggf. nach IG rx verschieben -->

<!-- A_22925 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-196" title="TI-Flow-Fachdienst - Task aktivieren - Längenprüfung PZN" version="1">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/&#60;id&#62;/$activate, wenn die PZN einer übergebenen PZN-Verordnung in KBV_PR_ERP_Medication_PZN.code.coding.code nicht 8-stellig ist, die Operation mit dem folgenden Fehler:
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
            <td>TIFLOW_EREZEPT_PZN_INVALID</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Länge PZN unzulässig (muss 8-stellig sein)</td>
        </tr>
    </table> 
    abbrechen.
</requirement>
<!-- ToDo: ggf. nach IG rx verschieben -->
