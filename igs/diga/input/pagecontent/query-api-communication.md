
Diese Seite basiert auf der gleichnamigen Schnittstelle in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}/query-api-communication.html) und beschreibt den Einstieg in die Communication-Query-Schnittstelle.

Communication wird für die Kommunikation zwischen Versicherten und Kostenträger verwendet.

### Nachricht

Die Interaktion mit Nachrichten als FHIR-Ressource _Communication_ wird über die folgenden HTTP-Methoden ermöglicht:

|HTTP-Methode|Ergebnis der Anfrage|
|---|---|
|GET|Nachrichten abrufen|
|POST|Nachricht einstellen|
|DELETE|Nachricht löschen|

### Anforderungen an Schnittstelle

- [FD-Anforderungen zu Communications](./query-api-communication-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zu Communications](./query-api-communication-req-fdv.html): Anforderungen an ein E-Rezept-FdV zur Nutzung der Schnittstelle.
- [KTR-Anforderungen zu Communications](./query-api-communication-req-ktr.html): Anforderungen an ein CS Kostenträger zur Nutzung der Schnittstelle.




### POST /Communication
- Zuweisung einer Verordnung durch den Versicherten an den Kostenträger. Der Payload ist hierbei optional (Kardinalität 0..1)
- Übermittlung einer Nachricht durch den Kostenträger an den Versicherten.



<div class="gematik-api"
	data-api-type="FHIRResource"
	data-api-fhir-resource-type="Communication"
	data-api-fhir-interaction="create">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-erp-fachdienst-server-diga.json %}
		</pre>
	</div>
	<div id="Request-Examples">
		<!-- TODO: Replace with a representative Communication create request for DiGA. -->
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Communication/140f716f-f649-44fe-9a4e-157eb3c8adf3 XML %}
		</div>
	</div>
	<div id="Response-Examples">
		<!-- TODO: Add a dedicated create response example if needed. -->
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleDiGAOperationOutcomeError XML %}
		</div>
	</div>
</div>

### GET /Communication
- Kostenträger: Abruf von Zuweisungen von Versicherten
- Versicherter: Abruf der Rückmeldungen des Kostenträgers


<div class="gematik-api"
	data-api-type="FHIRResource"
	data-api-fhir-resource-type="Communication"
	data-api-fhir-interaction="search-type">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-erp-fachdienst-server-diga.json %}
		</pre>
	</div>
	<div id="Response-Examples">
		<!-- TODO: Replace placeholder searchset with a representative Communication query example for DiGA. -->
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Bundle/ExampleDiGACommunicationSearchset XML %}
		</div>
	</div>
</div>
