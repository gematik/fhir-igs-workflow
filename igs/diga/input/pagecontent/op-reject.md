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
			{% include CapabilityStatement-ti-flow-fachdienst-server-diga.json %}
		</pre>
	</div>
	<div id="OperationDefinition">
		<pre>
			{% include OperationDefinition-TIFLOW-DIGA-reject-op.json %}
		</pre>
	</div>
	<div id="Request-Examples">
		<div data-name="Beispiel - $abort Request mit AccessCode und Secret im Header" data-type="HTTP" data-render="ig-Fragment">
					<pre>
					POST [base]/rx/fhir/Task/4711/$reject
					Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjE2MzQifQ.eyJpc3MiOiJodHRwczovL2lkcC50aS1leGFtcGxlLmRlIiwic3ViIjoiMTEyMjMzNDQ1NSIsImF1ZCI6InRpZmxvdy1mYWNoZGllbnN0IiwicHJvZmVzc2lvbk9JRCI6Im9pZF9wcmF4aXNfYXJ6dCIsIm9yZ2FuaXphdGlvbklEIjoiMS4yLjI3Ni4wLjcyLjAuNzYuNC4xMjM0NTYiLCJleHAiOjE4MDAwMDAwMDAsImlhdCI6MTcwMDAwMDAwMH0.dBjftJeZ4CVP-mB92K27uhbUJU1p1r_wW1gFWFOEjXk
					X-AccessCode: 5f8d0d55-9c3a-4a2f-bf2f-123456789abc
					X-Secret: 3fa85f64-5717-4562-b3fc-2c963f66afa6
					</pre>
				</div>
	</div>
	<div id="Response-Examples">
		<div data-name="Fehler 403 - application/fhir+json" data-type="JSON" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleOperationRejectRolleError JSON %}
		</div>
		<div data-name="Fehler 403 - application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleOperationRejectRolleError XML %}
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
 

