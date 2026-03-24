Die Operation führt zum Löschen der für den Versicherten gespeicherten Zugriffsberechtigung. Diese Operation steht dem Versicherten, der die Zugriffsberechtigung erteilt hat, zur Verfügung.

### Nachricht

Die Nachricht wird als HTTP `DELETE` an `/$revoke-eu-access-permission` gesendet.

### Anforderungen an die Schnittstelle

- [Server Anforderungen zu `$revoke-eu-access-permission`](./op-revoke-eu-access-permission-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zu `$revoke-eu-access-permission`](./op-revoke-eu-access-permission-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
	data-api-type="FHIROperation"
	data-api-fhir-resource-type="Task"
	data-api-fhir-invoke-level="system"
	data-api-operation-id="revokeEUAccessPermissionOperation">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-erp-fachdienst-server-erpeu.json %}
		</pre>
	</div>
	<div id="OperationDefinition">
		<pre>
			{% include OperationDefinition-Revoke-EU-Access-Permission.json %}
		</pre>
	</div>
	<div id="Request-Examples">
		<!-- TODO: Verify if a request body example is required for $revoke-eu-access-permission. -->
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Parameters/Example-EU-PermissionRequest XML %}
		</div>
	</div>
	<div id="Response-Examples">
		<!-- TODO: Verify if operation response is empty/success-only or returns a payload. -->
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Parameters/Example-EU-PermissionResponse XML %}
		</div>
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleERPEUOperationOutcomeError XML %}
		</div>
	</div>
</div>



