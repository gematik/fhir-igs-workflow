Die FHIR-Operation $eu-close beendet den E-Rezept-Workflow des unter der <id> geführten Tasks und speichert die von der europäischen Apotheke übermittelten Dispensierinformationen für den Versicherten. Diese Operation steht ausschließlich dem NCPeH-FD zur Verfügung.

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/$eu-close` gesendet.

### Anforderungen an Schnittstelle

- [Server Anforderungen zu `$eu-close`](op-eu-close-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [NCPeH Anforderungen zu `$eu-close`](./op-eu-close-req-ncpeha.html): Anforderungen an den NCPeH-FD zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
	data-api-type="FHIROperation"
	data-api-fhir-resource-type="Task"
	data-api-fhir-invoke-level="type"
	data-api-operation-id="euCloseOperation">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-erp-fachdienst-server-erpeu.json %}
		</pre>
	</div>
	<div id="OperationDefinition">
		<pre>
			{% include OperationDefinition-EUCloseOperation.json %}
		</pre>
	</div>
	<div id="Request-Examples">
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Parameters/ExampleEUCloseInputParameters XML %}
		</div>
	</div>
	<div id="Response-Examples">
		<!-- TODO: Add operation-specific success response for $eu-close. -->
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleERPEUOperationOutcomeError XML %}
		</div>
	</div>
</div>



