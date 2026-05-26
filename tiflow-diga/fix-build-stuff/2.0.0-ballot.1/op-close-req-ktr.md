# Anforderungen an das Clientsystem des Kostenträger für die $close-Operation - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.1

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* [**Operation: $close**](op-close.md)
* **Anforderungen an das Clientsystem des Kostenträger für die $close-Operation**

## Anforderungen an das Clientsystem des Kostenträger für die $close-Operation

Diese Seite enthält die normativen Anforderungen an ein Clientsystem des Kostenträgers für die Operation `$close`.

### Anforderungen aus der Core Spezifikation

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an Clientsysteme für die Nutzung der Operation `$close`.

funkt. Eignung: HerstellererklärungDas Clientsystem Kostenträger MUSS den Anwendungsfall "Quittung abrufen" für Verordnungen, welche abschließend verarbeitet wurden, ausführen, um den Workflow am TI-Flow-Fachdienst abzuschließen.
Die Erstellung der MedicationDispense erfolgt modulspezifisch.

funkt. Eignung: HerstellererklärungDas Clientsystem Kostenträger MUSS im Anwendungsfall "Quittung abrufen" für zum Abschliessen des Workflows für die Verordnung die HTTP-Operation POST /Task/<id>/$close mit
* Task-ID in URL <id>
* Geheimnis in URL-Parameter ?secret=
* GEM_ERP_PR_PAR_CloseOperation_Input-Objekt
ausführen.
### Modulspezifische Anforderungen

funkt. Eignung: KonformitätsbestätigungDas Clientsystem des Kostenträgers MUSS im Anwendungsfall "Quittung abrufen" eine FHIR-Ressource mit dem Profil GEM_ERP_PR_MedicationDispense_DiGA erstellen.

