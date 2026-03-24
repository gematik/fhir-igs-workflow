# Kommunikation zu Diensten der TI - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* **Kommunikation zu Diensten der TI**

## Kommunikation zu Diensten der TI

### Kommunikation zu den Diensten der TI

Clientsysteme nutzen TLS-Verbindungen für die Kommunikation zu den Diensten der TI. Es verbindet sich mit dem TI-Flow-Fachdienst und einem Identity Provider.

Das Clientsystem des TI-Flow-Fachdienstes MUSS für die Kommunikation mit dem TI-Flow-Fachdienst die Endpunkte der Schnittstellen gemäß [gemSpec_FD_eRP#5.1 Servicelokalisierung] nutzen.
Die Abfrage beim Namensdienst der TI erfolgt über einen DNS-Lookup. Hierfür muss der Konnektor als DNS-Resolver konfiguriert sein.

Das Clientsystem des TI-Flow-Fachdienstes MUSS für die Kommunikation mit dem TI-Flow-Fachdienst die URL mit dem Port 443 bilden.
Die Informationen zu den Endpunkten des Identity Providers ermittelt das Primärsystem aus dem Discovery Document. Für Informationen zum Discovery Document siehe auch [gemSpec_IDP_Dienst#Authorization Server Metadata (Discovery Document)]. Das Discovery Document ist vom IDP-Dienst unter der URL /.well-known/openid-configuration abrufbar. 

Die URL des Downloadpunktes im zentralen Netz der TI lautet: “https://idp.zentral.idp.splitdns.ti-dienste.de/.well-known/openid-configuration” [gemSpec_IDP_Dienst#A_19874-*].

Das Clientsystem des TI-Flow-Fachdienstes MUSS für die Anwendungsfälle der Anwendung E-Rezept mit den Diensten der TI ausschließlich über TLS kommunizieren.
Es gelten die Vorgaben aus [gemSpec_Krypt] für TLS.

Das Clientsystem des TI-Flow-Fachdienst MUSS bei jedem Verbindungsaufbau zum TI-Flow-Fachdienst oder IDP-Dienst diesen anhand seines TLS-Zertifikats authentifizieren und MUSS die Verbindungen ablehnen, falls die Authentifizierung fehlschlägt.

Das Clientsystem des TI-Flow-Fachdienstes MUSS in alle HTTP-Requests an den TI-Flow-Fachdienst und IDP-Dienst im äußeren HTTP-Request den HTTP-Header user-agent gemäß [RFC7231] mit <Produktname>/<Produktversion> <Herstellername>/<client_id> mit
* <Produktname> gemäß eigener Definition, Länge 1-20 Zeichen, Zeichenvorrat [0-9a-zA-Z\-\.]
* <Produktversion> gemäß Produktidentifikation
* <Herstellername> gemäß eigener Definition, Länge 1-20 Zeichen, Zeichenvorrat [0-9a-zA-Z\-\.] 
* <client_id> gemäß Registrierung bei der gematik

