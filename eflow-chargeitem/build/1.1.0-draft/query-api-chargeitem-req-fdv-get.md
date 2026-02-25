# E-Rezept-FdV Anforderungen: ChargeItem-Query - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: ChargeItem**](query-api-chargeitem.md)
* **E-Rezept-FdV Anforderungen: ChargeItem-Query**

## E-Rezept-FdV Anforderungen: ChargeItem-Query

Das E-Rezept-FdV KANN den Anwendungsfall "Liste Abrechnungsinformationen abrufen" umsetzen.
TODO: A_22172-01 

text

Das E-Rezept-FdV MUSS im Anwendungsfall "Liste Abrechnungsinformationen abfragen" zum Abrufen der Information vom E-Rezept-Fachdienst die HTTP-Operation GET /ChargeItem mit
* ACCESS_TOKEN im Authorization-Header
ausführen.
In der Response ist eine Liste von ChargeItem-Ressourcen enthalten. Für jede ChargeItem-Ressource ist die folgende Information enthalten:

* Prescription-ID

