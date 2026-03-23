
### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$reject` gesendet.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu `$reject`](./op-reject-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [AVS-Anforderungen zu `$reject`](./op-reject-req-avs.html): Anforderungen an ein Apothekenverwaltungssystem zur Nutzung der Schnittstelle.
- [KTR-Anforderungen zu `$reject`](./op-reject-req-ktr.html): Anforderungen an ein Clientsystem des Kostenträgers zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
  data-api-type="FHIROperation"
  data-api-fhir-resource-type="Task"
  data-api-fhir-invoke-level="instance"
  data-api-operation-id="rejectOperation">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server.json %}
    </pre>
  </div>
  <div id="OperationDefinition">
    <pre>
      {% include OperationDefinition-RejectOperation.json %}
    </pre>
  </div>
  <div id="Request-Examples">
    <!-- TODO: Request-Beispiel für $reject ergänzen (kein Body, nur Header mit AccessCode und secret) -->
  </div>
  <div id="Response-Examples">
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment OperationOutcome/ExampleOperationRejectError XML %}
    </div>
  </div>
</div>

### Hinweise

- `reject` und direktes erneutes `accept` sollen nicht als Übergabemechanismus zwischen Apotheken verwendet werden, da dies für Versicherte schwer nachvollziehbare Protokollierung/Notifications erzeugt.
- Im Ergebnis der `$reject`-Operation wird der referenzierte Task auf den aktiven Status ready zurückgesetzt und das `secret` gelöscht. Dementsprechend werden keine Daten an den aufrufenden Client zurückgegeben.
