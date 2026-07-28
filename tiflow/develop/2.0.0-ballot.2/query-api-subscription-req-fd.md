# Server-Anforderungen: Subscription - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**Additional API**](menu-schnittstellen-additional-api.md)
* [**Additional API: Subscription**](query-api-subscription.md)
* **Server-Anforderungen: Subscription**

## Server-Anforderungen: Subscription

Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für den Subscription-Endpunkt.

### POST /Subscription – Subscription registrieren

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf die /Subscription Ressource die zeta-user-info.professionOID des Nutzers bestimmen und sicherstellen, dass ausschließlich Nutzer in der Rolle
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
* oid_kostentraeger
die Operation am TI-Flow-Fachdienst aufrufen und bei Abweichungen die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_AUTH_ROLE_NOT_ALLOWED
* HTTP-Code: Details Text
  * 403 - Forbidden: Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern

abbrechen, damit eine Subscription nicht durch Unberechtigte registriert werden kann.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf die /Subscription Ressource durch eine abgebende Institution, diese anhand des zeta-user-info.identifier des Nutzers (Telematik-ID) identifizieren, diese gegen die in der Ressource im Element criteria Attribut receipient hinterlegte Telematik-ID prüfen und bei Ungleichheit die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: SVC_IDENTITY_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: Identity mismatch: Access token does not match FHIR data (Telematik-ID)

abbrechen, damit eine abgebende Institution ausschließlich für sich selbst eine Subscription registrieren kann.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf die /Subscription Ressource mit einem Response antworten, welcher eine Subscription Ressource mit
* Pseudonym der Telematik-ID in id
* aktueller Timestamp + 12 h in end
* Bearer Token in Authorization
enthält.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS das Pseudonym mittels eines 128-Bit-AES-CMAC-Schlüssels erstellen und hexadezimal kodieren (32 Byte lang).
**Hinweis**: Vergleichend kann [gemSpec_Krypt]#A_20163 betrachtet werden.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS den AES-CMAC-Schlüssel zur Pseudonymgenerierung regelmäßig mindestens alle 3 Monate ändern.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS für die Registrierung der Subscription einen Bearer-Token mit den Claims
* subscriptionid: Pseudonym der Telematik-ID
* iAt: Timestamp wann Subscription erstellt wurde
* exp: Timestamp Ablauf der Subscription
erstellen und mit einer Identität des TI-Flow-Fachdienstes signieren (Signature Algortihm: ES256).
### Subscription-Endpunkt (WebSocket)

funkt. Eignung: HerstellererklärungDer TI-Flow-Fachdienst MUSS eine Webschnittstelle anbieten, welche Websocket-Verbindungen mit einer Dauer von bis zu 12 h unterstützt.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS an der Webschnittstelle des Subscription Service auf einen WebSocket-Upgrade-Request eines berechtigten Clients mit dem HTTP-Statuscode 101 Switching Protocols antworten.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS an der Webschnittstelle des Subscription Service beim Verbindungsaufbau prüfen, dass der Client einen zeitlich und kryptographisch gültigen Bearer-Token der Schnittstelle POST /Subscription übermittelt und bei nicht-erfolgreicher Prüfung die Verbindung mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: SVC_INVALID_ACCESS_TOKEN
* HTTP-Code: Details Text
  * 403 - Forbidden: Invalid access token provided

ablehnen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS an der Webschnittstelle des Subscription Service sicherstellen, dass Verbindungen nach Überschreiten des Timestamp Ablauf der Subscription geschlossen werden.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst DARF in der Verbindung zum Subscription Service anfallende Metadaten (Client-IP-Adresse, etc.) NICHT für eine unbefugte Profilbildung der verbundenen Clients verwenden.
Hinweis: Eine Verwendung zur Sicherung der Schnittstelle (DDoS-Schutz, Fehleranalyse in sehr eingeschränktem Maß) ist zulässig (im Sinne einer befugten Profilbildung).

