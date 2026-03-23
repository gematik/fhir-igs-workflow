Mit der FHIR-Operation kann die Zugriffsberechtigung für die im ACCESS_TOKEN angegebene KVNR abgerufen werden. Diese Operation steht Versicherten zur Verfügung.

### Nachricht

Die Nachricht wird als HTTP `GET` an `/$read-eu-access-permission` gesendet.

### Anforderungen an Schnittstelle

- [Server Anforderungen zu `$read-eu-access-permission`](./op-read-eu-access-permission-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zu `$read-eu-access-permission`](./op-read-eu-access-permission-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
	data-api-type="FHIROperation"
	data-api-fhir-resource-type="Task"
	data-api-fhir-invoke-level="system"
	data-api-operation-id="readEUAccessPermissionOperation">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-erp-fachdienst-server-erpeu.json %}
		</pre>
	</div>
	<div id="OperationDefinition">
		<pre>
			{% include OperationDefinition-Read-EU-Access-Permission.json %}
		</pre>
	</div>
	<div id="Request-Examples">
		<!-- TODO: Verify if a request body example is required for $read-eu-access-permission. -->
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Parameters/Example-EU-PermissionRequest XML %}
		</div>
	</div>
	<div id="Response-Examples">
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Parameters/Example-EU-PermissionResponse XML %}
		</div>
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleERPEUOperationOutcomeError XML %}
		</div>
	</div>
</div>



