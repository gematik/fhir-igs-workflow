# Datenschutz und Sicherheit - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **Datenschutz und Sicherheit**

## Datenschutz und Sicherheit

# Datenschutz und Sicherheit

Dieses Kapitel fasst die sicherheitsrelevanten Anforderungen an den E-Rezept-Fachdienst zusammen. Es umfasst allgemeine Sicherheitsanforderungen, Client-Identifikation, Vertrauensraum der TI, Netzuebergangs-Sicherheit sowie die Vertrauenswuerdige Ausfuehrungsumgebung (VAU) inklusive Protokollierung.

## 5.8.1 Allgemeine Sicherheitsanforderungen

Der E-Rezept-Fachdienst MUSS an der Schnittstelle zum Internet die Produktidentifikation (Produktbezeichnung, Produktversion) des Clients erkennen und nicht zugelassene Produkte oder bestimmte Produktversionen von der Kommunikation mit dem E-Rezept-Fachdienst ausschliessen koennen. Der E-Rezept-Fachdienst MUSS in diesen Faellen eine entsprechende Fehlermeldung mit dem http-StatusCode 403 an den aufrufenden Client geben.
Hinweis: Der Ausschluss soll ueber ein Whitelisting gueltiger Produktidentifikationen erfolgen.

Der Anbieter des E-Rezept-Fachdienstes MUSS ausschliesslich auf Anweisung der gematik Clients mit einer bestimmten Produktidentifikation fuer die Kommunikation mit dem E-Rezept-Fachdienst zulassen.

Der E-Rezept-Fachdienst MUSS Massnahmen zum Schutz vor den OWASP-Top-10-Risiken in der aktuellen Version umsetzen.

Der E-Rezept-Fachdienst MUSS jede Antwort auf einen Funktionsaufruf, der einen AccessCode oder Secret enthaelt, um den konfigurierbaren http-Response-Header "Warning" (default "999 Throttling active") ergaenzen und um ein konfigurierbares Zeitintervall (default: 500 Millisekunden) verzoegert zurueckschicken, sofern der erwartete AccessCode bzw. Secret nicht mit dem uebergebenen AccessCode bzw. Secret uebereinstimmt, um Brute-Force-Angriffe durch einen hohen Zeitaufwand unattraktiv zu machen.

Der E-Rezept-Fachdienst MUSS jede Antwort auf den Funktionsaufruf zum Aktivieren eines Tasks mittels Uebergabe des QES-signierten Datensatzes um den konfigurierbaren http-Response-Header "Warning" (default "999 Throttling active") ergaenzen und um ein konfigurierbares Zeitintervall (default: 500 Millisekunden) verzoegert zurueckschicken, sofern die QES in der Pruefung waehrend der Operation POST /Task/
/$activate als ungueltig erkannt wird. </requirement>

Der Anbieter des E-Rezept-Fachdienstes MUSS die Funktion der Drosselung sowie die Konfiguration auf Weisung der gematik aktivieren oder deaktivieren bzw. die Konfigurationsparameter anpassen.

Der E-Rezept-Fachdienst MUSS eine eGK-Pruefkartenidentitaet anhand der Bildungsregel in Card-G2-A_3820 (X0000nnnnP, mit nnnn aus der Menge {0001 .. 5000} und P = Pruefziffer) fuer die KVNR der Pruefkarte eGK erkennen.

Der E-Rezept-Fachdienst MUSS das Einstellen einer Communication-Ressource mit dem http-Status-Code 400 ablehnen, wenn diese in den Absender- und Empfaenger-Informationen eine Kombination von KVNR der Pruefkarte eGK und KVNR von Versicherten enthaelt.

Der E-Rezept-Fachdienst MUSS jeden Zugriff auf E-Rezepte mittels AccessCode (Vertreterzugriff) mit dem http-Status-Code 400 ablehnen, wenn sich aus dem Zugriff eine Kombination aus KVNR der Pruefkarte eGK und KVNR von Versicherten ergibt.

Der E-Rezept-Fachdienst MUSS bei einer im laufenden Betrieb konfigurierbaren Anzahl von 200 Aufrufen pro Sekunde eines User-Agents die Antwortzeit um ein konfigurierbares Zeitintervall (Default 500 ms) verzoegert zurueckschicken, um eine Ueberlast am E-Rezept-Fachdienst zu verhindern. Die Drosselung muss ueber einen konfigurierbaren Schalter im laufenden Betrieb aktivierbar bzw. deaktivierbar sein. Der E-Rezept-Fachdienst MUSS zusaetzlich ein Whitelisting implementieren, damit User-Agents von der Drosselung ausgenommen werden koennen.## 5.8.2 Identifikation des Clientsystems

Der E-Rezept-Fachdienst MUSS das vom aufrufenden Nutzer verwendete Clientsystem anhand des im HTTP-Request enthaltenen Header-Felds "User-Agent" gemaess [RFC7231] erkennen und in den Eintraegen zur Performance-Rohdatenerfassung gemaess [gemSpec_Perf] protokollieren. Der E-Rezept-Fachdienst MUSS bei fehlendem User-Agent-Header den Request mit dem HTTP-Status-Code 403 beantworten.

Der Anbieter des E-Rezept-Fachdienstes MUSS organisatorische Prozesse mit der gematik zur Verwaltung von API-KEYs fuer die Schnittstellen des E-Rezept-Fachdienstes zum Internet unterstuetzen.

Der E-Rezept-Fachdienst MUSS jeden Zugriff ueber eine Schnittstelle im Internet mittels dem HTTP-Header "X-api-key" gegen die Liste zulaessiger API-KEYs pruefen. Anfragen ohne HTTP-Header "X-api-key" oder mit einem nicht gueltigen API-KEY MUESSEN als nicht authentisiert (HTTP-Statuscode 401) abgelehnt werden.## 5.8.3 Vertrauensraum der TI

Der E-Rezept-Fachdienst MUSS folgende Vorgaben umsetzen: 1. Er MUSS mindestens einmal taeglich aus der TI (TI-interne Verbindung) die "TSL(ECC-RSA)" und deren zugehoerigen Hashwert aus der TI herunterladen. 2. Er MUSS unter dem Pfadnamen "/TSL.xml" ueber das vom E-Rezept-FdV genutzte HTTPS-Interface die "TSL(ECC-RSA)" der TI zur Verfuegung stellen (HTTP-GET, HTTP Content-Type: text/xml). 3. Er MUSS unter dem Pfadnamen "/TSL.sha2" ueber das vom E-Rezept-FdV genutzte HTTPS-Interface den vom TSL-Dienst heruntergeladenen SHA-256 Hashwert der Datei TSL.xml zur Verfuegung stellen (HTTP Content-Type: text/plain, Hashwert als hexdump kodiert (64 Byte + Newline)).

Der E-Rezept-Fachdienst MUSS folgende Vorgaben umsetzen: 1. Er MUSS unter der Adresse
/ocspf eine Moeglichkeit zur Statusabfrage ueber das vom E-Rezept-FdV genutzte HTTPS-Interface zur Verfuegung stellen (HTTP-POST). 2. Er MUSS ueber die Schnittstelle OCSP-Requests entgegennehmen. 3. Er MUSS aus dem issuerKeyHash die URL des entsprechenden OCSP-Responders in der TI ermitteln und den OCSP-Request weiterleiten. 4. Er MUSS die erhaltenen OCSP-Response unveraendert an das E-Rezept-FdV weiterreichen. </requirement>

Der E-Rezept-Fachdienst KANN OCSP-Antworten aus A_20024 bis zu 4 Stunden cachen und bei einer entsprechend passenden OCSP-Anfrage aus dem Cache ausliefern.

Der E-Rezept-Fachdienst MUSS an der HTTPS-Schnittstelle zum Internet OCSP-Stapling gemaess [RFC-6066] unterstuetzen.## 5.8.4 Sicherheit der Netzuebergaenge

Der E-Rezept-Fachdienst MUSS zum Transportnetz Internet durch einen Paketfilter (ACL) gesichert werden, welcher ausschliesslich die erforderlichen Protokolle weiterleitet. Der Paketfilter MUSS frei konfigurierbar sein auf Grundlage von Informationen aus OSI-Layer 3 und 4 (Quell- und Zieladresse, IP-Protokoll, Ports).

Der Paketfilter des E-Rezept-Fachdienstes, zum Schutz in Richtung Transportnetz Internet, DARF NICHT physisch auf Systemen der VAU des E-Rezept-Fachdienstes oder dem vorgeschalteten TLS-terminierenden Load Balancer implementiert werden.

Der Paketfilter des E-Rezept-Fachdienstes MUSS die Weiterleitung von IP-Paketen an der Schnittstelle zum Internet auf die folgenden Protokolle beschraenken: 1. HTTPS. 2. OCSP-Zugriffe fuer das OCSP-Stapling nach A_20026, ggf. notwendige DNS-Anfragen. 3. Zugriff auf den FHIR-VZD. 4. Zugriff auf Webdienste des BfArM. 5. Zugriff auf die authentisierten Push Gateways. Ein Verbindungsaufbau aus dem E-Rezept-Fachdienst in Richtung Internet MUSS unterbunden werden, mit Ausnahme der Verbindungen aus Punkten 2 bis 5.

Der Paketfilter des E-Rezept-Fachdienstes MUSS bezueglich des OCSP-Stapling die folgenden Vorgaben umsetzen: 1. Initiale Ermittlung der IP-Adresse(n) des OCSP-Responders. 2. Whitelisting dieser IP-Adresse(n) per stateful Firewalling. 3. Regelmaessiger Bezug der OCSP-Response. 4. Pruefung der OCSP-Responses (Signatur, CertID). 5. Verwerfen ungueltiger/abgelaufener OCSP-Responses; TLS ohne Stapling falls keine gueltige OCSP-Response verfuegbar ist.

Der Paketfilter des E-Rezept-Fachdienstes MUSS so konfiguriert sein, dass bei Vollauslastung der Systemressourcen keine weiteren Verbindungen angenommen werden.

Der Eingangspunkt des E-Rezept-Fachdienstes MUSS Verbindungen von Clients ausschliesslich ueber TLS akzeptieren, die TLS-Verbindung terminieren und HTTP Requests/Responses zwischen Client und Verarbeitungskontext vermitteln.

Der Eingangspunkt des E-Rezept-Fachdienstes MUSS sich beim TLS-Verbindungsaufbau mit einem Extended Validation TLS-Zertifikat eines Herausgebers gemaess [CAB Forum] authentisieren. Das Zertifikat MUSS an die jeweilige Schnittstelle des Eingangspunkts gebunden werden.

Der E-Rezept-Fachdienst MUSS eine Konfiguration fuer die Ausfuehrung der folgenden Anwendungsfaelle vorsehen, um die Ausfuehrung bei Vorfaellen deaktivieren zu koennen: Uebertragen digitaler Durchschlag E-T-Rezept.

Der Anbieter des E-Rezept-Fachdienstes MUSS einen betrieblichen Prozess unterstuetzen, mittels dem die Konfiguration des Deaktivierens von Anwendungsfaellen angepasst werden kann.## 5.8.5 Vertrauenswuerdige Ausfuehrungsumgebung (VAU)

Der E-Rezept-Fachdienst MUSS die Verarbeitung aller fachlichen Operationen des Fachdienstes in einer Vertrauenswuerdigen Ausfuehrungsumgebung umsetzen.

Der Verarbeitungskontext des E-Rezept-Fachdienstes MUSS saemtliche physikalischen Systemkomponenten sowie Softwarekomponenten umfassen, deren Sicherheitseigenschaften den Schutz der personenbezogenen medizinischen Daten im Klartext beeinflussen.

Der Verarbeitungskontext MUSS sicherstellen, dass saemtliche schuetzenswerten Daten vor einer Speicherung ausserhalb der VAU verschluesselt werden. Es MUESSEN Schluessel pro E-Rezept verwendet oder mindestens einmal pro Sekunde gewechselt werden.

Der Verarbeitungskontext MUSS die zur Verschluesselung der persistierten E-Rezept-Daten verwendeten Schluessel von einem HSM innerhalb der VAU abrufen.

Das HSM der VAU MUSS eine Schnittstelle zur Ableitung symmetrischer Schluessel bereitstellen und zur Ableitung ein nach der ersten Erstellung unveraenderliches Merkmal des E-Rezept-Datensatzes verwenden.

Der Verarbeitungskontext MUSS sicherstellen, dass saemtliche schuetzenswerten Daten ausschliesslich ueber sichere Verbindungen an autorisierte Nutzer weitergegeben werden.

Der Verarbeitungskontext MUSS sicherstellen, dass er nur transportverschluesselt mit dem PVS kommuniziert.

Der Verarbeitungskontext MUSS sicherstellen, dass er nur transportverschluesselt mit dem AVS kommuniziert.

Der Verarbeitungskontext MUSS sicherstellen, dass er nur transportverschluesselt mit dem FdV kommuniziert.

Der Verarbeitungskontext MUSS sicherstellen, dass er nur transportverschluesselt mit Komponenten ausserhalb des Verarbeitungskontextes kommuniziert.

Der Verarbeitungskontext MUSS sich gegenueber Clients mittels der Fachdienstidentitaet oid_erp-vau mit Zertifikatsprofil C.FD.ENC ausweisen.

Die VAU MUSS die Verarbeitungen eines Verarbeitungskontextes von denen anderer Verarbeitungskontexte trennen, sodass ein Einwirken zwischen Kontexten technisch ausgeschlossen ist.

Die VAU MUSS fuer die Anwendergruppen Leistungserbringer und Versicherte sicherstellen, dass eine Ueberlastung einer Gruppe keine Beeintraechtigung der anderen Gruppe verursacht.### 5.8.5.2 Ausschluss von nicht autorisierten Zugriffen aus dem Betriebsumfeld

Die VAU MUSS die Datenverarbeitungsprozesse in ihren Verarbeitungskontexten von allen sonstigen Datenverarbeitungsprozessen des Anbieters trennen, sodass der Anbieter vom Zugriff auf schuetzenswerte Daten ausgeschlossen ist.

Die VAU MUSS eine Manipulation der eingesetzten Software erkennen und eine Ausfuehrung der manipulierten Software verhindern.

Die VAU MUSS die Integritaet der eingesetzten Hardware schuetzen und Manipulationen an der Hardware ausschliessen.

Die VAU MUSS den Ausschluss von Manipulationen an Hardware und Software mit Mitteln umsetzen, deren dauerhafte Wirksamkeit gewaehrleistet ist.

Die VAU MUSS sicherstellen, dass niemand, auch nicht der Anbieter, waehrend der Verarbeitung personenbezogener medizinischer Daten Zugriff auf physische Schnittstellen der Systeme erlangen kann.

Die VAU MUSS sicherstellen, dass physischer Zugang zu Hardware-Komponenten der Verarbeitungskontexte nur erfolgt, nachdem keine Nutzdaten extrahiert werden koennen.

Der E-Rezept-Fachdienst MUSS die privaten Schluessel der Dienstzertifikate im HSM erzeugen und anwenden. Die Prueftiefe des HSM MUSS den in A_19712 angegebenen Standards entsprechen.

Der Anbieter des E-Rezept-Fachdienstes MUSS beim Einsatz eines HSM sicherstellen, dass dessen Eignung durch eine erfolgreiche Evaluierung nachgewiesen wurde. Als Evaluierungsschemata kommen Common Criteria, ITSEC oder FIPS in Frage. Die Prueftiefe MUSS mindestens FIPS 140-2 Level 3, Common Criteria EAL 4+ mit hohem Angriffspotenzial oder ITSEC E3 der Staerke "hoch" entsprechen.

Die VAU MUSS technisch sicherstellen, dass nur Instanzen der VAU Zugriff auf die Kryptographieschnittstelle des HSM zur Nutzung des privaten Schluesselmaterials erhalten.

Die VAU MUSS den Aufbau eines vertraulichen und integritaetsgeschuetzten Kommunikationskanals zwischen einem Client und einem Verarbeitungskontext erzwingen, bevor fachliche Schnittstellen nutzbar sind.### 5.8.5.3 Konsistenz des Systemzustands, Logging und Monitoring

Die VAU MUSS sicherstellen, dass ein konsistenter Zustand des Verarbeitungskontextes auch bei Bedienfehlern oder technischen Problemen erhalten bleibt bzw. wiederhergestellt werden kann.

Die VAU MUSS Logging- und Monitoring-Informationen so erheben und verarbeiten, dass mit technischen Mitteln ausgeschlossen ist, dass vertrauliche oder zur Profilbildung geeignete Daten dem Anbieter oder Dritten bekannt werden.### 5.8.5.4 Client-Verbindungen zum Verarbeitungskontext

Die VAU MUSS ihre Verarbeitungskontexte ueber gemeinsame IP-Adressen und Ports des Eingangspunkts des Fachdienstes erreichbar machen.

Der Verarbeitungskontext MUSS sich gegenueber Clients mittels der Fachdienstidentitaet oid_erp-vau mit Zertifikatsprofil C.FD.ENC ausweisen.

Der Eingangspunkt MUSS Clients den Aufbau eines sicheren Kanals auf Inhaltsebene zum Verarbeitungskontext ermoeglichen.

Der Verarbeitungskontext MUSS den sicheren Kanal zu einem Client nach Abschluss einer fachlichen Operation abbauen, sodass anschliessend keine Zugriffe ohne neue Verbindung moeglich sind.### 5.8.5.5 gematik-Logdaten

Der E-Rezept-Fachdienst MUSS sicherstellen, dass der fuer das Pseudonymisieren der gematik-Logdaten benoetigte geheime Schluessel key_pn_log im Klartext ausschliesslich innerhalb einer VAU-Instanz verarbeitet wird.

Der E-Rezept-Fachdienst MUSS sicherstellen, dass der geheime Schluessel key_pn_log ausschliesslich im 4-Augen-Prinzip in den E-Rezept-Fachdienst eingebracht werden kann.

Der Anbieter des E-Rezept-Fachdienstes MUSS den geheimen Schluessel key_pn_log ausschliesslich im 4-Augen-Prinzip einbringen.

Der Anbieter des E-Rezept-Fachdienstes MUSS den geheimen Schluessel key_pn_log unverzueglich nach Bereitstellung durch die gematik wechseln.

