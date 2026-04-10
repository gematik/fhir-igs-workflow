# Server-Anforderungen: Subscription-Query - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Subscription**](query-api-subscription.md)
* **Server-Anforderungen: Subscription-Query**

## Server-Anforderungen: Subscription-Query

Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für den Subscription-Query-Endpunkt.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf die /Subscription Ressource die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Nutzer in der Rolle
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
* oid_kostentraeger
die Operation am TI-Flow-Fachdienst aufrufen dürfen, und bei Abweichungen die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_AUTH_ROLE_NOT_ALLOWED
* HTTP-Code: Details Text
  * 403 - Forbidden: Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern

abbrechen, damit eine Subscription nicht durch Unberechtigte registriert werden kann.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf die /Subscription Ressource mit einem Response antworten, welcher eine Subscription Ressource mit Pseudonym der Telematik-ID in id aktueller Timestamp + 12 h in end Bearer Token in Authorization enthält.

Der TI-Flow-Fachdienst MUSS das Pseudonym innerhalb der VAU mittels eines 128-Bit-AES-CMAC-Schlüssels erstellen und hexadezimal kodieren (32 Byte lang) (vgl gemSpec_Krypt#A_20163).

Der TI-Flow-Fachdienst MUSS den AES-CMAC-Schlüssel zur Pseudonymgenerierung regelmäßig mindestens alle 3 Monate ändern.

Der TI-Flow-Fachdienst MUSS für die Registrierung der Subscription einen Bearer-Token mit den Claims
* subscriptionid: Pseudonym der Telematik-ID
* iAt: Timestamp wann Subscription erstellt wurde 
* exp: Timestamp Ablauf der Subscription </ul> erstellen und mit einer Identität des TI-Flow-Fachdienstes signieren (Signature Algortihm: ES256). </requirement>       Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf die /Subscription Ressource durch eine abgebende Institution, diese anhand der Telematik-ID aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in der Ressource im Element criteria Attribut receipient hinterlegte Telematik-ID prüfen und bei Ungleichheit die Operation mit dem folgenden Fehler: 

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: SVC_IDENTITY_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: Identity mismatch: Access token does not match FHIR data (Telematik-ID)

 abbrechen, damit eine abgebende Institution ausschließlich für sich selbst eine Subscription registrieren kann.  

