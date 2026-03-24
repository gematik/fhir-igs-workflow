# FdV-Anforderungen: AuditEvent-Query - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: AuditEvent**](query-api-auditevent.md)
* **FdV-Anforderungen: AuditEvent-Query**

## FdV-Anforderungen: AuditEvent-Query

Diese Seite beschreibt Anforderungen ein E-Rezept-FdV zur Nutzung der `AuditEvent`-Query-Endpunkte.

Das E-Rezept-FdV MUSS im Anwendungsfall "Protokolldaten anzeigen" zum Abrufen der Protokolleinträge vom TI-Flow-Fachdienst die HTTP-Operation GET /AuditEvent mit
* ACCESS_TOKEN im Authorization-Header
ausführen.
Der Response beinhaltet ein Bundle mit einem searchset von AuditEvent Ressourcen. Eine AuditEvent Ressource beinhaltet die folgenden Informationen (Siehe auch [gemSpec_DM_eRp#A_19296-* - TI-Flow-Fachdienst - Inhalt Protokolleintrag ]):

* ID des Datenobjektes, auf das zugegriffen wurde (AuditEvent.entity.what) Das entspricht der Task-ID oder MedicationDispense-ID
* Rezept-ID (AuditEvent.entity.description)
* lesbarer Beschreibung in einfacher Sprache (AuditEvent.text)
* Name des Zugreifenden (AuditEvent.agent.who)
* Zeitpunkt des Zugriffs (AuditEvent.recorded)
* Ergebnis der aufgerufenen Operation (AuditEvent.outcome)

Das E-Rezept-FdV kann es dem Nutzer über einen Link in der Anzeige ermöglichen, die Details zum referenzierten E-Rezept anzuzeigen.

* AuditEvent-Einträge enthalten personenbezogene Protokolldaten und sind entsprechend vertraulich zu behandeln.
* `OperationOutcome` aus Query-Aufrufen ist im Client als konkrete Handlungsanweisung darzustellen.

