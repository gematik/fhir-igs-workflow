# Primärsystem des abgebenden Leistungserbringers - Anforderungen: ChargeItem-Query - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: ChargeItem**](query-api-chargeitem.md)
* **Primärsystem des abgebenden Leistungserbringers - Anforderungen: ChargeItem-Query**

## Primärsystem des abgebenden Leistungserbringers - Anforderungen: ChargeItem-Query

Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, die Abrechnungsinformation zu einem E-Rezept zum Ändern auf dem E-Rezept-Fachdienst auszuwählen.
TODO: A_22192 

text

Das PS der abgebenden LEI MUSS im Anwendungsfall "PKV-Abgabedatensatz ändern" eine FHIR-Ressource des PKV-Abgabedatensatzes mit den Informationen zur Abrechnung des abgegebenen Medikaments erstellen.
TODO: Fix Links Für die Spezifikation der Ressource PKV-Abgabedatensatz siehe [gemSpec_DM_eRp].

Das Signieren des PKV-Abgabedatensatzes erfolgt gemäß [gemILF_PS_eRp] Kap. “Abgabedatensatz signieren”.

Das PS der abgebenden LEI MUSS im Anwendungsfall "PKV-Abgabedatensatz ändern" eine FHIR-Ressource ChargeItem erstellen und den PKV-Abgabedatensatzes als contained Ressource einfügen.
TODO: Fix Link Für die Spezifikation der Ressource ChargeItem siehe [gemSpec_DM_eRp].

Das PS abgebende LEI MUSS im Anwendungsfall "PKV-Abgabedatensatz ändern" die HTTP-Operation PUT /ChargeItem/<id>/ des E-Rezept-Fachdienstes mit
* ACCESS_TOKEN im Authorization-Header
* Prescription-ID in URL <id>
* AccessCode in URL-Parameter ?ac=
* ChargeItem im http-Body des Aufrufs als data
ausführen.
Wenn der Versicherte zwischenzeitlich die Einwilligung zum Speichern von Abrechnungsinformationen im E-Rezept-Fachdienst widerrufen hat, dann enthält der Response den Fehlercode 403.

