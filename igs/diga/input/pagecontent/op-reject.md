Die FHIR-Operation `$reject` überführt einen im Status `in-progress` befindlichen `Task` in den Status `ready`, wenn der Kostenträger die Verordnung an den Versicherten zurückgibt, weil eine fehlerhafte Zuweisung vorliegt, d.h. der Kostenträger nicht zuständig ist.
 
Diese Operation basiert auf der $abort Operation des Basis-Workflow für E-Rezepte.

### Nachricht
Die Operation $reject wird als HTTP POST auf /Task/&#60;id&#62;/$reject ausgeführt.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu `$reject`](./op-reject-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.

- [Anforderungen für KTR zu `$reject`](./op-reject-req-ktr.html): Anforderungen an das Clientsystem des KTR zur Nutzung der Schnittstelle.

 
### API Beschreibung

<div class="gematik-api"
	data-api-type="FHIROperation"
	data-api-fhir-resource-type="Task"
	data-api-fhir-invoke-level="instance"
	data-api-operation-id="rejectOperation">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-erp-fachdienst-server-diga.json %}
		</pre>
	</div>
	<div id="OperationDefinition">
		<pre>
			{% include OperationDefinition-RejectOperation.json %}
		</pre>
	</div>
	<div id="Request-Examples">
		<!-- TODO: Request example for $reject (no body; accessCode and secret via headers) -->
	</div>
	<div id="Response-Examples">
		<!-- TODO: Replace with operation-specific response examples for $reject. -->
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleDiGAOperationOutcomeError XML %}
		</div>
	</div>
</div>
 
### Hinweise
Falls es bei der Verarbeitung einer Zuweisung einer digitalen Gesundheitsanwendung zu
einem Fehler kommt, bspw. wenn der Nutzer nicht beim Kostenträger versichert ist, muss
das Clientsystem den Nutzer informieren und das E-Rezept zur weiteren Nutzung
zurückgeben.

Hierzu führt der Kostenträger die TI-Flow-Fachdienst Operation "$reject" aus und
übermittelt dem Nutzer eine Communication GEM_ERP_PR_Communication_DiGA in der der Kostenträger
angeben kann, warum die Verordnung nicht bearbeitet werden kann.
 

