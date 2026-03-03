# Primärsystem des abgebenden Leistungserbringers Anforderungen: ChargeItem - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Systemüberblick**](menu-technische-umsetzung-systemueberblick.md)
* [**ChargeItem: Abrechnungsinformationen des E-Rezepts für PKV-Versicherte**](menu-technische-umsetzung-chargeitem.md)
* **Primärsystem des abgebenden Leistungserbringers Anforderungen: ChargeItem**

## Primärsystem des abgebenden Leistungserbringers Anforderungen: ChargeItem

### Abrechnungsinformation bereitstellen

Mit diesem Anwendungsfall stellt die abgebende LEI die Abrechnungsinformation zu einem E-Rezept auf dem E-Rezept-Fachdienst ein.
 Er wird [hier](./query-api-chargeitem-req-avs.md#Abrechnungsinformation-bereitstellen-POST-ChargeItem) im Detail beschreiben.

### Abrechnungsinformation abrufen

Mit diesem Anwendungsfall kann eine abgebende LEI die Abrechnungsinformation vom E-Rezept-Fachdienst abrufen, welche durch sie zuvor bereitgestellt und noch nicht gelöscht wurde. Als Voraussetzung muss der Versicherte der abgebenden LEI einen AccessCode übermitteln, um die abgebende LEI zu berechtigen.
 Er wird [hier](./query-api-chargeitem-req-avs.md#abrechnungsinformation-abrufen-get-chargeitemid) im Detail beschreiben.

### PKV-Abgabedatensatz ändern

Mit diesem Anwendungsfall kann die abgebende LEI den PKV-Abgabedatensatz zu einem E-Rezept, welche die abgebende LEI zuvor auf dem E-Rezept-Fachdienst bereitgestellt hat, ändern. Als Voraussetzung muss der Versicherte der abgebenden LEI einen AccessCode übermitteln, um die abgebende LEI zu berechtigen.
 Er wird [hier](./query-api-chargeitem-req-avs.md#PKV-Abgabedatensatz-ändern-PUT-ChargeItemId) im Detail beschreiben.

