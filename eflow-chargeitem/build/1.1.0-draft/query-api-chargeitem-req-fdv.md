# E-Rezept-FdV Anforderungen: ChargeItem-Query - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: ChargeItem**](query-api-chargeitem.md)
* **E-Rezept-FdV Anforderungen: ChargeItem-Query**

## E-Rezept-FdV Anforderungen: ChargeItem-Query

Diese Seite beschreibt Anforderungen an Clients zur Nutzung der `ChargeItem`-Query-Endpunkte.

### Abrechnungsinformationen abrufen

### Liste von Abrechnungsinformationen abrufen (GET /ChargeItem)

Mit diesem Anwendungsfall kann der Nutzer eine Liste aller Abrechnungsinformationen vom E-Rezept-Fachdienst abrufen, welche für den Versicherten bereitgestellt wurden.

Das E-Rezept-FdV KANN den Anwendungsfall "Liste Abrechnungsinformationen abrufen" umsetzen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Liste Abrechnungsinformationen abfragen" zum Abrufen der Information vom E-Rezept-Fachdienst die HTTP-Operation GET /ChargeItem mit
* ACCESS_TOKEN im Authorization-Header
ausführen.
In der Response ist eine Liste von ChargeItem-Ressourcen enthalten. Für jede ChargeItem-Ressource ist die folgende Information enthalten:

* Prescription-ID

### Abrechnungsinformation abrufen (GET /ChargeItem/<id>)

Mit diesem Anwendungsfall kann der Nutzer (Versicherter) die Abrechnungsinformation zu einem E-Rezept vom E-Rezept-Fachdienst herunterladen.

Das E-Rezept-FdV KANN den Anwendungsfall "Abrechnungsinformation durch den Versicherten abrufen" umsetzen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation abfragen" zum Abrufen der Information zu einem einzelnen Datensatz vom E-Rezept-Fachdienst die HTTP-Operation GET /ChargeItem/<id>/ mit
* ACCESS_TOKEN im Authorization-Header
* Prescription-ID in URL <id>
ausführen.
In der Response ist die ChargeItem Ressource und die zugehörigen Detaildatensätze Verordnungsdatensatz, PKV-Abgabedatensatz, Quittung und der AccessCode zum Ändern des PKV-Abgabedatensatzes enthalten.

### Abrechnungsinformation markieren (PATCH /Charge/<id>)

Mit diesem Anwendungsfall kann der Nutzer (Versicherter) Markierungen zu seiner Abrechnungsinformation setzen. Diese werden auf dem E-Rezept-Fachdienst gespeichert.

Das E-Rezept-FdV KANN den Anwendungsfall "Abrechnungsinformation markieren" umsetzen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation markieren" es dem Nutzer ermöglichen, eine oder mehrere der folgenden Inhalte als Markierung für eine Abrechnungsinformation zu wählen oder abzuwählen:
* zur Abrechnung bei Krankenversicherung eingereicht (extention "insuranceProvider")
* zur Abrechnung bei der Beihilfe eingereicht (extention "subsity")
* zur Einreichung beim Finanzamt verwendet (extention "taxOffice")

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation markieren" zum Speichern der Information im E-Rezept-Fachdienst die HTTP-Operation PATCH /ChargeItem/<id> mit
* ACCESS_TOKEN im Authorization-Header
* Prescription-ID in URL <id>
für jede zu ändernde Markierung
* "add" in type
* zu ändernde Markierung in path
* geänderter Wert in value
ausführen.
### Abrechnungsinformation löschen (DELETE /ChargeItem/<id>)

Das E-Rezept-FdV KANN den Anwendungsfall "Abrechnungsinformation löschen" umsetzen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation löschen" es dem Nutzer ermöglichen, eine Abrechnungsinformationen zum Löschen auszuwählen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation löschen" vom Nutzer eine Bestätigung einholen, dass die selektierte Abrechnungsinformation gelöscht werden soll und die Möglichkeit geben, das Löschen abzubrechen.
Das E-Rezept-FdV muss im Rahmen der Bestätigung darauf hinweisen, dass mit dem Löschen der Abrechnungsinformation die Daten des Verordnungsdatensatzes, des PKV-Abgabedatensatzes und der Quittung gelöscht werden und somit ein Neueinstellen der Abrechnungsinformation durch die Apotheke ggf. nicht mehr möglich ist.

Das E-Rezept-FdV kann es dem Nutzer ermöglichen, den Anwendungsfall zum lokalen Löschen für die zu löschende Abrechnungsinformation zusammen mit dem Löschen auf dem E-Rezept-Fachdienst auszuführen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation löschen" die HTTP-Operation DELETE /ChargeItem/<id> des E-Rezept-Fachdienstes mit
* ACCESS_TOKEN im Authorization-Header
* Prescription-ID in URL <id>
ausführen.

Das E-Rezept-FdV KANN, wenn es das Management von Abrechnungsinformationen unterstützt, den Nutzer vor Erreichen der Aufbewahrungsfrist der Abrechnungsinformation einen Hinweis zum automatischen Löschen geben, um dem Nutzer die Möglichkeit zu geben, falls gewünscht die Daten herunterzuladen und zu archivieren.

