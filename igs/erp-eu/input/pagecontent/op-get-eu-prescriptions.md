Der abgebenden Apotheke im europäischen Ausland werden Ressourcen des MedicationRequest sowie die darin verknüpften Ressourcen mit Informationen über im europäischen Ausland einlösbare Verordnungen bereitgestellt. Der Zugriff auf diese Ressourcen erfolgt ausschließlich lesend durch den deutschen NCPeH-FD, der die Informationen entsprechend aufbereitet und weiterleitet.

### Nachricht

Die Nachricht wird als HTTP `POST` an `/$get-eu-prescriptions` gesendet.

### Anforderungen an Schnittstelle

- [Server Anforderungen zu `$get-eu-prescriptions`](./op-get-eu-prescriptions-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [NCPeH Anforderungen zu `$get-eu-prescriptions`](./op-get-eu-prescriptions-req-ncpeha.html): Anforderungen an den NCPeH-FD zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
	data-api-type="FHIROperation"
	data-api-fhir-resource-type="Task"
	data-api-fhir-invoke-level="system"
	data-api-operation-id="getEUPrescriptionsOperation">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-erp-fachdienst-server-erpeu.json %}
		</pre>
	</div>
	<div id="OperationDefinition">
		<pre>
			{% include OperationDefinition-GET-Prescription-EU.json %}
		</pre>
	</div>
	<div id="Request-Examples">
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Parameters/ExampleEUGETPrescriptionE-PRESCRIPTIONS-RETRIEVAL XML %}
		</div>
	</div>
	<div id="Response-Examples">
		<!-- TODO: Add operation-specific success response for $get-eu-prescriptions. -->
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleERPEUOperationOutcomeError XML %}
		</div>
	</div>
</div>


