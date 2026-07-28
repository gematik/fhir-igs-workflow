# Anforderungen an das Clientsystem des Kostenträger für die $reject-Operation - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* [**Operation: $reject**](op-reject.md)
* **Anforderungen an das Clientsystem des Kostenträger für die $reject-Operation**

## Anforderungen an das Clientsystem des Kostenträger für die $reject-Operation

Diese Seite enthält die normativen Anforderungen an ein Clientsystem des Kostenträgers für die Operation `$reject`.

### Anforderungen aus der Core Spezifikation

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an Clientsysteme für die Nutzung der Operation `$reject`.

funkt. Eignung: HerstellererklärungDas Clientsystem Kostenträger MUSS im Anwendungsfall "Verordnung durch Clientsystem zurückgeben" für die zurückzugebende Verordnung die HTTP-Operation POST /Task/<id>/$reject mit
* Task-ID in URL <id> 
* Geheimnis in URL-Parameter ?secret=
ausführen.

funkt. Eignung: HerstellererklärungDas Clientsystem Kostenträger MUSS im Anwendungsfall "Verordnung durch Clientsystem zurückgeben" für die zurückzugebende Verornung nach erfolgreichem Aufruf der Operation "Eine Verordnung zurückweisen" die Daten zu Verordnung, E-Rezept-Token und das Geheimnis im CS löschen.
### Modulspezifische Anforderungen

Es gibt keine modulspezifischen Anforderungen.

