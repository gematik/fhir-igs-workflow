# KTR-Anforderungen $close - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $close (Task schließen)**](op-close.md)
* **KTR-Anforderungen $close**

## KTR-Anforderungen $close

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an Clientsysteme für die Nutzung der Operation `$close`.

Das Clientsystem Kostenträger MUSS den Anwendungsfall "Quittung abrufen" für Verordnungen, welche abschließend verarbeitet wurden, ausführen, um den Workflow am TI-Flow-Fachdienst abzuschließen.
Die Erstellung der MedicationDispense erfolgt modulspezifisch.

Das Clientsystem Kostenträger MUSS im Anwendungsfall "Quittung abrufen" für zum Abschliessen des Workflows für die Verordnung die HTTP-Operation POST /Task/<id>/$close mit
* ACCESS_TOKEN im Authorization-Header
* Task-ID in URL <id>
* Geheimnis in URL-Parameter ?secret=
* MedicationDispense
ausführen.

