Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für den Communication-Endpunkt.

<!-- A_19401 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-255" title="E-Rezept-Fachdienst - Communication - unzulässige Operationen" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS alle Zugriffe auf die Ressource Communication mittels der HTTP-Operationen PUT, PATCH und HEAD unterbinden, damit keine unzulässigen Operationen auf den Kommunikationsnachrichten ausgeführt werden können.
</requirement>

<!-- A_19446-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-256" title="E-Rezept-Fachdienst - Communication - Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
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
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-257" title="E-Rezept-Fachdienst - Nachrichten abrufen - für Empfänger filtern" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Abrufen von Nachrichten über die http-Operation GET auf den Endpunkt /Communication bzw. beim Abruf einer einzelnen Nachricht über /Communication/&lt;id&gt; ausschließlich die Nachrichten an den Aufrufer zurückgeben, die im Attribut Communication.recipient oder Communication.sender mit dem entsprechenden Identifier https://gematik.de/fhir/sid/telematik-id für Apotheken bzw. http://fhir.de/sid/gkv/kvid-10 für Versicherte den gleichen Typ und den identischen Wert haben wie im Attribut "idNummer" des übergebenen ACCESS_TOKEN im HTTP-Header "Authorization" für Versicherten-ID bzw. Telematik-ID, damit keine Nachrichten an Dritte unrechtmäßig ausgelesen werden.
</requirement>

<!-- A_19521 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-258" title="E-Rezept-Fachdienst - Nachrichten abrufen - als abgerufen markieren" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Abrufen von Nachrichten über die http-Operation GET auf den Endpunkt /Communication bzw. beim Abruf einer einzelnen Nachricht über /Communication/&lt;id&gt; den Wert des Attributs Communication.received = &lt;aktuelle Systemzeit&gt setzen, wenn dieser Wert zum Zeitpunkt des Abrufs der Nachrichten NULL ist, damit Nutzer eine Filtermöglicheit auf "neue Nachrichten" haben.
</requirement>

### POST /Communication

<!-- A_19447-06 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-259" title="E-Rezept-Fachdienst - Nachricht einstellen - Schemaprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
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
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-260" title="E-Rezept-Fachdienst - Nachricht einstellen - Validierung Payload  GEM_ERP_PR_Communication_DispReq" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication, falls die Ressource dem GEM_ERP_PR_Communication_DispReq-Profil entspricht, den Inhalt der contentString-Eigenschaft auf valides JSON sowie gegen die Struktur in TAB_eRpDM_002 überprüfen und bei negativem Prüfergebnis, mit einem Http-Fehler 400 (Bad Request) abbrechen sowie mit einer aussagekräftigen Fehlermeldung in Form einer eingebetteten OperationOutcome-Ressource antworten.
</requirement>

<!-- A_23879-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-261" title="E-Rezept-Fachdienst - Nachricht einstellen - Validierung Payload  GEM_ERP_PR_Communication_Reply" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication, falls die Ressource dem GEM_ERP_PR_Communication_Reply-Profil entspricht, den Inhalt der contentString-Eigenschaft auf valides JSON sowie gegen die Struktur in TAB_eRpDM_003 überprüfen und bei negativem Prüfergebnis, mit einem Http-Fehler 400 (Bad Request) abbrechen sowie mit einer aussagekräftigen Fehlermeldung in Form einer eingebetteten OperationOutcome-Ressource antworten.
</requirement>

<!-- A_19448-04 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-262" title="E-Rezept-Fachdienst - Nachricht einstellen - Absender und Sendedatum" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication die Absenderidentifikation aus dem Attribut idNummer des im HTTP-Header "Authorization" übergebenen ACCESS_TOKEN mit dem entsprechenden System https://gematik.de/fhir/sid/telematik-id für Institutionen der TI bzw. http://fhir.de/sid/gkv/kvid-10 für Versicherte übernehmen sowie das Absendedatum Communication.sent auf die aktuelle Systemzeit des E-Rezept-Fachdienstes setzen, damit Absender und Sendezeitpunkt für den Empfänger eindeutig sind.
</requirement>

 - E-Rezept-Fachdienst - Nachricht einstellen - Nachrichtenzähler bei Versicherter-zu-Versichertem-Kommunikation
 <=

<!-- A_20229-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-263" title="E-Rezept-Fachdienst - Nachricht einstellen - Versicherter-zu-Versichertem-Kommunikation" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS die zulässige Anzahl der Communication-Ressourcen des Schemas https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Representative zur Versicherter-zu-Versichertem-Kommunikation auf einen konfigurierbaren Maximalwert (Default: 10) je referenziertem Task beschränken und bei Überschreiten des Maximalwerts das Einstellen einer Nachricht mit dem http-Status-Code 429 abbrechen, damit Versicherte den E-Rezept-Fachdienst nicht für beliebige Kommunikation außerhalb der Vertretung in der Einlösung von E-Rezepten benutzen.
</requirement>

<!-- A_20511 -->
<requirement conformance="SHALL NOT" key="IG-TIFLOW-CORE-264" title="E-Rezept-Fachdienst - Nachricht einstellen - Nachrichtenzähler zweckgebunden" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Der E-Rezept-Fachdienst DARF die Anzahl der Communication-Ressourcen je referenziertem Task für die Versicherter-zu-Versichertem-Kommunikation NICHT zu anderen Zwecken verwenden, als für die Beschränkung der Anzahl auf den maximalen Wert.
</requirement>

<!-- A_20230-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-265" title="E-Rezept-Fachdienst - Nachricht einstellen - Einlösbare E-Rezepte für Versicherter-zu-Versichertem-Kommunikation" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht des Schemas https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Representative zur Versicherter-zu-Versichertem-Kommunikation über die http-Operation POST auf den Endpunkt /Communication mit dem http-Status-Code 400 abbrechen, wenn der referenzierte Task nicht im Zustand "ready" oder "in-progress" ist, damit die Weitergabe des Zugriffs auf E-Rezepte ausschließlich auf einlösbare bzw. in Arbeit befindliche Verordnungen beschränkt wird.
</requirement>

<!-- A_20231-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-266" title="E-Rezept-Fachdienst - Nachricht einstellen - Ausschluss Nachrichten an Empfänger gleich Absender" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS das Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication mit dem http-Status-Code 400 abbrechen, wenn der Empfänger Communication.recipient gleich der Absenderidentifikation im Attribut idNummer des übergebenen ACCESS_TOKEN im HTTP-Header "Authorization" ist, damit irreführende Kommunikationsbeziehungen nicht zu einer vermeidbaren Mehrbelastung des E-Rezept-Fachdienstes führen.
</requirement>

<!-- A_19450-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-267" title="E-Rezept-Fachdienst - Nachricht einstellen - Schadcodeprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
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
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-268" title="E-Rezept-Fachdienst - Nachricht einstellen - Prüfung Versichertenbezug und Berechtigung" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
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
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-269" title="E-Rezept-Fachdienst - Nachricht einstellen - Prüfung des Empfängers" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
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

<!-- A_21371-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-270" title="E-Rezept-Fachdienst - Nachricht einstellen - Prüfung Existenz Task" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der Fachdienst E-Rezept MUSS beim Einstellen einer Nachricht des Profils "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq", "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Reply", "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DiGA" oder "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Representative" über die http-Operation POST auf den Endpunkt /Communication mit dem http-Status-Code 400 abbrechen, wenn das Pflichtfeld Communication.basedOn einen Task referenziert, der nicht existiert, um Spam und nicht-verordnungsbezogene Kommunikation zu verhindern.
</requirement>

<!-- A_26320 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-271" title="E-Rezept-Fachdienst - Nachricht einstellen - Dispense Request - Prüfung Status Task" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication mit GEM_ERP_PR_Communication_DispReq-Ressource für den in Communication.basedOn referenzierten Task prüfen, dass Task.status = ready und bei Ungleichheit mit dem Http-Fehler 400 und dem OperationOutcome "Task has invalid status." abbrechen, damit ausschließlich E-Rezepte zugewiesen werden, welche durch den Adressaten abrufbar sind.
</requirement>

<!-- A_26321 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-272" title="E-Rezept-Fachdienst - Nachricht einstellen - Dispense Request - Prüfung Ende Gültigkeit Task" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication mit GEM_ERP_PR_Communication_DispReq-Ressource für den in Communication.basedOn referenzierten Task prüfen, dass Task.ExpiryDate nicht zu einem früheren Zeitpunkt als dem aktuellem Datum liegt und anderenfalls mit dem Http-Fehler 400 und dem OperationOutcome "Task has expired." abbrechen, damit ausschließlich E-Rezepte zugewiesen werden, welche deren Einlösefrist noch nicht erreicht ist.
</requirement>

<!-- A_26327 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-273" title="E-Rezept-Fachdienst - Nachricht einstellen - Dispense Request - Prüfung Beginn Gültigkeit Task" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication mit GEM_ERP_PR_Communication_DispReq-Ressource für den in Communication.basedOn referenzierten Task prüfen, falls die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet ist, ob der Beginn der Einlösefrist (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) zum aktuellen oder einem früheren Zeitpunkt als das aktuelle Datum liegt und anderenfalls mit dem Http-Fehler 400 und dem OperationOutcome "Prescription is not fillable yet." abbrechen, damit ausschließlich E-Rezepte zugewiesen werden, deren Einlösefrist erreicht ist.
</requirement>

<!-- A_22734-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-274" title="E-Rezept-Fachdienst - Nachricht einstellen - Prüfung Existenz ChargeItem" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der Fachdienst E-Rezept MUSS beim Einstellen einer Nachricht des Profils "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReq" oder "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReply" über die http-Operation POST auf den Endpunkt /Communication mit dem http-Status-Code 400 abbrechen, wenn das Pflichtfeld Communication.basedOn einen ChargeItem referenziert, der nicht existiert, um Spam und nicht-rezeptbezogene Kommunikation zu verhindern.
</requirement>

<!-- A_22367-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-275" title="E-Rezept-Fachdienst - Nachricht einstellen - Notification Apotheke" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht des Profils "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq", oder "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReq" zur Versicherter-zu-Apotheken-Kommunikation über die http-Operation POST auf den Endpunkt /Communication prüfen, ob für die Telematik-ID des Empfängers Subscriptions registriert sind und für Registrierungen über den Subscription Service eine Notification (ping : subscription-id) senden.
</requirement>

<!-- A_28132 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-276" title="E-Rezept-Fachdienst - Nachricht einstellen - Push Notification Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht mittels HTTP-POST-Operation über /Communication bei erfolgreichem Abschluss der Operation, den Push Notification Prozess für den Trigger mit der ChannelId "erp.communication.new" und den Versicherten mit der KVNR = Communication.recipient initiieren.
</requirement>

<!-- A_23876 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-358" title="E-Rezept-Fachdienst: Nachrichtenaustausch - E-Rezept einer Apotheke zuweisen - Datenstruktur Nachricht" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS für den Anwendungsfall "E-Rezept einer Apotheke zuweisen" Nachrichten mit der Datenstruktur gemäß der Tabelle in der contentString-Eigenschaft des GEM_ERP_PR_Communication_DispReq-Profils unterstützen. 
     
     <table>
  <thead>
    <tr>
      <th>Attribut</th>
      <th>verpflichtend</th>
      <th>Beschreibung</th>
      <th>zulässige Werte</th>
      <th>Beispiel</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>version</td>
      <td>ja</td>
      <td>Gibt die Version des JSON an. Aktuell immer 1. Kann im weiteren Lebenszyklus verändert werden.</td>
      <td>nummerisch, bis zu 6 Stellen</td>
      <td>1</td>
    </tr>
    <tr>
      <td>supplyOptionsType</td>
      <td>ja</td>
      <td>Wird gemäß des Servicerequests gesetzt, den der Nutzer wählt. Die für den Nutzer zur Auswahl stehenden Services gibt die Apotheke vor, indem sie den servicespezifischen Zuweisungs-Endpunkt angibt, oder nicht.</td>
      <td>onPremise, shipment, delivery</td>
      <td>onPremise</td>
    </tr>
    <tr>
      <td>name</td>
      <td>nein</td>
      <td>Name des Versicherten.</td>
      <td>100 Stellen, UTF-8</td>
      <td>Dr. Maximilian von Muster</td>
    </tr>
    <tr>
      <td>address</td>
      <td>nein</td>
      <td>String-Array der Zeilen einer Adresse. Sie ist im JSON in der korrekten Reihenfolge anzugeben und auch auszulesen. "onPremise": Adresse des Versicherten laut Rezept. "delivery"/"shipment": Adresse des Lieferungsempfängers – mindestens: Strasse+Hausnummer, PLZ+Ort werden gesetzt.</td>
      <td>Array von Strings je 500 Stellen UTF-8</td>
      <td><pre>"address": [
  "wohnhaft bei Emilia Fischer",
  "Bundesallee 312",
  "123. OG",
  "12345 Berlin"
]</pre></td>
    </tr>
    <tr>
      <td>hint</td>
      <td>nein</td>
      <td>Hinweis, den der Versicherte mit angeben kann.</td>
      <td>500 Stellen, UTF-8</td>
      <td>Bitte im Morsecode klingeln: -.-.</td>
    </tr>
    <tr>
      <td>phone</td>
      <td>nein</td>
      <td>Telefonnummer</td>
      <td>32 Stellen, UTF-8</td>
      <td>004916094858168</td>
    </tr>
  </tbody>
</table>
<div><figcaption><strong>Tabelle: </strong>E-Rezept einer Apotheke zuweisen</figcaption></div>
</requirement>

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-359" title="E-Rezept-Fachdienst: Nachrichtenaustausch - Nachricht durch Abgebenden übermitteln - Datenstruktur Nachricht" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS für den Anwendungsfall "Nachricht durch Abgebenden übermitteln" Nachrichten mit der folgenden Datenstruktur in der contentString-Eigenschaft des GEM_ERP_PR_Communication_Reply unterstützen.
     
     <table>
  <thead>
    <tr>
      <th>Attribut</th>
      <th>verpflichtend</th>
      <th>Beschreibung</th>
      <th>zulässige Werte</th>
      <th>Beispiel</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>version</td>
      <td>ja</td>
      <td>Gibt die Version des JSON an. Aktuell immer 1. Kann im weiteren Lebenszyklus verändert werden.</td>
      <td>nummerisch, bis zu 6 Stellen</td>
      <td>1</td>
    </tr>
    <tr>
      <td>supplyOptionsType</td>
      <td>ja</td>
      <td>Wird gemäß des Servicerequests gesetzt, den der Nutzer wählt. Die für den Nutzer zur Auswahl stehenden Services gibt die Apotheke vor, indem sie den servicespezifischen Zuweisungs-Endpunkt angibt, oder nicht.</td>
      <td>onPremise, shipment, delivery</td>
      <td>onPremise</td>
    </tr>
    <tr>
      <td>info_text</td>
      <td>nein</td>
      <td>Zusätzlicher Freitext des Versicherten an die Apotheke</td>
      <td>500 Stellen, UTF-8</td>
      <td>Wir möchten Sie informieren, dass Ihre bestellten Medikamente zur Abholung bereitstehen. Den Abholcode finden Sie anbei.</td>
    </tr>
    <tr>
      <td>url</td>
      <td>nein</td>
      <td>Einbettung einer externen URL ausschließlich für das Einlösen von E-Rezepten in einer externen Bestellplattform</td>
      <td>500 Stellen, URL gemäß RFC3986</td>
      <td>https://www.meine-apotheke.de/pickup/59b52340-7a6a-430d-99ea-45a8e5cd03f6</td>
    </tr>
    <tr>
      <td>pickUpCodeHR</td>
      <td>nein</td>
      <td>Menschenlesbarer Abholcode. Nur bei supplyOptionsType "onPremise". Wenn gesetzt, wird dem Nutzer der Inhalt des "pickUpCodeHR" optisch hervorgehoben angezeigt.</td>
      <td>8 Stellen, UTF-8</td>
      <td>12315615</td>
    </tr>
    <tr>
      <td>pickUpCodeDMC</td>
      <td>nein</td>
      <td>Maschinenlesbarer Abholcode (Data-Matrix-Code). Nur bei supplyOptionsType "onPremise". Wenn gesetzt, kann sich der Nutzer den Inhalt als Data-Matrix-Code anzeigen lassen. Der Inhalt wird gemäß ISO/IEC 16022:2006 von der App in einen DMC gewandelt. Fehlt die Interpretation, so wird der Code als Freitext angezeigt.</td>
      <td>128 Stellen, UTF-8</td>
      <td>5346a991-c5c6-49c8-b87b-4cdd255bbde4</td>
    </tr>
  </tbody>
</table>

<div><figcaption><strong>Tabelle: </strong>Nachricht als Apotheke an einen Versicherten schicken</figcaption></div>
     
</requirement>

<!-- A_23878-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-360" title="E-Rezept-Fachdienst - Nachricht einstellen - Validierung des Payload-Inhalt von GEM_ERP_PR_Communication_DispReq" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication den Inhalt der contentString-Eigenschaft des GEM_ERP_PR_Communication_DispReq-Profils auf valides JSON überprüfen und, falls die Inhalte des strukturierten JSON die unter "Prüfungsoperationen durch den Fachdienst" aufgeführten Anforderungen nicht erfüllen mit, einem Http-Fehler 400 (Bad Request) abbrechen sowie mit einer aussagekräftigen Fehlermeldung in Form einer eingebetteten OperationOutcome-Ressource antworten.
     
     <table>
  <thead>
    <tr>
      <th>Attribut</th>
      <th>Pflicht / Optional</th>
      <th>Prüfungsoperationen durch den Fachdienst</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>version</td>
      <td>Pflicht</td>
      <td>Der Wert muss immer 1 sein.</td>
    </tr>
    <tr>
      <td>supplyOptionsType</td>
      <td>Pflicht</td>
      <td>Einer der folgenden Werte muss gesetzt sein: "onPremise", "delivery", "shipment". Wenn Communication.extension:flowType == 166 ist nur "onPremise" und "delivery" erlaubt.</td>
    </tr>
    <tr>
      <td>name</td>
      <td>Optional</td>
      <td>Die Zeichenlänge darf maximal 100 Zeichen betragen.</td>
    </tr>
    <tr>
      <td>address</td>
      <td>Optional</td>
      <td>Die Zeichenlänge darf maximal 500 Zeichen betragen.</td>
    </tr>
    <tr>
      <td>hint</td>
      <td>Optional</td>
      <td>Die Zeichenlänge darf maximal 500 Zeichen betragen.</td>
    </tr>
    <tr>
      <td>phone</td>
      <td>Optional</td>
      <td>Die Zeichenlänge darf maximal 100 Zeichen betragen.</td>
    </tr>
  </tbody>
</table>
<div><figcaption><strong>Tabelle: </strong>Prüfungsoperationen durch den Fachdienst GEM_ERP_PR_Communication_DispReq-Profil</figcaption></div>
</requirement>

<!-- A_23879 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-361" title="E-Rezept-Fachdienst - Nachricht einstellen - Validierung des Payload-Inhalt von GEM_ERP_PR_Communication_Reply" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication den Inhalt der contentString-Eigenschaft des GEM_ERP_PR_Communication_Reply-Profils auf valides JSON überprüfen und, falls die Inhalte des strukturierten JSON die unter "Prüfungsoperationen durch den Fachdienst" aufgeführten Anforderungen nicht erfüllen, mit einem Http-Fehler 400 (Bad Request) abbrechen sowie mit einer aussagekräftigen Fehlermeldung in Form einer eingebetteten OperationOutcome-Ressource antworten. 
     
     <table>
  <thead>
    <tr>
      <th>Attribut</th>
      <th>Pflicht / Optional</th>
      <th>Prüfungsoperationen durch den Fachdienst</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>version</td>
      <td>Pflicht</td>
      <td>Der Wert muss immer 1 sein.</td>
    </tr>
    <tr>
      <td>supplyOptionsType</td>
      <td>Pflicht</td>
      <td>Einer der folgenden Werte muss gesetzt sein: "onPremise", "delivery", "shipment".</td>
    </tr>
    <tr>
      <td>info_text</td>
      <td>Optional</td>
      <td>Die Zeichenlänge darf maximal 500 Zeichen betragen.</td>
    </tr>
    <tr>
      <td>url</td>
      <td>Optional</td>
      <td>Wenn gesetzt, muss der übermittelte String eine valide URL gemäß RFC3986 sein. Die Zeichenlänge darf maximal 500 Zeichen betragen.</td>
    </tr>
    <tr>
      <td>pickUpCodeHR</td>
      <td>Optional</td>
      <td>Wenn gesetzt, muss das Attribut supplyOptionsType den Wert "onPremise" haben und die Zeichenlänge darf maximal 8 Zeichen betragen.</td>
    </tr>
    <tr>
      <td>pickUpCodeDMC</td>
      <td>Optional</td>
      <td>Wenn gesetzt, muss das Attribut supplyOptionsType den Wert "onPremise" haben und die Zeichenlänge darf maximal 128 Zeichen betragen.</td>
    </tr>
  </tbody>
</table>
<div><figcaption><strong>Tabelle: </strong>Prüfungsoperationen durch den Fachdienst GEM_ERP_PR_Communication_Reply-Profil</figcaption></div>
     
</requirement>

### DELETE /Communication

Mit der HTTP-Operation DELETE kann ein Nutzer eine verschickte Kommunikationsnachricht als Absender löschen, um bspw. einen Irrläufer zurückzurufen. Der E-Rezept-Fachdienst prüft, ob die Nachricht bereits abgerufen wurde. Das Löschen einer ungelesenen Nachricht erfolgt sofort, das Löschen einer bereits abgerufenen Nachricht wird vom E-Rezept-Fachdienst mit einer Warnung umgesetzt, um darauf hinzuweisen, dass die Nachricht als Kopie im Clientsystem des Empfängers vorliegt und das Löschen nicht vor unberechtigter Einsichtnahme schützt.

Um den Schutz vor unberechtigter Einsichtnahme in persönliche Daten durchzusetzen, ist es ratsam bei bereits gelesenen Nachrichten den referenzierten E-Rezept-Task zu löschen. Für eine geeignete Nutzerführung auf Clientseite ergänzt der E-Rezept-Fachdienst die http-Response um das Header-Attribut "Warning" mit einem entsprechenden Hinweis. Das Löschen des Task führt direkt auch zum Löschen aller Kommunikationsnachrichten, die auf diesen Task verweisen. Damit kann ein fälschlich adressierter Vertreter eines Versicherten keine Einsicht in die Daten des E-Rezepts mehr nehmen bzw. das E-Rezept in keiner Apotheke mehr einlösen.

<!-- A_20258 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-277" title="E-Rezept-Fachdienst - Nachricht löschen - Absender-ID" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf /Communication/&lt;id&gt; die über &lt;id&gt; identifizierte Communication-Ressource anhand der KVNR bzw. Telematik-ID des aufrufenden Nutzers im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests über das Absender-Attribut Communication.sender lokalisieren und löschen, damit Nutzer irrtümlich versendete oder nicht mehr gewünschte Nachrichten vom E-Rezept-Fachdienst entfernen können.
</requirement>

<!-- A_20259 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-278" title="E-Rezept-Fachdienst - Nachricht löschen - Warning bei Empfänger bereits abgerufen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Löschen einer Communication-Ressource der http-Response das http-Header-Feld "Warning" mit dem Zeitpunkt des Nachrichtenabrufs durch den Empfänger ergänzen (z.B. "Warning: 'Deleted message delivered at 2020-07-01 10:30:00'"), wenn die Nachricht bereits durch den Empfänger abgerufen wurde (Communication.received ungleich NULL, bzw. enthält Datum des Abrufs), um dem Absender einen Hinweis anzeigen zu können.
</requirement>
