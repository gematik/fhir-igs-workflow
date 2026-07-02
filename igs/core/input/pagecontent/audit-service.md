
### Zugriffsprotokoll für den Versicherten

Der TI-Flow-Fachdienst führt Zugriffsprotokolle für Versicherte, in denen alle Zugriffe auf die personenbezogenen und medizinischen Daten eines Versicherten für den Versicherten einsehbar sind. Diese Zugriffsprotokolle sind unabhängig vom Systemprotokoll und stehen ausschließlich dem Versicherten zur Wahrnehmung seiner Betroffenenrechte zur Einsicht zur Verfügung.

<!-- A_19296-04 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A30" title="TI-Flow-Fachdienst - Inhalt Protokolleintrag" version="0">
	<meta lockversion="false"/>
	<actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    	<testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS einen Protokolleintrag mit den folgenden Werten befüllen:
<table>
  <thead>
    <tr>
      <th>Element in AuditEvent</th>
      <th>Befüllung</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>AuditEvent.text</td>
      <td>Generierung eines HTML-<code>&lt;div&gt;</code>-Elements mit lesbarer Beschreibung in einfacher Sprache</td>
    </tr>
    <tr>
      <td>AuditEvent.type</td>
      <td>Fester Wert gemäß [CodeSystem: Audit Event ID]</td>
    </tr>
    <tr>
      <td>AuditEvent.subtype</td>
      <td>Aus dem ValueSet [ValueSet http://hl7.org/fhir/ValueSet/auditevent-sub-type] gemäß [CodeSystem http://hl7.org/fhir/restful-interaction]:
        <ul>
          <li><code>create</code> beim Hinzufügen/Speichern/Anlegen eines Datenobjekts mit Versichertenbezug (mit Ausnahme von AuditEvent- und Communication-Ressource)</li>
          <li><code>read</code> beim lesenden Zugriff auf ein Datenobjekt mit Versichertenbezug</li>
          <li><code>update</code>, wenn das Datenobjekt mit Versichertenbezug geändert/aktualisiert wird</li>
          <li><code>delete</code>, wenn das Datenobjekt mit Versichertenbezug manuell oder automatisch gelöscht wird</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>AuditEvent.action</td>
      <td>Analog AuditEvent.subType (C, R, U, D) gemäß [ValueSet http://hl7.org/fhir/ValueSet/audit-event-action]</td>
    </tr>
    <tr>
      <td>AuditEvent.recorded</td>
      <td>Aktuelle Systemzeit des TI-Flow-Fachdienstes</td>
    </tr>
    <tr>
      <td>AuditEvent.outcome</td>
      <td>Ergebnis der aufgerufenen Operation gemäß [ValueSet http://hl7.org/fhir/ValueSet/audit-event-outcome] (<code>0</code> = Erfolg, <code>4</code> = Fehler auf Clientseite, <code>8</code> = Serverfehler)</td>
    </tr>
    <tr>
      <td>AuditEvent.agent.type</td>
      <td>Fester Wert <code>humanuser</code> bzw. bei Übermittlung an ePA oder NCPeH-FD <code>dataprocessor</code> aus [CodeSystem: Security Role Type (Experimental)]</td>
    </tr>
    <tr>
      <td>AuditEvent.agent.name</td>
      <td><code>zeta-user-info.commonName</code> bzw. bei Übermittlung an ePA <code>"TI-Flow-Fachdienst"</code></td>
    </tr>
    <tr>
      <td>AuditEvent.agent.who</td>
      <td><code>zeta-user-info.identifier</code></td>
    </tr>
    <tr>
      <td>AuditEvent.agent.requestor</td>
      <td>Fester Wert <code>false</code>, da keine Protokolleinträge von außen erzeugt werden</td>
    </tr>
    <tr>
      <td>AuditEvent.source.site</td>
      <td>Fester Wert <code>TI-Flow-Fachdienst</code></td>
    </tr>
    <tr>
      <td>AuditEvent.source.observer</td>
      <td>Device-Informationen des TI-Flow-Fachdienstes (<code>status</code>, <code>serialnumber</code> = gemäß Release)</td>
    </tr>
    <tr>
      <td>AuditEvent.entity.what</td>
      <td>Referenz auf das durch den Abruf betroffene Datenobjekt Task, ChargeItem, MedicationDispense, Consent oder Objekt der Zugriffsberechtigung</td>
    </tr>
    <tr>
      <td>AuditEvent.entity.name</td>
      <td>Eintrag der KVNR des betroffenen Versicherten aus dem Identifier des protokollierten Datenobjekts (String)</td>
    </tr>
    <tr>
      <td>AuditEvent.entity.description</td>
      <td>Task-ID als Identifier, wird übernommen aus MedicationDispense, ChargeItem oder Task bzw. <code>Consent.category.coding.code</code> bei Anlegen oder Löschen eines Consent bzw. <code>countryCode</code> bei Anlegen oder Löschen einer Zugriffsberechtigung</td>
    </tr>
  </tbody>
</table>
</requirement>

<!-- A_19284-14 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A31" title="TI-Flow-Fachdienst - Versichertenprotokoll zu Operationen" version="0">
	<meta lockversion="false"/>
	<actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    	<testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  	</actor>
	Der TI-Flow-Fachdienst MUSS jeden Aufruf von Operationen gemäß "TAB_TIFlowFD_004 Versichertenprotokoll" protokollieren und die gelesene bzw. geschriebene Ressource im Protokolleintrag AuditEvent.entity.what als Referenz hinzufügen sowie die KVNR des betroffenen Versicherten in AuditEvent.entity.name speichern. Mit diesen Informationen kann der Versicherte die Zugriffe auf seine Daten nachvollziehen und bei einem unberechtigten Zugriff ggf. intervenieren.
</requirement>

<table>
  <tr>
    <th>Operation</th>
    <th>Rolle des zugreifenden Nutzers</th>
    <th>Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache)</th>
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
    <td>http POST /pushers/set</td>
    <td>Versicherter</td>
    <td>
        <ul>
            <li>Falls kind=null:Versicherter hat das Gerät "device_display_name" für Push-Nachrichten deregistriert.</li>
            <li>Falls kind=http:Versicherter hat das Gerät "device_display_name" für Push-Nachrichten registriert.</li>
        </ul>
    </td>
  </tr>
</table>
<div><figcaption><strong>Tabelle: </strong>TAB_TIFlowFD_004 Versichertenprotokoll</figcaption></div>

<table>
  <tr>
    <th>Wert in proofMethod</th>
    <th>Wert für &#60;PoPP-Anwendungsfall&#62;</th>
  </tr>
  <tr>
    <td>ehc-practitioner-*</td>
    <td>eGK in der Apotheke</td>
  </tr>
</table>
<div><figcaption><strong>Tabelle: </strong>TAB_TIFlowFD_004c Versichertenprotokoll PoPP Anwendungsfall</figcaption></div>

<!-- A_19284-14 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A32" title="TI-Flow-Fachdienst - Versichertenprotokoll zu automatischen Löschen" version="0">
	<meta lockversion="false"/>
	<actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    	<testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  	</actor>
	Der TI-Flow-Fachdienst MUSS beim automatischen Löschen nach Erreichen einer Löschfrist gemäß "TAB_TIFlowFD_004a Versichertenprotokoll nach automatischen Löschen" protokollieren und die gelesene bzw. geschriebene Ressource im Protokolleintrag AuditEvent.entity.what als Referenz hinzufügen sowie die KVNR des betroffenen Versicherten in AuditEvent.entity.name speichern. Mit diesen Informationen kann der Versicherte die Zugriffe auf seine Daten nachvollziehen und bei einem unberechtigten Zugriff ggf. intervenieren.
</requirement>

<table>
  <tr>
    <th>Ressource</th>
    <th>Akteur</th>
    <th>Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache)</th>
  </tr>
  <tr>
    <td>Ressource Task</td>
    <td>TI-Flow-Fachdienst</td>
    <td>Veraltete E-Rezepte vom Fachdienst automatisch gelöscht.</td>
  </tr>
  <tr>
    <td>Ressource MedicationDispense</td>
    <td>TI-Flow-Fachdienst</td>
    <td>Veraltete Medikament-Informationen vom Fachdienst automatisch gelöscht.</td>
  </tr>
  <tr>
    <td>Ressource Communication</td>
    <td>TI-Flow-Fachdienst</td>
    <td>Veraltete Nachricht vom Fachdienst automatisch gelöscht.</td>
  </tr>
  <tr>
    <td>Ressource ChargeItem</td>
    <td>TI-Flow-Fachdienst</td>
    <td>Veraltete Abrechnungsinformation vom Fachdienst automatisch gelöscht.</td>
  </tr>
</table>
<div><figcaption><strong>Tabelle: </strong>TAB_TIFlowFD_004a Versichertenprotokoll nach automatischen Löschen</figcaption></div>

<!-- A_19284-14 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A33" title="TI-Flow-Fachdienst - Versichertenprotokoll zu Löschen nach Fehlerbehandlung" version="0">
	<meta lockversion="false"/>
	<actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  </actor>
	Der TI-Flow-Fachdienst MUSS beim automatischen Löschen nach Fehlerbehandlung gemäß "TAB_TIFlowFD_004b Versichertenprotokoll nach Löschen wegen Fehlerbehandlung" protokollieren und die gelesene bzw. geschriebene Ressource im Protokolleintrag AuditEvent.entity.what als Referenz hinzufügen sowie die KVNR des betroffenen Versicherten in AuditEvent.entity.name speichern. Mit diesen Informationen kann der Versicherte die Zugriffe auf seine Daten nachvollziehen und bei einem unberechtigten Zugriff ggf. intervenieren.
</requirement>

<table>
  <tr>
    <th>Ressource</th>
    <th>Akteur</th>
    <th>Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache)</th>
  </tr>
  <tr>
    <td>Ressource Pusher</td>
    <td>TI-Flow-Fachdienst</td>
    <td>Fachdienst hat das Gerät "device_display_name" für Push-Nachrichten deregistriert.</td>
  </tr>
</table>
<div><figcaption><strong>Tabelle: </strong>TAB_TIFlowFD_004b Versichertenprotokoll nach Löschen wegen Fehlerbehandlung</figcaption></div>

<!-- A_19302 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A34" title="TI-Flow-Fachdienst - Protokolleintrag Versichertenprotokoll leicht verständlich" version="0">
	<meta lockversion="false"/>
	<actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  </actor>
	Der TI-Flow-Fachdienst MUSS in jedem zu tätigenden Eintrag des Protokolls für Versicherte einen lesbaren Text in einfacher Sprache (deutsch und englisch) erzeugen, der mindestens den Namen des Zugreifenden, die auslösende Operation und das Ergebnis der Operation umfasst, damit Versicherte ohne technisches Vorwissen den Inhalt des Zugriffsprotokolls verstehen können.
</requirement>

<!-- A_22217 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A35" title="TI-Flow-Fachdienst - Protokollierung - keine Angabe zu organizationName" version="0">
	<meta lockversion="false"/>
	<actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    	<testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  	</actor>
	Der TI-Flow-Fachdienst MUSS, wenn in den Nutzerinformationen zeta-user-info.commonName = NULL ist, in der Protokollierung als AuditEvent.agent.name "unbekannt" verwenden.
</requirement>