Diese Seite basiert auf der gleichnamigen Schnittstelle in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}query-api-consent.html) und beschreibt den Einstieg in die Consent-Query-Schnittstelle.

Die Query API für Consent ermöglicht das Erteilen, Einsehen und Widerrufen der Einwilligung zur Speicherung von Abrechnungsinformationen.

### Anforderungen an die Schnittstelle

- [Server-Anforderungen zur Consent-Query](./query-api-consent-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zur Consent-Query](./query-api-consent-req-fdv.html): Anforderungen an das TI-Flow-FdV des TI-Flow-Fachdienstes zur Nutzung der Schnittstelle.

Für die Verwaltung der Einwilligung zum Speichern der Abrechnungsinformationen wird Consent.category.coding.code mit dem Codesystem https://gematik.de/fhir/erpchrg/CodeSystem/GEM_ERPCHRG_CS_ConsentType verwendet.

### Resource API

<div class="gematik-api"
	data-api-type="FHIRResource"
	data-api-fhir-resource-type="Consent"
	data-api-fhir-interaction="search-type">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-ti-flow-fachdienst-server-erpchrg.json %}
		</pre>
	</div>
	<div id="Response-Examples">
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Bundle/Example-Consent-Bundle XML %}
		</div>
		<div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
			{% fragment Bundle/Example-Consent-Bundle JSON %}
		</div>
	</div>
</div>

<div class="gematik-api"
	data-api-type="FHIRResource"
	data-api-fhir-resource-type="Consent"
	data-api-fhir-interaction="create">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-ti-flow-fachdienst-server-erpchrg.json %}
		</pre>
	</div>
	<div id="Request-Examples">
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Consent/Example-GEM-ERPCHRG-Consent XML %}
		</div>
		<div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
			{% fragment Consent/Example-GEM-ERPCHRG-Consent JSON %}
		</div>
	</div>
	<div id="Response-Examples">
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Consent/Example-GEM-ERPCHRG-Consent XML %}
		</div>
		<div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
			{% fragment Consent/Example-GEM-ERPCHRG-Consent JSON %}
		</div>
	</div>
</div>

<div class="gematik-api"
	data-api-type="FHIRResource"
	data-api-fhir-resource-type="Consent"
	data-api-fhir-interaction="delete">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-ti-flow-fachdienst-server-erpchrg.json %}
		</pre>
	</div>	
</div>