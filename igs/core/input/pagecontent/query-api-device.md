# Query API: Device

Diese Seite beschreibt die moduluebergreifende Device-Query-Schnittstelle.

### Nachricht

Die Device-Query wird ueber HTTP `GET` auf `/Device` aufgerufen.

### Anforderungen an Schnittstelle

- [Server Anforderungen zur Device-Query](./query-api-device-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [Client-Anforderungen zur Device-Query](./query-api-device-client-requirements.html): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="Device"
  data-api-fhir-interaction="search-type">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server.json %}
    </pre>
  </div>
  <div id="Response-Examples">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment Device/ReceiptBundleDevice JSON %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Device/ReceiptBundleDevice XML %}
    </div>
  </div>
</div>

### Hinweis

- Die Ressource `Device` dient der statischen Selbstauskunft des E-Rezept-Fachdienstes.
- Der Endpunkt wird zur Bereitstellung von Produkttypinformationen genutzt.
