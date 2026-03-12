

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$accept` gesendet.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu `$accept`](./op-accept-fd-requirements.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [AVS-Anforderungen zu `$accept`](./op-accept-req-avs.html): Anforderungen an das Apothekenverwaltungssystem zur Nutzung der Schnittstelle.
- [AVS-Anforderungen zu `$accept`](./op-accept-req-ktr.html): Anforderungen an das Clientsystem des Kostenträgers zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
  data-api-type="FHIROperation"
  data-api-fhir-invoke-level="instance"
  data-api-operation-id="acceptOperation">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server.json %}
    </pre>
  </div>
  <div id="OperationDefinition">
    <pre>
      {% include OperationDefinition-AcceptOperation.json %}
    </pre>
  </div>
  <div id="Request-Examples">
    <!-- TODO: Request-Beispiel für $accept ergänzen (kein Body, nur Header mit AccessCode) -->
  </div>
  <div id="Response-Examples">
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Bundle/ExampleAcceptResponseBundle XML %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment OperationOutcome/ExampleOperationAcceptError XML %}
    </div>
  </div>
</div>

### Hinweis

- Die Rückgabe kann bei Mehrfachverordnung mit `403` scheitern, wenn die Einlösefrist noch nicht begonnen hat.
- AccessCode und insbesondere `secret` sind als hochsensible Daten zu behandeln.

### Geschäftslogik

<figure>
  <div class="gem-ig-img-container" style="--box-width: 900px; margin-bottom: 30px;">
{% include rx-op-accept-flow.svg %}
  </div>
  <figcaption><strong>Abbildung: </strong>Ablauf Operation `$accept`</figcaption>
</figure>
