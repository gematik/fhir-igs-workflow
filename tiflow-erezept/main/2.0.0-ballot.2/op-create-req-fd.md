# FD-Anforderungen $create - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $create (Task erzeugen)**](op-create.md)
* **FD-Anforderungen $create**

## FD-Anforderungen $create

Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$create`.

### Anforderungen aus der Core Spezifikation

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$create`.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS beim Erzeugen eines Tasks mittels HTTP-POST/$create-Operation die zeta-user-info.professionOID des Nutzers bestimmen und sicherstellen, dass ausschließlich Nutzer in der Rolle
* oid_praxis_arzt
* oid_zahnarztpraxis
* oid_praxis_psychotherapeut
* oid_krankenhaus
* oid_institution-vorsorge-reha
die Operation im Fachdienst aufrufen und bei Abweichungen die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_AUTH_ROLE_NOT_ALLOWED
* HTTP-Code: Details Text
  * 403 - Forbidden: Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern

abbrechen, damit Workflows nicht durch zur Verordnung Unberechtigte erstellt werden können.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Erzeugen eines Tasks mittels HTTP-POST/$create-Operation die im Body der HTTP-POST-Operation auf die Ressource Task übertragenen Parameter gegen das Schema http://gematik.de/fhir/erp/OperationDefinition/CreateOperationDefinition prüfen und bei Nicht-Konformität die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: SVC_VALIDATION_FAILED
* HTTP-Code: Details Text
  * 400 - Bad Request: FHIR Profile Validation Failed

abbrechen, damit kein Schadcode und keine "fachfremden" Daten in den TI-Flow-Fachdienst hochgeladen werden.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Erzeugen eines Tasks mittels HTTP-POST/$create-Operation den Parameter workflowType (Rezepttyp) aus dem HTTP-Body des POST-Requests entnehmen, als Attribut Task.extension:flowType des zu erstellenden Tasks verwenden und bei Fehlen bzw. Nicht-Konformität des Parameters den Request als unzulässig abweisen, damit auf Basis dieser Parameter ausschließlich gültige Workflows gestartet werden können und dem Versicherten bei Einsicht des Tasks der Weg in entweder eine Apotheke oder ein Sanitätshaus oder eine andere zuständige Einrichtung gewiesen werden kann.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Anlegen eines neuen Tasks eine Rezept-ID gemäß der Bildungsregel in [IG-TIFLOW-CORE-A357] generieren und als Identifier mit Namingsystem https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PrescriptionId dem Task hinzufügen und sicherstellen, dass diese Rezept-ID innerhalb von 11 Jahren nach ihrer Erzeugung nicht erneut vergeben wird, damit es innerhalb der Aufbewahrungsfrist der Abrechnungsdaten bei den Krankenkassen zu keinen Dubletten kommt.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Erzeugen des ersten Tasks aller Workflowtypen sicherstellen, dass der 12-stellige Zählerstand der Rezept-ID gleich 010.000.000.000 ist.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Erzeugen eines neuen Tasks sicherstellen, dass die Rezept-ID je Workflowtyp sequentiell aufsteigend erzeugt wird.

funkt. Eignung: HerstellererklärungDer TI-Flow-Fachdienst MUSS beim Erzeugen eines neuen Tasks die Rezept-ID, welche mit Task an das verordnende Primärsystem übermittelt wird, als Task-ID verwenden.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS beim Erzeugen eines Tasks mittels HTTP-POST/$create-Operation eine 256 Bit Zufallszahl mit einer Mindestentropie von 120 Bit erzeugen, hexadezimal kodieren ([0-9a-f]{64}) und diese im zu speichernden Task als externe ID in Task.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode hinzufügen, damit nachfolgende Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS die zulässige Anlage eines Tasks mittels HTTP-POST/$create-Operation im Status Task.status = draft vollziehen und beim erfolgreichen Abschluss der Operation die angelegte Ressource Task im HTTP-Body der HTTP-Response zurückgeben, damit die verordnende Leistungserbringerinstitution die generierte Rezept-ID für die QES verwenden kann.
### Modulspezifische Anforderungen

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Erzeugen eines Tasks die Felder Task.performerType und Task.PrescriptionType.valueCoding.display entsprechend dem übergebenen, gültigen Parameter Task.extension:flowType belegen.
Die Belegung ergibt sich workflow-typ abhängig aus den [Prozessparametern](./op-activate-req-fd.md).

