

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$activate` gesendet.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu `$activate`](./op-activate-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [Client-Anforderungen zu `$activate`](./op-activate-req-pvs.html): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
  data-api-type="FHIROperation"
  data-api-fhir-resource-type="Task"
  data-api-fhir-invoke-level="instance"
  data-api-operation-id="activateOperation">
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
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Parameters/ExampleOperationActivateParametersInput XML %}
    </div>
  </div>
  <div id="Response-Examples">
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Task/TaskInReadyState XML %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment OperationOutcome/ExampleOperationActivateError XML %}
    </div>
  </div>
</div>


### Hinweis

- Bei ausbleibender Antwort soll der Client den Aufruf wiederholen.
- Wenn ein wiederholter Aufruf mit `403` und "Task not in status draft but in status ready" antwortet, war ein vorheriger Aufruf bereits erfolgreich.
