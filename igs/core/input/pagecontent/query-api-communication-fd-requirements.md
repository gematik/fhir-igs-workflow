Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für den Communication-Endpunkt.

<!-- A_19401 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Communication - unzulässige Operationen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS alle Zugriffe auf die Ressource Communication mittels der HTTP-Operationen PUT, PATCH und HEAD unterbinden, damit keine unzulässigen Operationen auf den Kommunikationsnachrichten ausgeführt werden können.
</requirement>

<!-- A_19446-02 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Communication - Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET, DELETE und POST-Operation auf den Endpunkt /Communication bzw. /Communication/&lt;id&gt; sicherstellen, dass ausschließlich Versicherte, Leistungserbingerinstitutionen und Kostenträger in der Rolle
    <ul>
        <li>oid_versicherter</li>
        <li>oid_oeffentliche_apotheke</li>
        <li>oid_krankenhausapotheke</li>
        <li>oid_kostentraeger</li>
    </ul>
    die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit der Nachrichtenaustausch nicht zwischen Unbefugten erfolgt.
</requirement>
<!-- ToDo: Fehlt hier die Angabe des Fehlercodes? Siehe auch entsprechende Afos in allen anderen SST. -->

### GET /Communication


<!-- A_19520-02 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Nachrichten abrufen - für Empfänger filtern" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Abrufen von Nachrichten über die http-Operation GET auf den Endpunkt /Communication bzw. beim Abruf einer einzelnen Nachricht über /Communication/&lt;id&gt; ausschließlich die Nachrichten an den Aufrufer zurückgeben, die im Attribut Communication.recipient oder Communication.sender mit dem entsprechenden Identifier https://gematik.de/fhir/sid/telematik-id für Apotheken bzw. http://fhir.de/sid/gkv/kvid-10 für Versicherte den gleichen Typ und den identischen Wert haben wie im Attribut "idNummer" des übergebenen ACCESS_TOKEN im HTTP-Header "Authorization" für Versicherten-ID bzw. Telematik-ID, damit keine Nachrichten an Dritte unrechtmäßig ausgelesen werden.
</requirement>

<!-- A_19521 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Nachrichten abrufen - als abgerufen markieren" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Abrufen von Nachrichten über die http-Operation GET auf den Endpunkt /Communication bzw. beim Abruf einer einzelnen Nachricht über /Communication/&lt;id&gt; den Wert des Attributs Communication.received = &lt;aktuelle Systemzeit&gt setzen, wenn dieser Wert zum Zeitpunkt des Abrufs der Nachrichten NULL ist, damit Nutzer eine Filtermöglicheit auf "neue Nachrichten" haben.
</requirement>

### POST /Communication

<!-- A_19447-06 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Nachricht einstellen - Schemaprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication die im http-Request-Body übergebene Communications-Ressource gegen das aus der Kommunikationsbeziehung ableitbare, zulässige Schema gemäß TAB_eRPFD_008 prüfen und den Aufruf bei Nicht-Konformität mit dem http-Status-Code 400 ablehnen, damit ausschließlich konforme E-Rezept-Nachrichten ausgetauscht werden.
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
		<td>KVNR</td>
        <td>Communication.basedOn referenziert Task</td>
        <td>https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Representative</td>
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
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Nachricht einstellen - Validierung Payload  GEM_ERP_PR_Communication_DispReq" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication, falls die Ressource dem GEM_ERP_PR_Communication_DispReq-Profil entspricht, den Inhalt der contentString-Eigenschaft auf valides JSON sowie gegen die Struktur in TAB_eRpDM_002 überprüfen und bei negativem Prüfergebnis, mit einem Http-Fehler 400 (Bad Request) abbrechen sowie mit einer aussagekräftigen Fehlermeldung in Form einer eingebetteten OperationOutcome-Ressource antworten.
</requirement>

<!-- A_23879-01 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Nachricht einstellen - Validierung Payload  GEM_ERP_PR_Communication_Reply" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication, falls die Ressource dem GEM_ERP_PR_Communication_Reply-Profil entspricht, den Inhalt der contentString-Eigenschaft auf valides JSON sowie gegen die Struktur in TAB_eRpDM_003 überprüfen und bei negativem Prüfergebnis, mit einem Http-Fehler 400 (Bad Request) abbrechen sowie mit einer aussagekräftigen Fehlermeldung in Form einer eingebetteten OperationOutcome-Ressource antworten.
</requirement>

<!-- A_19448-04 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Nachricht einstellen - Absender und Sendedatum" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication die Absenderidentifikation aus dem Attribut idNummer des im HTTP-Header "Authorization" übergebenen ACCESS_TOKEN mit dem entsprechenden System https://gematik.de/fhir/sid/telematik-id für Institutionen der TI bzw. http://fhir.de/sid/gkv/kvid-10 für Versicherte übernehmen sowie das Absendedatum Communication.sent auf die aktuelle Systemzeit des E-Rezept-Fachdienstes setzen, damit Absender und Sendezeitpunkt für den Empfänger eindeutig sind.
</requirement>

 - E-Rezept-Fachdienst - Nachricht einstellen - Nachrichtenzähler bei Versicherter-zu-Versichertem-Kommunikation
 <=

<!-- A_20229-01 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Nachricht einstellen - Versicherter-zu-Versichertem-Kommunikation" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS die zulässige Anzahl der Communication-Ressourcen des Schemas https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Representative zur Versicherter-zu-Versichertem-Kommunikation auf einen konfigurierbaren Maximalwert (Default: 10) je referenziertem Task beschränken und bei Überschreiten des Maximalwerts das Einstellen einer Nachricht mit dem http-Status-Code 429 abbrechen, damit Versicherte den E-Rezept-Fachdienst nicht für beliebige Kommunikation außerhalb der Vertretung in der Einlösung von E-Rezepten benutzen.
</requirement>

<!-- A_20511 -->
<requirement conformance="SHALL NOT" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Nachricht einstellen - Nachrichtenzähler zweckgebunden" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Der E-Rezept-Fachdienst DARF die Anzahl der Communication-Ressourcen je referenziertem Task für die Versicherter-zu-Versichertem-Kommunikation NICHT zu anderen Zwecken verwenden, als für die Beschränkung der Anzahl auf den maximalen Wert.
</requirement>

<!-- A_20230-01 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Nachricht einstellen - Einlösbare E-Rezepte für Versicherter-zu-Versichertem-Kommunikation" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht des Schemas https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Representative zur Versicherter-zu-Versichertem-Kommunikation über die http-Operation POST auf den Endpunkt /Communication mit dem http-Status-Code 400 abbrechen, wenn der referenzierte Task nicht im Zustand "ready" oder "in-progress" ist, damit die Weitergabe des Zugriffs auf E-Rezepte ausschließlich auf einlösbare bzw. in Arbeit befindliche Verordnungen beschränkt wird.
</requirement>

<!-- A_20231-01 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Nachricht einstellen - Ausschluss Nachrichten an Empfänger gleich Absender" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS das Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication mit dem http-Status-Code 400 abbrechen, wenn der Empfänger Communication.recipient gleich der Absenderidentifikation im Attribut idNummer des übergebenen ACCESS_TOKEN im HTTP-Header "Authorization" ist, damit irreführende Kommunikationsbeziehungen nicht zu einer vermeidbaren Mehrbelastung des E-Rezept-Fachdienstes führen.
</requirement>

<!-- A_19450-01 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Nachricht einstellen - Schadcodeprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS das Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication mit dem http-Status-Code 400 abbrechen, wenn
    <ul>
        <li>der Nachrichteninhalt Communication.payload größer als 10 kByte ist oder</li>
        <li>in von Versicherten eingestellten Nachrichten in Communication.payload eine externe URLs enthält oder</li>
        <li>ein Attachment mit MimeType "application/*" enthält,</li>
    </ul>
    damit über den E-Rezept-Fachdienst kein Schadcode verteilt wird.
</requirement>

<!-- A_20885-04 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Nachricht einstellen - Prüfung Versichertenbezug und Berechtigung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS das Einstellen einer Nachricht des Profils "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq" oder "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Representative" durch einen Versicherten über die http-Operation POST auf den Endpunkt /Communication mit dem http-Status-Code 400 abbrechen, wenn 
    <ul><li>
        die KVNR des in Communication.basedOn referenzierten Tasks Task.for ungleich der KVNR des Einstellenden in "idNummer" des übergebenen ACCESS_TOKEN
    </li></ul>
    und
    <ul><li>
        der http-Header "X-AccessCode" fehlt oder der im http-Header "X-AccessCode" übergebene AccessCode ungleich dem AccessCode-Identifier des referenzierten Tasks
    </li></ul>
    ist, um irreführende Testnachrichten zu unterbinden, die eine vermeidbare Mehrbelastung für den E-Rezept-Fachdienst darstellen.
</requirement>

<!-- A_27767-01 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Nachricht einstellen - Prüfung des Empfängers" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht des Profils "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq" durch einen Versicherten über die http-Operation POST auf den Endpunkt /Communication die Zulässigkeit der Übermittlung auf Basis des Flowtypes des referenzierten Tasks (Task.extension:flowType) und dem Empfänger Communication.recipient prüfen und mit dem http-Status-Code 403 abbrechen, wenn der Empfänger laut TAB_eRPFD_028 den spezifischen Flowtype nicht empfangen darf.
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