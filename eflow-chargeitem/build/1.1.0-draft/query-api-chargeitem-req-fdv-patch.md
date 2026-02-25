# E-Rezept-FdV Anforderungen: ChargeItem-Query - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: ChargeItem**](query-api-chargeitem.md)
* **E-Rezept-FdV Anforderungen: ChargeItem-Query**

## E-Rezept-FdV Anforderungen: ChargeItem-Query

Das E-Rezept-FdV KANN den Anwendungsfall "Abrechnungsinformation markieren" umsetzen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation markieren" es dem Nutzer ermöglichen, eine oder mehrere der folgenden Inhalte als Markierung für eine Abrechnungsinformation zu wählen oder abzuwählen:
* zur Abrechnung bei Krankenversicherung eingereicht (extention "insuranceProvider")
* zur Abrechnung bei der Beihilfe eingereicht (extention "subsity")
* zur Einreichung beim Finanzamt verwendet (extention "taxOffice")

TODO: A_22177-02 

text

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation markieren" zum Speichern der Information im E-Rezept-Fachdienst die HTTP-Operation PATCH /ChargeItem/<id> mit
* ACCESS_TOKEN im Authorization-Header
* Prescription-ID in URL <id>
für jede zu ändernde Markierung
* "add" in type
* zu ändernde Markierung in path
* geänderter Wert in value
ausführen.

