Diese Operation basiert auf der gleichnamigen Operation in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}/op-reject.html).

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$reject` gesendet.

### Anforderungen an Schnittstelle

- [Ergänzende Server-Anforderungen zu `$reject`](./op-reject-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
	data-api-type="FHIROperation"
	data-api-fhir-resource-type="Task"
	data-api-fhir-invoke-level="instance"
	data-api-operation-id="rejectOperation">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-erp-fachdienst-server-rx.json %}
		</pre>
	</div>
	<div id="OperationDefinition">
		<pre>
			{% include OperationDefinition-RejectOperation.json %}
		</pre>
	</div>
	<div id="Request-Examples">
		<!-- TODO: Request example for $reject (no body; accessCode and secret via headers) -->
	</div>
	<div id="Response-Examples">
		<!-- TODO: Replace with operation-specific response examples for $reject. -->
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleRxOperationOutcomeError XML %}
		</div>
	</div>
</div>

### Hinweise

- `reject` und direktes erneutes `accept` sollen nicht als Übergabemechanismus zwischen Apotheken verwendet werden.
- Diese Folge erzeugt für Versicherte schwer nachvollziehbare Protokollierung/Notifications.



