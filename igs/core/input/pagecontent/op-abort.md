

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$abort` gesendet.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu `$abort`](./op-abort-fd-requirements.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [PVS-Anforderungen zu `$abort`](./op-abort-req-pvs.html): Anforderungen an ein Praxisverwaltungssystem zur Nutzung der Schnittstelle.
- [AVS-Anforderungen zu `$abort`](./op-abort-req-avs.html): Anforderungen an ein Praxisverwaltungssystem zur Nutzung der Schnittstelle.
- [FdV-Anforderungen zu `$abort`](./op-abort-req-avs.html): Anforderungen an ein E-Rezept-FdV zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
  data-api-type="FHIROperation"
  data-api-fhir-resource-type="Task"
  data-api-fhir-invoke-level="instance"
  data-api-operation-id="abortOperation">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server.json %}
    </pre>
  </div>
  <div id="OperationDefinition">
    <pre>
      {% include OperationDefinition-AbortOperation.json %}
    </pre>
  </div>
  <div id="Request-Examples">
    <!-- TODO: Request-Beispiele für $abort ergänzen (PVS/AVS: XML, FdV: JSON) -->
  </div>
  <div id="Response-Examples">
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment OperationOutcome/ExampleOperationAbortErrorPVS XML %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment OperationOutcome/ExampleOperationAbortErrorAVS XML %}
    </div>
    <!-- TODO: FdV-Fehlerbeispiel für $abort als JSON ergänzen -->
  </div>
</div>


### Hinweise

- Nach erfolgreichem `$abort` sind lokale Einlöseinformationen (`secret`, Token-Bezug) im Client zu bereinigen.
- Im Ergebnis der `$abort`-Operation wird der referenzierte Task gelöscht. Dementsprechend werden keine Daten an den aufrufenden Client zurückgegeben.
