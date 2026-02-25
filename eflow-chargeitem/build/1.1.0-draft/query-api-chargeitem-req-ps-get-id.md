# Primärsystem des abgebenden Leistungserbringers - Anforderungen: ChargeItem-Query - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: ChargeItem**](query-api-chargeitem.md)
* **Primärsystem des abgebenden Leistungserbringers - Anforderungen: ChargeItem-Query**

## Primärsystem des abgebenden Leistungserbringers - Anforderungen: ChargeItem-Query

TODO: A_22202 

text

Das PS abgebende LEI MUSS im Anwendungsfall "Abrechnungsinformation abrufen" die HTTP-Operation GET /ChargeItem/<id> des E-Rezept-Fachdienstes mit
* ACCESS_TOKEN im Authorization-Header
* Prescription-ID in URL <id>
* AccessCode in URL-Parameter ?ac=
ausführen.
Im Response ist die ChargeItem Ressource mit dem Verordnungsdatensatz und dem zugehörigen PKV-Abgabedatensatz enthalten.

