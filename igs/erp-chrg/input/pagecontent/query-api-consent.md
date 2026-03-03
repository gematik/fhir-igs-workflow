Diese Seite basiert auf der gleichnamigen Schnittstelle in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}query-api-consent.html) und beschreibt den Einstieg in die Consent-Query-Schnittstelle.

Die Query API für Consent ermöglicht das Erteilen, Einsehen und Widerrufen der Einwilligung zur Speicherung von Abrechnungsinformationen.

### Anforderungen an die Schnittstelle
- [Anforderungen für den E-Rezept-Fachdienst](./query-api-consent-req-fd.html)

### POST /Consent (Einwilligung erteilen)

### Nachricht
Der Versicherte erteilt die Einwilligung durch das Erstellen einer Consent‑Ressource (CHARGCONS). Die KVNR wird in Consent.patient.identifier angegeben.

### GET /Consent (Einwilligung einsehen)

### Nachricht
Der Versicherte liest die gespeicherte Einwilligung aus. Die Antwort ist ein Bundle mit den Consent‑Ressourcen des Versicherten.

**Beispiel-URI:** `https://prescriptionserver.telematik/Consent`

### Auslösung
Die Operation wird im FdV/AdV ausgelöst, um den Einwilligungsstatus anzuzeigen.

### Resource API
<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="Consent"
  data-api-fhir-interaction="read"
  data-api-operation-id="readConsent">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server-erpchrg.json %}
    </pre>
  </div>
</div>

### DELETE /Consent (Einwilligung widerrufen)

### Nachricht
Der Versicherte widerruft die Einwilligung. Der Widerruf löscht die Consent‑Ressource und alle zugehörigen Abrechnungsinformationen.

**Beispiel-URI:** `https://prescriptionserver.telematik/Consent?category=CHARGCONS`

### Auslösung
Die Operation wird im FdV/AdV ausgelöst, wenn der Versicherte die Einwilligung zurückzieht.

### Resource API
<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="Consent"
  data-api-fhir-interaction="delete"
  data-api-operation-id="deleteConsent">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server-erpchrg.json %}
    </pre>
  </div>
</div>

### Sicherheitsanforderungen
Generelle Sicherheitsanforderungen werden [hier](./menu-technische-umsetzung-datenschutz-und-sicherheit.html) festgehalten.
