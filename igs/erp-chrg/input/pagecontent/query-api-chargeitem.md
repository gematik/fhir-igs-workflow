Die Query API für ChargeItem ermöglicht den Zugriff auf Abrechnungsinformationen (Verordnungsdatensatz, PKV‑Abgabedatensatz, Quittung). Die Abrechnungsinformation wird als ChargeItem mit Referenzen auf die Datensätze abgebildet.

### Profilierung
Die Profilierung der Ressource ChargeItem ist hier dokumentiert: https://simplifier.net/erezept-patientenrechnung/gem_erpchrg_pr_chargeitem

### Nachricht
Die Nachricht zur Interaktion mit Einwilligungen als FHIR-Ressource ChargeItem wird über die folgenden HTTP-Methoden ermöglicht:

|Akteur|HTTP-Methode|Ergebnis der Anfrage|
|---|---|---|
|Versicherter|GET|Abrechnungsinformationen als Liste abrufen|
|Versicherter|GET /<id>|Spezifische Abrechnungsinformationen abrufen|
|Apotheke|GET /<id>?ac=|Spezifische Abrechnungsinformationen abrufen|
|Apotheke|POST|Abrechnungsinformation bereitstellen|
|Versicherter|PATCH /<id>|Abrechnungsinformation markieren|
|Apotheke|PUT /<id>|Abrechnungsinformation aktualisieren|
|Versicherter|DELETE /<id>|Abrechnungsinformation löschen|

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu ChargeItem](./query-api-chargeitem-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
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
			{% include CapabilityStatement-erp-fachdienst-server-erpchrg.json %}
		</pre>
	</div>
	<div id="Response-Examples">
		<!-- TODO: Replace placeholder searchset with a representative ChargeItem query example. -->
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Bundle/ExampleERPCHRGChargeItemSearchset XML %}
		</div>
	</div>
</div>
