Diese Operation basiert auf der gleichnamigen Operation in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}/op-activate.html).

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$activate` gesendet.

### Anforderungen an Schnittstelle

- [FD-Anforderungen zu `$activate`](./op-activate-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [PVS-Anforderungen zu `$activate`](./op-activate-req-pvs.html): Anforderungen an das PVS zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
	data-api-type="FHIROperation"
	data-api-fhir-resource-type="Task"
	data-api-fhir-invoke-level="instance"
	data-api-operation-id="activateOperation">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-ti-flow-fachdienst-server-rx.json %}
		</pre>
	</div>
	<div id="OperationDefinition">
		<pre>
			{% include OperationDefinition-ActivateOperation.json %}
		</pre>
	</div>
	<div id="Request-Examples">
		<!-- TODO: Replace with operation-specific request examples for $activate. -->
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Parameters/ExampleRxOperationRequestParameters XML %}
		</div>
	</div>
	<div id="Response-Examples">
		<!-- TODO: Replace with operation-specific response examples for $activate. -->
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleRxOperationOutcomeError XML %}
		</div>
	</div>
</div>


### Hinweise

- Bei ausbleibender Antwort soll der Client den Aufruf wiederholen.
- Wenn ein wiederholter Aufruf mit `403` und "Task not in status draft but in status ready" antwortet, war ein vorheriger Aufruf bereits erfolgreich.


