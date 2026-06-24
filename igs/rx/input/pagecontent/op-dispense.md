
### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$dispense` gesendet.

### Anforderungen an Schnittstelle

- [FD-Anforderungen zu `$dispense`](./op-dispense-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [AVS-Anforderungen zu `$dispense`](./op-dispense-req-avs.html): Anforderungen an das AVS zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
	data-api-type="FHIROperation"
	data-api-fhir-resource-type="Task"
	data-api-fhir-invoke-level="instance"
	data-api-operation-id="dispenseOperation">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-ti-flow-fachdienst-server-rx.json %}
		</pre>
	</div>
	<div id="OperationDefinition">
		<pre>
			{% include OperationDefinition-tiflow-rx-dispense-op.json %}
		</pre>
	</div>
	<div id="Request-Examples">
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Parameters/ExampleDispenseInputParameters XML %}
		</div>
	</div>
	<div id="Response-Examples">
		<div data-name="Fehler (403) application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleRxDispenseOperationOutcomeError XML %}
		</div>
	</div>
</div>

### Hinweise

- Wiederholte Aufrufe von `$dispense` überschreiben die bisher gespeicherten Dispensierinformationen.
- Deshalb muss immer die vollständige, aktuelle MedicationDispense übermittelt werden.


