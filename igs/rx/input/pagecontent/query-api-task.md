# Query API: Task

Diese Seite beschreibt den Einstieg in die Task-Query-Schnittstellen des RX-Moduls.

### Nachricht

Die Task-Query wird über HTTP `GET` auf `/Task` und `/Task/{id}` aufgerufen.

### Anforderungen an Schnittstelle

- [FD-Anforderungen zur Task-Query](./query-api-task-fd-requirements.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [Client-Anforderungen zur Task-Query](./query-api-task-client-requirements.html): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

#### GET /Task

<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="Task"
  data-api-fhir-interaction="search-type"
  data-api-operation-id="searchTask">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server.json %}
    </pre>
  </div>
</div>

#### GET /Task/{id}

<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="Task"
  data-api-fhir-interaction="read"
  data-api-operation-id="readTask">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server.json %}
    </pre>
  </div>
</div>

### Hinweis

- Die Varianten `GET /Task/{id}?ac=...` und `GET /Task/{id}?secret=...` sind Teil der Task-Query und in den FD-Anforderungen spezifiziert.
- AccessCode/Secret dürfen nur in zugelassenen Clients verarbeitet und nicht offengelegt werden.
