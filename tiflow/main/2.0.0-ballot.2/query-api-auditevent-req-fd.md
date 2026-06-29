# Server-Anforderungen: AuditEvent-Query - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: AuditEvent**](query-api-auditevent.md)
* **Server-Anforderungen: AuditEvent-Query**

## Server-Anforderungen: AuditEvent-Query

Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für die AuditEvent-Query-Endpunkte.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS alle Zugriffe auf die Ressource AuditEvent mittels der HTTP-Operationen PUT, PATCH, HEAD, DELETE und POST unterbinden und mit mit dem HTTP-Code "405 - Method Not Allowed" abbrechen, damit keine unzulässigen Operationen werden können.
### GET /AuditEvent

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /AuditEvent und auf einen konkreten über <id> adressierten /AuditEvent/<id> die zeta-user-info.professionOID des Nutzers bestimmen und sicherstellen, dass ausschließlich Nutzer in der Rolle
* oid_versicherter
die Operation am Fachdienst aufrufen und bei Abweichungen die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_AUTH_ROLE_NOT_ALLOWED
* HTTP-Code: Details Text
  * 403 - Forbidden: Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern

abbrechen, damit Protokolleinträge nicht durch Unberechtigte ausgelesen werden können.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /AuditEvent die dem Versicherten zugeordneten AuditEvent-Ressourcen anhand des identifier des Nutzers (KVNR) identifizieren, die in AuditEvent.entity.name die entsprechende KVNR des begünstigten Patienten referenziert haben, damit ausschließlich Versicherte ihre eigenen Protokolleinträge einsehen können.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /AuditEvent die Ergebnisliste der AuditEvent-Ressourcen bei mehr als einem Eintrag als Ergebnis-Bundle an den Aufrufer zurückgeben, damit der Versicherte eine vollständige Einsicht in das Zugriffsprotokoll erhält.

