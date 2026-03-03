### Nachricht
Die Operation $activate wird als HTTP POST auf `/Task/<id>/$activate` ausgeführt.

### Anforderungen an Schnittstelle
- [Anforderungen für den E-Rezept-Fachdienst](./op-activate-req-fd.html)

### Auslösung
Die abgebende LEI aktiviert den Task. Für Flowtype 200/209 muss der Versicherungstyp PKV im Verordnungsdatensatz geprüft werden.

### FHIR Operation API
<div class="gematik-api"
  data-api-type="FHIROperation"
  data-api-fhir-invoke-level="type"
  data-api-operation-id="taskActivate">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server-erpchrg.json %}
    </pre>
  </div>
</div>

### Sicherheitsanforderungen
Generelle Sicherheitsanforderungen werden [hier](./menu-technische-umsetzung-datenschutz-und-sicherheit.html) festgehalten.
