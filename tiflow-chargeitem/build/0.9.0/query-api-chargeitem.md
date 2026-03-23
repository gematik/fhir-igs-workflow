# Query API: ChargeItem - TIFlow - Abrechnungsinformationen v0.9.0

TIFlow - Abrechnungsinformationen

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* **Query API: ChargeItem**

## Query API: ChargeItem

Die Query API für ChargeItem ermöglicht den Zugriff auf Abrechnungsinformationen (Verordnungsdatensatz, PKV‑Abgabedatensatz, Quittung). Die Abrechnungsinformation wird als ChargeItem mit Referenzen auf die Datensätze abgebildet.

### Profilierung

Die Profilierung der Ressource ChargeItem ist hier dokumentiert: https://simplifier.net/erezept-patientenrechnung/gem_erpchrg_pr_chargeitem

### Nachricht

Die Nachricht zur Interaktion mit Einwilligungen als FHIR-Ressource ChargeItem wird über die folgenden HTTP-Methoden ermöglicht:

| | | |
| :--- | :--- | :--- |
| Versicherter | GET | Abrechnungsinformationen als Liste abrufen |
| Versicherter | GET / | Spezifische Abrechnungsinformationen abrufen |
| Apotheke | GET /?ac= | Spezifische Abrechnungsinformationen abrufen |
| Apotheke | POST | Abrechnungsinformation bereitstellen |
| Versicherter | PATCH / | Abrechnungsinformation markieren |
| Apotheke | PUT / | Abrechnungsinformation aktualisieren |
| Versicherter | DELETE / | Abrechnungsinformation löschen |

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu ChargeItem](./query-api-chargeitem-req-fd.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zu ChargeItem](./query-api-chargeitem-req-fdv.md): Anforderungen an ein E-Rezept-FdV zur Nutzung der Schnittstelle.
* [AVS-Anforderungen zu ChargeItem](./query-api-chargeitem-req-avs.md): Anforderungen an ein AVS zur Nutzung der Schnittstelle.

#### Resource API

Anfragen an die *ChargeItem*-Ressource können über die RESTful API durchgeführt werden.

### API Beschreibung

* [API-ERP: PKV-Abrechnungsinformationen](https://github.com/gematik/api-erp/blob/master/docs/erp_chargeItem.adoc)

