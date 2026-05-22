# Notifications für Clientsysteme - TIFlow - Kernfunktionalitäten v2.0.0-ballot.1

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* **Notifications für Clientsysteme**

## Notifications für Clientsysteme

Der Subscription Service wird außerhalb der VAU betrieben.

funkt. Eignung: HerstellererklärungDer TI-Flow-Fachdienst MUSS eine Webschnittstelle anbieten, welche Websocket-Verbindungen mit einer Dauer von bis zu 12 h unterstützt.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS an der Webschnittstelle des Subscription Service beim Verbindungsaufbau prüfen, dass der Client einen zeitlich und kryptographisch gültigen Bearer-Token der Schnittstelle GET /Subscription übermittelt und bei nicht-erfolgreicher Prüfung die Verbindung mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: SVC_INVALID_ACCESS_TOKEN
* HTTP-Code: Details Text
  * 403 - Forbidden: Invalid access token provided

ablehnen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS an der Webschnittstelle des Subscription Service beim Verbindungsaufbau ein Upgrade durchführen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS an der Webschnittstelle des Subscription Service sicherstellen, dass Verbindungen nach Überschreiten des Timestamp Ablauf der Subscription geschlossen werden.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst DARF in der Verbindung zum Subscription Service anfallende Metadaten (Client-IP-Adresse, etc.) NICHT für eine unbefugte Profilbildung der verbundenen Clients verwenden.
Hinweis: Eine Verwendung zur Sicherung der Schnittstelle (DDoS-Schutz, Fehleranalyse in sehr eingeschränktem Maß) ist zulässig (im Sinne einer befugten Profilbildung).

