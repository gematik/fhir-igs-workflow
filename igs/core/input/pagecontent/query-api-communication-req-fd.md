Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für den Communication-Endpunkt.

<!-- A_19401 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-316" title="TI-Flow-Fachdienst - Communication - unzulässige Operationen" version="0">
  <meta lockversion="false"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS alle Zugriffe auf die Ressource Communication mittels der HTTP-Operationen PUT, PATCH und HEAD unterbinden, damit keine unzulässigen Operationen auf den Kommunikationsnachrichten ausgeführt werden können.
</requirement>

<!-- A_19446-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-317" title="TI-Flow-Fachdienst - Communication - Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET, DELETE und POST-Operation auf den Endpunkt /Communication bzw. /Communication/&lt;id&gt; sicherstellen, dass ausschließlich Versicherte, Leistungserbingerinstitutionen und Kostenträger in der Rolle
    <ul>
        <li>oid_versicherter</li>
        <li>oid_oeffentliche_apotheke</li>
        <li>oid_krankenhausapotheke</li>
        <li>oid_kostentraeger</li>
    </ul>
    die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, und bei Abweichungen mit dem folgenden Fehler:
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
    abrechen, damit der Nachrichtenaustausch nicht zwischen Unbefugten erfolgt.
</requirement>
<!-- ToDo: Fehlt hier die Angabe des Fehlercodes? Siehe auch entsprechende Afos in allen anderen SST. -->

### GET /Communication


<!-- A_19520-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-318" title="TI-Flow-Fachdienst - Nachrichten abrufen - für Empfänger filtern" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Abrufen von Nachrichten über die http-Operation GET auf den Endpunkt /Communication bzw. beim Abruf einer einzelnen Nachricht über /Communication/&lt;id&gt; ausschließlich die Nachrichten an den Aufrufer zurückgeben, die im Attribut Communication.recipient oder Communication.sender mit dem entsprechenden Identifier https://gematik.de/fhir/sid/telematik-id für Apotheken bzw. http://fhir.de/sid/gkv/kvid-10 für Versicherte den gleichen Typ und den identischen Wert haben wie im Attribut "idNummer" des übergebenen ACCESS_TOKEN im HTTP-Header "Authorization" für Versicherten-ID bzw. Telematik-ID, damit keine Nachrichten an Dritte unrechtmäßig ausgelesen werden.
</requirement>

<!-- A_19521 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-319" title="TI-Flow-Fachdienst - Nachrichten abrufen - als abgerufen markieren" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Abrufen von Nachrichten über die http-Operation GET auf den Endpunkt /Communication bzw. beim Abruf einer einzelnen Nachricht über /Communication/&lt;id&gt; den Wert des Attributs Communication.received = &lt;aktuelle Systemzeit&gt setzen, wenn dieser Wert zum Zeitpunkt des Abrufs der Nachrichten NULL ist, damit Nutzer eine Filtermöglicheit auf "neue Nachrichten" haben.
</requirement>

### POST /Communication

<!-- A_19447-06 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-320" title="TI-Flow-Fachdienst - Nachricht einstellen - Schemaprüfung" version="1">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication die im http-Request-Body übergebene Communications-Ressource gegen das aus der Kommunikationsbeziehung ableitbare, zulässige Schema gemäß TAB_eRPFD_008 prüfen und den Aufruf bei Nicht-Konformität mit dem folgenden Fehler:
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
    ablehnen, damit ausschließlich konforme E-Rezept-Nachrichten ausgetauscht werden.
    <table>
    <tr> 
		<th>sender</th>
		<th>recipient</th>
        <th>zusätzliche Bedingung</th>
        <th>Schema</th>
	</tr>
	<tr> 
		<td>KVNR</td>
		<td>Telematik-ID</td>
        <td>Communication.basedOn referenziert Task</td>
        <td>https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq</td>
	</tr>
    <tr> 
		<td>Telematik-ID</td>
		<td>KVNR</td>
        <td>Communication.basedOn referenziert Task</td>
        <td>
            https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Reply <br> https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DiGA 
        </td>
	</tr>
    <tr> 
		<td>KVNR</td>
		<td>Telematik-ID</td>
        <td>Communication.basedOn referenziert ChargeItam</td>
        <td>https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReq</td>
	</tr>
    <tr> 
		<td>Telematik-ID</td>
		<td>KVNR</td>
        <td>Communication.basedOn referenziert ChargeItam</td>
        <td>https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReqReply</td>
	</tr>
    </table>
    <div><figcaption><strong>Tabelle: </strong>TAB_eRPFD_008 Nachrichtentyp zu Kommunikationsbeziehung</figcaption></div>
</requirement>
<!-- ToDo: DiGA und rx trennen -->

<!-- A_23878-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-321" title="TI-Flow-Fachdienst - Nachricht einstellen - Validierung Payload GEM_ERP_PR_Communication_DispReq" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication, falls die Ressource dem GEM_ERP_PR_Communication_DispReq-Profil entspricht, den Inhalt der contentString-Eigenschaft auf valides JSON sowie gegen die Struktur in "Tabelle: E-Rezept einer Apotheke zuweisen" überprüfen und bei negativem Prüfergebnis, mit dem folgenden Fehler:
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
    abbrechen sowie mit einer aussagekräftigen Fehlermeldung in Form einer eingebetteten OperationOutcome-Ressource antworten.
</requirement>

<!-- A_23879-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-322" title="TI-Flow-Fachdienst - Nachricht einstellen - Validierung Payload  GEM_ERP_PR_Communication_Reply" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication, falls die Ressource dem GEM_ERP_PR_Communication_Reply-Profil entspricht, den Inhalt der contentString-Eigenschaft auf valides JSON sowie gegen die Struktur in "Tabelle: Nachricht als Apotheke an einen Versicherten schicken" überprüfen und bei negativem Prüfergebnis, mit dem folgenden Fehler:
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
    abbrechen sowie mit einer aussagekräftigen Fehlermeldung in Form einer eingebetteten OperationOutcome-Ressource antworten.
</requirement>

<!-- A_19448-04 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-323" title="TI-Flow-Fachdienst - Nachricht einstellen - Absender und Sendedatum" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication die Absenderidentifikation aus dem Attribut idNummer des im HTTP-Header "Authorization" übergebenen ACCESS_TOKEN mit dem entsprechenden System https://gematik.de/fhir/sid/telematik-id für Institutionen der TI bzw. http://fhir.de/sid/gkv/kvid-10 für Versicherte übernehmen sowie das Absendedatum Communication.sent auf die aktuelle Systemzeit des TI-Flow-Fachdienstes setzen, damit Absender und Sendezeitpunkt für den Empfänger eindeutig sind.
</requirement>

<!-- A_20231-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-327" title="TI-Flow-Fachdienst - Nachricht einstellen - Ausschluss Nachrichten an Empfänger gleich Absender" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS das Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication mit dem folgenden Fehler:
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
            <td>TIFLOW_MESSAGE_TO_SELF</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table> 
    abbrechen, wenn der Empfänger Communication.recipient gleich der Absenderidentifikation im Attribut idNummer des übergebenen ACCESS_TOKEN im HTTP-Header "Authorization" ist, damit irreführende Kommunikationsbeziehungen nicht zu einer vermeidbaren Mehrbelastung des TI-Flow-Fachdienstes führen.
</requirement>

<!-- A_19450-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-328" title="TI-Flow-Fachdienst - Nachricht einstellen - Schadcodeprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS das Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication mit dem folgenden Fehler:
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
            <td>TIFLOW_COMMUNICATION_PAYLOAD_INVALID</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table> 
    abbrechen, wenn
    <ul>
        <li>der Nachrichteninhalt Communication.payload größer als 10 kByte ist oder</li>
        <li>in von Versicherten eingestellten Nachrichten in Communication.payload eine externe URLs enthält oder</li>
        <li>ein Attachment mit MimeType "application/*" enthält,</li>
    </ul>
    damit über den TI-Flow-Fachdienst kein Schadcode verteilt wird.
</requirement>

<!-- A_20885-04 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-329" title="TI-Flow-Fachdienst - Nachricht einstellen - Prüfung Versichertenbezug" version="1">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS das Einstellen einer Nachricht des Profils "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq" durch einen Versicherten über die http-Operation POST auf den Endpunkt /Communication mit dem folgenden Fehler:
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
            <td>TIFLOW_INSURANT_NOT_ELIGIBLE</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table> 
    abbrechen, wenn die KVNR des in Communication.basedOn referenzierten Tasks Task.for ungleich der KVNR des Einstellenden in "idNummer" des übergebenen ACCESS_TOKEN ist, um irreführende Testnachrichten zu unterbinden, die eine vermeidbare Mehrbelastung für den TI-Flow-Fachdienst darstellen.
</requirement>

<!-- A_27767-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-330" title="TI-Flow-Fachdienst - Nachricht einstellen - Prüfung des Empfängers" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Einstellen einer Nachricht des Profils "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq" durch einen Versicherten über die http-Operation POST auf den Endpunkt /Communication die Zulässigkeit der Übermittlung auf Basis des Flowtypes des referenzierten Tasks (Task.extension:flowType) und dem Empfänger Communication.recipient prüfen und mit dem folgenden Fehler:
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
            <td>TIFLOW_RECIPIENT_INVALID</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table> 
    abbrechen, wenn der Empfänger laut TAB_eRPFD_028 den spezifischen Flowtype nicht empfangen darf.
    <table>
    <tr> 
		<th>Empfänger (Präfix der Telematik-ID)</th>
		<th>Zulässige Flowtypes</th>
	</tr>
	<tr> 
		<td>oid_oeffentliche_apotheke (3-*, 9-*)</td>
		<td>160, 166, 200</td>
	</tr>
    <tr> 
		<td>oid_kostentraeger (8-*)</td>
		<td>162</td>
	</tr>
    </table>
    <div><figcaption><strong>Tabelle: </strong>Tab_eRPFD_028 Zulässige Empfänger Communication_DispReq</figcaption></div>
</requirement>

<!-- A_21371-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-331" title="TI-Flow-Fachdienst - Nachricht einstellen - Prüfung Existenz Task" version="1">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der Fachdienst E-Rezept MUSS beim Einstellen einer Nachricht des Profils "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq", "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Reply" oder "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DiGA" über die http-Operation POST auf den Endpunkt /Communication mit dem folgenden Fehler:
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
            <td>TIFLOW_TASK_NOT_FOUND</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table> 
    abbrechen, wenn das Pflichtfeld Communication.basedOn einen Task referenziert, der nicht existiert, um Spam und nicht-verordnungsbezogene Kommunikation zu verhindern.
</requirement>

<!-- A_26320 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-332" title="TI-Flow-Fachdienst - Nachricht einstellen - Dispense Request - Prüfung Status Task" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication mit GEM_ERP_PR_Communication_DispReq-Ressource für den in Communication.basedOn referenzierten Task prüfen, dass Task.status = ready und bei Ungleichheit mit dem folgenden Fehler:
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
            <td>TIFLOW_TASK_STATUS_MISMATCH</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Task has invalid status.</td>
        </tr>
    </table> 
    abbrechen, damit ausschließlich E-Rezepte zugewiesen werden, welche durch den Adressaten abrufbar sind.
</requirement>

<!-- A_26321 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-333" title="TI-Flow-Fachdienst - Nachricht einstellen - Dispense Request - Prüfung Ende Gültigkeit Task" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication mit GEM_ERP_PR_Communication_DispReq-Ressource für den in Communication.basedOn referenzierten Task prüfen, dass Task.ExpiryDate nicht zu einem früheren Zeitpunkt als dem aktuellem Datum liegt und anderenfalls mit dem folgenden Fehler:
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
            <td>TIFLOW_TASK_EXPIRED</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Task has expired.</td>
        </tr>
    </table> 
    abbrechen, damit ausschließlich E-Rezepte zugewiesen werden, welche deren Einlösefrist noch nicht erreicht ist.
</requirement>

<!-- A_26327 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-334" title="TI-Flow-Fachdienst - Nachricht einstellen - Dispense Request - Prüfung Beginn Gültigkeit Task" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication mit GEM_ERP_PR_Communication_DispReq-Ressource für den in Communication.basedOn referenzierten Task prüfen, falls die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet ist, ob der Beginn der Einlösefrist (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) zum aktuellen oder einem früheren Zeitpunkt als das aktuelle Datum liegt und anderenfalls mit dem folgenden Fehler:
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
            <td>TIFLOW_MVO_NOT_VALID_YET</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Prescription is not fillable yet.</td>
        </tr>
    </table> 
    abbrechen, damit ausschließlich E-Rezepte zugewiesen werden, deren Einlösefrist erreicht ist.
</requirement>


<!-- A_22367-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-335" title="TI-Flow-Fachdienst - Nachricht einstellen - Notification Apotheke" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Einstellen einer Nachricht des Profils "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq" oder "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReq" zur Versicherter-zu-Apotheken-Kommunikation über die http-Operation POST auf den Endpunkt /Communication prüfen, ob für die Telematik-ID des Empfängers Subscriptions registriert sind und für Registrierungen über den Subscription Service eine Notification (ping : subscription-id) senden.
</requirement>

<!-- A_28132 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-336" title="TI-Flow-Fachdienst - Nachricht einstellen - Push Notification Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Einstellen einer Nachricht mittels HTTP-POST-Operation über /Communication bei erfolgreichem Abschluss der Operation, den Push Notification Prozess für den Trigger mit der ChannelId "erp.communication.new" und den Versicherten mit der KVNR = Communication.recipient initiieren.
</requirement>


### DELETE /Communication

Mit der HTTP-Operation DELETE kann ein Nutzer eine verschickte Kommunikationsnachricht als Absender löschen, um bspw. einen Irrläufer zurückzurufen. 


<!-- A_20258 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-337" title="TI-Flow-Fachdienst - Nachricht löschen - Absender-ID" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf /Communication/&lt;id&gt; die über &lt;id&gt; identifizierte Communication-Ressource anhand der KVNR bzw. Telematik-ID des aufrufenden Nutzers im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests über das Absender-Attribut Communication.sender lokalisieren und löschen, damit Nutzer irrtümlich versendete oder nicht mehr gewünschte Nachrichten vom TI-Flow-Fachdienst entfernen können.
</requirement>
<!-- ToDo: 2 Afos 1. prüfen Zugreifender = sender , 2. löschen -->
