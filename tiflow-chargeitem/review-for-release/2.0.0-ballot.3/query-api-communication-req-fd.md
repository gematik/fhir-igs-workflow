# FD-Anforderungen: Communication-Query - Implementation Guide TIFlow - Abrechnungsinformationen v2.0.0-ballot.3

Implementation Guide

TIFlow - Abrechnungsinformationen

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: Communication**](query-api-communication.md)
* **FD-Anforderungen: Communication-Query**

## FD-Anforderungen: Communication-Query

Diese Seite beschreibt Anforderungen am TI-Flow-Fachdienst zur Nutzung der `Communication`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-query-api.html)

### Modulspezifische Anforderungen

#### POST /Communication

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Einstellen einer Nachricht der Profile GEM_ERPCHRG_PR_Communication_ChargChangeReq oder GEM_ERPCHRG_PR_Communication_ChargChangeReply über die HTTP-Operation POST auf den Endpunkt /Communication prüfen und, wenn Communication.basedOn eine nicht existierende ChargeItem Ressource referenziert, mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_CHARGEITEM_NOT_FOUND
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen, um Spam und nicht-rezeptbezogene Kommunikation zu verhindern.

