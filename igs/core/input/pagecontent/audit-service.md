### Systemprotokoll

Der E-Rezept-Fachdienst soll Protokolldateien schreiben, die eine Analyse technischer Vorgänge erlauben. Diese Protokolldateien sind dafür vorgesehen, aufgetretene Fehler zu identifizieren und die Performance zu analysieren. Für diese Zwecke führt der E-Rezept-Fachdienst ein Systemprotokoll, mit dem der Anbieter des Dienstes jederzeit den Betriebszustand des Systems kontrollieren kann.

<requirement conformance="SHALL" key="IG-WF-CORE-77" title="E-Rezept-Fachdienst - Systemprotokoll für Betriebszustand" version="0">
	<meta lockversion="false"/>
	<actor name="E-Rezept-Fachdienst">
    	<testProcedure id="Herstellererklärung"/>
  	</actor>
  	<description>
		Der E-Rezept-Fachdienst MUSS ein Systemprotokoll über durchgeführte Operationen und deren Erfolg/Misserfolg führen, um dem Anbieter des Dienstes jederzeit eine Übersicht über den aktuellen Betriebszustand zu ermöglichen.
	</description>
	<!-- A_19282 -->
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-77" title="Systemprotokoll ohne personenbezogene und ohne medizinische Daten" version="0">
	<meta lockversion="false"/>
	<actor name="E-Rezept-Fachdienst">
    	<testProcedure id="Produktgutachten"/>
  	</actor>
  	<description>
		Der E-Rezept-Fachdienst MUSS in jedem zu tätigenden Systemprotokolleintrag alle personenbezogenen, personenbeziehbaren und medizinischen Informationen vor der Speicherung entfernen, damit vom administrativen Personal keine personenbezogenen Daten der Versicherten oder Leistungserbringer eingesehen werden können.
	</description>
	<!-- A_19283 -->
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-77" title="E-Rezept-Fachdienst - Systemprotokoll  Verfügbarkeit interner Logdaten" version="0">
	<meta lockversion="false"/>
	<actor name="E-Rezept-Fachdienst">
    	<testProcedure id="Herstellererklärung"/>
  	</actor>
  	<description>
		Der Betreiber des E-Rezept-Fachdienstes MUSS im Rahmen von Testmaßnahmen dem Testbetriebsverantwortlichen auf Anforderung die Log-Dateien des Systemprotokolls übermitteln.
	</description>
	<!-- A_19678 -->
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-77" title="E-Rezept-Fachdienst - Systemprotokoll zu Ergebnis einer aufgerufenen Operation" version="0">
	<meta lockversion="false"/>
	<actor name="E-Rezept-Fachdienst">
    	<testProcedure id="Herstellererklärung"/>
  	</actor>
  	<description>
		Der E-Rezept-Fachdienst MUSS ein Systemprotokoll über durchgeführte Operationen und deren Erfolg/Misserfolg führen.
	</description>
	<!-- A_20001 -->
</requirement>

### Zugriffsprotokoll für den Versicherten

Der E-Rezept-Fachdienst führt Zugriffsprotokolle für Versicherte, in denen alle Zugriffe auf die personenbezogenen und medizinischen Daten eines Versicherten für den Versicherten einsehbar sind. Diese Zugriffsprotokolle sind unabhängig vom Systemprotokoll und stehen ausschließlich dem Versicherten zur Wahrnehmung seiner Betroffenenrechte zur Einsicht zur Verfügung.

<requirement conformance="SHALL" key="IG-WF-CORE-77" title="E-Rezept-Fachdienst - Versichertenprotokoll zu Operationen" version="0">
	<meta lockversion="false"/>
	<actor name="E-Rezept-Fachdienst">
    	<testProcedure id="Produkttest"/>
  	</actor>
  	<description>
		Der E-Rezept-Fachdienst MUSS jeden Aufruf von Operationen gemäß "TAB_eRPFD_004 Versichertenprotokoll" protokollieren und die gelesene bzw. geschriebene Ressource im Protokolleintrag AuditEvent.entity.what als Referenz hinzufügen sowie die KVNR des betroffenen Versicherten in AuditEvent.entity.name speichern. Mit diesen Informationen kann der Versicherte die Zugriffe auf seine Daten nachvollziehen und bei einem unberechtigten Zugriff ggf. intervenieren.
	</description>
	<!-- A_19284-13 -->
</requirement>

<table>
  <tr>
    <th>Operation</th>
    <th>Rolle des zugreifenden Nutzers</th>
    <th>Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache)</th>
  </tr>
  <tr>
    <td>http GET /Task/&#60;id&#62;</td>
    <td>Versicherter/Vertreter</td>
    <td>Versicherter/Vertreter hat das E-Rezept heruntergeladen</td>
  </tr>
  <tr>
    <td>http GET /Task/&#60;id&#62;?secret</td>
    <td>Apotheke/Kostenträger</td>
    <td>Apotheke/Kostenträger hat die E-Rezept-Quittung heruntergeladen</td>
  </tr>
  <tr>
    <td>http GET /Task</td>
    <td>Apotheke</td>
    <td>
        <ul>
            <li>im Erfolgsfall beim passenden AcceptPN3VSDMxx=false: Apotheke hat mit Ihrer eGK die Liste der offenen E-Rezepte abgerufen.</li>
            <li>im Erfolgsfall bei PN3 und passende AcceptPN3VSDMxx=true: Apotheke hat mit Ihrer eGK die Liste der offenen E-Rezepte abgerufen. (Offline-Check wurde akzeptiert)</li>
            <li>im Fehlerfall PN3 und passende AcceptPN3VSDMxx=false:  Apotheke konnte aufgrund eines Fehlerfalls nicht die Liste der offenen E-Rezepte mit Ihrer eGK abgerufen. (Offline-Check wurde nicht akzeptiert)</li>
            <li>im sonstigen Fehlerfall: Apotheke konnte aufgrund eines Fehlerfalls nicht die Liste der offenen E-Rezepte mit Ihrer eGK abrufen.</li>
        </ul>
    </td>
  </tr>
  <tr>
    <td>http GET /Task</td>
    <td>Kostenträger</td>
    <td>Krankenkasse hat die Liste der einlösbaren Verordnungen (DiGA-Verordnungen) abgerufen.</td>
  </tr>
  <tr>
    <td>http POST /Task/&#60;id&#62;/$activate</td>
    <td>Arztpraxis/Zahnarztpraxis/Krankenhaus/Psychotherapeut</td>
    <td>Arztpraxis/Zahnarztpraxis/Krankenhaus/Psychotherapeut hat das E-Rezept bereitgestellt.</td>
  </tr>
  <tr>
    <td>http POST /Task/&#60;id&#62;/$accept</td>
    <td>Apotheke</td>
    <td>Apotheke hat das E-Rezept heruntergeladen</td>
  </tr>
  <tr>
    <td>http POST /Task/&#60;id&#62;/$accept</td>
    <td>Kostenträger</td>
    <td>Krankenkasse hat die Verordnung heruntergeladen</td>
  </tr>
  <tr>
    <td>http POST /Task/&#60;id&#62;/$reject</td>
    <td>Apotheke</td>
    <td>Apotheke hat das E-Rezept zurückgegeben.</td>
  </tr>
  <tr>
    <td>http POST /Task/&#60;id&#62;/$reject</td>
    <td>Kostenträger</td>
    <td>Krankenkasse hat die Verordnung zurückgegeben.</td>
  </tr>
  <tr>
    <td>http POST /Task/&#60;id&#62;/$dispense</td>
    <td>Apotheke</td>
    <td>Apotheke hat das E-Rezept beliefert.</td>
  </tr>
  <tr>
    <td>http POST /Task/&#60;id&#62;/$close</td>
    <td>Apotheke</td>
    <td>Apotheke hat das E-Rezept abgeschlossen.</td>
  </tr>
  <tr>
    <td>http POST /Task/&#60;id&#62;/$close</td>
    <td>Kostenträger</td>
    <td>Krankenkasse hat die Verordnung abgeschlossen.</td>
  </tr>
  <tr>
    <td>http POST /Task/&#60;id&#62;/$abort</td>
    <td>Versicherter/Vertreter</td>
    <td>Versicherter/Vertreter hat das E-Rezept gelöscht.</td>
  </tr>
  <tr>
    <td>http POST /Task/&#60;id&#62;/$abort</td>
    <td>Arztpraxis/Zahnarztpraxis/Krankenhaus/Psychotherapeut</td>
    <td>Arztpraxis/Zahnarztpraxis/Krankenhaus/Psychotherapeut hat das E-Rezept gelöscht.</td>
  </tr>
  <tr>
    <td>http POST /Task/&#60;id&#62;/$abort</td>
    <td>Apotheke</td>
    <td>Apotheke hat das E-Rezept gelöscht.</td>
  </tr>
  <tr>
    <td>http POST /Task/&#60;id&#62;/$eu-close</td>
    <td>NCPeH-FD</td>
    <td>Der Parameters.parameter:requestData.part:practitionerRole Parameters.parameter:requestData.part:practitionerName hat in Parameters.parameter:requestData.part:healthcare-facility-type Parameters.parameter:requestData.part:pointOfCare in Land B (Klartext aus: Parameters.parameter:requestData.part:countryCode) Ihr E-Rezept eingelöst.</td>
  </tr>
  <tr>
    <td>http PATCH /Task/&#60;id&#62;</td>
    <td>Versicherter</td>
    <td>Versicherter hat Markierung zu Einlösung im EU Ausland gespeichert</td>
  </tr>
  <tr>
    <td>http GET /MedicationDispense</td>
    <td>Versicherter/Vertreter</td>
    <td>Versicherter/Vertreter hat Medikament-Informationen heruntergeladen.</td>
  </tr>
  <tr>
    <td>http DELETE /ChargeItem/&#60;id&#62;</td>
    <td>Versicherter</td>
    <td>Versicherter hat Abrechnungsinformation gelöscht</td>
  </tr>
  <tr>
    <td>http GET /ChargeItem/&#60;id&#62;</td>
    <td>Versicherter</td>
    <td>Versicherter hat Abrechnungsinformation gelesen</td>
  </tr>
  <tr>
    <td>http GET /ChargeItem/&#60;id&#62;</td>
    <td>Apotheke</td>
    <td>Apotheke hat Abrechnungsinformation gelesen</td>
  </tr>
  <tr>
    <td>http POST /ChargeItem</td>
    <td>Apotheke</td>
    <td>Apotheke hat Abrechnungsinformation bereitgestellt</td>
  </tr>
  <tr>
    <td>http PATCH /ChargeItem/&#60;id&#62;</td>
    <td>Versicherter</td>
    <td>Versicherter hat Markierung zu Abrechnungsinformation gespeichert</td>
  </tr>
  <tr>
    <td>http PUT /ChargeItem/&#60;id&#62;</td>
    <td>Apotheke</td>
    <td>Apotheke hat Abrechnungsinformation geändert</td>
  </tr>
  <tr>
    <td>http POST /Consent</td>
    <td>Versicherter</td>
    <td>Versicherter hat Einwilligung für "Beschreibung für Consent.category.coding.code" erteilt.</td>
  </tr>
  <tr>
    <td>http DELETE /Consent</td>
    <td>Versicherter</td>
    <td>Versicherter hat Einwilligung für "Beschreibung für Consent.category.coding.code" widerrufen.</td>
  </tr>
  <tr>
    <td>http POST /$grant-eu-access-permission</td>
    <td>Versicherter</td>
    <td>Versicherter hat eine Zugriffsberechtigung zum Einlösen von E-Rezepten für das Land "Land B" erteilt.</td>
  </tr>
  <tr>
    <td>http DELETE /$revoke-eu-access-permission</td>
    <td>Versicherter</td>
    <td>Versicherter hat die Zugriffsberechtigung zum Einlösen von E-Rezepten für das Land "Land B" widerrufen.</td>
  </tr>
  <tr>
    <td>POST /$get-eu-prescriptions<br>Parameters.parameter:requestData.part:requesttype = demographics</td>
    <td>NCPeH-FD</td>
    <td>Der Parameters.parameter:requestData.part:practitionerRole Parameters.parameter:requestData.part:practitionerName hat in Parameters.parameter:requestData.part:healthcare-facility-type Parameters.parameter:requestData.part:pointOfCare in Land B (Klartext aus: Parameters.parameter:requestData.part:countryCode) Ihre Patientendaten abgerufen.</td>
  </tr>
  <tr>
    <td>POST /$get-eu-prescriptions<br>Parameters.parameter:requestData.part:requesttype = e-prescriptions-list</td>
    <td>NCPeH-FD</td>
    <td>Der Parameters.parameter:requestData.part:practitionerRole Parameters.parameter:requestData.part:practitionerName hat in Parameters.parameter:requestData.part:healthcare-facility-type Parameters.parameter:requestData.part:pointOfCare in Land B (Klartext aus: Parameters.parameter:requestData.part:countryCode) Ihre ausgwählten und einlösbaren E-Rezepte abgerufen.</td>
  </tr>
  <tr>
    <td>POST /$get-eu-prescriptions<br>Parameters.parameter:requestData.part:requesttype = e-prescriptions-retrieval</td>
    <td>NCPeH-FD</td>
    <td>Der Parameters.parameter:requestData.part:practitionerRole Parameters.parameter:requestData.part:practitionerName hat in Parameters.parameter:requestData.part:healthcare-facility-type Parameters.parameter:requestData.part:pointOfCare in Land B (Klartext aus: Parameters.parameter:requestData.part:countryCode) Ihre einzulösenden E-Rezepte abgerufen.</td>
  </tr>
  <tr>
    <td>http POST /pushers/set</td>
    <td>Versicherter</td>
    <td>
        <ul>
            <li>Falls kind=null:Versicherter hat das Gerät "device_display_name" für Push-Nachrichten deregistriert.</li>
            <li>Falls kind=http:Versicherter hat das Gerät "device_display_name" für Push-Nachrichten registriert.</li>
        </ul>
    </td>
  </tr>
  <tr>
</table>
<div><figcaption><strong>Tabelle: </strong>TAB_eRPFD_004 Versichertenprotokoll</figcaption></div>

<requirement conformance="SHALL" key="IG-WF-CORE-77" title="E-Rezept-Fachdienst - Versichertenprotokoll zu automatischen Löschen" version="0">
	<meta lockversion="false"/>
	<actor name="E-Rezept-Fachdienst">
    	<testProcedure id="Produkttest"/>
  	</actor>
  	<description>
		Der E-Rezept-Fachdienst MUSS beim automatischen Löschen nach Erreichen einer Löschfrist gemäß "TAB_eRPFD_004a Versichertenprotokoll nach automatischen Löschen" protokollieren und die gelesene bzw. geschriebene Ressource im Protokolleintrag AuditEvent.entity.what als Referenz hinzufügen sowie die KVNR des betroffenen Versicherten in AuditEvent.entity.name speichern. Mit diesen Informationen kann der Versicherte die Zugriffe auf seine Daten nachvollziehen und bei einem unberechtigten Zugriff ggf. intervenieren.
	</description>
	<!-- A_19284-13 -->
</requirement>

<table>
  <tr>
    <th>Ressource</th>
    <th>Akteur</th>
    <th>Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache)</th>
  </tr>
  <tr>
    <td>Ressource Task</td>
    <td>E-Rezept-Fachdienst</td>
    <td>Veraltete E-Rezepte vom Fachdienst automatisch gelöscht.</td>
  </tr>
  <tr>
    <td>Ressource MedicationDispense</td>
    <td>E-Rezept-Fachdienst</td>
    <td>Veraltete Medikament-Informationen vom Fachdienst automatisch gelöscht.</td>
  </tr>
  <tr>
    <td>Ressource Communication</td>
    <td>E-Rezept-Fachdienst</td>
    <td>Veraltete Nachricht vom Fachdienst automatisch gelöscht.</td>
  </tr>
  <tr>
    <td>Ressource ChargeItem</td>
    <td>E-Rezept-Fachdienst</td>
    <td>Veraltete Abrechnungsinformation vom Fachdienst automatisch gelöscht.</td>
  </tr>
</table>
<div><figcaption><strong>Tabelle: </strong>TAB_eRPFD_004a Versichertenprotokoll nach automatischen Löschen</figcaption></div>

<requirement conformance="SHALL" key="IG-WF-CORE-77" title="E-Rezept-Fachdienst - Versichertenprotokoll zu Löschen nach Fehlerbehandlung" version="0">
	<meta lockversion="false"/>
	<actor name="E-Rezept-Fachdienst">
    	<testProcedure id="Produkttest"/>
  	</actor>
  	<description>
		Der E-Rezept-Fachdienst MUSS beim automatischen Löschen nach Fehlerbehandlung gemäß "TAB_eRPFD_004b Versichertenprotokoll nach Löschen wegen Fehlerbehandlung" protokollieren und die gelesene bzw. geschriebene Ressource im Protokolleintrag AuditEvent.entity.what als Referenz hinzufügen sowie die KVNR des betroffenen Versicherten in AuditEvent.entity.name speichern. Mit diesen Informationen kann der Versicherte die Zugriffe auf seine Daten nachvollziehen und bei einem unberechtigten Zugriff ggf. intervenieren.
	</description>
	<!-- A_19284-13 -->
</requirement>

<table>
  <tr>
    <th>Ressource</th>
    <th>Akteur</th>
    <th>Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache)</th>
  </tr>
  <tr>
    <td>Ressource Pusher</td>
    <td>E-Rezept-Fachdienst</td>
    <td>Fachdienst hat das Gerät "device_display_name" für Push-Nachrichten deregistriert..</td>
  </tr>
</table>
<div><figcaption><strong>Tabelle: </strong>TAB_eRPFD_004b Versichertenprotokoll nach Löschen wegen Fehlerbehandlung</figcaption></div>

<requirement conformance="SHALL" key="IG-WF-CORE-77" title="E-Rezept-Fachdienst - Protokolleintrag Versichertenprotokoll leicht verständlich" version="0">
	<meta lockversion="false"/>
	<actor name="E-Rezept-Fachdienst">
    	<testProcedure id="Produkttest"/>
  	</actor>
  	<description>
		Der E-Rezept-Fachdienst MUSS in jedem zu tätigenden Eintrag des Protokolls für Versicherte einen lesbaren Text in einfacher Sprache (deutsch und englisch) erzeugen, der mindestens den Namen des Zugreifenden, die auslösende Operation und das Ergebnis der Operation umfasst, damit Versicherte ohne technisches Vorwissen den Inhalt des Zugriffsprotokolls verstehen können.
	</description>
	<!-- A_19302 -->
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-77" title="E-Rezept-Fachdienst - Protokollierung - keine Angabe zu organizationName" version="0">
	<meta lockversion="false"/>
	<actor name="E-Rezept-Fachdienst">
    	<testProcedure id="Produkttest"/>
  	</actor>
  	<description>
		Der E-Rezept-Fachdienst MUSS, wenn im ACCESS_TOKEN die Angabe zur "organizationName" mit NULL gefüllt ist, in der Protokollierung als agentname "unbekannt" verwenden.
	</description>
	<!-- A_22217 -->
</requirement>

