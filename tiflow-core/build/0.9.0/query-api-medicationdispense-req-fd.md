# Server-Anforderungen: MedicationDispense-Query - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: MedicationDispense**](query-api-medicationdispense.md)
* **Server-Anforderungen: MedicationDispense-Query**

## Server-Anforderungen: MedicationDispense-Query

Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für den Device-Query-Endpunkt.

Der E-Rezept-Fachdienst MUSS alle Zugriffe auf die Ressource MedicationDispense mittels der HTTP-Operationen PUT, PATCH, HEAD und DELETE sowie POST unterbinden, damit keine unzulässigen Operationen auf den Rezeptdaten ausgeführt werden können.
### GET /MedicationDispense

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /MedicationDispense sicherstellen, dass ausschließlich Nutzer in der Rolle
* oid_versicherter
die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit Dispensierinformationen nicht durch Unberechtigte ausgelesen werden können.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /MedicationDispense die dem Versicherten zugeordneten MedicationDispense-Ressourcen anhand der KVNR des Versicherten im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, die in MedicationDispense.subject die entsprechende KVNR des begünstigten Patienten referenziert haben, damit ausschließlich Versicherte ihre eigenen Dispensierinformationen einsehen können.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /MedicationDispense sicherstellen, dass alle im zurückgegebenen Search-Bundle enthaltenen Ressourcen mit eindeutig identifizierbaren IDs versehen sind und Referenzen innerhalb des Bundles auf eine Ressource mit einer eindeutigen ID verweisen.

Der E-Rezept-Fachdienst MUSS im Anwendungsfall "Abgabeinformationen abrufen" die Suche aller Abgabeinformationen zu einer Verordnung mit dem Aufruf GET /MedicationDispense?identifier=https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId|<PrescriptionID> unterstützten und dabei eines oder mehrere MedicationDispense-Objekte in einem Bundle an den Aufrufenden zurückgeben.
Der E-Rezept-Fachdienst soll eine mögliche Konstellation von Bundles im Ergebnis-Bundle auflösen, sodass das Ergebnis-Bundle ausschließlich MedicationDispense-Objekte enthält, unabhängig davon, ob ein oder mehrere dieser Objekte zu je einem Task gehören.

