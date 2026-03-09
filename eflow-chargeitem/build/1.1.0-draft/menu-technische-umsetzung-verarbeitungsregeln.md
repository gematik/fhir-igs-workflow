# Verarbeitungsregeln für den E-Rezept-Fachdienst - Abrechnungsinformationen zu E-Rezepten für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen zu E-Rezepten für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Systemüberblick**](menu-technische-umsetzung-systemueberblick.md)
* **Verarbeitungsregeln für den E-Rezept-Fachdienst**

## Verarbeitungsregeln für den E-Rezept-Fachdienst

Diese Seite beschreibt gesonderte Verarbeitungsregeln und technische Aspekte für den E-Rezept-Fachdienst und dessen Clients im Kontext der Abrechnungsinformationen zu E-Rezepten für PKV-Versicherte.

### Allgemeine Verarbeitungsregeln

#### Zuordnung Workflow

Für die Übermittlung von ärztlichen und zahnärztlichen Verordnungen für apothekenpflichtige Arzneimittel für PKV-Versicherte wird der Workflow-Typ “200” eingeführt. Für den Workflow von ärztlichen und zahnärztlichen Verordnungen für apothekenpflichtige Arzneimittel mit Steuerung durch Leistungserbringer wird der Workflow-Typ “209” eingeführt.

Im Workflow-Typ “200” und Workflow-Typ “209” werden dasselbe Informationsmodell für den Verordnungsdatensatz (siehe https://simplifier.net/erezept ) wie bei der Verordnung für GKV-Versicherte verwendet. Hinweis: In MedicationRequest.insurance.Coverage.type mit dem Codesystem Coverage.type.coding in https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Coverage ist erkennbar, ob der Versicherte, für den das E-Rezept erstellt wurde, bei einer PKV versichert ist.

Der Ablauf im Workflow-Typ “200” ist identisch zum Workflow-Typ “160”. Der Ablauf im Workflow-Typ “209” ist identisch zum Workflow-Typ “169”.

Der Workflow-Typ “200” und der Workflow-Typ “209” verwenden dasselbe Statusmodell, wie der Workflow-Typ “160”. Siehe [gemSysL_eRp#2.4.6 Konzept Status E-Rezept].

Für E-Rezepte der Workflow-Types “200” und “209” können die Abrechnungsinformationen über den E-Rezept-Fachdienst an den Versicherten übermittelt werden.

### Verarbeitungsregeln für den E-Rezept-Fachdienst

#### Löschfristen

Für die Löschfristen des E-Rezepts gelten für Flowtype 200 und 209 die Vorgaben von Flowtype 160.

Der E-Rezept-Fachdienst MUSS ein ChargeItem innerhalb eines Monats nach Ablauf von 10 Jahren nach dem Erstellen der Ressource automatisch löschen und das Löschen in einem AuditEvent für den Versicherten nachvollziehbar protokollieren, damit nicht mehr benötigte Informationen gelöscht sind. Der E-Rezept-Fachdienst MUSS bei jedem Löschen eines ChargeItems alle referenzierten Bundles (E-Rezept-Bundle, Quittungs-Bundle, PKV-Abgabedatensatz) ebenfalls löschen, damit die Informationen rund um ein gelöschtes ChargeItem ebenfalls entfernt werden.
#### Identifikation von PKV-Versicherten

Die Zuordnung eines E-Rezeptes zu einem Versicherten erfolgt auf Basis der Versicherten-ID (10-stelliger unveränderlicher Teil der Krankenversichertennummer (KVNR)). D.h. teilnehmende PKV-Versicherte benötigen eine KVNR, welche ihnen über ihre Krankenversicherung zugeordnet wird. An der Versicherten-ID kann nicht erkannt werden, ob der Versicherte bei einer PKV versichert ist.

Die Authentisierung des Nutzers am E-Rezept-Fachdienst erfolgt mittels eines ACCESS_TOKEN. Diese werden durch Identity Provider (IdP) ausgestellt, welche die Identität des Nutzers attestieren. Es werden ACCESS_TOKEN von IdPs akzeptiert, bei denen der E-Rezept-Fachdienst sich registriert hat.

Mit dem Start der Anwendung E-Rezept kann der IdP der gematik genutzt werden. Für die Authentisierung eines Versicherten am IdP der gematik mittels E-Rezept-FdV wird eine eGK mit NFC-Schnittstelle verwendet.

Mit der Entwicklung von digitalen Identitäten, bspw. föderierter IdPs, werden diese für die Authentisierung einbezogen.

### Verarbeitungsregeln für das E-Rezept-FdV

#### Abrechnungsinformation-Token als 2D-Code anzeigen

Mit diesem Anwendungsfall kann der Nutzer den AccessCode zum Ändern als 2D-Code auf dem Bildschirm seines E-Rezept-FdVs anzeigen lassen, um es direkt in der Apotheke vorzuzeigen und die Apotheke damit zu berechtigen, die Abrechnungsinformation vom E-Rezept-Fachdienst abzurufen und den PKV-Abgabedatensatz einmalig zu ändern.

Das E-Rezept-FdV KANN den Anwendungsfall "2D-Code Abrechnungsinformation anzeigen" umsetzen.

Das E-Rezept-FdV MUSS im Anwendungsfall "2D-Code Abrechnungsinformation anzeigen" es dem Nutzer ermöglichen, ein E-Rezept für die Anzeige des 2D-Code der Abrechnungsinformation auszuwählen, um einer Apotheke das Einscannen zu ermöglichen und sie somit für das Ändern des PKV-Abgabedatensatzes zu berechtigen.

Das E-Rezept-FdV MUSS im Anwendungsfall "2D-Code Abrechnungsinformation anzeigen" für das ausgewählte E-Rezept den Abrechnungsinformation-Token erstellen.
Für die Beschreibung der Struktur des Abrechnungsinformation-Token siehe [gemSpec_DM_eRp].

Das E-Rezept-FdV MUSS im Anwendungsfall "2D-Code Abrechnungsinformation anzeigen" mit dem erstellten Abrechnungsinformation-Token einen 2D-Code erstellen und auf dem Display des Endgerätes anzeigen.
#### Abrechnungsinformation exportieren

Mit diesem Anwendungsfall kann der Versicherte die Abrechnungsinformation aus dem E-Rezept-FdV exportieren, um es zur Abrechnung einzureichen oder zu archivieren.

Das E-Rezept-FdV KANN den Anwendungsfall "Abrechnungsinformation exportieren" umsetzen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation exportieren" auf Basis der vom E-Rezept-Fachdienst zu einer Prescription-ID heruntergeladenen ChargeItem, Verordnungsdatensatz, PKV-Abgabedatensatz und Quittung Ressourcen
* einen Ausdruck erstellen,
* für den Ausdruck ein PDF gemäß PDF/A-3-Standard (ISO 19005-3) erstellen,
* in das Dokument den signierten Verordnungsdatensatz (<Prescription-ID>_verordnung.p7s), den signierten PKV-Abgabedatensatz (<Prescription-ID>_abgabedaten.p7s) und den signierten Quittung Datensatz (<Prescription-ID>_quittung.p7s) gemäß PDF/A-3 einbetten.

Für die Visualisierung der Abrechnungsinformation für PKV-Versicherte ist die zwischen DAV und PKV-Verband vereinbarte Technische Anlage zu den PKV-Abgabedaten und dem dortigen Kapitel 6 Ausdruck für den Privatversicherten sowie dem Unterkapitel 6.2 Spezifikation des Ausdrucks für den Versicherten [Empfehlung](http://www.abda.de/themen/e-health/datenauschtausch-pkv) zu beachten. Zur Umsetzungsunterstützung siehe auch [hier](https://github.com/DAV-ABDA/eRezept-Beispiele/tree/main/PKV).

Das E-Rezept-FdV MUSS es dem Nutzer im Anwendungsfall "Abrechnungsinformation exportieren" ermöglichen, das erstellte PDF mit anderen Apps zu teilen, um den Versicherten die Möglichkeit zu geben, seine Abrechnungsinformation an Krankenversicherungen oder andere Institutionen zur Abrechnung zu übermitteln.
Das schließt das Versenden per E-Mail oder die Ablage im Dateisystem ein.

