# Kommunikation zu Diensten der TI - TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* **Kommunikation zu Diensten der TI**

## Kommunikation zu Diensten der TI

### Kommunikation zu den Diensten der TI

Ein Clientsystem nutzen für die Kommunikation zu den Diensten der TI TLS-Verbindungen. Es verbindet sich bspw. mit dem TI-Flow-Fachdienst, PoPP-Service oder FHIR-VZD.

funkt. Eignung: Konformitätsbestätigung

funkt. Eignung: Herstellererklärung

funkt. Eignung: Herstellererklärung

funkt. Eignung: Test Produkt/FADas Clientsystem des TI-Flow-Fachdienstes MUSS für die Kommunikation mit dem TI-Flow-Fachdienst die Endpunkte der Schnittstellen gemäß [gemSpec_FD_eRP]#5.1 Servicelokalisierung nutzen.
Die Abfrage beim Namensdienst der TI erfolgt über einen DNS-Lookup. Hierfür muss der Konnektor als DNS-Resolver konfiguriert sein. 

funkt. Eignung: Konformitätsbestätigung

funkt. Eignung: Herstellererklärung

funkt. Eignung: Herstellererklärung

funkt. Eignung: Test Produkt/FADas Clientsystem des TI-Flow-Fachdienstes MUSS für die Kommunikation mit dem TI-Flow-Fachdienst die URL mit dem Port 443 bilden.

funkt. Eignung: Konformitätsbestätigung

funkt. Eignung: Herstellererklärung

funkt. Eignung: Herstellererklärung

funkt. Eignung: Test Produkt/FADas Clientsystem des TI-Flow-Fachdienstes MUSS für die Anwendungsfälle der Anwendung E-Rezept mit den Diensten der TI ausschließlich über TLS kommunizieren.
Es gelten die Vorgaben aus [gemSpec_Krypt] für TLS.

funkt. Eignung: Konformitätsbestätigung

funkt. Eignung: Herstellererklärung

funkt. Eignung: Herstellererklärung

funkt. Eignung: Test Produkt/FADas Clientsystem des TI-Flow-Fachdienst MUSS bei jedem Verbindungsaufbau zum TI-Flow-Fachdienst diesen anhand seines TLS-Zertifikats authentifizieren und MUSS die Verbindungen ablehnen, falls die Authentifizierung fehlschlägt.

funkt. Eignung: Konformitätsbestätigung

funkt. Eignung: Herstellererklärung

funkt. Eignung: Herstellererklärung

funkt. Eignung: Test Produkt/FA

funkt. Eignung: Test Produkt/FADas Clientsystem des TI-Flow-Fachdienstes MUSS in alle HTTP-Requests an den TI-Flow-Fachdienst im äußeren HTTP-Request den HTTP-Header user-agent gemäß [RFC7231] mit <Produktname>/<Produktversion> <Herstellername>/<client_id> mit
* <Produktname> gemäß eigener Definition, Länge 1-20 Zeichen, Zeichenvorrat [0-9a-zA-Z\-\.]
* <Produktversion> gemäß Produktidentifikation
* <Herstellername> gemäß eigener Definition, Länge 1-20 Zeichen, Zeichenvorrat [0-9a-zA-Z\-\.] 
* <client_id> gemäß Registrierung bei der gematik
des Clientsystems befüllen.

funkt. Eignung: Konformitätsbestätigung

funkt. Eignung: Herstellererklärung

funkt. Eignung: Herstellererklärung

funkt. Eignung: Test Produkt/FA

funkt. Eignung: Test Produkt/FADas Clientsystem des TI-Flow-Fachdienstes MUSS in alle Anfragen an den TI-Flow-Fachdienst im äußeren HTTP-Request den HTTP-Header "X-erp-user" mit dem Wert
* "l" (kleines L) als PS eines Leistungserbringers
* "k" als CS eines Kostenträgers
* "v" als E-Rezept-FdV oder
* "n" als NCPeH-FD
einfügen.

funkt. Eignung: Konformitätsbestätigung

funkt. Eignung: Herstellererklärung

funkt. Eignung: Herstellererklärung

funkt. Eignung: Test Produkt/FA

funkt. Eignung: Test Produkt/FADas Clientsystem des TI-Flow-Fachdienstes MUSS in alle Anfragen an den TI-Flow-Fachdienst im äußeren HTTP-Request den HTTP-Header "X-erp-resource" mit dem Wert gemäß der angefragten Ressource im FHIR-Request einfügen.

* API / Operation: Query API: AuditEvent
  * X-erp-resource: AuditEvent
* API / Operation: Query API: ChargeItem
  * X-erp-resource: ChargeItem
* API / Operation: Query API: Consent
  * X-erp-resource: Consent
* API / Operation: Query API: Communication
  * X-erp-resource: Communication
* API / Operation: GET /Device
  * X-erp-resource: Device
* API / Operation: GET /metadata
  * X-erp-resource: metadata
* API / Operation: POST /Subscription
  * X-erp-resource: Subscription
* API / Operation: Query API: TaskPOST /Task *
  * X-erp-resource: Task
* API / Operation: POST /$get-eu-prescriptions
  * X-erp-resource: Prescription
* API / Operation: GET /$read-eu-access-permissionPOST /$grant-eu-access-permissionDELETE /$revoke-eu-access-permission
  * X-erp-resource: access-permission

**Tabelle: **HTTP-Header "X-erp-resource"

### Verschlüsselte Kommunikation zur VAU des TI-Flow-Fachdienstes

Die Kommunikation zum TI-Flow-Fachdienst wird zusätzlich zu TLS über einen sicheren Kanal (Verschlüsselung auf Http-Ebene) zwischen dem PS und der Vertrauenswürdigen Ausführungsumgebung (VAU) im TI-Flow-Fachdienst gesichert.

funkt. Eignung: Herstellererklärung

funkt. Eignung: Herstellererklärung

funkt. Eignung: Herstellererklärung

Sich.techn. Eignung: Produktgutachten

funkt. Eignung: Test Produkt/FADas Clientsystem des TI-Flow-Fachdienstes MUSS für alle Anfragen an den TI-Flow-Fachdienst für
* die Abfrage des capability statement
* den Zugriff auf Task, MedicationDispense, Communication, Consent, Prescription, AuditEvent oder access-permission Ressourcen
das Kommunikationsprotokoll zwischen VAU des TI-Flow-Fachdienstes und Clientsysteme des TI-Flow-Fachdienstes in der Rolle TI-Flow-Client nutzen.
Für Informationen zum Kommunikationsprotokoll zwischen E-Rezept-FdV und der VAU des TI-Flow-Fachdienstes siehe [gemSpec_Krypt]#E-Rezept-spezifische Vorgaben und [gemSpec_Krypt]#ZETA/ASL (VAU-Protokoll).

Alternativ zur Umsetzung des TUC_PKI_018 gemäß [gemSpec_Krypt]#A_21216 soll das Primärsystem für die Prüfung des VAU-Zertifikates die VerifyCertificate Operation des Konnektors/Basis Consumers nutzen.

Folgendes kann umgesetzt werden:

1. Beziehen des VAU-Zertifikat von /VAUCertificate
1. Lokales Speichern der aktuellen Zeit mit dem VAU-Zertifikat als Tupel
1. Prüfen des VAU-Zertifikates mittels der Konnektor-Operation VerifyCertificate
1. Abbrechen falls INVALID
1. (5) if (get_current_time() < gespeicherte Zeit + 12h) { VAU-Zertifikat wird als gültig angesehen, Nutzen des VAU-Zertifikat }
if (get_current_time() >= gespeicherte Zeit + 12h) { VAU-Zertifikat neu beziehen, siehe (1)}

Hinweis zum Fehlerhandling: Nur wenn der äußere Response der TI-Flow-Fachdienstes den Response-Code 200 liefert, enthält der payload eine mittels ASL-Protokoll verschlüsselte Response. Liefert der äußere Response eine Code >= 400, ist im ASL-Protokoll ein Fehler aufgetreten. Das PS muss nicht versuchen, den payload zu entschlüsseln.

