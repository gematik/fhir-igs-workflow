### Nachricht
Die Operation $accept wird als HTTP POST auf `/Task/<id>/$accept` ausgeführt.

### Anforderungen an Schnittstelle
- [Anforderungen für den E-Rezept-Fachdienst](./op-accept-req-fd.html)

### Auslösung
Die abgebende LEI ruft $accept auf, um ein E‑Rezept anzunehmen und – für Flowtype 200/209 – die Einwilligung zum Speichern der Abrechnungsinformationen zu berücksichtigen.

### FHIR Operation API
<div class="gematik-api"
  data-api-type="FHIROperation"
  data-api-fhir-invoke-level="type"
  data-api-operation-id="taskAccept">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server-erpchrg.json %}
    </pre>
  </div>
</div>

### Sicherheitsanforderungen
Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.html) festgehalten.
