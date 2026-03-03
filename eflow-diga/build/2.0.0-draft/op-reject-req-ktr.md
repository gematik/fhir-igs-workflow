# Anforderungen an das Clientsystem des Kostenträger für die $reject-Operation - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* [**Operation: $reject**](op-reject.md)
* **Anforderungen an das Clientsystem des Kostenträger für die $reject-Operation**

## Anforderungen an das Clientsystem des Kostenträger für die $reject-Operation

Diese Seite enthält die normativen Anforderungen an ein Clientsystem des Kostenträgers für die Operation `$reject`.

### Anforderungen aus der Core Spezifikation

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an Clientsysteme für die Nutzung der Operation `$reject`.

Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, ein E-Rezept zum Zurückgeben auszuwählen.

Das PS der abgebenden LEI MUSS vom Nutzer eine Bestätigung einholen, dass das ausgewählte E-Rezept zurückgegeben werden soll und die Möglichkeit geben, das Zurückgeben abzubrechen.

Das PS der abgebenden LEI MUSS den Anwendungsfall "UC 4.2 - E-Rezept durch Abgebenden zurückgeben" gemäß TAB_ILFERP_008 umsetzen.

* Name: Auslöser
  * E-Rezept durch Abgebenden zurückgeben: Aufruf des Anwendungsfalls in der UI
* Name: Akteur
  * E-Rezept durch Abgebenden zurückgeben: Leistungserbringer, Mitarbeiter der abgebenden LEI
* Name: Vorbedingung
  * E-Rezept durch Abgebenden zurückgeben: * Die LEI hat das E-Rezept vom E-Rezept-Fachdienst heruntergeladen und es befindet sich im Status "in-progress".
* Der Nutzer hat ein E-Rezept zum Zurückgeben markiert und das Zurückgeben bestätigt.
* Die LEI hat sich gegenüber der TI authentisiert.

* Name: Nachbedingung
  * E-Rezept durch Abgebenden zurückgeben: Das ausgewählte E-Rezept hat auf dem E-Rezept-Fachdienst den Status "ready"
* Name: Standardablauf
  * E-Rezept durch Abgebenden zurückgeben: 1. Task-ID und Geheimnis des E-Rezepts bestimmen
1. E-Rezept Status auf Fachdienst ändern
1. E-Rezept und E-Rezept-Token in PS löschen


**Tabelle: **TAB_ILFERP_008 - E-Rezept durch Abgebenden zurückgeben

Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezept durch Abgebenden zurückgeben" für das zurückzugebende E-Rezept die HTTP-Operation POST /Task/<id>/$reject mit
* ACCESS_TOKEN im Authorization-Header
* Task-ID in URL <id> 
* Geheimnis in URL-Parameter ?secret=
ausführen.

Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezept durch Abgebenden zurückgeben" für das zurückzugebende E-Rezept nach erfolgreichem Aufruf der Operation "Ein E-Rezept zurückweisen" die Daten zum E-Rezept, E-Rezept-Token und das Geheimnis im PS löschen.
### Modulspezifische Anforderungen

Es gibt keine modulspezifischen Anforderungen.

