# KTR-Anforderungen $reject - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - draft 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $reject (Task zurückweisen)**](op-reject.md)
* **KTR-Anforderungen $reject**

## KTR-Anforderungen $reject

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an Clientsysteme für die Nutzung der Operation `$reject`.

funkt. Eignung: HerstellererklärungDas Clientsystem Kostenträger MUSS im Anwendungsfall "Verordnung durch Clientsystem zurückgeben" für die zurückzugebende Verordnung die HTTP-Operation POST /Task/<id>/$reject mit
* Task-ID in URL <id> 
* Geheimnis in URL-Parameter ?secret=
ausführen.

funkt. Eignung: HerstellererklärungDas Clientsystem Kostenträger MUSS im Anwendungsfall "Verordnung durch Clientsystem zurückgeben" für die zurückzugebende Verornung nach erfolgreichem Aufruf der Operation "Eine Verordnung zurückweisen" die Daten zu Verordnung, E-Rezept-Token und das Geheimnis im CS löschen.

