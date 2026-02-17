### Task schliessen ($close)

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$close` gesendet.

### Anforderungen an Schnittstelle

- [FD-Anforderungen zu `$close`](./op-close-fd-requirements.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [Client-Anforderungen zu `$close`](./op-close-client-requirements.html): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
  data-api-type="FHIROperation"
  data-api-fhir-invoke-level="instance"
  data-api-operation-id="closeTask">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server.json %}
    </pre>
  </div>
  <div id="OperationDefinition">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment OperationDefinition/CloseOperation JSON %}
    </div>
  </div>
  <div id="Request-Examples">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment Parameters/ExampleCloseInputParameters JSON %}
    </div>
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment Parameters/ExampleCloseInputParametersMultipleMedicationDispenses JSON %}
    </div>
  </div>
  <div id="Response-Examples">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment Task/09330307-16ce-4cdc-810a-ca24ef80dde3 JSON %}
    </div>
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment Bundle/dffbfd6a-5712-4798-bdc8-07201eb77ab8 JSON %}
    </div>
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment OperationOutcome/ExampleOperationCloseError JSON %}
    </div>
  </div>
</div>

### Hinweis

- `$close` beendet den Workflow verbindlich; danach ist keine weitere inhaltliche Aenderung der Dispensierdaten moeglich.
- Falls ohne MedicationDispense aufgerufen wird, muss bereits eine gueltige `$dispense`-Information gespeichert sein.
- Bei Stapelverarbeitung sind Lastverteilungsregeln einzuhalten.

### Geschaeftslogik

<figure>
  <div class="gem-ig-img-container" style="--box-width: 900px; margin-bottom: 30px;">
{% include rx-op-close-flow.svg %}
  </div>
  <figcaption><strong>Abbildung: </strong>Ablauf Operation `$close`</figcaption>
</figure>

### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.html) festgehalten.
