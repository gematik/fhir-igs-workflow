Diese Seite basiert auf der gleichnamigen Schnittstelle in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/{{ site.data.constants.tiflow_core_version }}/query-api-task.html) und beschreibt den Einstieg in die Task-Schnittstelle.

### Nachricht

Die Nachricht zur Interaktion mit Verordnungen als FHIR-Ressource _Task_ wird über die folgenden HTTP-Methoden ermöglicht:

|Akteur|HTTP-Methode|Ergebnis der Anfrage|
|---|---|---|
|Versicherter|GET|Liste von Task abrufen|
|Versicherter|GET /&#60;id&#62;|Spezifischen Task abrufen|
|Kostenträger|GET /&#60;id&#62;?ac=|Recovery Secret|
|Kostenträger|GET /&#60;id&#62;?secret=|Quittung erneut abrufen|

### Anforderungen an Schnittstelle

- [FD-Anforderungen zur Task](./query-api-task-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen für Task](./query-api-task-req-fdv.html): Anforderungen an das TI-Flow-FdV zur Nutzung der Schnittstelle.
- [KTR-Anforderungen für Task](./query-api-task-req-ktr.html): Anforderungen an das Clientsystem Kostenträger zur Nutzung der Schnittstelle.

#### API Beschreibung

Als Versicherter alle E-Rezepte einsehen.

<div class="gematik-api"
	data-api-type="FHIRResource"
	data-api-fhir-resource-type="Task"
	data-api-fhir-interaction="search-type">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-ti-flow-fachdienst-server-diga.json %}
		</pre>
	</div>
	<div id="Response-Examples">
		<div data-name="Liste von Tasks abrufen" data-type="XML" data-render="ig-Fragment">
			{% fragment Bundle/Example-GET-Task-Response-All-Insured XML %}
		</div>
		<div data-name="Liste von Tasks abrufen" data-type="JSON" data-render="ig-Fragment">
			{% fragment Bundle/Example-GET-Task-Response-All-Insured JSON %}
		</div>
	</div>
</div>

### Instance API

#### API Beschreibung

- Der Zugriff auf ein einzelnes E-Rezept ist durch den Versicherten mit Nachweis seiner Identität
- E-Rezept durch den Kostenträger erneut abrufen. Der TIFlow-Fachdienst überträgt daraufhin den Task mit Secret und das QES Verordnungsbundle an die Kostenträger.

<div class="gematik-api"
	data-api-type="FHIRResource"
	data-api-fhir-resource-type="Task"
	data-api-fhir-interaction="read">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-ti-flow-fachdienst-server-diga.json %}
		</pre>
	</div>
	<div id="Response-Examples">
		<div data-name="Versicherter: Spezifischen Task abrufen" data-type="XML" data-render="ig-Fragment">
			{% fragment Bundle/Example-GET-Task-Response-Single-Insured XML %}
		</div>
		<div data-name="Versicherter: Spezifischen Task abrufen" data-type="JSON" data-render="ig-Fragment">
			{% fragment Bundle/Example-GET-Task-Response-Single-Insured JSON %}
		</div>
		<div data-name="Kostenträger: E-Rezept erneut abrufen" data-type="XML" data-render="ig-Fragment">
			{% fragment Bundle/Example-GET-Task-Response-Single-Performer XML %}
		</div>
		<div data-name="Kostenträger: E-Rezept erneut abrufen" data-type="JSON" data-render="ig-Fragment">
			{% fragment Bundle/Example-GET-Task-Response-Single-Performer JSON %}
		</div>
	</div>
</div>

