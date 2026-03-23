Diese Seite beschreibt den Einstieg in die Consent-Query-Schnittstelle.

### Nachricht

Die Nachricht zur Interaktion mit Einwilligungen als FHIR-Ressource _Consent_ wird über die folgenden HTTP-Methoden ermöglicht:

|HTTP-Methode|Ergebnis der Anfrage|
|---|---|
|GET|Einwilligungen einsehen|
|POST|Einwilligung erteilen|
|DELETE|Einwilligung widerrufen|

### Anforderungen an die Schnittstelle

- [Server-Anforderungen zur Consent-Query](./query-api-consent-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zur Consent-Query](./query-api-consent-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.

### Resource API

#### Einstellen von Einwilligungen

Als Versicherter möchte ich eine Einwilligung zur elektronischen Speicherung meiner Abrechnungsinformationen erstellen und dem Fachdienst übermitteln. Die Einwilligung wird über die FHIR-Ressource "Consent" abgebildet.

Der Aufruf erfolgt als http-`POST`-Operation auf die Ressource /Consent. Im Aufruf muss das während der Authentisierung erhaltene ACCESS_TOKEN im http-Request-Header Authorization übergeben werden.

<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="Consent"
  data-api-fhir-interaction="create">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server-erpeu.json %}
    </pre>
  </div>
  <div id="Response-Examples">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment Consent/ExampleEUConsent JSON %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Consent/ExampleEUConsent XML %}
    </div>
  </div>
</div>

#### Abfragen von Einwilligungen

Als Versicherter möchte ich meine erteilte Einwilligung zur elektronischen Speicherung meiner Abrechnungsinformationen einsehen.

Der Aufruf erfolgt als http-GET-Operation auf die Ressource /Consent. Im Aufruf muss das während der Authentisierung erhaltene ACCESS_TOKEN im http-Request-Header Authorization übergeben werden, der Fachdienst filtert die Consent-Einträge nach der im ACCESS_TOKEN enthaltenen KVNR des Versicherten.

<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="Consent"
  data-api-fhir-interaction="search-type">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server-erpeu.json %}
    </pre>
  </div>
  <div id="Response-Examples">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment Bundle/ExampleGetConsent JSON %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Bundle/ExampleGetConsent XML %}
    </div>
  </div>
</div>

### Instance API

#### Löschen einer einzelnen Einwilligung

Als Versicherter möchte ich meine erteilte Einwilligung zur elektronischen Speicherung meiner Abrechnungsinformationen widerrufen. Mit dem Widerruf der Einwilligung werden bereits gespeicherte Abrechnungsinformationen gelöscht.

Der Aufruf erfolgt als http-`DELETE`-Operation auf die Ressource /Consent. Im Aufruf muss das während der Authentisierung erhaltene ACCESS_TOKEN im http-Request-Header Authorization übergeben werden, der Fachdienst filtert die Consent-Einträge nach der im ACCESS_TOKEN enthaltenen KVNR des Versicherten.

<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="Consent"
  data-api-fhir-interaction="delete">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server-erpeu.json %}
    </pre>
  </div>
</div>