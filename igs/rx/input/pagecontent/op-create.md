### Task erzeugen ($create)

Diese Operation basiert auf der gleichnamigen Operation in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/eflow-core/latest/op-create.html).

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/$create` gesendet.

### Anforderungen an Schnittstelle

- [FD-Anforderungen zu `$create`](./op-create-fd-requirements.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [Client-Anforderungen zu `$create`](./op-create-client-requirements.html): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
  data-api-type="FHIROperation"
  data-api-fhir-invoke-level="type"
  data-api-operation-id="createOperation">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server.json %}
    </pre>
  </div>
  <div id="OperationDefinition">
    <pre>
      {% include OperationDefinition-CreateOperation.json %}
    </pre>
  </div>
  <div id="Request-Examples">
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Parameters/OperationCreateParametersInputExample XML %}
    </div>
  </div>
  <div id="Response-Examples">
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Task/b12eb5f7-91ce-4887-93c7-800454601377 XML %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment OperationOutcome/ExampleOperationCreateError XML %}
    </div>
  </div>
</div>

### Hinweis

- Task-IDs duerfen nicht auf Vorrat erzeugt bzw. bevorratet werden.
- `$create` ist nur fuer konkrete, unmittelbar folgende Verordnungsprozesse zu verwenden.
- Quelle: [api-erp: E-Rezept erstellen](https://github.com/gematik/api-erp/blob/master/docs/erp_bereitstellen.adoc#e-rezept-erstellen).

### Geschaeftslogik

<figure>
  <div class="gem-ig-img-container" style="--box-width: 900px; margin-bottom: 30px;">
{% include rx-op-create-flow.svg %}
  </div>
  <figcaption><strong>Abbildung: </strong>Ablauf Operation `$create`</figcaption>
</figure>

### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.html) festgehalten.
