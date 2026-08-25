# AVS-Anforderungen: Task-Query - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Task**](query-api-task.md)
* **AVS-Anforderungen: Task-Query**

## AVS-Anforderungen: Task-Query

Diese Seite beschreibt Anforderungen an das AVS zur Nutzung der `Task`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-query-api.html)

### Modulspezifische Anforderungen

#### E-Rezepte von Versicherten abrufen (PoPP)

Mit diesem Anwendungsfall kann die abgebende LEI die Zugriffsinformationen zu allen einlösbaren E-Rezepten von einem Versicherten, dessen eGK mit einem im Rahmen von PoPP zulässigen Kartenlesegerät eingelesen wurde, vom TI-Flow-Fachdienst abrufen.

funkt. Eignung: HerstellererklärungDas PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" einen PoPP-Token vom PoPP-Service abrufen.
Für die Umsetzung siehe [spec-ilf-popp-client](https://github.com/gematik/spec-ilf-popp-client/tree/main).

Hinweis: Im Response des PoPP-Service erhält das PS den PoPP-Token im JWT Compact Serialization Format (siehe [gemSpec_PoPP_Service]#A_26432). Das PS gibt den PoPP-Token im gleichen Format an den TI-Flow-Fachdienst weiter.

funkt. Eignung: HerstellererklärungDas PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" die HTTP-Operation GET /Task mit
* PoPP-Token in HTTP-Header X-PoPP-Token
ausführen.
Im Response ist eine Liste von Tasks enthalten. Für jeden Task sind u.a. folgende Informationen enthalten: Task-ID und AccessCode.

Auf Basis dieser Informationen können die Verordnungsdatensätze zu den E-Rezepten vom TI-Flow-Fachdienst abgerufen werden. Erst dann sind die Inhalte der Verordnungen im AVS bekannt und können mit dem Versicherten abgestimmt werden.

Abgerufene Rezepte, welche nicht durch die Apotheke beliefert werden, müssen durch die Apotheke zurückgegeben (Anwendungsfall "E-Rezept durch Abgebenden zurückgeben") werden.

funkt. Eignung: HerstellererklärungDas PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" den Nutzer geeignet unterstützen, heruntergeladene und damit reservierte E-Rezepte, welche nicht beliefert werden, wieder zurückzugeben, um dem Versicherten zu ermöglichen, diese in einer anderen Apotheke einzulösen.

