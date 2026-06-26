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
			{% include CapabilityStatement-ti-flow-fachdienst-server-rx.json %}
		</pre>
	</div>
	<div id="OperationDefinition">
		<pre>
			{% include OperationDefinition-tiflow-rx-abort-op.json %}
		</pre>
	</div>
	<div id="Request-Examples">
		<div data-name="Beispiel - $abort Request mit AccessCode Header und Secretals URL-Parameter" data-type="HTTP" data-render="ig-Fragment">
			<pre>
				POST [base]/rx/fhir/Task/4711/$abort?secret=3fa85f64-5717-4562-b3fc-2c963f66afa6
				Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjE2MzQifQ.eyJpc3MiOiJodHRwczovL2lkcC50aS1leGFtcGxlLmRlIiwic3ViIjoiMTEyMjMzNDQ1NSIsImF1ZCI6InRpZmxvdy1mYWNoZGllbnN0IiwicHJvZmVzc2lvbk9JRCI6Im9pZF9wcmF4aXNfYXJ6dCIsIm9yZ2FuaXphdGlvbklEIjoiMS4yLjI3Ni4wLjcyLjAuNzYuNC4xMjM0NTYiLCJleHAiOjE4MDAwMDAwMDAsImlhdCI6MTcwMDAwMDAwMH0.dBjftJeZ4CVP-mB92K27uhbUJU1p1r_wW1gFWFOEjXk
				X-AccessCode: 5f8d0d55-9c3a-4a2f-bf2f-123456789abc
			</pre>
    	</div>
		<div data-name="Beispiel - $abort Request mit AccessCode und Secret im Header" data-type="HTTP" data-render="ig-Fragment">
        	<pre>
			POST [base]/rx/fhir/Task/4711/$abort
			Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjE2MzQifQ.eyJpc3MiOiJodHRwczovL2lkcC50aS1leGFtcGxlLmRlIiwic3ViIjoiMTEyMjMzNDQ1NSIsImF1ZCI6InRpZmxvdy1mYWNoZGllbnN0IiwicHJvZmVzc2lvbk9JRCI6Im9pZF9wcmF4aXNfYXJ6dCIsIm9yZ2FuaXphdGlvbklEIjoiMS4yLjI3Ni4wLjcyLjAuNzYuNC4xMjM0NTYiLCJleHAiOjE4MDAwMDAwMDAsImlhdCI6MTcwMDAwMDAwMH0.dBjftJeZ4CVP-mB92K27uhbUJU1p1r_wW1gFWFOEjXk
			X-AccessCode: 5f8d0d55-9c3a-4a2f-bf2f-123456789abc
			X-Secret: 3fa85f64-5717-4562-b3fc-2c963f66afa6
			</pre>
		</div>
	</div>
	<div id="Response-Examples">
		<div data-name="Fehler - Response ohne Rechte application/fhir+json" data-type="JSON" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleRxAbortOperationOutcomeError JSON %}
		</div>
		<div data-name="Fehler - Response ohne Rechte application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleRxAbortOperationOutcomeError XML %}
		</div>
	</div>
</div>

### Hinweise

- Nach erfolgreichem `$abort` sind lokale Einlöseinformationen (`secret`, Token-Bezug) im Client zu bereinigen.
- Fehlercodes und OperationOutcome-Hinweise sollen dem Nutzer mit klarem Bezug zum Task-Status angezeigt werden.

