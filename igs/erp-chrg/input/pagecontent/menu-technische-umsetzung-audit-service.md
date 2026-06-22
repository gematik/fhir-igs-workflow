### Zugriffsprotokoll für den Versicherten

Der TI-Flow-Fachdienst führt Zugriffsprotokolle für Versicherte, in denen alle Zugriffe auf die personenbezogenen und medizinischen Daten eines Versicherten für den Versicherten einsehbar sind. Weitere Details sind in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}/audit-service.html) zu finden, und unten sind die modulspezifischen Anforderungen.

<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-99" title="TI-Flow-Fachdienst - Versichertenprotokoll zu DiGA-Operationen" version="0">
    <meta lockversion="false"/>
	<actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    	<testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  	</actor>
	Der TI-Flow-Fachdienst MUSS jeden Aufruf von Operationen gemäß "TAB_Chrg_004 Versichertenprotokoll" protokollieren und die gelesene bzw. geschriebene Ressource im Protokolleintrag AuditEvent.entity.what als Referenz hinzufügen sowie die KVNR des betroffenen Versicherten in AuditEvent.entity.name speichern. Mit diesen Informationen kann der Versicherte die Zugriffe auf seine Daten nachvollziehen und bei einem unberechtigten Zugriff ggf. intervenieren.
</requirement>

<table>
  <tr>
    <th>Operation</th>
    <th>Rolle des zugreifenden Nutzers</th>
    <th>Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache)</th>
  </tr>  
  <tr>
    <td>http DELETE /chrg/fhir/ChargeItem/&#60;id&#62;</td>
    <td>Versicherter</td>
    <td>Versicherter hat Abrechnungsinformation gelöscht</td>
  </tr>
  <tr>
    <td>http GET /chrg/fhir/ChargeItem/&#60;id&#62;</td>
    <td>Versicherter</td>
    <td>Versicherter hat Abrechnungsinformation gelesen</td>
  </tr>
  <tr>
    <td>http GET /chrg/fhir/ChargeItem/&#60;id&#62;</td>
    <td>Apotheke</td>
    <td>Apotheke hat Abrechnungsinformation gelesen</td>
  </tr>
  <tr>
    <td>http POST /chrg/fhir/ChargeItem</td>
    <td>Apotheke</td>
    <td>Apotheke hat Abrechnungsinformation bereitgestellt</td>
  </tr>
  <tr>
    <td>http PATCH /chrg/fhir/ChargeItem/&#60;id&#62;</td>
    <td>Versicherter</td>
    <td>Versicherter hat Markierung zu Abrechnungsinformation gespeichert</td>
  </tr>
  <tr>
    <td>http PUT /chrg/fhir/ChargeItem/&#60;id&#62;</td>
    <td>Apotheke</td>
    <td>Apotheke hat Abrechnungsinformation geändert</td>
  </tr>
</table>
<div><figcaption><strong>Tabelle: </strong>TAB_Chrg_004 Versichertenprotokoll</figcaption></div>