# Query API: MedicationDispense

Diese Seite beschreibt den Einstieg in die MedicationDispense-Query-Schnittstelle des RX-Moduls.

### Nachricht

Die MedicationDispense-Query wird ueber HTTP `GET` auf `/MedicationDispense` aufgerufen.

### Anforderungen an Schnittstelle

- [FD-Anforderungen zur MedicationDispense-Query](./query-api-medicationdispense-fd-requirements.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [Client-Anforderungen zur MedicationDispense-Query](./query-api-medicationdispense-client-requirements.html): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

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
- Die Rueckgabe erfolgt als Bundle und kann ein oder mehrere `MedicationDispense`-Objekte enthalten.
