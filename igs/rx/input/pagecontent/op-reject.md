### Task zurueckweisen ($reject)

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$reject` gesendet.

### Anforderungen an Schnittstelle

- [FD-Anforderungen zu `$reject`](./op-reject-fd-requirements.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [Client-Anforderungen zu `$reject`](./op-reject-client-requirements.html): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
  data-api-type="FHIROperation"
  data-api-fhir-invoke-level="instance"
  data-api-operation-id="rejectTask">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server.json %}
    </pre>
  </div>
  <div id="OperationDefinition">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment OperationDefinition/RejectOperation JSON %}
    </div>
  </div>
  <div id="Response-Examples">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment OperationOutcome/ExampleOperationRejectError JSON %}
    </div>
  </div>
</div>

### Hinweis

- `reject` und direktes erneutes `accept` sollen nicht als Uebergabemechanismus zwischen Apotheken verwendet werden.
- Diese Folge erzeugt fuer Versicherte schwer nachvollziehbare Protokollierung/Notifications.

### Geschaeftslogik

<figure>
  <div class="gem-ig-img-container" style="--box-width: 900px; margin-bottom: 30px;">
{% include rx-op-reject-flow.svg %}
  </div>
  <figcaption><strong>Abbildung: </strong>Ablauf Operation `$reject`</figcaption>
</figure>

### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.html) festgehalten.
