# FdV-Anforderungen: Consent-Query - Implementation Guide TIFlow - Abrechnungsinformationen v2.0.0-ballot.2

Implementation Guide

TIFlow - Abrechnungsinformationen

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: Consent**](query-api-consent.md)
* **FdV-Anforderungen: Consent-Query**

## FdV-Anforderungen: Consent-Query

Diese Seite beschreibt Anforderungen für das E-Rezept-FdV zur Nutzung der `Consent`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `Consent`-Query-Endpunkte.

#### Einwilligung erteilen

**Sequenzdiagramm:**

**Abbildung: **UC 3.14 - Einwilligung durch Versicherten erteilen

funkt. Eignung: HerstellererklärungDas E-Rezept-FdV MUSS im Anwendungsfall "Einwilligung erteilen" den Text für die Einwilligung derart gestalten, dass dem Nutzer eine informierte Einwilligung möglich ist. Insbesondere MÜSSEN enthalten sein: der Verwendungszweck, die konkreten Informationen über die Art der erhobenen Daten, die Speicherdauer, Hinweis auf Freiwilligkeit, auf Widerrufsrecht, Hinweis auf die Folgen bei Verweigerung oder Widerruf.

funkt. Eignung: HerstellererklärungDas E-Rezept-FdV MUSS im Anwendungsfall "Einwilligung erteilen" es dem Nutzer ermöglichen, die Einwilligung einzugeben.

funkt. Eignung: Test Produkt/FADas E-Rezept-FdV MUSS im Anwendungsfall "Einwilligung erteilen" eine Consent Ressource mit:
* Versicherten-ID in Consent.patient.identifier
* Einwilligungstyp in Consent.category.coding.code
erstellen.

funkt. Eignung: Test Produkt/FADas E-Rezept-FdV MUSS im Anwendungsfall "Einwilligung erteilen" zum Speichern der Information im TI-Flow-Fachdienst die HTTP-Operation POST /Consent mit:
* Consent Ressource im HTTP-Request-Body
ausführen.
#### Einwilligungen einsehen

**Sequenzdiagramm:**

**Abbildung: **UC 3.13 - Einwilligungen durch Versicherten einsehen

funkt. Eignung: Test Produkt/FADas E-Rezept-FdV MUSS im Anwendungsfall "Einwilligungsinformation abrufen" zum Abrufen der Information vom TI-Flow-Fachdienst die HTTP-Operation GET /Consent mit ausführen.
In der Response können mehrere Consent Ressourcen enthalten sein. Der Einwilligungstyp des Consent ist in Consent.category.coding.code angegeben. Die Werte können sich auf folgende Codesysteme beziehen: [GEM_ERPCHRG_CS_ConsentType], [GEM_ERPEU_CS_ConsentType].

#### Einwilligung widerrufen

**Sequenzdiagramm:**

**Abbildung: **UC 3.15 - Einwilligung durch Versicherten widerrufen

funkt. Eignung: HerstellererklärungDas E-Rezept-FdV MUSS im Anwendungsfall "Einwilligung widerrufen" es dem Nutzer ermöglichen, den Widerruf zu erfassen.

funkt. Eignung: HerstellererklärungDas E-Rezept-FdV MUSS im Anwendungsfall "Einwilligung widerrufen" vom Nutzer eine Bestätigung einholen, dass die Einwilligung widerrufen werden soll, somit ggf. korrespondierende Daten gelöscht werden und die Möglichkeit geben, das Widerrufen abzubrechen.

funkt. Eignung: Test Produkt/FADas E-Rezept-FdV MUSS im Anwendungsfall "Einwilligung widerrufen" zum Löschen der Information im TI-Flow-Fachdienst die HTTP-Operation DELETE /Consent/?category=<Einwilligungstyp> mit:
* Einwilligungstyp in ?category
ausführen.
Der Einwilligungstyp ist entsprechend dem Codesystem [GEM_ERPCHRG_CS_ConsentType] oder [GEM_ERPEU_CS_ConsentType] anzugeben.

