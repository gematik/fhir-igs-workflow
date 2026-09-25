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
		<div data-name="Parameters mit E-Rezept-Binary" data-type="XML" data-render="ig-Fragment">
			{% fragment Parameters/Example-POST-Activate-Request XML %}
		</div>
		<div data-name="Parameters mit E-Rezept-Binary" data-type="JSON" data-render="ig-Fragment">
			{% fragment Parameters/Example-POST-Activate-Request JSON %}
		</div>
	</div>
	<div id="Response-Examples">
		<div data-name="200 - DiGA-Task im Status ready" data-type="XML" data-render="ig-Fragment">
			{% fragment Task/Example-POST-Activate-Response XML %}
		</div>
		<div data-name="200 - DiGA-Task im Status ready" data-type="JSON" data-render="ig-Fragment">
			{% fragment Task/Example-POST-Activate-Response JSON %}
		</div>
		<div data-name="400 - Signatur ungültig" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/Example-Operation-Error-400-InvalidSignature XML %}
		</div>
		<div data-name="400 - Signatur ungültig" data-type="JSON" data-render="ig-Fragment">
			{% fragment OperationOutcome/Example-Operation-Error-400-InvalidSignature JSON %}
		</div>
		<div data-name="400 - FHIR-Profilvalidierung" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/Example-Operation-Error-400-Validation-Failed XML %}
		</div>
		<div data-name="400 - FHIR-Profilvalidierung" data-type="JSON" data-render="ig-Fragment">
			{% fragment OperationOutcome/Example-Operation-Error-400-Validation-Failed JSON %}
		</div>
	</div>
</div>


