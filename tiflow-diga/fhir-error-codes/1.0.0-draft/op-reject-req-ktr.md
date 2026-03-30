# Anforderungen an das Clientsystem des Kostenträger für die $reject-Operation - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v1.0.0-draft

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* [**Operation: $reject**](op-reject.md)
* **Anforderungen an das Clientsystem des Kostenträger für die $reject-Operation**

## Anforderungen an das Clientsystem des Kostenträger für die $reject-Operation

Diese Seite enthält die normativen Anforderungen an ein Clientsystem des Kostenträgers für die Operation `$reject`.

### Anforderungen aus der Core Spezifikation

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an Clientsysteme für die Nutzung der Operation `$reject`.

Das Clientsystem Kostenträger MUSS im Anwendungsfall "Verordnung durch Clientsystem zurückgeben" für die zurückzugebende Verordnung die HTTP-Operation POST /Task/<id>/$reject mit
* ACCESS_TOKEN im Authorization-Header
* Task-ID in URL <id> 
* Geheimnis in URL-Parameter ?secret=
ausführen.

Das Clientsystem Kostenträger MUSS im Anwendungsfall "Verordnung durch Clientsystem zurückgeben" für das zurückzugebende E-Rezept nach erfolgreichem Aufruf der Operation "Eine Verordnung zurückweisen" die Daten zu Verordnung, E-Rezept-Token und das Geheimnis im CS löschen.
### Modulspezifische Anforderungen

Es gibt keine modulspezifischen Anforderungen.

