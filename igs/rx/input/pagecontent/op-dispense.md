### Dispensierinformationen bereitstellen ($dispense)

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$dispense` gesendet.

### Anforderungen an Schnittstelle

- [FD-Anforderungen zu `$dispense`](./op-dispense-fd-requirements.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [Client-Anforderungen zu `$dispense`](./op-dispense-client-requirements.html): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

<div class="gematik-api"
  data-api-type="FHIROperation"
  data-api-fhir-invoke-level="instance"
  data-api-operation-id="dispenseTask">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server.json %}
    </pre>
  </div>
  <div id="OperationDefinition">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment OperationDefinition/DispenseOperation JSON %}
    </div>
  </div>
  <div id="Request-Examples">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment Parameters/ExampleDispenseInputParameters JSON %}
    </div>
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment Parameters/ExampleDispenseInputParametersMultipleMedicationDispenses JSON %}
    </div>
  </div>
  <div id="Response-Examples">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment Task/f5c21409-b84b-4125-8649-5630a00906b1 JSON %}
    </div>
  </div>
</div>

### Hinweis

- Wiederholte Aufrufe von `$dispense` ueberschreiben die bisher gespeicherten Dispensierinformationen.
- Deshalb muss immer die vollstaendige, aktuelle MedicationDispense uebermittelt werden.

### Geschaeftslogik

<figure>
  <div class="gem-ig-img-container" style="--box-width: 900px; margin-bottom: 30px;">
{% include rx-op-dispense-flow.svg %}
  </div>
  <figcaption><strong>Abbildung: </strong>Ablauf Operation `$dispense`</figcaption>
</figure>

### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.html) festgehalten.
