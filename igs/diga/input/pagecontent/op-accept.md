Die FHIR-Operation `$acsept` überführt einen im Status `ready` befindlichen `Task` in den Status `in-progress`, nachdem der Kostenträger die Verordnung vom Fachdienst abgerufen hat.

### Nachricht
Die Operation $accept wird als HTTP POST auf /Task/&#60;id&#62;/$accept ausgeführt.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu `$accept`](./op-accept-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.

- [Anforderungen für KTR zu `$accept`](./op-accept-req-ktr.html): Anforderungen an das Clientsystem des KTR zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
	data-api-type="FHIROperation"
	data-api-fhir-resource-type="Task"
	data-api-fhir-invoke-level="instance"
	data-api-operation-id="acceptOperation">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-erp-fachdienst-server-diga.json %}
		</pre>
	</div>
	<div id="OperationDefinition">
		<pre>
			{% include OperationDefinition-AcceptOperation.json %}
		</pre>
	</div>
	<div id="Response-Examples">
		<!-- TODO: Replace with operation-specific response examples for $accept. -->
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleDiGAOperationOutcomeError XML %}
		</div>
	</div>
</div>
