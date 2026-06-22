### Zugriffsprotokoll für den Versicherten

Der TI-Flow-Fachdienst führt Zugriffsprotokolle für Versicherte, in denen alle Zugriffe auf die personenbezogenen und medizinischen Daten eines Versicherten für den Versicherten einsehbar sind. Weitere Details sind in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}/audit-service.html) zu finden, und unten sind die modulspezifischen Anforderungen.

<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-64" title="TI-Flow-Fachdienst - Versichertenprotokoll zu DiGA-Operationen" version="0">
    <meta lockversion="false"/>
	<actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    	<testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  	</actor>
	Der TI-Flow-Fachdienst MUSS jeden Aufruf von Operationen gemäß "TAB_EU_004 Versichertenprotokoll" protokollieren und die gelesene bzw. geschriebene Ressource im Protokolleintrag AuditEvent.entity.what als Referenz hinzufügen sowie die KVNR des betroffenen Versicherten in AuditEvent.entity.name speichern. Mit diesen Informationen kann der Versicherte die Zugriffe auf seine Daten nachvollziehen und bei einem unberechtigten Zugriff ggf. intervenieren.
</requirement>

<table>
  <tr>
    <th>Operation</th>
    <th>Rolle des zugreifenden Nutzers</th>
    <th>Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache)</th>
  </tr>
  <tr>
    <td>http POST /rx/fhir/Task/&#60;id&#62;/$eu-close</td>
    <td>NCPeH-FD</td>
    <td>Der Parameters.parameter:requestData.part:practitionerRole Parameters.parameter:requestData.part:practitionerName hat in Parameters.parameter:requestData.part:healthcare-facility-type Parameters.parameter:requestData.part:pointOfCare in Land B (Klartext aus: Parameters.parameter:requestData.part:countryCode) Ihr E-Rezept eingelöst.</td>
  </tr>
  <tr>
    <td>http PATCH /rx/fhir/Task/&#60;id&#62;</td>
    <td>Versicherter</td>
    <td>Versicherter hat Markierung zu Einlösung im EU Ausland gespeichert</td>
  </tr>  
  <tr>
    <td>http POST /rx/fhir/$grant-eu-access-permission</td>
    <td>Versicherter</td>
    <td>Versicherter hat eine Zugriffsberechtigung zum Einlösen von E-Rezepten für das Land "Land B" erteilt.</td>
  </tr>
  <tr>
    <td>http DELETE /rx/fhir/$revoke-eu-access-permission</td>
    <td>Versicherter</td>
    <td>Versicherter hat die Zugriffsberechtigung zum Einlösen von E-Rezepten für das Land "Land B" widerrufen.</td>
  </tr>
  <tr>
    <td>POST /rx/fhir/$get-eu-prescriptions<br>Parameters.parameter:requestData.part:requesttype = demographics</td>
    <td>NCPeH-FD</td>
    <td>Der Parameters.parameter:requestData.part:practitionerRole Parameters.parameter:requestData.part:practitionerName hat in Parameters.parameter:requestData.part:healthcare-facility-type Parameters.parameter:requestData.part:pointOfCare in Land B (Klartext aus: Parameters.parameter:requestData.part:countryCode) Ihre Patientendaten abgerufen.</td>
  </tr>
  <tr>
    <td>POST /rx/fhir/$get-eu-prescriptions<br>Parameters.parameter:requestData.part:requesttype = e-prescriptions-list</td>
    <td>NCPeH-FD</td>
    <td>Der Parameters.parameter:requestData.part:practitionerRole Parameters.parameter:requestData.part:practitionerName hat in Parameters.parameter:requestData.part:healthcare-facility-type Parameters.parameter:requestData.part:pointOfCare in Land B (Klartext aus: Parameters.parameter:requestData.part:countryCode) Ihre ausgwählten und einlösbaren E-Rezepte abgerufen.</td>
  </tr>
  <tr>
    <td>POST /rx/fhir/$get-eu-prescriptions<br>Parameters.parameter:requestData.part:requesttype = e-prescriptions-retrieval</td>
    <td>NCPeH-FD</td>
    <td>Der Parameters.parameter:requestData.part:practitionerRole Parameters.parameter:requestData.part:practitionerName hat in Parameters.parameter:requestData.part:healthcare-facility-type Parameters.parameter:requestData.part:pointOfCare in Land B (Klartext aus: Parameters.parameter:requestData.part:countryCode) Ihre einzulösenden E-Rezepte abgerufen.</td>
  </tr>  
</table>
<div><figcaption><strong>Tabelle: </strong>TAB_EU_004 Versichertenprotokoll</figcaption></div>