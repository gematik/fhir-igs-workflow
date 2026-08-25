# AVS-Anforderungen: Communication-Query - Implementation Guide TIFlow - Abrechnungsinformationen v2.0.0-ballot.3

Implementation Guide

TIFlow - Abrechnungsinformationen

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: Communication**](query-api-communication.md)
* **AVS-Anforderungen: Communication-Query**

## AVS-Anforderungen: Communication-Query

Diese Seite beschreibt Anforderungen ein AVS zur Nutzung der `Communication`-Query-Endpunkte für "Bereitstellung von Abrechnungsinformationen für PKV-Versicherte".

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-query-api.html)

### Modulspezifische Anforderungen

#### Nachricht versenden

funkt. Eignung: HerstellererklärungDas PS der abgebenden LEI (Apotheke) MUSS im Anwendungsfall "Nachricht an Versicherten versenden" bezüglich dem Änderungswunsch einer Abrechnungsinformation eine Communication Ressource mit dem Profil GEM_ERPCHRG_PR_Communication_ChargChangeReply erstellen.

