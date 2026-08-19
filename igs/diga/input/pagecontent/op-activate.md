Die FHIR-Operation `$activate` überführt einen im Status `draft` befindlichen `Task` in den Status `ready`, wenn das Primärsystem den qualifiziert elektronisch signierten Verordnungsdatensatz (QES) übermittelt. 

Diese Operation basiert auf der $activate Operation des Basis-Workflow für E-Rezepte. Für DiGA-Verordnungen (Flowtype 162) gelten zusätzliche Payload-Prüfungen. 

### Nachricht
Die Operation $activate wird als HTTP POST auf /Task/&#60;id&#62;/$activate ausgeführt.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu `$activate`](./op-activate-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.

- [Anforderungen für PVS zu `$activate`](./op-activate-req-pvs.html): Anforderungen an das PVS zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
	data-api-type="FHIROperation"
	data-api-fhir-resource-type="Task"
	data-api-fhir-invoke-level="instance"
	data-api-operation-id="activateOperation">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-ti-flow-fachdienst-server-diga.json %}
		</pre>
	</div>
	<div id="OperationDefinition">
		<pre>
			{% include OperationDefinition-tiflow-diga-activate-op.json %}
		</pre>
	</div>
	<div id="Request-Examples">
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Parameters/ExampleOperationActivateParametersInput XML %}
		</div>
		<div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
			{% fragment Parameters/ExampleOperationActivateParametersInput JSON %}
		</div>
	</div>
	<div id="Response-Examples">
		<div data-name="200 - application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Task/ExampleDiGATaskInReadyState XML %}
		</div>
		<div data-name="400 - application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleOperationActivateInvalidRoleError XML %}
		</div>
		<div data-name="400 - application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleOperationActivateError XML %}
		</div>
		<div data-name="200 - application/fhir+json" data-type="JSON" data-render="ig-Fragment">
			{% fragment Task/ExampleDiGATaskInReadyState JSON %}
		</div>
		<div data-name="400 - application/fhir+json" data-type="JSON" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleOperationActivateInvalidRoleError JSON %}
		</div>
		<div data-name="400 - application/fhir+json" data-type="JSON" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleOperationActivateError JSON %}
		</div>
	</div>
</div>


