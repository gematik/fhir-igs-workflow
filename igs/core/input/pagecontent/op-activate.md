

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$activate` gesendet.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu `$activate`](./op-activate-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [Client-Anforderungen zu `$activate`](./op-activate-req-pvs.html): Anforderungen an den Client des TI-Flow-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
  data-api-type="FHIROperation"
  data-api-fhir-resource-type="Task"
  data-api-fhir-invoke-level="instance"
  data-api-operation-id="activateOperation">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server.json %}
    </pre>
  </div>
  <div id="OperationDefinition">
    <pre>
      {% include OperationDefinition-ActivateOperation.json %}
    </pre>
  </div>
  <div id="Request-Examples">
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Parameters/ExampleOperationActivateParametersInput XML %}
    </div>
  </div>
  <div id="Response-Examples">
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Task/TaskInReadyState XML %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment OperationOutcome/ExampleOperationActivateError XML %}
    </div>
  </div>
</div>


### Hinweise

- Der E-Rezept-Fachdienst prüft die Gültigkeit der qualifizierten Signatur des übergebenen FHIR-Bundles. Bei Gültigkeit wird der Task aktiviert und die Zuordnung des Task zum Patienten auf Basis der KVNR im Task unter dem value von <system value="http://fhir.de/sid/gkv/kvid-10"/> hinterlegt.
- Das signierte FHIR-Bundle wird als Ganzes gespeichert und steht inkl. der Signatur für den Abruf durch einen berechtigten, abgebenden Leistungserbringer zur Verfügung. Der Verweis erfolgt über die ID des Bundles unter `Task.input[coding.code = 1].reference`. Der Abruf erfolgt immer über den Task.
- Für den Versicherten wird eine Kopie des Bundles im JSON-Format inkl. serverseitiger Signatur bereitgestellt, die an der Stelle `Task.input[coding.code = 2].reference` referenziert wird.
- Für den Fall, dass das Clientsystem beim Aufruf der Operation keinen Response erhält, soll der Aufruf wiederholt werden. Wenn im Response des zweiten Aufrufs ein Fehler 403 mit dem OperationOutcome "Task not in status draft but in status ready" zurückkommt, wurde der erste Aufruf bereits erfolgreich durch den E-Rezept-Fachdienst verarbeitet. Wenn eine Response mit dem Status 200 zurückkommt, war der zweite Aufruf erfolgreich.