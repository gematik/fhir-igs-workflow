# Server-Anforderungen: Task-Query - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Task**](query-api-task.md)
* **Server-Anforderungen: Task-Query**

## Server-Anforderungen: Task-Query

# FD-Anforderungen: Query API Task

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task sicherstellen, dass ausschließlich Versicherte und Leistungserbringer in der Rolle oid_versicherter oid_oeffentliche_apotheke oid_krankenhausapotheke die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte ausgelesen werden können.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task die dem Versicherten zugeordneten Task-Ressourcen anhand der KVNR des Versicherten aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, die in Task.for die entsprechende KVNR des begünstigten Patienten referenziert haben, damit ausschließlich Versicherte ihre eigenen E-Rezepte einsehen können.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task die gültige Ergebnisliste der Task-Ressourcen ohne die referenzierten, signierten E-Rezept-Bundle an den Aufrufer zurückgeben, damit der Versicherte eine Übersicht aller Tasks erhält.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen konkreten über <id> adressierten /Task/<id> (ohne die Referenz einer FHIR-Operation) sicherstellen, dass ausschließlich Clientsysteme in einer der Rollen oid_versicherter oid_oeffentliche_apotheke oid_krankenhausapotheke oid_kostentraeger die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte ausgelesen werden können.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen /Task/<id> und Ungleichheit der KVNR des Aufrufenden (KVNR des ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests UNGLEICH KVNR in Task.for ) prüfen, ob der im HTTP-Request-Header "X-AccessCode" oder URL-Parameter "?ac=..." übergebene AccessCode gleich dem AccessCode in Task.identifier ist, damit auch Vertreter in Kenntnis des AccessCodes ein einzelnes E-Rezept einsehen können.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen /Task/<id> durch einen Versicherten, wenn Task.extension:flowType = 169 oder 209 und die KVNR des Aufrufenden (KVNR des ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests) ungleich der KVNR in Task.for ist, mit dem Fehler 403 abbrechen.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen /Task/<id> durch einen Versicherten die einzelne Task-Ressource um das referenzierte, serverseitig signierte E-Rezept-Bundle aus Task.input mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 2 als search.include im Ergebnis-Bundle an den Aufrufer zurückgeben, damit der Versicherte eine vollständige Einsicht in den Task und den signierten Verordnungsdatensatz für eigene Dokumentationszwecke erhält.

Der E-Rezept-Fachdienst MUSS beim Aufruf der Operation GET /Task und GET /Task/<id> durch einen Versicherten oid_versicherter ein optional vorhandenes Task.identifier:Secret als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret aus dem zurückgegebenen Task entfernen, sodass Versicherte nicht in Kenntnis des Secrets gelangen, welches die Prozesshoheit des Apothekers darstellt.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task/<id> ausschließlich solchen Clients die AccessCode Information (Task.identifier mit system="https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode" ) in den Task-Ressourcen zurückgeben, welche anhand der mitgeteilten, gültigen Produktidentifikation als hierfür zulässige Clients erkannt werden.

Der E-Rezept-Fachdienst DARF den AccessCode beim Zugriff durch den Versicherten NICHT an das E-Rezept-Frontend des Versicherten herausgeben, wenn der Flowtype des Tasks den Wert für die Workflowsteuerung durch Leistungserbringer enthält (169, 209).

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen Task mittels "/Task/<id>?ac=..." durch eine abgebende LEI die zum referenzierten Task in Task.owner gespeicherte Telematik-ID der abgebenden LEI mit der Telematik-ID aus dem ACCESS_TOKEN vergleichen und bei Ungleichheit die Operation mit dem HTTP-Fehlercode 412 abbrechen, damit der Zugriff auf diesen Datensatz nur durch Berechtigte erfolgt.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen Task mittels "/Task/<id>?ac=..." durch eine abgebende LEI den im URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten Task gespeicherten AccessCode Task.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCode erfolgen.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen Task mittels "/Task/<id>?ac=..." durch eine abgebende LEI den im referenzierten Task gespeicherten Status Task.status prüfen und mit dem Fehler 412 abbrechen, wenn Task.status ungleich "in-progress", damit der Datensatz nur abgerufen werden, kann, wenn sich die Verordnung in Belieferung befindet.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen Task mittels "/Task/<id>?ac=..." durch eine abgebende LEI den Task mit dem Geheimnis Task.identifier:Secret sowie im Bundle mit dem in Task.input mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 1 referenzierten QES-Datensatz als Binary-Ressource https://www.hl7.org/fhir/binary.html an den Aufrufer zurückgeben.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen Task mittels "/Task/<id>?secret=..." durch einen Apotheker den Task, sofern er den Status "completed" hat, um das referenzierte, serverseitig signierte Quittungs-Bundle aus Task.output mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 3 als search.include im Ergebnis-Bundle ergänzen und die Ergebnismenge Task + Quittungs-Bundle an den Apotheker zurückgeben, damit ein Apotheker, der ein konkretes E-Rezept beliefert hat, bei Bedarf genau dieses belieferte E-Rezept inkl. der Quittung erneut abrufen kann.

Der E-Rezept-Fachdienst MUSS beim Aufruf der Operation GET /Task/<id> durch einen Versicherten mit der Rolle oid_versicherter, sofern die KVNR des Aufrufenden ungleich der KVNR in Task.for ist, den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.vertreter" und den Versicherten mit der KVNR = Task.for initiieren.

