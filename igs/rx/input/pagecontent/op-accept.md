### Task akzeptieren ($accept)

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$accept` gesendet.

### Anforderungen an Schnittstelle

- [FD-Anforderungen zu `$accept`](./op-accept-fd-requirements.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [Client-Anforderungen zu `$accept`](./op-accept-client-requirements.html): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
  data-api-type="FHIROperation"
  data-api-fhir-invoke-level="instance"
  data-api-operation-id="acceptTask">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server.json %}
    </pre>
  </div>
  <div id="OperationDefinition">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment OperationDefinition/AcceptOperation JSON %}
    </div>
  </div>
  <div id="Response-Examples">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment Bundle/Bundle-AcceptOperation JSON %}
    </div>
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment OperationOutcome/ExampleOperationAcceptError JSON %}
    </div>
  </div>
</div>

### Hinweis

- Die Rueckgabe kann bei Mehrfachverordnung mit `403` scheitern, wenn die Einloesefrist noch nicht begonnen hat.
- AccessCode und insbesondere `secret` sind als hochsensible Daten zu behandeln.

### Geschaeftslogik

<figure>
  <div class="gem-ig-img-container" style="--box-width: 900px; margin-bottom: 30px;">
{% include rx-op-accept-flow.svg %}
  </div>
  <figcaption><strong>Abbildung: </strong>Ablauf Operation `$accept`</figcaption>
</figure>

### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.html) festgehalten.
