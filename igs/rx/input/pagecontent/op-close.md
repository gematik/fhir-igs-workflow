Diese Operation basiert auf der gleichnamigen Operation in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}/op-close.html).

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$close` gesendet.

### Anforderungen an Schnittstelle

- [FD-Anforderungen zu `$close`](./op-close-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [AVS-Anforderungen zu `$close`](./op-close-req-avs.html): Anforderungen an das AVS zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
	data-api-type="FHIROperation"
	data-api-fhir-resource-type="Task"
	data-api-fhir-invoke-level="instance"
	data-api-operation-id="closeOperation">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-ti-flow-fachdienst-server-rx.json %}
		</pre>
	</div>
	<div id="OperationDefinition">
		<pre>
			{% include OperationDefinition-tiflow-rx-close-op.json %}
		</pre>
	</div>
	<div id="Request-Examples">
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Parameters/ExampleCloseInputParameters XML %}
		</div>
	</div>
	<div id="Response-Examples">
		<div data-name="Erfolg (200) application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Parameters/ExampleRxCloseOutputParameters XML %}
		</div>
		<div data-name="Fehler (403) application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleRxCloseOperationOutcomeError XML %}
		</div>
	</div>
</div>

### Hinweise

- `$close` beendet den Workflow verbindlich; danach ist keine weitere inhaltliche Änderung der Dispensierdaten möglich.
- Falls ohne MedicationDispense aufgerufen wird, muss bereits eine gültige `$dispense`-Information gespeichert sein.
- Bei Stapelverarbeitung sind Lastverteilungsregeln einzuhalten.
- Die maximale Dateigröße für die Kommunikation am TI-Flow-Fachdienst beträgt derzeit 1MB. Dies meint den kompletten Request, daher muss der innere ASL-Request etwas kleiner als 1MB sein. Für Verordnungen, die mehrere Abgaben erfordern ist darauf zu achten, dass für mehrere Abgaben einer Charge nur eine MedicationDispense erstellt wird.



