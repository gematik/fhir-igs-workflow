Diese Seite beschreibt den Einstieg in die MedicationDispense-Query-Schnittstelle.

### Nachricht

Die Nachricht zum Abruf von Dipensierdaten wird als HTTP GET-Anfrage an den  gesendet, um eine Liste der hinterlegten _MedicationDispense_-Instanzen abzurufen.

### Anforderungen an Schnittstelle

- [FD-Anforderungen zur MedicationDispense-Query](./query-api-medicationdispense-fd-requirements.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [Client-Anforderungen zur MedicationDispense-Query](./query-api-medicationdispense-client-requirements.html): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### Resource API

Anfragen an die <i>MedicationDispense</i>-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden. Dabei können spezifische Suchparameter genutzt werden, um die Anfragen zu verfeinern. Zum Beispiel:

- Suche nach Medikamentenabgaben, die an einem bestimmten Tag erfolgten: ``?whenHandedOver=2025-02-14``

#### API Beschreibung


- [API-ERP: E-Rezept-Abgabe vollziehen](https://github.com/gematik/api-erp/blob/master/docs/erp_abrufen.adoc#e-rezept-abgabe-vollziehen)


### Instance API


#### GET /MedicationDispense

<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="MedicationDispense"
  data-api-fhir-interaction="search-type"
  data-api-operation-id="searchMedicationDispense">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server.json %}
    </pre>
  </div>
</div>

### Hinweis

- Im Anwendungsfall "Abgabeinformationen abrufen" wird die Suche per `identifier` auf die PrescriptionID genutzt.
- Die Rückgabe erfolgt als Bundle und kann ein oder mehrere `MedicationDispense`-Objekte enthalten.
