# AVS-Anforderungen: Communication-Query - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Communication**](query-api-communication.md)
* **AVS-Anforderungen: Communication-Query**

## AVS-Anforderungen: Communication-Query

Diese Seite beschreibt Anforderungen an das AVS zur Nutzung der `Communication`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-query-api.html)

### Modulspezifische Anforderungen

#### Nachrichten abrufen

siehe [Datenmodell Payload für Communication-Query](./query-api-communication-req-data.md)

#### Nachricht versenden

funkt. Eignung: HerstellererklärungDas PS der abgebenden LEI MUSS sicherstellen, dass die Einbettung einer externen URL ausschließlich für das Einlösen von E-Rezepten in einer externen Bestellplattform genutzt wird.

funkt. Eignung: HerstellererklärungDas PS der abgebenden LEI (Apotheke) MUSS im Anwendungsfall "Nachricht an Versicherten versenden" die Nachricht gemäß der Struktur für Communication-Ressourcen und
* einem communicationType entsprechend der zu übermittelnden Information
* TransactionID aus der empfangenen Nachricht des Versicherten
erstellen.
Für TAB_eRpDM_003 siehe [Datenmodell Payload für Communication-Query](./query-api-communication-req-data.md)

Beispiele für diesen Anwendungsfall stehen im GitHub https://github.com/gematik/interactive-api-erp .

Die Nachrichtenstruktur wird durch die Communication-Ressource und ihre Erweiterungen definiert.

funkt. Eignung: HerstellererklärungDas PS der abgebenden LEI (Apotheke) MUSS im Anwendungsfall "Nachricht an Versicherten versenden" bezüglich der Belieferung eines Arzneimittels eine Communication Ressource mit dem Profil GEM_ERP_PR_Communication_Reply mit
* Versicherten-ID des Absenders der empfangenen Nachricht in recipient
* Task-ID des referenzierten E-Rezeptes in basedOn
* Nachrichten-ID der empfangenen Anfrage in inResponseTo
* Nachricht in payload contentString
erstellen.

