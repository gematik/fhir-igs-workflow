# FdV-Anforderungen: Communication-Query - E-Rezepte apothekenpflichtiger Arzneimittel für PKV-Versicherte v1.1.0-draft

E-Rezepte apothekenpflichtiger Arzneimittel für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: Communication**](query-api-communication.md)
* **FdV-Anforderungen: Communication-Query**

## FdV-Anforderungen: Communication-Query

Diese Seite beschreibt Anforderungen an Clients zur Nutzung der `Communication`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Diese Seite beschreibt Anforderungen ein E-Rezept-FdV zur Nutzung der `Communication`-Query-Endpunkte.

#### Nachrichten abrufen

Das E-Rezept-FdV MUSS im Anwendungsfall "Nachrichten von Apotheken anzeigen" zum Herunterladen von Nachrichten vom E-Rezept-Fachdienst die HTTP-Operation GET /Communication mit
* ACCESS_TOKEN im Authorization-Header
* optional: ?received=null für nur ungelesene Nachrichten
* optional: ?received=gtYYYY-MM-DD_sort=sent für Nachrichten jünger als Datum DD.MM.YYY
ausführen.
#### Nachricht versenden

Die für die Nachricht zu verwendende Communication-Ressource wird modul- und anwendungsfall-spezifisch festgelegt.

Das E-Rezept-FdV MUSS im Anwendungsfall "Nachricht senden" zum Übermitteln einer Nachricht über den E-Rezept-Fachdienst die HTTP-Operation POST /Communication mit
* ACCESS_TOKEN im Authorization-Header
* Communication Ressource in HTTP-Request-Body
ausführen.
#### Nachricht löschen

Das E-Rezept-FdV MUSS im Anwendungsfall “Nachricht löschen” es dem Nutzer ermöglichen, eine Nachricht zum Löschen auf dem E-Rezept-Fachdienst auszuwählen.

Das E-Rezept-FdV MUSS im Anwendungsfall “Nachricht löschen” vom Nutzer eine Bestätigung einholen, dass die selektierte Nachricht gelöscht werden sollen und die Möglichkeit geben, das Löschen abzubrechen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Nachrichten löschen" für die zu löschende Nachricht die HTTP-Operation DELETE /Communication/<id> des E-Rezept-Fachdienstes mit
* ACCESS_TOKEN im Authorization-Header
* Communication-ID in URL <id>
ausführen.
### Modulspezifische Anforderungen

Das E-Rezept-FdV KANN den Anwendungsfall "Abrechnungsinformations-Token einer Apotheke übermitteln" umsetzen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation-Token einer Apotheke übermitteln" es dem Nutzer ermöglichen, ein E-Rezept auszuwählen, um den zugehörigen Abrechnungsinformation-Token der Apotheke, welche den PKV-Abgabedatensatz bereitgestellt hat, mittels einer Nachricht zu übermitteln und die Apotheke somit für das Ändern des PKV-Abgabedatensatzes zu berechtigen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation-Token einer Apotheke übermitteln" es dem Nutzer ermöglichen, die Apotheke auszuwählen, welche die Abrechnungsinformation bereitgestellt hat.
Die Korrektur des PKV-Abgabedatensatzes wird durch die Apotheke durchgeführt, welche die ursprünglichen Abrechnungsinformation erstellt hat. Daher ist keine freie Apothekenwahl für den Nutzer notwendig. Es ist ausreichend, die Apotheke aus den vorliegenden Abrechnungsinformationen zu ermitteln und dem Nutzer als Adressat der Nachricht anzuzeigen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation-Token einer Apotheke übermitteln" es dem Nutzer ermöglichen, eine freie Textnachricht zu erfassen, welche der Nachricht an die Apotheke hinzugefügt wird.
Hinweis: Die Textnachricht ist optional.

Innerhalb der Textnachricht sind keine Internet-Links und keine Non-Printable-Characters zulässig.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation-Token einer Apotheke übermitteln" eine FHIR Ressource Communication des Profils https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReq mit
* Telematik-ID der ausgewählten abgebenden LEI in recipient
* Textnachricht in payload contentString
* E-Rezept-Token in basedOn reference auf Task inkl. AccessCode als "/ChargeItem/<id>?ac=..."
erstellen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation-Token einer Apotheke übermitteln" zum Einstellen der Nachricht die HTTP-Operation POST /Communication mit
* ACCESS_TOKEN im Authorization-Header
* Communication Ressource in HTTP-Request-Body
ausführen.

