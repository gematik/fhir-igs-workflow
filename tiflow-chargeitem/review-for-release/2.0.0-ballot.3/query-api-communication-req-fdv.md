# FdV-Anforderungen: Communication-Query - Implementation Guide TIFlow - Abrechnungsinformationen v2.0.0-ballot.3

Implementation Guide

TIFlow - Abrechnungsinformationen

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: Communication**](query-api-communication.md)
* **FdV-Anforderungen: Communication-Query**

## FdV-Anforderungen: Communication-Query

Diese Seite beschreibt Anforderungen an Clients zur Nutzung der `Communication`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-query-api.html)

### Modulspezifische Anforderungen

#### Nachricht versenden

##### Abrechnungsinformation-Token übermitteln

Mit dem Anwendungsfall kann die Apotheke , welche den PKV-Abgabedatensatz bereitgestellt hat, für das Ändern des PKV-Abgabedatensatzes berechtigt werden. Die Berechtigung erfolgt mit der Übermittlung des zugehörigen Abrechnungsinformation-Token

Das E-Rezept-FdV KANN den Anwendungsfall "Abrechnungsinformations-Token einer Apotheke übermitteln" umsetzen.

Die Korrektur des PKV-Abgabedatensatzes wird durch die Apotheke durchgeführt, welche die ursprünglichen Abrechnungsinformation erstellt hat. Daher ist keine freie Apothekenwahl für den Nutzer notwendig. Es ist ausreichend, die Apotheke aus den vorliegenden Abrechnungsinformationen zu ermitteln und dem Nutzer als Adressat der Nachricht anzuzeigen.

Eine Textnachricht ist optional. Innerhalb der Textnachricht sind keine Internet-Links und keine Non-Printable-Characters zulässig.

funkt. Eignung: Test Produkt/FADas E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation-Token einer Apotheke übermitteln" eine FHIR Ressource Communication des Profils https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReq mit
* Telematik-ID der ausgewählten abgebenden LEI in recipient
* Textnachricht in payload contentString
* E-Rezept-Token in basedOn reference auf Task inkl. AccessCode als "/ChargeItem/<id>?ac=..."
erstellen.

funkt. Eignung: Test Produkt/FADas E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation-Token einer Apotheke übermitteln" zum Einstellen der Nachricht die HTTP-Operation POST /Communication mit
* Communication Ressource in HTTP-Request-Body
ausführen.

