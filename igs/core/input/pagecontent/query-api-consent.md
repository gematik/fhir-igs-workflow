
Für die Nutzung verschiedener im Rahmen der Anwendung E-Rezept angebotenen Funktionalitäten muss der Versicherte vorab eine Einwilligung erteilen. Für die Verwaltung der Einwilligung wird die FHIR Ressource Consent verwendet.

### Nachricht


Die Nachricht zur Interaktion mit Einwilligungen als FHIR-Ressource _Consent_ wird über die folgenden HTTP-Methoden ermöglicht:

|HTTP-Methode|Ergebnis der Anfrage|
|---|---|
|GET|Einwilligungen einsehen|
|POST|Einwilligung erteilen|
|DELETE|Einwilligung widerrufen|


### Anforderungen an Schnittstelle

- [Server-Anforderungen zur Consent-Query](./query-api-consent-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zur Consent-Query](./query-api-consent-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.


### Resource API

Anfragen an die <i>Consent</i>-Ressource können über die RESTful API durchgeführt werden. Dabei können spezifische Suchparameter genutzt werden, um die Anfragen zu verfeinern. Zum Beispiel:

- Suche nach Einwilligungen, die für einen Anwendungsfall eingestellt wurden: ``?category=CHARGCONS``

#### API Beschreibung

<div class="gematik-api"
  data-api-type="FHIRInteraction"
  data-api-fhir-resource="Consent"
  data-api-fhir-interaction="search-type">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server.json %}
    </pre>
  </div>
  <div id="Request-Examples">
    <!-- TODO: Request-Beispiel für GET /Consent (FdV, JSON) ergänzen -->
  </div>
  <div id="Response-Examples">
    <!-- TODO: Response-Beispiel für GET /Consent Bundle (FdV, JSON) ergänzen -->
  </div>
</div>

