
### Nachricht

Die Interaktion mit Nachrichten als FHIR-Ressource _Communication_ wird über die folgenden HTTP-Methoden ermöglicht:

|HTTP-Methode|Ergebnis der Anfrage|
|---|---|
|GET|Nachrichten abrufen|
|POST|Nachricht einstellen|
|DELETE|Nachricht löschen|

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu Communications](./query-api-communication-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zu Communications](./query-api-communication-req-fdv.html): Anforderungen an ein E-Rezept-FdV zur Nutzung der Schnittstelle.
- [AVS-Anforderungen zu Communications](./query-api-communication-req-avs.html): Anforderungen an ein Apothekenverwaltungssystem zur Nutzung der Schnittstelle.
- [KTR-Anforderungen zu Communications](./query-api-communication-req-ktr.html): Anforderungen an ein Clientsystem des Kostenträgers zur Nutzung der Schnittstelle.


### Resource API

Anfragen an die <i>Communication</i>-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden. Dabei können spezifische Suchparameter genutzt werden, um die Anfragen zu verfeinern. Zum Beispiel:

- Für den Versicherten noch nicht vom E-Rezept-Fachdienst abgerufene Communications: `?recipient=<kvnr>&received=NULL`

#### API Beschreibung

<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="Communication"
  data-api-fhir-interaction="search-type">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server.json %}
    </pre>
  </div>
  <div id="Request-Examples">
    <!-- TODO: Request-Beispiele für GET /Communication ergänzen (FdV: JSON, AVS: XML, KTR: XML) -->
  </div>
  <div id="Response-Examples">
    <!-- TODO: Response-Beispiele für GET /Communication Bundle ergänzen (FdV: JSON, AVS: XML, KTR: XML) -->
  </div>
</div>

#### Hinweis

- Bei Bereitstellung von Communications werden angehangene JSONs in content.payload ebenfalls validiert.
