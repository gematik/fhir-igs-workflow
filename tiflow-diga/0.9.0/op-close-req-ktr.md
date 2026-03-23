# Anforderungen an das Clientsystem des Kostenträger für die $close-Operation - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v0.9.0

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* [**Operation: $close**](op-close.md)
* **Anforderungen an das Clientsystem des Kostenträger für die $close-Operation**

## Anforderungen an das Clientsystem des Kostenträger für die $close-Operation

Diese Seite enthält die normativen Anforderungen an ein Clientsystem des Kostenträgers für die Operation `$close`.

### Anforderungen aus der Core Spezifikation

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an Clientsysteme für die Nutzung der Operation `$close`.

Das Clientsystem Kostenträger MUSS den Anwendungsfall "Quittung abrufen" für Verordnungen, welche abschließend verarbeitet wurden, ausführen, um den Workflow am E-Rezept-Fachdienst abzuschließen.
Die Erstellung der MedicationDispense erfolgt modulspezifisch.

Das Clientsystem Kostenträger MUSS im Anwendungsfall "Quittung abrufen" für zum Abschliessen des Workflows für die Verordnung die HTTP-Operation POST /Task/<id>/$close mit
* ACCESS_TOKEN im Authorization-Header
* Task-ID in URL <id>
* Geheimnis in URL-Parameter ?secret=
* MedicationDispense
ausführen.
### Modulspezifische Anforderungen

Das Clientsystem des Kostenträgers MUSS im Anwendungsfall "Quittung abrufen" eine FHIR-Ressource mit dem Profil GEM_ERP_PR_MedicationDispense_DiGA erstellen.

