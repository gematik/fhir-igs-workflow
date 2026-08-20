Diese Operation basiert auf der gleichnamigen Operation in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}/op-create.html).

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/$create` gesendet.

### Anforderungen an Schnittstelle

- [FD-Anforderungen zu `$create`](./op-create-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [PVS-Anforderungen zu `$create`](./op-create-req-pvs.html): Anforderungen an das PVS zur Nutzung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:
- [API-ERP: E-Rezept erstellen](https://github.com/gematik/api-erp/blob/master/docs/erp_bereitstellen.adoc#e-rezept-erstellen)

<div class="gematik-api"
  data-api-type="FHIROperation"
  data-api-fhir-resource-type="Task"
  data-api-fhir-invoke-level="type"
  data-api-operation-id="createOperation">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-ti-flow-fachdienst-server-rx.json %}
    </pre>
  </div>
  <div id="OperationDefinition">
    <pre>
      {% include OperationDefinition-tiflow-rx-create-op.json %}
    </pre>
  </div>
  <div id="Request-Examples">
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Parameters/OperationCreateParametersInputExample XML %}
		</div>
		<div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
			{% fragment Parameters/OperationCreateParametersInputExample JSON %}
		</div>
  </div>
  <div id="Response-Examples">
    <pre>
			POST /Task/$create HTTP/1.1
			Host: example.org
			Content-Type: application/fhir+xml; charset=UTF-8
			Accept: application/fhir+xml
		</pre>
		<div data-name="200 - application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Task/TaskInCreatedState XML %}
		</div>
		<div data-name="400 - application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleOperationCreateError XML %}
		</div>
		<div data-name="403 - application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleCreateOperationOutputError XML %}
		</div>
		<div data-name="200 - application/fhir+json" data-type="JSON" data-render="ig-Fragment">
			{% fragment Task/TaskInCreatedState JSON %}
		</div>
		<div data-name="400 - application/fhir+json" data-type="JSON" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleOperationCreateError JSON %}
		</div>
		<div data-name="403 - application/fhir+json" data-type="JSON" data-render="ig-Fragment">
			{% fragment OperationOutcome/ExampleCreateOperationOutputError JSON %}
		</div>
  </div>
</div>

### Hinweise

- Task-IDs dürfen nicht auf Vorrat erzeugt bzw. bevorratet werden.
- `$create` ist nur für konkrete, unmittelbar folgende Verordnungsprozesse zu verwenden.
- Quelle: [api-erp: E-Rezept erstellen](https://github.com/gematik/api-erp/blob/master/docs/erp_bereitstellen.adoc#e-rezept-erstellen).



