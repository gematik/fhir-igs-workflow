# Primärsystem des abgebenden Leistungserbringers - Anforderungen: ChargeItem-Query - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: ChargeItem**](query-api-chargeitem.md)
* **Primärsystem des abgebenden Leistungserbringers - Anforderungen: ChargeItem-Query**

## Primärsystem des abgebenden Leistungserbringers - Anforderungen: ChargeItem-Query

Das PS der abgebenden LEI DARF NICHT Abrechnungsinformation auf dem E-Rezept-Fachdienst bereitstellen, wenn ihm nicht zuvor die Information über die Einwilligung des Versicherten vom E-Rezept-Fachdienst übertragen wurde.

Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, ein E-Rezept auszuwählen, zu dem die Abrechnungsinformation auf dem E-Rezept-Fachdienst bereitgestellt werden soll.
Die Information, dass der Versicherte die Einwilligung zum Speichern der Abrechnungsinformationen auf dem E-Rezept-Fachdienst erteilt hat, wird im Anwendungsfall “E-Rezept abrufen” übermittelt.

TODO: A_22187 

text

Das PS der abgebenden LEI MUSS im Anwendungsfall "Abrechnungsinformation bereitstellen" eine FHIR-Ressource des PKV-Abgabedatensatzes mit den Informationen zur Abrechnung des abgegebenen Medikaments erstellen.
TODO: Fix Links Für die Spezifikation der Ressource PKV-Abgabedatensatz siehe [gemSpec_DM_eRp].

Das Signieren des PKV-Abgabedatensatzes erfolgt gemäß [gemILF_PS_eRp] Kap. “Abgabedatensatz signieren”. Für die Wahl des Signaturverfahrens (QES oder nonQES) gelten die rechtlichen Vorgaben.

Das PS der abgebenden LEI MUSS im Anwendungsfall "Abrechnungsinformation bereitstellen" eine FHIR-Ressource ChargeItem erstellen und den PKV-Abgabedatensatzes als contained Ressource einfügen.
TODO: Fix Link Für die Spezifikation der Ressource ChargeItem siehe [gemSpec_DM_eRp].

Das PS der abgebenden LEI MUSS im Anwendungsfall "Abrechnungsinformation bereitstellen" die HTTP-Operation POST /ChargeItem/ des E-Rezept-Fachdienstes mit
* ACCESS_TOKEN im Authorization-Header
* Task-ID als URL-Parameter ?task=
* Geheimnis in URL-Parameter ?secret=
* ChargeItem im http-Body des Aufrufs als data
ausführen.
Wenn das E-Rezept bereits vom E-Rezept-Fachdienst gelöscht wurde, dann enthält der Response den Fehlercode 405. Das Bereitstellen der Abrechnungsinformation zu einem E-Rezept ist nur möglich bevor das E-Rezept gelöscht wurde.

Wenn der Versicherte zwischenzeitlich die Einwilligung zum Speichern von Abrechnungsinformationen im E-Rezept-Fachdienst widerrufen hat, dann enthält der Response den Fehlercode 403.

