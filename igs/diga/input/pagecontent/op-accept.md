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
			{% include CapabilityStatement-ti-flow-fachdienst-server-diga.json %}
		</pre>
	</div>
	<div id="OperationDefinition">
		<pre>
			{% include OperationDefinition-tiflow-diga-accept-op.json %}
		</pre>
	</div>
	<div id="Response-Examples">
		<div data-name="200 - DiGA-Verordnung per $accept-Operation abzurufen" data-type="XML" data-render="ig-Fragment">
			{% fragment Bundle/Example-POST-Accept-Response XML %}
		</div>
		<div data-name="200 - DiGA-Verordnung per $accept-Operation abzurufen" data-type="JSON" data-render="ig-Fragment">
			{% fragment Bundle/Example-POST-Accept-Response JSON %}
		</div>
		<div data-name="403 - Operation für Rolle nicht erlaubt" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/Example-Operation-Error-403-Role XML %}
		</div>
		<div data-name="403 - Operation für Rolle nicht erlaubt" data-type="JSON" data-render="ig-Fragment">
			{% fragment OperationOutcome/Example-Operation-Error-403-Role JSON %}
		</div>
		<div data-name="412 - Task-Status passt nicht" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/Example-Operation-Error-412-Task-Status XML %}
		</div>
		<div data-name="412 - Task-Status passt nicht" data-type="JSON" data-render="ig-Fragment">
			{% fragment OperationOutcome/Example-Operation-Error-412-Task-Status JSON %}
		</div>	
	</div>
</div>
