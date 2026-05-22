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
      {% include OperationDefinition-CreateOperation.json %}
    </pre>
  </div>
  <div id="Request-Examples">
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Parameters/ExampleRxOperationRequestParameters XML %}
    </div>
  </div>
  <div id="Response-Examples">
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Task/ExampleRxTaskInReadyState XML %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment OperationOutcome/ExampleRxOperationOutcomeError XML %}
    </div>
  </div>
</div>

### Hinweise

- Task-IDs dürfen nicht auf Vorrat erzeugt bzw. bevorratet werden.
- `$create` ist nur für konkrete, unmittelbar folgende Verordnungsprozesse zu verwenden.
- Quelle: [api-erp: E-Rezept erstellen](https://github.com/gematik/api-erp/blob/master/docs/erp_bereitstellen.adoc#e-rezept-erstellen).



