Die FHIR-Operation $eu-close beendet den E-Rezept-Workflow des unter der &lt;id&gt; geführten Tasks und speichert die von der europäischen Apotheke übermittelten Dispensierinformationen für den Versicherten. Diese Operation steht ausschließlich dem NCPeH-FD zur Verfügung.

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/$eu-close` gesendet.

### Anforderungen an Schnittstelle

- [Server Anforderungen zu `$eu-close`](op-eu-close-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [NCPeH Anforderungen zu `$eu-close`](./op-eu-close-req-ncpeha.html): Anforderungen an den NCPeH-FD zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
	data-api-type="FHIROperation"
	data-api-fhir-resource-type="Task"
	data-api-fhir-invoke-level="type"
	data-api-operation-id="euCloseOperation">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-ti-flow-fachdienst-server-rx.json %}
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
		<div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
			{% fragment Parameters/ExampleEUCloseInputParameters JSON %}
		</div>
	</div>
	<div id="Response-Examples">
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleOperationEUCloseError XML %}
		</div>
		<div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleOperationEUCloseError JSON %}
		</div>
	</div>
</div>



