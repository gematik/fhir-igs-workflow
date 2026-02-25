# E-Rezept-FdV Anforderungen: ChargeItem-Query - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: ChargeItem**](query-api-chargeitem.md)
* **E-Rezept-FdV Anforderungen: ChargeItem-Query**

## E-Rezept-FdV Anforderungen: ChargeItem-Query

Das E-Rezept-FdV KANN den Anwendungsfall "Abrechnungsinformation durch den Versicherten abrufen" umsetzen.
TODO: A_22174-01 

text

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation abfragen" zum Abrufen der Information zu einem einzelnen Datensatz vom E-Rezept-Fachdienst die HTTP-Operation GET /ChargeItem/<id>/ mit
* ACCESS_TOKEN im Authorization-Header
* Prescription-ID in URL <id>
ausführen.
In der Response ist die ChargeItem Ressource und die zugehörigen Detaildatensätze Verordnungsdatensatz, PKV-Abgabedatensatz, Quittung und der AccessCode zum Ändern des PKV-Abgabedatensatzes enthalten.

