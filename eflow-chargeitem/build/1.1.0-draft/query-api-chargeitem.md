# Query API: ChargeItem - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* **Query API: ChargeItem**

## Query API: ChargeItem

Die Query API für ChargeItem ermöglicht den Zugriff auf Abrechnungsinformationen (Verordnungsdatensatz, PKV‑Abgabedatensatz, Quittung). Die Abrechnungsinformation wird als ChargeItem mit Referenzen auf die Datensätze abgebildet.

### Profilierung

Die Profilierung der Ressource ChargeItem ist hier dokumentiert: https://simplifier.net/erezept-patientenrechnung/gem_erpchrg_pr_chargeitem

### Anforderungen an Schnittstelle

* [Anforderungen für den E-Rezept-Fachdienst](./query-api-chargeitem-req-fd.md)
* [Anforderungen für den E-Rezept-FdV](./query-api-chargeitem-req-fdv.md)
* [Anforderungen für den abgebenden Leistungserbringer](./query-api-chargeitem-req-avs.md)

### API Beschreibung

* [API-ERP: Charge Items](https://github.com/gematik/api-erp/blob/master/docs/erp_chargeItem.adoc)

### GET /ChargeItem (Liste)

#### Nachricht

Versicherte rufen ihre Abrechnungsinformationen als Liste ab. Die Antwort ist ein Bundle vom Typ searchset ohne die referenzierten Datensätze.

**Beispiel-URI:** `https://erp.zentral.erp.splitdns.ti-dienste.de/ChargeItem/`

Hinweis: Liegt keine Einwilligung vor, wird eine leere Liste zurückgegeben, da nach Widerruf alle Abrechnungsinformationen gelöscht wurden.

#### Auslösung

Die Operation wird im FdV/AdV ausgelöst, z. B. beim Abruf der Liste oder nach Gerätewechsel.

#### Resource API

Anfragen an die *ChargeItem*-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden.

### GET /ChargeItem/<id> (Details)

#### Nachricht

Der Detailabruf liefert ein Bundle mit ChargeItem, Verordnungsdatensatz, PKV‑Abgabedatensatz und Quittung. Für Versicherte werden die Datensätze durch den E‑Rezept‑Fachdienst signiert.

**Beispiel-URI (Versicherter):** `https://prescriptionserver.telematik/ChargeItem/200.000.001.944.091.20`

**Beispiel-URI (abgebende LEI):** `https://prescriptionserver.telematik/ChargeItem/200.000.001.944.091.20?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea`

#### Auslösung

Der Detailabruf erfolgt aus dem FdV/AdV oder durch die abgebende LEI (mit AccessCode), z. B. zur Korrektur.

#### Resource API

Anfragen an die *ChargeItem*-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden.

### POST /ChargeItem (Bereitstellen)

#### Nachricht

Die abgebende LEI stellt die Abrechnungsinformation bereit, indem sie ein ChargeItem an den E‑Rezept‑Fachdienst übermittelt. Das ChargeItem enthält Referenzen auf Verordnungsdatensatz und Quittung sowie den PKV‑Abgabedatensatz (contained Binary). Für die Berechtigungsprüfung werden Task‑ID und Secret über URL‑Parameter übermittelt.

**Beispiel-URI:** `https://prescriptionserver.telematik/ChargeItem?task=200.000.001.944.091.20&secret=c36ca26502892b371d252c99b496e31505ff449aca9bc69e231c58148f6233cf`

Hinweis: In VAU‑Requests sind u. a. die Header `X-erp-user: l` und `X-erp-resource: ChargeItem` zu setzen.

#### Auslösung

Die Operation wird nach der Belieferung ausgelöst, sobald eine Einwilligung des Versicherten vorliegt und die Abrechnungsinformation digital bereitgestellt werden soll.

#### Resource API

Die *ChargeItem*-Ressource können über die RESTful API mittels HTTP GET-Anfragen angelegt werden.

### PATCH /ChargeItem/<id> (Markierungen)

#### Nachricht

Versicherte können Markierungen am ChargeItem (z. B. für Einreichung) ändern.

#### Auslösung

Der Anwendungsfall wird im FdV/AdV ausgelöst, wenn Markierungen angepasst werden.

#### Resource API

Die *ChargeItem*-Ressource können über die RESTful API mittels HTTP PATCH-Anfragen angepasst werden.

### PUT /ChargeItem/<id> (Ändern PKV‑Abgabedatensatz)

#### Nachricht

Die abgebende LEI überschreibt den PKV‑Abgabedatensatz eines ChargeItems. Dafür sind Prescription‑ID und AccessCode erforderlich.

**Beispiel-URI:** `https://prescriptionserver.telematik/ChargeItem/200.000.001.944.091.20?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea`

#### Auslösung

Der Anwendungsfall wird ausgelöst, wenn Korrekturen an Abgabedaten notwendig sind.

#### Resource API

Die *ChargeItem*-Ressource können über die RESTful API mittels HTTP PUT-Anfragen korrigiert werden.

### DELETE /ChargeItem/<id>

#### Nachricht

Versicherte können Abrechnungsinformationen löschen. Dabei werden auch die referenzierten Datensätze gelöscht.

### Auslösung

Der Anwendungsfall wird durch den Versicherten im FdV/AdV ausgelöst.

#### Resource API

Die *ChargeItem*-Ressource können über die RESTful API mittels HTTP DELETE-Anfragen gelöscht werden.

