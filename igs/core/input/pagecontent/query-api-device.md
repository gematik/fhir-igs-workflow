# Query API: Device

Diese Seite beschreibt die moduluebergreifende Device-Query-Schnittstelle.

### Nachricht

Die Device-Query wird ueber HTTP `GET` auf `/Device` aufgerufen.

### Anforderungen an Schnittstelle

- [Server Anforderungen zur Device-Query](./query-api-device-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [Client-Anforderungen zur Device-Query](./query-api-device-client-requirements.html): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
  data-api-type="FHIRInteraction"
  data-api-fhir-resource="Device"
  data-api-fhir-interaction="read">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server.json %}
    </pre>
  </div>
  <div id="Request-Examples">
    <!-- TODO: Request-Beispiel für GET /Device ergänzen (alle Clients: XML und JSON) -->
  </div>
  <div id="Response-Examples">
    <!-- TODO: Response-Beispiel für GET /Device ergänzen (XML und JSON) -->
  </div>
</div>

### Hinweis

- Die Ressource `Device` dient der statischen Selbstauskunft des E-Rezept-Fachdienstes.
- Der Endpunkt wird zur Bereitstellung von Produkttypinformationen genutzt.
