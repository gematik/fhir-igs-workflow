# Anforderungen an das Clientsystem des Kostenträger für die $accept-Operation - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v0.9.0

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* [**Operation: $accept**](op-accept.md)
* **Anforderungen an das Clientsystem des Kostenträger für die $accept-Operation**

## Anforderungen an das Clientsystem des Kostenträger für die $accept-Operation

Diese Seite enthält die normativen Anforderungen an ein Clientsystem des Kostenträgers für die Operation `$accept`.

### Anforderungen aus der Core Spezifikation

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an Clientsysteme für die Nutzung der Operation `$activate`.

Das Clientsystem Kostenträger MUSS im Anwendungsfall "Verordnung abrufen" zum Herunterladen des E-Rezepts die HTTP-Operation POST /Task/<id>/$accept mit
* ACCESS_TOKEN im Authorization-Header
* Task-ID in URL <id>
* AccessCode im X-AccessCode-Header oder als URL-Parameter ?ac=
ausführen.
### Modulspezifische Anforderungen

Es gibt keine modulspezifischen Anforderungen.

