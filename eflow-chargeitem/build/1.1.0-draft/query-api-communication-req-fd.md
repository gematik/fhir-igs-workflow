# E-Rezept-Fachdienst Anforderungen: Communication-Query - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: Communication**](query-api-communication.md)
* **E-Rezept-Fachdienst Anforderungen: Communication-Query**

## E-Rezept-Fachdienst Anforderungen: Communication-Query

Diese Seite beschreibt Anforderungen am E-Rezept-Fachdienst zur Nutzung der `Communication`-Query-Endpunkte.

Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht der Profile GEM_ERPCHRG_PR_Communication_ChargChangeReq oder GEM_ERPCHRG_PR_Communication_ChargChangeReply über die HTTP-Operation POST auf den Endpunkt /Communication mit dem http-Status-Code 400 abbrechen, wenn das Pflichtfeld Communication.basedOn einen ChargeItem referenziert, der nicht existiert, um Spam und nicht-rezeptbezogene Kommunikation zu verhindern.

Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht der Profile GEM_ERP_PR_Communication_DispReq, GEM_ERP_PR_Communication_InfoReq oder GEM_ERPCHRG_PR_Communication_ChargChangeReq zur Versicherten-zu-Apotheken-Kommunikation über die HTTP-Operation POST auf den Endpunkt /Communication prüfen, ob für die Telematik-ID des Empfängers Subscriptions registriert sind und für Registrierungen über den Subscription Service eine Notification (ping : subscription-id) senden.

