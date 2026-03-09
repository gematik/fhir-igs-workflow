Die Query API für ChargeItem ermöglicht den Zugriff auf Abrechnungsinformationen (Verordnungsdatensatz, PKV‑Abgabedatensatz, Quittung). Die Abrechnungsinformation wird als ChargeItem mit Referenzen auf die Datensätze abgebildet.

### Profilierung
Die Profilierung der Ressource ChargeItem ist hier dokumentiert: https://simplifier.net/erezept-patientenrechnung/gem_erpchrg_pr_chargeitem

### Nachricht
Die Nachricht zur Interaktion mit Einwilligungen als FHIR-Ressource ChargeItem wird über die folgenden HTTP-Methoden ermöglicht:

|HTTP-Methode|Ergebnis der Anfrage|
|---|---|
|GET|Abrechnungsinformationen als Liste abrufen|
|GET/<id>|Bestimmte Abrechnungsinformationen abrufen|
|POST|Abrechnungsinformation bereitstellen|
|PATCH/<id>|Abrechnungsinformation markieren|
|PUT/<id>|Abrechnungsinformation überschreiben|
|DELETE/<id>|Abrechnungsinformation löschen|

### Anforderungen an Schnittstelle
- [Anforderungen für den E-Rezept-Fachdienst](./query-api-chargeitem-req-fd.html)
- [Anforderungen für den E-Rezept-FdV](./query-api-chargeitem-req-fdv.html)
- [Anforderungen für den abgebenden Leistungserbringer](./query-api-chargeitem-req-avs.html)

#### Resource API
Anfragen an die <i>ChargeItem</i>-Ressource können über die RESTful API durchgeführt werden.

### API Beschreibung

- [API-ERP: PKV-Abrechnungsinformationen](https://github.com/gematik/api-erp/blob/master/docs/erp_chargeItem.adoc)
