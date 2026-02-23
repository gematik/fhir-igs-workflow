# FD-Anforderungen: AuditEvent-Query - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: AuditEvent**](query-api-auditevent.md)
* **FD-Anforderungen: AuditEvent-Query**

## FD-Anforderungen: AuditEvent-Query

# FD-Anforderungen: Query API AuditEvent

Diese Seite enthaelt die normativen Anforderungen an den E-Rezept-Fachdienst fuer die AuditEvent-Query-Endpunkte.

Der E-Rezept-Fachdienst MUSS alle Zugriffe auf die Ressource AuditEvent mittels der HTTP-Operationen PUT, PATCH, HEAD, DELETE und POST unterbinden, damit keine unzulässigen Operationen auf den Protokolldaten ausgeführt werden können.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /AuditEvent und auf einen konkreten über <id> adressierten /AuditEvent/<id> sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezept-Protokolleinträge nicht durch Unberechtigte ausgelesen werden können.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /AuditEvent die dem Versicherten zugeordneten AuditEvent-Ressourcen anhand der KVNR des Versicherten im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, die in AuditEvent.entity.name die entsprechende KVNR des begünstigten Patienten referenziert haben, damit ausschließlich Versicherte ihre eigenen E-Rezept-Protokolleinträge einsehen können.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /AuditEvent die Ergebnisliste der AuditEvent-Ressourcen bei mehr als einem Eintrag als Ergebnis-Bundle an den Aufrufer zurückgeben, damit der Versicherte eine vollständige Einsicht in das Zugriffsprotokoll erhält.

