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

Das Clientsystem MUSS den Anwendungsfall "UC 4.2 - E-Rezept durch Abgebenden zurückgeben" gemäß TAB_ILFERP_008 umsetzen.

* Name: Auslöser
  * Verordnung durch Abgebenden zurückgeben: Aufruf des Anwendungsfalls in der UI oder automatisierte Verarbeitung
* Name: Akteur
  * Verordnung durch Abgebenden zurückgeben: Mitarbeiter des Kostenträgers
* Name: Vorbedingung
  * Verordnung durch Abgebenden zurückgeben: * Der Kostenträger hat die Verordnung vom Fachdienst heruntergeladen und es befindet sich im Status "in-progress".
* Der Nutzer hat die Verordnung zum Zurückgeben markiert und das Zurückgeben bestätigt.
* Das Clientsystem hat sich gegenüber der TI authentisiert.

* Name: Nachbedingung
  * Verordnung durch Abgebenden zurückgeben: Der Workflow der Verordnung hat auf dem Fachdienst den Status "ready"
* Name: Standardablauf
  * Verordnung durch Abgebenden zurückgeben: 1. Task-ID und Geheimnis der Verordnung bestimmen
1. Verordnung Status auf Fachdienst ändern
1. Verordnung und E-Rezept-Token im CS löschen


**Tabelle: **TAB_ILFERP_008 - Verordnung durch Clientsystem zurückgeben

Das Clientsystem Kostenträger MUSS im Anwendungsfall "Verordnung durch Clientsystem zurückgeben" für die zurückzugebende Verordnung die HTTP-Operation POST /Task/<id>/$reject mit
* ACCESS_TOKEN im Authorization-Header
* Task-ID in URL <id> 
* Geheimnis in URL-Parameter ?secret=
ausführen.

Das Clientsystem Kostenträger MUSS im Anwendungsfall "Verordnung durch Clientsystem zurückgeben" für das zurückzugebende E-Rezept nach erfolgreichem Aufruf der Operation "Eine Verordnung zurückweisen" die Daten zu Verordnung, E-Rezept-Token und das Geheimnis im CS löschen.
### Modulspezifische Anforderungen

Es gibt keine modulspezifischen Anforderungen.

