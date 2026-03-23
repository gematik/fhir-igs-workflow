Diese Seite basiert auf der gleichnamigen Schnittstelle in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}/query-api-task.html) und beschreibt den Einstieg in die Task-Query-Schnittstelle.

### Nachricht

Die Nachricht zur Interaktion mit Verordnungen als FHIR-Ressource _Task_ wird über die folgenden HTTP-Methoden ermöglicht:

|Akteur|HTTP-Methode|Ergebnis der Anfrage|
|---|---|---|
|Versicherter|GET|Liste von Task abrufen|
|Versicherter|GET /&#60;id&#62;|Spezifischen Task abrufen|
|Apotheke|GET ?hcv=|E-Rezepte von Versicherten abrufen (VSDM)|
|Apotheke|GET X-PoPP-Token|E-Rezepte von Versicherten abrufen (PoPP)|
|Apotheke|GET /&#60;id&#62;?ac=|Recovery Secret|
|Apotheke|GET /&#60;id&#62;?secret=|Quittung erneut abrufen|

### Anforderungen an Schnittstelle

- [FD-Anforderungen zur Task-Query](./query-api-task-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen für Task-Query](./query-api-task-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.
- [AVS-Anforderungen für Task-Query](./query-api-task-req-avs.html): Anforderungen an das AVS zur Nutzung der Schnittstelle.

### Resource API

Anfragen an die <i>Task</i>-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden.

#### API Beschreibung

<div class="gematik-api"
	data-api-type="FHIRResource"
	data-api-fhir-resource-type="Task"
	data-api-fhir-interaction="search-type">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-erp-fachdienst-server-rx.json %}
		</pre>
	</div>
	<div id="Response-Examples">
		<!-- TODO: Replace placeholder searchset with a representative task query example. -->
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Bundle/ExampleRxTaskSearchset XML %}
		</div>
	</div>
</div>

### Instance API

Um spezifische Details zu einem einzelnen _Task_ mittels der RESTful API zu erhalten, wird die _Task Instance API_ verwendet, indem eine HTTP GET-Anfrage an den Endpunkt <i>/Task/&lt;id&gt;</i> gestellt wird.

#### API Beschreibung

<div class="gematik-api"
	data-api-type="FHIRResource"
	data-api-fhir-resource-type="Task"
	data-api-fhir-interaction="read">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-erp-fachdienst-server-rx.json %}
		</pre>
	</div>
	<div id="Response-Examples">
		<!-- TODO: Add a dedicated Task read example for RX. -->
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Bundle/ExampleRxTaskSearchset XML %}
		</div>
	</div>
</div>
