Diese Seite basiert auf der gleichnamigen Schnittstelle in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}/query-api-communication.html) und beschreibt den Einstieg in die Communication-Query-Schnittstelle.

Communication wird für die Kommunikation zwischen Versicherten und Apotheke verwendet.

### Nachricht

Die Interaktion mit Nachrichten als FHIR-Ressource _Communication_ wird über die folgenden HTTP-Methoden ermöglicht:

|HTTP-Methode|Ergebnis der Anfrage|
|---|---|
|GET|Nachrichten abrufen|
|POST|Nachricht einstellen|
|DELETE|Nachricht löschen|

### Anforderungen an Schnittstelle

- [FD-Anforderungen zur Communication-Query](./query-api-communication-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen für Communication-Query](./query-api-communication-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.
- [AVS-Anforderungen für Communication-Query](./query-api-communication-req-avs.html): Anforderungen an das AVS zur Nutzung der Schnittstelle.
- [Datenmodell Payload für Communication-Query](./query-api-communication-req-data.html): Datenmodell Payload zur Nutzung der Schnittstelle.

### Resource API

Anfragen an die <i>Communication</i>-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden.

#### API Beschreibung

<div class="gematik-api"
	data-api-type="FHIRResource"
	data-api-fhir-resource-type="Communication"
	data-api-fhir-interaction="search-type">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-ti-flow-fachdienst-server-rx.json %}
		</pre>
	</div>
	<div id="Response-Examples">
		<!-- TODO: Replace placeholder searchset with a representative Communication query example. -->
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Bundle/ExampleRxCommunicationSearchset XML %}
		</div>
	</div>
</div>

### Instance API

Um spezifische Details zu einer einzelnen _Communciation_ mittels der RESTful API zu erhalten, wird die _Communciation Instance API_ verwendet, indem eine HTTP GET-Anfrage an den Endpunkt <i>/Communciation/[id]</i> gestellt wird.

#### API Beschreibung

<div class="gematik-api"
	data-api-type="FHIRResource"
	data-api-fhir-resource-type="Communication"
	data-api-fhir-interaction="read">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-ti-flow-fachdienst-server-rx.json %}
		</pre>
	</div>
	<div id="Response-Examples">
		<!-- TODO: Add a dedicated Communication read example for RX. -->
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Bundle/ExampleRxCommunicationSearchset XML %}
		</div>
	</div>
</div>


