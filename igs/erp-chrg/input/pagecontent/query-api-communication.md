Diese Seite basiert auf der gleichnamigen Schnittstelle in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}query-api-communication.html) und beschreibt den Einstieg in die Communication-Query-Schnittstelle.

Die Query API für Communication beschreibt das Einstellen von Nachrichten im Rahmen der PKV‑Abrechnung (z. B. Änderungsanfragen der Abrechnungsinformation).

## POST /Communication

### Nachricht
Nachrichten werden als Communication‑Ressourcen an den E‑Rezept‑Fachdienst gesendet. Die verwendeten Profile richten sich nach der Kommunikationsbeziehung (Versicherter ↔ Apotheke).

**Beispiel-URI:** `https://prescriptionserver.telematik/Communication`

### Auslösung
Die Operation wird ausgelöst, wenn ein Versicherter eine Änderungsanfrage stellt oder die Apotheke antwortet.

### Resource API
<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="Communication"
  data-api-fhir-interaction="create"
  data-api-operation-id="createCommunication">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server-erpchrg.json %}
    </pre>
  </div>
</div>

### Verarbeitung
- [Spezifische Anforderungen für den E-Rezept-Fachdienst](./query-api-communication-req-fd.html)
- [Spezifische Anforderungen für das E-Rezept-FdV](./query-api-communication-req-fdv.html)

## Sicherheitsanforderungen
Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.html) festgehalten.
