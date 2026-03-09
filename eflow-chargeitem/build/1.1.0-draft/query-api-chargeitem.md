# Query API: ChargeItem - Abrechnungsinformationen zu E-Rezepten für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen zu E-Rezepten für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* **Query API: ChargeItem**

## Query API: ChargeItem

Die Query API für ChargeItem ermöglicht den Zugriff auf Abrechnungsinformationen (Verordnungsdatensatz, PKV‑Abgabedatensatz, Quittung). Die Abrechnungsinformation wird als ChargeItem mit Referenzen auf die Datensätze abgebildet.

### Profilierung

Die Profilierung der Ressource ChargeItem ist hier dokumentiert: https://simplifier.net/erezept-patientenrechnung/gem_erpchrg_pr_chargeitem

### Nachricht

Die Nachricht zur Interaktion mit Einwilligungen als FHIR-Ressource ChargeItem wird über die folgenden HTTP-Methoden ermöglicht:

| | |
| :--- | :--- |
| GET | Abrechnungsinformationen als Liste abrufen |
| GET/ | Bestimmte Abrechnungsinformationen abrufen |
| POST | Abrechnungsinformation bereitstellen |
| PATCH/ | Abrechnungsinformation markieren |
| PUT/ | Abrechnungsinformation überschreiben |
| DELETE/ | Abrechnungsinformation löschen |

### Anforderungen an Schnittstelle

* [Anforderungen für den E-Rezept-Fachdienst](./query-api-chargeitem-req-fd.md)
* [Anforderungen für den E-Rezept-FdV](./query-api-chargeitem-req-fdv.md)
* [Anforderungen für den abgebenden Leistungserbringer](./query-api-chargeitem-req-avs.md)

#### Resource API

Anfragen an die *ChargeItem*-Ressource können über die RESTful API durchgeführt werden.

### API Beschreibung

* [API-ERP: PKV-Abrechnungsinformationen](https://github.com/gematik/api-erp/blob/master/docs/erp_chargeItem.adoc)

