# Server-Anforderungen: Subscription-Query - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Subscription**](query-api-subscription.md)
* **Server-Anforderungen: Subscription-Query**

## Server-Anforderungen: Subscription-Query

Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für den Subscription-Query-Endpunkt.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf die /Subscription Ressource sicherstellen, dass ausschließlich Nutzer in der Rolle oid_oeffentliche_apotheke oid_krankenhausapotheke oid_kostentraeger die Operation am TI-Flow-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Subscription nicht durch Unberechtigte registriert werden kann.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf die /Subscription Ressource mit einem Response antworten, welcher eine Subscription Ressource mit Pseudonym der Telematik-ID in id aktueller Timestamp + 12 h in end Bearer Token in Authorization enthält.

Der TI-Flow-Fachdienst MUSS das Pseudonym innerhalb der VAU mittels eines 128-Bit-AES-CMAC-Schlüssels erstellen und hexadezimal kodieren (32 Byte lang) (vgl gemSpec_Krypt#A_20163).

Der TI-Flow-Fachdienst MUSS den AES-CMAC-Schlüssel zur Pseudonymgenerierung regelmäßig mindestens alle 3 Monate ändern.

Der TI-Flow-Fachdienst MUSS für die Registrierung der Subscription einen Bearer-Token mit den Claims
* subscriptionid: Pseudonym der Telematik-ID
* iAt: Timestamp wann Subscription erstellt wurde 
* exp: Timestamp Ablauf der Subscription </ul> erstellen und mit einer Identität des TI-Flow-Fachdienstes signieren (Signature Algortihm: ES256). </requirement>       Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf die /Subscription Ressource durch eine abgebende Leistungserbringerinstitution (Apotheke), diese anhand der Telematik-ID aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in der Ressource im Element criteria Attribut receipient hinterlegte Telematik-ID prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich die Apotheke für sich selbst eine Subscription registrieren kann.  

