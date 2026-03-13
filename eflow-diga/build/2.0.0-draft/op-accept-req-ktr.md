# Anforderungen an das Clientsystem des Kostenträger für die $accept-Operation - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

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

