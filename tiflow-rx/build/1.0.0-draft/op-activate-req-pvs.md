# PVS-Anforderungen $activate - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $activate (Task aktivieren)**](op-activate.md)
* **PVS-Anforderungen $activate**

## PVS-Anforderungen $activate

Diese Seite enthält die normativen Anforderungen an das PVS für die Operation `$activate`.

### Anforderungen aus der Core Spezifikation

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an Clientsysteme für die Nutzung der Operation `$activate`.

Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden einstellen" für das E-Rezept die HTTP-Operation POST /Task/<id>/$activate mit
* ACCESS_TOKEN im Authorization-Header
* Task-ID in URL <id> 
* AccessCode in X-AccessCode - Header oder URL-Parameter ?ac=
* QES signiertes E-Rezept-Bundle im http-Body des Aufrufs als data
ausführen.
Hinweis: Für den Fall, dass das Clientsystem beim Aufruf der Operation keinen Response erhält, soll der Aufruf wiederholt werden. Wenn im Response des zweiten Aufrufs ein Fehler 403 mit dem OperationOutcome “Task not in status draft but in status ready” zurückkommt, wurde der erste Aufruf bereits erfolgreich durch den E-Rezept-Fachdienst verarbeitet. Wenn eine Response mit dem Status 200 zurückkommt, war der zweite Aufruf erfolgreich.

Das PS der verordnenden LEI DARF im Anwendungsfall "E-Rezept durch Verordnenden einstellen" NICHT einen Ausdruck für den Versicherten erstellen, wenn der E-Rezept-Fachdienst im Response der Operation POST /Task/<id>/$activate mit einem Fehler antwortet.
Für den Patientenausdruck gelten vorrangig die Regelungen zum Ausdruck eines E-Rezepts aus den Bundesmantelverträgen [BMV] und [BMV-Z]. 

Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden einstellen", wenn ein Patientenausdruck erstellt werden soll, einen E-Rezept-Token erstellen.
Für die Spezifikation des E-Rezept-Token siehe [gemSpec_DM_eRp#2.3]. 

Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden einstellen", wenn ein Patientenausdruck erstellt werden soll, Datamatrix-Codes erstellen und für den Patientenausdruck verwenden.
Für die Spezifikation des Datamatrix-Code für E-Rezept-Token siehe [gemSpec_DM_eRp#2.3]. 

### Modulspezifische Anforderungen

Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden erstellen" für Verordnungen mit Flowtype 160, 166, 169, 200 oder 209 Dosierinformationen nach [Medication IG] erzeugen und im E-Rezept-Bundle angeben.
### Anforderungen Workflow 200, 209

Das PS der verordnenden LEI MUSS im Verordnungsdatensatz für ein E-Rezept des Flowtype 200 oder 209 als Identifier des Patienten in Patient.identifer.value die KVNR des Versicherten verwenden.

Das PS der verordnenden LEI MUSS im Verordnungsdatensatz für ein E-Rezept des Flowtype 200 oder 209 für Coverage.type.coding.code den Wert "PKV" verwenden.
### Anforderungen für Mehrfachverordnung

Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden erstellen" beim Erstellen des E-Rezept-Bundles für die Teilverordnung einer Mehrfachverordnung den Beginn der Einlösefrist der Teilverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) angeben.
### Anforderungen Workflow 166

Das PS der verordnenden LEI MUSS sicherstellen, dass ein Verordnungsdatensatz für ein E-Rezept des Flowtype 166 nur mit einem HBA mit der zulässigen ProfessionOID oid_arzt signiert werden kann.

Das PS der verordnenden LEI MUSS im Verordnungsdatensatz für ein E-Rezept des Flowtype 166 sicherstellen, dass die maximale Reichdauer entsprechend den gesetzlichen Vorgaben nicht überschritten wird.

| | | |
| :--- | :--- | :--- |
| Alle Sicherheitsbestimmungen gemäß der Fachinformation entsprechender Fertigarzneimittel werden eingehalten | Bei jedem Verordnungsvorgang | "nein" ist zulässig, "ja" ist nicht zulässig |
| Ich verfüge über ausreichende Sachkenntnisse zur Verschreibung von Arzneimitteln nach § 3a AMVV | Einmalig aktiv abfragen, danach darf das Feld im Verordnungsvorgang angezeigt, aber vorbefüllt werden. | "nein" ist zulässig, "ja" ist ab der zweiten Verordnung zulässig |
| Der Patientin bzw. dem Patienten wurde vor Beginn der Behandlung medizinisches Informationsmaterial gemäß den Anforderungen der Fachinformation entsprechender Arzneimittel ausgehändigt. | Bei jedem Verordnungsvorgang | "nein" ist zulässig, "ja" ist nicht zulässig |
| Behandlung erfolgt außerhalb der zugelassenen Anwendungsgebiete (Off-Label) | Bei jedem Verordnungsvorgang | "nein" ist zulässig, "ja" ist nicht zulässig |
| Bei der Patientin handelt es sich um eine gebärfähige Frau | Bei jedem Verordnungsvorgang | "nein" und "ja" sind zulässig |

### Patientenausdruck

Das PS der verordnenden LEI DARF für E-Rezepte des Workflowtype mit Steuerung durch den Leistungserbringer (169, 209) NICHT einen Patientenausdruck erstellen.
### Anforderungen Workflow 169

Das PS der verordnenden LEI MUSS es dem Nutzer ermöglichen, die Einlöseinformationen (Task.id und AccessCode) als E-Rezept-Token über ein geeignetes Übermittlungsverfahren an eine Apotheke der Wahl zu schicken.

Das Primärsystem MUSS für die Übertragung von E-Rezept-Token ein Verfahren nutzen, dass die sehr hohe Vertraulichkeit des E-Rezept-Tokens und seine Integrität schützt.

Das PS der verordnenden LEI KANN die Auswahl und Verwaltung von herstellenden Apotheken für die Übermittlung der E-Rezept-Einlöseinformationen ermöglichen.

