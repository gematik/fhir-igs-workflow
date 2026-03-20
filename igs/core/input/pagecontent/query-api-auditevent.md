Diese Seite beschreibt die modulübergreifende AuditEvent-Query-Schnittstelle.

### Nachricht

Die AuditEvent-Query wird über HTTP `GET` auf `/AuditEvent` und `/AuditEvent/{id}` aufgerufen.

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


### Hinweise

- Dieser Aufruf soll nicht regelmäßig im FdV ausgeführt werden, sondern nur, wenn der Versicherte Einsicht in das Protokoll nehmen möchte. Dies spart Ressourcen am E-Rezept-Fachdienst.
- Die Angabe "`total`" wird vom E-Rezept-Fachdienst aus Gründen der Performance nicht unterstützt. Die Anzahl der zurückgegebenen Einträge ist nach Möglichkeit immer 50.
- Die Sprache muss in jedem Aufruf mittels "Accept-Language" Heder übergeben werden, um die Protokolleinträge in der bevorzugten Sprache des Versicherten zurückzugeben.
