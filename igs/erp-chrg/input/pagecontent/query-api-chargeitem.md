Die Query API für ChargeItem ermöglicht den Zugriff auf Abrechnungsinformationen (Verordnungsdatensatz, PKV‑Abgabedatensatz, Quittung). Die Abrechnungsinformation wird als ChargeItem mit Referenzen auf die Datensätze abgebildet.

## Profilierung
Die Profilierung der Ressource ChargeItem ist hier dokumentiert: https://simplifier.net/erezept-patientenrechnung/gem_erpchrg_pr_chargeitem

## Allgemeine Anforderungen an Schnittstelle
- [Spezifische Anforderungen für den E-Rezept-Fachdienst](./query-api-chargeitem-req-fd.html)

## GET /ChargeItem (Liste)

### Nachricht
Versicherte rufen ihre Abrechnungsinformationen als Liste ab. Die Antwort ist ein Bundle vom Typ searchset ohne die referenzierten Datensätze.

**Beispiel-URI:** `https://erp.zentral.erp.splitdns.ti-dienste.de/ChargeItem/`

Hinweis: Liegt keine Einwilligung vor, wird eine leere Liste zurückgegeben, da nach Widerruf alle Abrechnungsinformationen gelöscht wurden.

### Auslösung
Die Operation wird im FdV/AdV ausgelöst, z. B. beim Abruf der Liste oder nach Gerätewechsel.

### Resource API
Anfragen an die Communication-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden.
<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="ChargeItem"
  data-api-fhir-interaction="search-type"
  data-api-operation-id="searchChargeItem">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server-erpchrg.json %}
    </pre>
  </div>
</div>

### Anforderungen an Schnittstelle
- [Spezifische Anforderungen für den E-Rezept-Fachdienst](./query-api-chargeitem-req-fd-get.html)
- [Spezifische Anforderungen für den E-Rezept-FdV](./query-api-chargeitem-req-fdv-get.html)

## GET /ChargeItem/&#60;id&#62; (Details)

### Nachricht
Der Detailabruf liefert ein Bundle mit ChargeItem, Verordnungsdatensatz, PKV‑Abgabedatensatz und Quittung. Für Versicherte werden die Datensätze durch den E‑Rezept‑Fachdienst signiert.

**Beispiel-URI (Versicherter):** `https://prescriptionserver.telematik/ChargeItem/200.000.001.944.091.20`

**Beispiel-URI (abgebende LEI):** `https://prescriptionserver.telematik/ChargeItem/200.000.001.944.091.20?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea`

### Auslösung
Der Detailabruf erfolgt aus dem FdV/AdV oder durch die abgebende LEI (mit AccessCode), z. B. zur Korrektur.

### Resource API

<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="ChargeItem"
  data-api-fhir-interaction="read"
  data-api-operation-id="readChargeItem">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server-erpchrg.json %}
    </pre>
  </div>
</div>

### Anforderungen an Schnittstelle
- [Spezifische Anforderungen für den E-Rezept-Fachdienst](./query-api-chargeitem-req-fd-get-id.html)
- [Spezifische Anforderungen für den E-Rezept-FdV](./query-api-chargeitem-req-fdv-get-id.html)
- [Spezifische Anforderungen für den abgebenden Leistungserbringer](./query-api-chargeitem-req-ps-get-id.html)

## POST /ChargeItem (Bereitstellen)

### Nachricht
Die abgebende LEI stellt die Abrechnungsinformation bereit, indem sie ein ChargeItem an den E‑Rezept‑Fachdienst übermittelt. Das ChargeItem enthält Referenzen auf Verordnungsdatensatz und Quittung sowie den PKV‑Abgabedatensatz (contained Binary). Für die Berechtigungsprüfung werden Task‑ID und Secret über URL‑Parameter übermittelt.

**Beispiel-URI:** `https://prescriptionserver.telematik/ChargeItem?task=200.000.001.944.091.20&secret=c36ca26502892b371d252c99b496e31505ff449aca9bc69e231c58148f6233cf`

Hinweis: In VAU‑Requests sind u. a. die Header `X-erp-user: l` und `X-erp-resource: ChargeItem` zu setzen.

### Auslösung
Die Operation wird nach der Belieferung ausgelöst, sobald eine Einwilligung des Versicherten vorliegt und die Abrechnungsinformation digital bereitgestellt werden soll.

### Resource API
TODO

### Anforderungen an Schnittstelle
- [Spezifische Anforderungen für den E-Rezept-Fachdienst](./query-api-chargeitem-req-fd-post.html)
- [Spezifische Anforderungen für den abgebenden Leistungserbringer](./query-api-chargeitem-req-ps-post.html)

## PATCH /ChargeItem/&#60;id&#62; (Markierungen)

### Nachricht
Versicherte können Markierungen am ChargeItem (z. B. für Einreichung) ändern.

### Auslösung
Der Anwendungsfall wird im FdV/AdV ausgelöst, wenn Markierungen angepasst werden.

### Resource API
TODO

### Anforderungen an Schnittstelle
- [Spezifische Anforderungen für den E-Rezept-Fachdienst](./query-api-chargeitem-req-fd-patch.html)
- [Spezifische Anforderungen für das E-Rezept-FdV](./query-api-chargeitem-req-fdv-patch.html)

## PUT /ChargeItem/&#60;id&#62; (Ändern PKV‑Abgabedatensatz)

### Nachricht
Die abgebende LEI überschreibt den PKV‑Abgabedatensatz eines ChargeItems. Dafür sind Prescription‑ID und AccessCode erforderlich.

**Beispiel-URI:** `https://prescriptionserver.telematik/ChargeItem/200.000.001.944.091.20?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea`

### Auslösung
Der Anwendungsfall wird ausgelöst, wenn Korrekturen an Abgabedaten notwendig sind.

### Resource API
TODO

### Anforderungen an Schnittstelle
- [Spezifische Anforderungen für den E-Rezept-Fachdienst](./query-api-chargeitem-req-fd-put.html)
- [Spezifische Anforderungen für den abgebenden Leistungserbringer](./query-api-chargeitem-req-ps-put.html)

## DELETE /ChargeItem/&#60;id&#62;

### Nachricht
Versicherte können Abrechnungsinformationen löschen. Dabei werden auch die referenzierten Datensätze gelöscht.

### Auslösung
Der Anwendungsfall wird durch den Versicherten im FdV/AdV ausgelöst.

### Resource API
TODO

### Anforderungen an Schnittstelle
- [Spezifische Anforderungen für den E-Rezept-Fachdienst](./query-api-chargeitem-req-fd-delete.html)
- [Spezifische Anforderungen für das E-Rezept-FdV](./query-api-chargeitem-req-fdv-delete.html)

## Sicherheitsanforderungen
Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.html) festgehalten.
