# FdV-Anforderungen: Consent - EU Zugriff E-Rezept v1.0.1

EU Zugriff E-Rezept

Version 1.0.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Consent**](query-api-consent.md)
* **FdV-Anforderungen: Consent**

## FdV-Anforderungen: Consent

Diese Seite beschreibt Anforderungen für das E-Rezept-FdV zur Nutzung der `Consent`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `Consent`-Query-Endpunkte.

#### Einwilligung erteilen

Das E-Rezept-FdV MUSS im Anwendungsfall "Einwilligung erteilen" den Text für die Einwilligung derart gestalten, dass dem Nutzer eine informierte Einwilligung möglich ist. Insbesondere MÜSSEN enthalten sein: der Verwendungszweck, die konkreten Informationen über die Art der erhobenen Daten, die Speicherdauer, Hinweis auf Freiwilligkeit, auf Widerrufsrecht, Hinweis auf die Folgen bei Verweigerung oder Widerruf.

Das E-Rezept-FdV MUSS im Anwendungsfall "Einwilligung erteilen" es dem Nutzer ermöglichen, die Einwilligung einzugeben.

Das E-Rezept-FdV MUSS im Anwendungsfall "Einwilligung erteilen" eine Consent Ressource mit:
* Versicherten-ID in Consent.patient.identifier
* Einwilligungstyp in Consent.category.coding.code
erstellen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Einwilligung erteilen" zum Speichern der Information im E-Rezept-Fachdienst die HTTP-Operation POST /Consent mit:
* ACCESS_TOKEN im Authorization-Header
ausführen.
#### Einwilligungen einsehen

Das E-Rezept-FdV MUSS im Anwendungsfall "Einwilligungsinformation abrufen" zum Abrufen der Information vom E-Rezept-Fachdienst die HTTP-Operation GET /Consent mit:
* ACCESS_TOKEN im Authorization-Header
ausführen.
In der Response können mehrere Consent Ressourcen enthalten sein. Der Einwilligungstyp des Consent ist in Consent.category.coding.code angegeben. Die Werte können sich auf folgende Codesysteme beziehen: [GEM_ERPCHRG_CS_ConsentType], [GEM_ERPEU_CS_ConsentType].

#### Einwilligung widerrufen

Das E-Rezept-FdV MUSS im Anwendungsfall "Einwilligung widerrufen" es dem Nutzer ermöglichen, den Widerruf zu erfassen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Einwilligung widerrufen" vom Nutzer eine Bestätigung einholen, dass die Einwilligung widerrufen werden soll, somit ggf. korrespondierende Daten gelöscht werden und die Möglichkeit geben, das Widerrufen abzubrechen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Einwilligung widerrufen" zum Löschen der Information im E-Rezept-Fachdienst die HTTP-Operation DELETE /Consent/?category=<Einwilligungstyp> mit:
* ACCESS_TOKEN im Authorization-Header
* Einwilligungstyp in ?category
ausführen.
Der Einwilligungstyp ist entsprechend dem Codesystem [GEM_ERPCHRG_CS_ConsentType] oder [GEM_ERPEU_CS_ConsentType] anzugeben.

### Modulspezifische Anforderungen

Für die Verwaltung der Einwilligung zum Einlösen von E-Rezepten im europäischen Ausland wird Consent.category.coding.code mit dem Codesystem https://gematik.de/fhir/erp-eu/CodeSystem/GEM_ERPEU_CS_ConsentType verwendet.

