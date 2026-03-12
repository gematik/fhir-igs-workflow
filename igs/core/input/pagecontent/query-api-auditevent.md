# Query API: AuditEvent

Diese Seite beschreibt die moduluebergreifende AuditEvent-Query-Schnittstelle.

### Nachricht

Die AuditEvent-Query wird ueber HTTP `GET` auf `/AuditEvent` und `/AuditEvent/{id}` aufgerufen.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zur AuditEvent-Query](./query-api-auditevent-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zur AuditEvent-Query](./query-api-auditevent-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
  data-api-type="FHIRInteraction"
  data-api-fhir-resource="AuditEvent"
  data-api-fhir-interaction="search-type">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server.json %}
    </pre>
  </div>
  <div id="Request-Examples">
    <!-- TODO: Request-Beispiel für GET /AuditEvent (FdV, JSON) ergänzen -->
  </div>
  <div id="Response-Examples">
    <!-- TODO: Response-Beispiel für GET /AuditEvent Bundle (FdV, JSON) ergänzen -->
  </div>
</div>


### Hinweis

- Die AuditEvent-Query ist auf Versicherte beschraenkt.
- Schreibende HTTP-Operationen auf `AuditEvent` sind unzulaessig.
