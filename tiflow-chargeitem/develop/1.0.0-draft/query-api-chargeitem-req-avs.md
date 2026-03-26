# AVS-Anforderungen: ChargeItem-Query - TIFlow - Abrechnungsinformationen v1.0.0-draft

TIFlow - Abrechnungsinformationen

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: ChargeItem**](query-api-chargeitem.md)
* **AVS-Anforderungen: ChargeItem-Query**

## AVS-Anforderungen: ChargeItem-Query

### Abrechnungsinformation bereitstellen (POST /ChargeItem)

Mit diesem Anwendungsfall stellt die abgebende LEI die Abrechnungsinformation zu einem E-Rezept auf dem TI-Flow-Fachdienst ein.

Das PS der abgebenden LEI DARF NICHT Abrechnungsinformation auf dem TI-Flow-Fachdienst bereitstellen, wenn ihm nicht zuvor die Information über die Einwilligung des Versicherten vom TI-Flow-Fachdienst übertragen wurde.

Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, ein E-Rezept auszuwählen, zu dem die Abrechnungsinformation auf dem TI-Flow-Fachdienst bereitgestellt werden soll.
Die Information, dass der Versicherte die Einwilligung zum Speichern der Abrechnungsinformationen auf dem TI-Flow-Fachdienst erteilt hat, wird im Anwendungsfall “E-Rezept abrufen” übermittelt.

Das PS der abgebenden LEI MUSS im Anwendungsfall "Abrechnungsinformation bereitstellen" eine FHIR-Ressource des PKV-Abgabedatensatzes mit den Informationen zur Abrechnung des abgegebenen Medikaments erstellen.
Für die Spezifikation der Ressource PKV-Abgabedatensatz siehe [gemSpec_DM_eRp].

Das Signieren des PKV-Abgabedatensatzes erfolgt gemäß [gemILF_PS_eRp] Kap. “Abgabedatensatz signieren”. Für die Wahl des Signaturverfahrens (QES oder nonQES) gelten die rechtlichen Vorgaben.

Das PS der abgebenden LEI MUSS im Anwendungsfall "Abrechnungsinformation bereitstellen" eine FHIR-Ressource ChargeItem erstellen und den PKV-Abgabedatensatzes als contained Ressource einfügen.
Für die Spezifikation der Ressource ChargeItem siehe [gemSpec_DM_eRp].

Das PS der abgebenden LEI MUSS im Anwendungsfall "Abrechnungsinformation bereitstellen" die HTTP-Operation POST /ChargeItem/ des TI-Flow-Fachdienstes mit
* ACCESS_TOKEN im Authorization-Header
* Task-ID als URL-Parameter ?task=
* Geheimnis in URL-Parameter ?secret=
* ChargeItem im http-Body des Aufrufs als data
ausführen.
Wenn das E-Rezept bereits vom TI-Flow-Fachdienst gelöscht wurde, dann enthält der Response den Fehlercode 405. Das Bereitstellen der Abrechnungsinformation zu einem E-Rezept ist nur möglich bevor das E-Rezept gelöscht wurde.

Wenn der Versicherte zwischenzeitlich die Einwilligung zum Speichern von Abrechnungsinformationen im TI-Flow-Fachdienst widerrufen hat, dann enthält der Response den Fehlercode 403.

### PKV-Abgabedatensatz ändern (PUT /ChargeItem/<id>)

Mit diesem Anwendungsfall kann die abgebende LEI den PKV-Abgabedatensatz zu einem E-Rezept, welche die abgebende LEI zuvor auf dem TI-Flow-Fachdienst bereitgestellt hat, ändern. Als Voraussetzung muss der Versicherte der abgebenden LEI einen AccessCode übermitteln, um die abgebende LEI zu berechtigen.

Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, die Abrechnungsinformation zu einem E-Rezept zum Ändern auf dem TI-Flow-Fachdienst auszuwählen.

Das PS der abgebenden LEI MUSS im Anwendungsfall "PKV-Abgabedatensatz ändern" eine FHIR-Ressource des PKV-Abgabedatensatzes mit den Informationen zur Abrechnung des abgegebenen Medikaments erstellen.
Für die Spezifikation der Ressource PKV-Abgabedatensatz siehe [gemSpec_DM_eRp].

Das Signieren des PKV-Abgabedatensatzes erfolgt gemäß [gemILF_PS_eRp] Kap. “Abgabedatensatz signieren”.

Das PS der abgebenden LEI MUSS im Anwendungsfall "PKV-Abgabedatensatz ändern" eine FHIR-Ressource ChargeItem erstellen und den PKV-Abgabedatensatzes als contained Ressource einfügen.
Für die Spezifikation der Ressource ChargeItem siehe [gemSpec_DM_eRp].

Das PS abgebende LEI MUSS im Anwendungsfall "PKV-Abgabedatensatz ändern" die HTTP-Operation PUT /ChargeItem/<id>/ des TI-Flow-Fachdienstes mit
* ACCESS_TOKEN im Authorization-Header
* Prescription-ID in URL <id>
* AccessCode in URL-Parameter ?ac=
* ChargeItem im http-Body des Aufrufs als data
ausführen.
Wenn der Versicherte zwischenzeitlich die Einwilligung zum Speichern von Abrechnungsinformationen im TI-Flow-Fachdienst widerrufen hat, dann enthält der Response den Fehlercode 403.

### Abrechnungsinformation abrufen (GET /ChargeItem/<id>)

Mit diesem Anwendungsfall kann eine abgebende LEI die Abrechnungsinformation vom TI-Flow-Fachdienst abrufen, welche durch sie zuvor bereitgestellt und noch nicht gelöscht wurde. Als Voraussetzung muss der Versicherte der abgebenden LEI einen AccessCode übermitteln, um die abgebende LEI zu berechtigen.

Das PS abgebende LEI MUSS im Anwendungsfall "Abrechnungsinformation abrufen" die HTTP-Operation GET /ChargeItem/<id> des TI-Flow-Fachdienstes mit
* ACCESS_TOKEN im Authorization-Header
* Prescription-ID in URL <id>
* AccessCode in URL-Parameter ?ac=
ausführen.
Im Response ist die ChargeItem Ressource mit dem Verordnungsdatensatz und dem zugehörigen PKV-Abgabedatensatz enthalten.

