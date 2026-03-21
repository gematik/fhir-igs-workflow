# FD-Anforderungen $create - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $create (Task erzeugen)**](op-create.md)
* **FD-Anforderungen $create**

## FD-Anforderungen $create

Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$create`.

### Anforderungen aus der Core Spezifikation

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$create`.

Der E-Rezept-Fachdienst MUSS beim Erzeugen eines Tasks mittels HTTP-POST/$create-Operation die Rolle "professionOID" des Aufrufenden im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich verordnende Leistungserbringer in der Rolle
* oid_praxis_arzt
* oid_zahnarztpraxis
* oid_praxis_psychotherapeut
* oid_krankenhaus
* oid_institution-vorsorge-reha
die Operation im Fachdienst aufrufen dürfen, damit E-Rezepte nicht durch zur Verordnung Unberechtigte eingestellt werden können.

Der E-Rezept-Fachdienst MUSS die im Body der HTTP-POST-Operation auf die Ressource Task übertragenen Parameter gegen das Schema http://gematik.de/fhir/erp/OperationDefinition/CreateOperationDefinition prüfen und bei Nicht-Konformität das Anlegen der Ressource im Fachdienst mit dem http-Status-Code 400 beantworten, damit kein Schadcode und keine "fachfremden" Daten in den E-Rezept-Fachdienst hochgeladen werden.

Der E-Rezept-Fachdienst MUSS beim Erzeugen eines Tasks mittels HTTP-POST/$create-Operation den Parameter workflowType (Rezepttyp) aus dem HTTP-Body des POST-Requests entnehmen, als Attribut Task.extension:flowType des zu erstellenden Tasks verwenden und bei Fehlen bzw. Nicht-Konformität des Parameters den Request als unzulässig abweisen, damit auf Basis dieser Parameter ausschließlich gültige Workflows gestartet werden können und dem Versicherten bei Einsicht des Tasks der Weg in entweder eine Apotheke oder ein Sanitätshaus oder eine andere zuständige Einrichtung gewiesen werden kann.

Der E-Rezept-Fachdienst MUSS beim Erzeugen eines Tasks das Feld Task.performerType aus dem übergebenen, gültigen Parameter Task.extension:flowType gemäß der Prozessparameter [gemSpec_DM_eRp#A_19445-*] übernehmen.

Der E-Rezept-Fachdienst MUSS beim Anlegen eines neuen Tasks eine Rezept-ID gemäß der Bildungsregel [gemSpec_DM_eRp#A_19217-*] generieren und als Identifier mit Namingsystem https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PrescriptionId dem Task hinzufügen und sicherstellen, dass diese Rezept-ID innerhalb von 11 Jahren nach ihrer Erzeugung nicht erneut vergeben wird, damit es innerhalb der Aufbewahrungsfrist der Abrechnungsdaten bei den Krankenkassen zu keinen Dubletten kommt.

Der E-Rezept-Fachdienst MUSS beim Erzeugen eines neuen Tasks die Rezept-ID, welche mit Task an das verordnende Primärsystem übermittelt wird, als Task-ID verwenden.

Der E-Rezept-Fachdienst MUSS beim Erzeugen eines Tasks mittels HTTP-POST/$create-Operation eine 256 Bit Zufallszahl mit einer Mindestentropie von 120 Bit erzeugen, hexadezimal kodieren ([0-9a-f]{64}) und diese im zu speichernden Task als externe ID in Task.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode hinzufügen, damit nachfolgende Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.

Der E-Rezept-Fachdienst MUSS die zulässige Anlage eines Tasks mittels HTTP-POST/$create-Operation im Status Task.status = draft vollziehen und beim erfolgreichen Abschluss der Operation die angelegte Ressource Task im HTTP-Body der HTTP-Response zurückgeben, damit die verordnende Leistungserbringerinstitution die generierte Rezept-ID für die QES verwenden kann.
### Modulspezifische Anforderungen

