# Query API: AuditEvent

Diese Seite beschreibt die moduluebergreifende AuditEvent-Query-Schnittstelle.

### Nachricht

Die AuditEvent-Query wird ueber HTTP `GET` auf `/AuditEvent` und `/AuditEvent/{id}` aufgerufen.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zur AuditEvent-Query](./query-api-auditevent-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zur AuditEvent-Query](./query-api-auditevent-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="AuditEvent"
  data-api-fhir-interaction="search-type">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server.json %}
    </pre>
  </div>
  <div id="Response-Examples">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment Bundle/example-searchset-auditevent JSON %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Bundle/example-searchset-auditevent XML %}
    </div>
  </div>
</div>


### Hinweis

- Die AuditEvent-Query ist auf Versicherte beschränkt.
- Schreibende HTTP-Operationen auf `AuditEvent` sind unzulässig.
