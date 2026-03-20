
### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$close` gesendet.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu `$close`](./op-close-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [Client-Anforderungen zu `$close`](./op-close-req-avs.html): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
  data-api-type="FHIROperation"
  data-api-fhir-resource-type="Task"
  data-api-fhir-invoke-level="instance"
  data-api-operation-id="closeOperation">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server.json %}
    </pre>
  </div>
  <div id="OperationDefinition">
    <pre>
      {% include OperationDefinition-CloseOperation.json %}
    </pre>
  </div>
  <div id="Request-Examples">
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Parameters/ExampleCloseInputParameters XML %}
    </div>
  </div>
  <div id="Response-Examples">
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Task/TaskInClosedState XML %}
    </div>
  </div>
</div>

### Hinweise

- `$close` beendet den Workflow verbindlich; danach ist keine weitere inhaltliche Änderung der Dispensierdaten möglich.
- Falls ohne MedicationDispense aufgerufen wird, muss bereits eine gültige `$dispense`-Information gespeichert sein.
- Bei Stapelverarbeitung sind Lastverteilungsregeln einzuhalten.
- Die maximale Dateigröße für die Kommunikation am E-Rezept-Fachdienst beträgt derzeit 1MB. Dies meint den kompletten Request, daher muss der innere VAU-Request etwas kleiner als 1MB sein. Für Verordnungen, die mehrere Abgaben erfordern ist darauf zu achten, dass für mehrere Abgaben einer Charge nur eine MedicationDispense erstellt wird.

