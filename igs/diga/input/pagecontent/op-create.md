Die FHIR-Operation `$create` erstellt einen Workflow im TI-Flow-Fachdienst.

Diese Operation basiert auf der $create Operation des Basis-Workflow für E-Rezepte.

### Nachricht
Die Operation $create wird als HTTP POST auf /Task/$create ausgeführt.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu `$create`](./op-create-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.

- [Anforderungen für PVS zu `$create`](./op-create-req-pvs.html): Anforderungen an das PVS zur Nutzung der Schnittstelle.


 
### API Beschreibung

<div class="gematik-api"
	data-api-type="FHIROperation"
	data-api-fhir-resource-type="Task"
	data-api-fhir-invoke-level="type"
	data-api-operation-id="createOperation">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-ti-flow-fachdienst-server-diga.json %}
		</pre>
	</div>
	<div id="OperationDefinition">
		<pre>
			{% include OperationDefinition-tiflow-diga-create-op.json %}
		</pre>
	</div>
	<div id="Request-Examples">
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Parameters/OperationCreateParametersInputExample XML %}
		</div>
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Parameters/OperationCreateParametersInputExample XML %}
		</div>
	</div>
	<div id="Response-Examples">
		<pre>
			POST /Task/$create HTTP/1.1
			Host: example.org
			Content-Type: application/fhir+xml; charset=UTF-8
			Accept: application/fhir+xml
		</pre>
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/erp-diga-01-task-162-create XML %}
		</div>
	</div>
</div>
 
