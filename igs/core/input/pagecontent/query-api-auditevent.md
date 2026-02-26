# Query API: AuditEvent

Diese Seite beschreibt die moduluebergreifende AuditEvent-Query-Schnittstelle.

### Nachricht

Die AuditEvent-Query wird ueber HTTP `GET` auf `/AuditEvent` und `/AuditEvent/{id}` aufgerufen.

### Anforderungen an Schnittstelle

- [FD-Anforderungen zur AuditEvent-Query](./query-api-auditevent-fd-requirements.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [Client-Anforderungen zur AuditEvent-Query](./query-api-auditevent-client-requirements.html): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

#### GET /AuditEvent

<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="AuditEvent"
  data-api-fhir-interaction="search-type">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server.json %}
    </pre>
  </div>
</div>

#### GET /AuditEvent/{id}

<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="AuditEvent"
  data-api-fhir-interaction="read">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server.json %}
    </pre>
  </div>
</div>

### Hinweis

- Die AuditEvent-Query ist auf Versicherte beschraenkt.
- Schreibende HTTP-Operationen auf `AuditEvent` sind unzulaessig.
