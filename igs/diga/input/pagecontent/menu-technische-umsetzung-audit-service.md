### Zugriffsprotokoll für den Versicherten

Der TI-Flow-Fachdienst führt Zugriffsprotokolle für Versicherte, in denen alle Zugriffe auf die personenbezogenen und medizinischen Daten eines Versicherten für den Versicherten einsehbar sind. Weitere Details sind in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}/audit-service.html) zu finden, und unten sind die modulspezifischen Anforderungen.

<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-A30" title="TI-Flow-Fachdienst - Versichertenprotokoll zu DiGA-Operationen" version="0">
    <meta lockversion="false"/>
	<actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    	<testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  	</actor>
	Der TI-Flow-Fachdienst MUSS jeden Aufruf von Operationen gemäß "TAB_DiGA_004 Versichertenprotokoll" protokollieren und die gelesene bzw. geschriebene Ressource im Protokolleintrag AuditEvent.entity.what als Referenz hinzufügen sowie die KVNR des betroffenen Versicherten in AuditEvent.entity.name speichern. Mit diesen Informationen kann der Versicherte die Zugriffe auf seine Daten nachvollziehen und bei einem unberechtigten Zugriff ggf. intervenieren.
</requirement>

<table>
  <tr>
    <th>Operation</th>
    <th>Rolle des zugreifenden Nutzers</th>
    <th>Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache)</th>
  </tr>
  <tr>
    <td>http GET /diga/fhir/Task/&#60;id&#62;</td>
    <td>Versicherter</td>
    <td>Versicherter hat die Verordnung heruntergeladen</td>
  </tr>
  <tr>
    <td>http GET /diga/fhir/Task/&#60;id&#62;?secret</td>
    <td>Kostenträger</td>
    <td>Kostenträger hat die Verordnung-Quittung heruntergeladen</td>
  </tr>
  <tr>
    <td>http GET /diga/fhir/Task</td>
    <td>Kostenträger</td>
    <td>Krankenkasse hat die Liste der einlösbaren Verordnungen (DiGA-Verordnungen) abgerufen.</td>
  </tr>
  <tr>
    <td>http POST /diga/fhir/Task/&#60;id&#62;/$activate</td>
    <td>Arztpraxis/Zahnarztpraxis/Krankenhaus/Psychotherapeut</td>
    <td>Arztpraxis/Zahnarztpraxis/Krankenhaus/Psychotherapeut hat die Verordnung bereitgestellt.</td>
  </tr>
  <tr>
    <td>http POST /diga/fhir/Task/&#60;id&#62;/$accept</td>
    <td>Kostenträger</td>
    <td>Krankenkasse hat die Verordnung heruntergeladen</td>
  </tr>
  <tr>
    <td>http POST /diga/fhir/Task/&#60;id&#62;/$reject</td>
    <td>Kostenträger</td>
    <td>Krankenkasse hat die Verordnung zurückgegeben.</td>
  </tr>
  <tr>
    <td>http POST /diga/fhir/Task/&#60;id&#62;/$close</td>
    <td>Kostenträger</td>
    <td>Krankenkasse hat die Verordnung abgeschlossen.</td>
  </tr>
  <tr>
    <td>http POST /diga/fhir/Task/&#60;id&#62;/$abort</td>
    <td>Versicherter</td>
    <td>Versicherter hat die Verordnung gelöscht.</td>
  </tr>
  <tr>
    <td>http POST /diga/fhir/Task/&#60;id&#62;/$abort</td>
    <td>Arztpraxis/Zahnarztpraxis/Krankenhaus/Psychotherapeut</td>
    <td>Arztpraxis/Zahnarztpraxis/Krankenhaus/Psychotherapeut hat die Verordnung gelöscht.</td>
  </tr>
</table>
<div><figcaption><strong>Tabelle: </strong>TAB_DiGA_004 Versichertenprotokoll</figcaption></div>