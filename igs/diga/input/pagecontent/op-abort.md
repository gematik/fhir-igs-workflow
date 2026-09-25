Nachdem der Verordnende die Verordnung gelöscht hat, ruft er die FHIR-Operation `$abort` auf und überführt damit den Task in den Status `cancelled`, sofern sich dieser im Status `ready` befindet.
Wenn der Versicherte die Verordnung gelöscht hat, überführt die FHIR-Operation `$abort` den Task in den Status `cancelled`. Befindet sich der Task im Status `in-progress`, ist ein Abbruch durch den Versicherten nicht möglich.

Diese Operation basiert auf der `$abort` Operation des Basis-Workflow für E-Rezepte.

### Nachricht
Die Operation `$abort` wird als HTTP POST auf `/Task/&lt;id&gt;/$abort` ausgeführt.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu `$abort`](./op-abort-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.

- [Anforderungen für PVS zu `$abort`](./op-abort-req-pvs.html): Anforderungen an das PVS zur Nutzung der Schnittstelle.

- [Anforderungen für FdV zu `$abort`](./op-abort-req-fdv.html): Anforderungen an das FdV zur Nutzung der Schnittstelle.
 
### API Beschreibung

<div class="gematik-api"
	data-api-type="FHIROperation"
	data-api-fhir-resource-type="Task"
	data-api-fhir-invoke-level="instance"
	data-api-operation-id="abortOperation">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-ti-flow-fachdienst-server-diga.json %}
		</pre>
	</div>
  <div id="OperationDefinition">
    <pre>
      {% include OperationDefinition-tiflow-diga-abort-op.json %}
    </pre>
  </div>
	<div id="Response-Examples">
		<div data-name="403 - Operation für Rolle nicht erlaubt" data-type="JSON" data-render="ig-Fragment">
			{% fragment OperationOutcome/Example-Operation-Error-403-Role JSON %}
		</div>
		<div data-name="403 - Operation für Rolle nicht erlaubt" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/Example-Operation-Error-403-Role XML %}
		</div>
		<div data-name="403 - Identitätsabgleich fehlgeschlagen" data-type="JSON" data-render="ig-Fragment">
			{% fragment OperationOutcome/Example-Operation-Error-403-Identity-Mismatch JSON %}
		</div>
		<div data-name="403 - Identitätsabgleich fehlgeschlagen" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/Example-Operation-Error-403-Identity-Mismatch XML %}
		</div>
		<div data-name="412 - Taskstatus nicht zulässig" data-type="JSON" data-render="ig-Fragment">
			{% fragment OperationOutcome/Example-Operation-Error-412-Task-Status JSON %}
		</div>
		<div data-name="412 - Taskstatus nicht zulässig" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/Example-Operation-Error-412-Task-Status XML %}
		</div>
	</div>
</div>