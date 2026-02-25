# E-Rezept-FdV Anforderungen: ChargeItem-Query - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: ChargeItem**](query-api-chargeitem.md)
* **E-Rezept-FdV Anforderungen: ChargeItem-Query**

## E-Rezept-FdV Anforderungen: ChargeItem-Query

Das E-Rezept-FdV KANN den Anwendungsfall "Abrechnungsinformation löschen" umsetzen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation löschen" es dem Nutzer ermöglichen, eine Abrechnungsinformationen zum Löschen auszuwählen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation löschen" vom Nutzer eine Bestätigung einholen, dass die selektierte Abrechnungsinformation gelöscht werden soll und die Möglichkeit geben, das Löschen abzubrechen.
Das E-Rezept-FdV muss im Rahmen der Bestätigung darauf hinweisen, dass mit dem Löschen der Abrechnungsinformation die Daten des Verordnungsdatensatzes, des PKV-Abgabedatensatzes und der Quittung gelöscht werden und somit ein Neueinstellen der Abrechnungsinformation durch die Apotheke ggf. nicht mehr möglich ist.

Das E-Rezept-FdV kann es dem Nutzer ermöglichen, den Anwendungsfall zum lokalen Löschen für die zu löschende Abrechnungsinformation zusammen mit dem Löschen auf dem E-Rezept-Fachdienst auszuführen.

TODO: A_22182-01 

text

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation löschen" die HTTP-Operation DELETE /ChargeItem/<id> des E-Rezept-Fachdienstes mit
* ACCESS_TOKEN im Authorization-Header
* Prescription-ID in URL <id>
ausführen.

Das E-Rezept-FdV KANN, wenn es das Management von Abrechnungsinformationen unterstützt, den Nutzer vor Erreichen der Aufbewahrungsfrist der Abrechnungsinformation einen Hinweis zum automatischen Löschen geben, um dem Nutzer die Möglichkeit zu geben, falls gewünscht die Daten herunterzuladen und zu archivieren.

