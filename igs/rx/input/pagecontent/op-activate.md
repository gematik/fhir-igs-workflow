### Task aktivieren ($activate)

Diese Operation basiert auf der gleichnamigen Operation in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/eflow-core/latest/op-activate.html).

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$activate` gesendet.

### Anforderungen an Schnittstelle

- [FD-Anforderungen zu `$activate`](./op-activate-fd-requirements.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [Client-Anforderungen zu `$activate`](./op-activate-client-requirements.html): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
  data-api-type="FHIROperation"
  data-api-fhir-invoke-level="instance"
  data-api-operation-id="activateTask">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server.json %}
    </pre>
  </div>
  <div id="OperationDefinition">
    <pre>
      {% include OperationDefinition-ActivateOperation.json %}
    </pre>
  </div>
  <div id="Request-Examples">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment Parameters/ExampleOperationActivateParametersInput JSON %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Parameters/ExampleOperationActivateParametersInput XML %}
    </div>
  </div>
  <div id="Response-Examples">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment Task/607255ed-ce41-47fc-aad3-cfce1c39963f JSON %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Task/607255ed-ce41-47fc-aad3-cfce1c39963f XML %}
    </div>
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment OperationOutcome/ExampleOperationActivateError JSON %}
    </div>
  </div>
</div>

### Hinweis

- Bei ausbleibender Antwort soll der Client den Aufruf wiederholen.
- Wenn ein wiederholter Aufruf mit `403` und "Task not in status draft but in status ready" antwortet, war ein vorheriger Aufruf bereits erfolgreich.

### Geschaeftslogik

<figure>
  <div class="gem-ig-img-container" style="--box-width: 900px; margin-bottom: 30px;">
{% include rx-op-activate-flow.svg %}
  </div>
  <figcaption><strong>Abbildung: </strong>Ablauf Operation `$activate`</figcaption>
</figure>

### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.html) festgehalten.
