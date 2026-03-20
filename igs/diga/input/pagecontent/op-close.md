Die FHIR-Operation `$close` überführt einen im Status `in-progress` befindlichen `Task` in den Status `completed`, wenn der Kostenträger des Workflow abschliesst.

### Nachricht
Die Operation $close wird als HTTP POST auf /Task/&#60;id&#62;/$close ausgeführt.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu `$close`](./op-close-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.

- [Anforderungen für KTR zu `$close`](./op-close-req-ktr.html): Anforderungen an das Clientsystem des KTR zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
	data-api-type="FHIROperation"
	data-api-fhir-resource-type="Task"
	data-api-fhir-invoke-level="instance"
	data-api-operation-id="closeOperation">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-erp-fachdienst-server-diga.json %}
		</pre>
	</div>
	<div id="OperationDefinition">
		<pre>
			{% include OperationDefinition-CloseOperation.json %}
		</pre>
	</div>
	<div id="Request-Examples">
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Parameters/ExampleCloseInputParametersDiGA XML %}
		</div>
	</div>
	<div id="Response-Examples">
		<!-- TODO: Replace with operation-specific response examples for $close. -->
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleDiGAOperationOutcomeError XML %}
		</div>
	</div>
</div>


### Hinweise
Nach Abschluss der Workflows eines E-Rezeptes hat der Kostenträger die Möglichkeit dem Versicherten eine Antwort zur Zuweisung zu übermitteln. Hierfür erstellt der Kostenträger eine Communication vom ProfilGEM_ERP_PR_Communication_DiGA und ergänzt unter Communication.payload.contentString den Antworttext, der dem Nutzer im E-Rezept-FdV dargestellt werden soll.


