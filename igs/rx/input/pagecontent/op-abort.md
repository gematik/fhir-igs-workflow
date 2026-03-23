Diese Operation basiert auf der gleichnamigen Operation in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}/op-abort.html).

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$abort` gesendet.

### Anforderungen an Schnittstelle

- [FD-Anforderungen zu `$abort`](./op-abort-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zu `$abort`](./op-abort-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.
- [PVS-Anforderungen zu `$abort`](./op-abort-req-pvs.html): Anforderungen an das PVS zur Nutzung der Schnittstelle.
- [AVS-Anforderungen zu `$abort`](./op-abort-req-avs.html): Anforderungen an das AVS zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
	data-api-type="FHIROperation"
	data-api-fhir-resource-type="Task"
	data-api-fhir-invoke-level="instance"
	data-api-operation-id="abortOperation">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-erp-fachdienst-server-rx.json %}
		</pre>
	</div>
	<div id="OperationDefinition">
		<pre>
			{% include OperationDefinition-AbortOperation.json %}
		</pre>
	</div>
	<div id="Request-Examples">
		<!-- TODO: Request example for $abort (no body; accessCode and secret via headers) -->
	</div>
	<div id="Response-Examples">
		<!-- TODO: Replace with operation-specific response examples for $abort. -->
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleRxOperationOutcomeError XML %}
		</div>
	</div>
</div>

### Hinweise

- Nach erfolgreichem `$abort` sind lokale Einlöseinformationen (`secret`, Token-Bezug) im Client zu bereinigen.
- Fehlercodes und OperationOutcome-Hinweise sollen dem Nutzer mit klarem Bezug zum Task-Status angezeigt werden.

