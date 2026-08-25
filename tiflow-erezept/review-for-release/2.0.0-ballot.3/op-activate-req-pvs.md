# PVS-Anforderungen $activate - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $activate (Task aktivieren)**](op-activate.md)
* **PVS-Anforderungen $activate**

## PVS-Anforderungen $activate

Diese Seite enthält die normativen Anforderungen an das PVS für die Operation `$activate`.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-operation-api.html)

### Modulspezifische Anforderungen

funkt. Eignung: KonformitätsbestätigungDas PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden erstellen" für Verordnungen mit Flowtype 160, 166, 169, 200 oder 209 Dosierinformationen nach [Medication IG] erzeugen und im E-Rezept-Bundle angeben.
### Anforderungen Workflow 200, 209

funkt. Eignung: KonformitätsbestätigungDas PS der verordnenden LEI MUSS im Verordnungsdatensatz für ein E-Rezept des Flowtype 200 oder 209 als Identifier des Patienten in Patient.identifer.value die KVNR des Versicherten verwenden.

funkt. Eignung: KonformitätsbestätigungDas PS der verordnenden LEI MUSS im Verordnungsdatensatz für ein E-Rezept des Flowtype 200 oder 209 für Coverage.type.coding.code den Wert "PKV" verwenden.
### Anforderungen für Mehrfachverordnung

funkt. Eignung: KonformitätsbestätigungDas PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden erstellen" beim Erstellen des E-Rezept-Bundles für die Teilverordnung einer Mehrfachverordnung den Beginn der Einlösefrist der Teilverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) angeben.
### Anforderungen Workflow 166

funkt. Eignung: KonformitätsbestätigungDas PS der verordnenden LEI MUSS sicherstellen, dass ein Verordnungsdatensatz für ein E-Rezept des Flowtype 166 nur mit einem HBA mit der zulässigen ProfessionOID oid_arzt signiert werden kann.

funkt. Eignung: KonformitätsbestätigungDas PS der verordnenden LEI MUSS im Verordnungsdatensatz für ein E-Rezept des Flowtype 166 sicherstellen, dass die maximale Reichdauer entsprechend den gesetzlichen Vorgaben nicht überschritten wird.

funkt. Eignung: Konformitätsbestätigung

| | | |
| :--- | :--- | :--- |
| Alle Sicherheitsbestimmungen gemäß der Fachinformation entsprechender Fertigarzneimittel werden eingehalten | Bei jedem Verordnungsvorgang | "nein" ist zulässig, "ja" ist nicht zulässig |
| Ich verfüge über ausreichende Sachkenntnisse zur Verschreibung von Arzneimitteln nach § 3a AMVV | Einmalig aktiv abfragen, danach darf das Feld im Verordnungsvorgang angezeigt, aber vorbefüllt werden. | "nein" ist zulässig, "ja" ist ab der zweiten Verordnung zulässig |
| Der Patientin bzw. dem Patienten wurde vor Beginn der Behandlung medizinisches Informationsmaterial gemäß den Anforderungen der Fachinformation entsprechender Arzneimittel ausgehändigt. | Bei jedem Verordnungsvorgang | "nein" ist zulässig, "ja" ist nicht zulässig |
| Behandlung erfolgt außerhalb der zugelassenen Anwendungsgebiete (Off-Label) | Bei jedem Verordnungsvorgang | "nein" ist zulässig, "ja" ist nicht zulässig |
| Bei der Patientin handelt es sich um eine gebärfähige Frau | Bei jedem Verordnungsvorgang | "nein" und "ja" sind zulässig |

### Patientenausdruck

funkt. Eignung: HerstellererklärungDas PS der verordnenden LEI DARF für E-Rezepte des Workflowtype mit Steuerung durch den Leistungserbringer (169, 209) NICHT einen Patientenausdruck erstellen.
### Anforderungen Workflow 169

funkt. Eignung: KonformitätsbestätigungDas PS der verordnenden LEI MUSS es dem Nutzer ermöglichen, die Einlöseinformationen (Task.id und AccessCode) als E-Rezept-Token über ein geeignetes Übermittlungsverfahren an eine Apotheke der Wahl zu schicken.

funkt. Eignung: KonformitätsbestätigungDas Primärsystem MUSS für die Übertragung von E-Rezept-Token ein Verfahren nutzen, dass die sehr hohe Vertraulichkeit des E-Rezept-Tokens und seine Integrität schützt.

funkt. Eignung: KonformitätsbestätigungDas PS der verordnenden LEI KANN die Auswahl und Verwaltung von herstellenden Apotheken für die Übermittlung der E-Rezept-Einlöseinformationen ermöglichen.

