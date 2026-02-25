# E-Rezept-FdV Anforderungen: Communication-Query - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: Communication**](query-api-communication.md)
* **E-Rezept-FdV Anforderungen: Communication-Query**

## E-Rezept-FdV Anforderungen: Communication-Query

Diese Seite beschreibt Anforderungen an Clients zur Nutzung der `Communication`-Query-Endpunkte. TODO: Prüfverfahren

Das E-Rezept-FdV KANN den Anwendungsfall "Abrechnungsinformations-Token einer Apotheke übermitteln" umsetzen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation-Token einer Apotheke übermitteln" es dem Nutzer ermöglichen, ein E-Rezept auszuwählen, um den zugehörigen Abrechnungsinformation-Token der Apotheke, welche den PKV-Abgabedatensatz bereitgestellt hat, mittels einer Nachricht zu übermitteln und die Apotheke somit für das Ändern des PKV-Abgabedatensatzes zu berechtigen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation-Token einer Apotheke übermitteln" es dem Nutzer ermöglichen, die Apotheke auszuwählen, welche die Abrechnungsinformation bereitgestellt hat.
Die Korrektur des PKV-Abgabedatensatzes wird durch die Apotheke durchgeführt, welche die ursprünglichen Abrechnungsinformation erstellt hat. Daher ist keine freie Apothekenwahl für den Nutzer notwendig. Es ist ausreichend, die Apotheke aus den vorliegenden Abrechnungsinformationen zu ermitteln und dem Nutzer als Adressat der Nachricht anzuzeigen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation-Token einer Apotheke übermitteln" es dem Nutzer ermöglichen, eine freie Textnachricht zu erfassen, welche der Nachricht an die Apotheke hinzugefügt wird.
Hinweis: Die Textnachricht ist optional.

Innerhalb der Textnachricht sind keine Internet-Links und keine Non-Printable-Characters zulässig.

TODO: Do A_22738-01?

text

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation-Token einer Apotheke übermitteln" eine FHIR Ressource Communication des Profils https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReq mit
* Telematik-ID der ausgewählten abgebenden LEI in recipient
* Textnachricht in payload contentString
* E-Rezept-Token in basedOn reference auf Task inkl. AccessCode als "/ChargeItem/<id>?ac=..."
erstellen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation-Token einer Apotheke übermitteln" zum Einstellen der Nachricht die HTTP-Operation POST /Communication mit
* ACCESS_TOKEN im Authorization-Header
* Communication Ressource in HTTP-Request-Body
ausführen.

