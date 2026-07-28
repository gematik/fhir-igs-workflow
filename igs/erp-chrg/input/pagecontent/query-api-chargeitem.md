Die Query API für ChargeItem ermöglicht den Zugriff auf Abrechnungsinformationen (Verordnungsdatensatz, PKV‑Abgabedatensatz, Quittung). Die Abrechnungsinformation wird als ChargeItem mit Referenzen auf die Datensätze abgebildet.

### Profilierung
Die Profilierung der Ressource ChargeItem ist hier dokumentiert: https://simplifier.net/erezept-patientenrechnung/gem_erpchrg_pr_chargeitem

### Nachricht
Die Nachricht zur Interaktion mit Einwilligungen als FHIR-Ressource ChargeItem wird über die folgenden HTTP-Methoden ermöglicht:

|Akteur|HTTP-Methode|Ergebnis der Anfrage|
|---|---|---|
|Versicherter|GET|Abrechnungsinformationen als Liste abrufen|
|Versicherter|GET /&#60;id&#62;|Spezifische Abrechnungsinformationen abrufen|
|Apotheke|GET /&#60;id&#62;?ac=|Spezifische Abrechnungsinformationen abrufen|
|Apotheke|POST|Abrechnungsinformation bereitstellen|
|Versicherter|PATCH /&#60;id&#62;|Abrechnungsinformation markieren|
|Apotheke|PUT /&#60;id&#62;|Abrechnungsinformation aktualisieren|
|Versicherter|DELETE /&#60;id&#62;|Abrechnungsinformation löschen|

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu ChargeItem](./query-api-chargeitem-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zu ChargeItem](./query-api-chargeitem-req-fdv.html): Anforderungen an ein E-Rezept-FdV zur Nutzung der Schnittstelle.
- [AVS-Anforderungen zu ChargeItem](./query-api-chargeitem-req-avs.html): Anforderungen an ein AVS zur Nutzung der Schnittstelle.

#### Resource API
Anfragen an die <i>ChargeItem</i>-Ressource können über die RESTful API durchgeführt werden.

### API Beschreibung

<div class="gematik-api"
	data-api-type="FHIRResource"
	data-api-fhir-resource-type="ChargeItem"
	data-api-fhir-interaction="search-type">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-ti-flow-fachdienst-server-erpchrg.json %}
		</pre>
	</div>
<!--
	<div id="Response-Examples">
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Bundle/ExampleERPCHRGChargeItemSearchset XML %}
		</div>
	</div>
-->
</div>
