# Datenschutz und Sicherheit

Dieses Kapitel fasst die sicherheitsrelevanten Anforderungen an den
E-Rezept-Fachdienst zusammen. Es umfasst allgemeine Sicherheitsanforderungen,
Client-Identifikation, Vertrauensraum der TI, Netzuebergangs-Sicherheit sowie die
Vertrauenswuerdige Ausfuehrungsumgebung (VAU) inklusive Protokollierung.

## 5.8.1 Allgemeine Sicherheitsanforderungen

<requirement conformance="SHALL" key="IG-WF-CORE-17" title="E-Rezept-Fachdienst - Ausschluss unbekannter FdV-Versionsnummern von der Kommunikation (A_19260)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS an der Schnittstelle zum Internet die
	Produktidentifikation (Produktbezeichnung, Produktversion) des Clients erkennen
	und nicht zugelassene Produkte oder bestimmte Produktversionen von der
	Kommunikation mit dem E-Rezept-Fachdienst ausschliessen koennen. Der
	E-Rezept-Fachdienst MUSS in diesen Faellen eine entsprechende Fehlermeldung mit
	dem http-StatusCode 403 an den aufrufenden Client geben.
</requirement>

Hinweis: Der Ausschluss soll ueber ein Whitelisting gueltiger Produktidentifikationen
erfolgen.

<requirement conformance="SHALL" key="IG-WF-CORE-18" title="E-Rezept-Fachdienst - Ausschluss von Client-Versionen (A_19261-01)" version="0">
	<meta lockversion="false"/>
	Der Anbieter des E-Rezept-Fachdienstes MUSS ausschliesslich auf Anweisung der
	gematik Clients mit einer bestimmten Produktidentifikation fuer die Kommunikation
	mit dem E-Rezept-Fachdienst zulassen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-19" title="E-Rezept-Fachdienst - Beruecksichtigung OWASP-Top-10-Risiken (A_19266)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS Massnahmen zum Schutz vor den OWASP-Top-10-Risiken
	in der aktuellen Version umsetzen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-20" title="E-Rezept-Fachdienst - Drosselung Brute-Force-Anfragen (A_20703)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS jede Antwort auf einen Funktionsaufruf, der einen
	AccessCode oder Secret enthaelt, um den konfigurierbaren http-Response-Header
	"Warning" (default "999 Throttling active") ergaenzen und um ein konfigurierbares
	Zeitintervall (default: 500 Millisekunden) verzoegert zurueckschicken, sofern der
	erwartete AccessCode bzw. Secret nicht mit dem uebergebenen AccessCode bzw.
	Secret uebereinstimmt, um Brute-Force-Angriffe durch einen hohen Zeitaufwand
	unattraktiv zu machen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-21" title="E-Rezept-Fachdienst - Drosselung Rezeptfaelschungen (A_20704)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS jede Antwort auf den Funktionsaufruf zum Aktivieren
	eines Tasks mittels Uebergabe des QES-signierten Datensatzes um den
	konfigurierbaren http-Response-Header "Warning" (default "999 Throttling active")
	ergaenzen und um ein konfigurierbares Zeitintervall (default: 500 Millisekunden)
	verzoegert zurueckschicken, sofern die QES in der Pruefung waehrend der Operation
	POST /Task/<id>/$activate als ungueltig erkannt wird.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-22" title="Anbieter E-Rezept-Fachdienst - Konfiguration und Deaktivierung Drosselung (A_20705)" version="0">
	<meta lockversion="false"/>
	Der Anbieter des E-Rezept-Fachdienstes MUSS die Funktion der Drosselung sowie die
	Konfiguration auf Weisung der gematik aktivieren oder deaktivieren bzw. die
	Konfigurationsparameter anpassen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-23" title="E-Rezept-Fachdienst - Erkennen der Pruefidentitaet (A_20751)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS eine eGK-Pruefkartenidentitaet anhand der
	Bildungsregel in Card-G2-A_3820 (X0000nnnnP, mit nnnn aus der Menge {0001 .. 5000}
	und P = Pruefziffer) fuer die KVNR der Pruefkarte eGK erkennen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-24" title="E-Rezept-Fachdienst - Ausschluss Vertreterkommunikation von bzw. an Pruef-Identitaet (A_20752)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS das Einstellen einer Communication-Ressource mit dem
	http-Status-Code 400 ablehnen, wenn diese in den Absender- und
	Empfaenger-Informationen eine Kombination von KVNR der Pruefkarte eGK und KVNR
	von Versicherten enthaelt.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-25" title="E-Rezept-Fachdienst - Ausschluss Vertreterzugriff auf bzw. mittels Pruef-Identitaet (A_20753)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS jeden Zugriff auf E-Rezepte mittels AccessCode
	(Vertreterzugriff) mit dem http-Status-Code 400 ablehnen, wenn sich aus dem
	Zugriff eine Kombination aus KVNR der Pruefkarte eGK und KVNR von Versicherten
	ergibt.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-26" title="E-Rezept-Fachdienst - Drosselung User-Agent Aufrufe (A_26579)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS bei einer im laufenden Betrieb konfigurierbaren
	Anzahl von 200 Aufrufen pro Sekunde eines User-Agents die Antwortzeit um ein
	konfigurierbares Zeitintervall (Default 500 ms) verzoegert zurueckschicken, um eine
	Ueberlast am E-Rezept-Fachdienst zu verhindern. Die Drosselung muss ueber einen
	konfigurierbaren Schalter im laufenden Betrieb aktivierbar bzw. deaktivierbar sein.
	Der E-Rezept-Fachdienst MUSS zusaetzlich ein Whitelisting implementieren, damit
	User-Agents von der Drosselung ausgenommen werden koennen.
</requirement>

## 5.8.2 Identifikation des Clientsystems

<requirement conformance="SHALL" key="IG-WF-CORE-27" title="E-Rezept-Fachdienst - Erkennung Clientsystem User-Agent (A_20013-01)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS das vom aufrufenden Nutzer verwendete Clientsystem
	anhand des im HTTP-Request enthaltenen Header-Felds "User-Agent" gemaess
	[RFC7231] erkennen und in den Eintraegen zur Performance-Rohdatenerfassung gemaess
	[gemSpec_Perf] protokollieren. Der E-Rezept-Fachdienst MUSS bei fehlendem
	User-Agent-Header den Request mit dem HTTP-Status-Code 403 beantworten.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-28" title="E-Rezept-Fachdienst - Prozess zur Verwaltung von API-KEYs (A_21551)" version="0">
	<meta lockversion="false"/>
	Der Anbieter des E-Rezept-Fachdienstes MUSS organisatorische Prozesse mit der
	gematik zur Verwaltung von API-KEYs fuer die Schnittstellen des
	E-Rezept-Fachdienstes zum Internet unterstuetzen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-29" title="E-Rezept-Fachdienst - Zuordnung Abfrageursprung Client (A_21552)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS jeden Zugriff ueber eine Schnittstelle im Internet
	mittels dem HTTP-Header "X-api-key" gegen die Liste zulaessiger API-KEYs pruefen.
	Anfragen ohne HTTP-Header "X-api-key" oder mit einem nicht gueltigen API-KEY
	MUESSEN als nicht authentisiert (HTTP-Statuscode 401) abgelehnt werden.
</requirement>

## 5.8.3 Vertrauensraum der TI

<requirement conformance="SHALL" key="IG-WF-CORE-30" title="E-Rezept-Fachdienst - Bereitstellung TSL (A_20023)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS folgende Vorgaben umsetzen:
	1. Er MUSS mindestens einmal taeglich aus der TI (TI-interne Verbindung) die
	   "TSL(ECC-RSA)" und deren zugehoerigen Hashwert aus der TI herunterladen.
	2. Er MUSS unter dem Pfadnamen "/TSL.xml" ueber das vom E-Rezept-FdV genutzte
	   HTTPS-Interface die "TSL(ECC-RSA)" der TI zur Verfuegung stellen (HTTP-GET,
	   HTTP Content-Type: text/xml).
	3. Er MUSS unter dem Pfadnamen "/TSL.sha2" ueber das vom E-Rezept-FdV genutzte
	   HTTPS-Interface den vom TSL-Dienst heruntergeladenen SHA-256 Hashwert der
	   Datei TSL.xml zur Verfuegung stellen (HTTP Content-Type: text/plain, Hashwert
	   als hexdump kodiert (64 Byte + Newline)).
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-31" title="E-Rezept-Fachdienst - Bereitstellung OCSP-Forwarder (A_20024-01)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS folgende Vorgaben umsetzen:
	1. Er MUSS unter der Adresse <FQDN>/ocspf eine Moeglichkeit zur Statusabfrage ueber
	   das vom E-Rezept-FdV genutzte HTTPS-Interface zur Verfuegung stellen (HTTP-POST).
	2. Er MUSS ueber die Schnittstelle OCSP-Requests entgegennehmen.
	3. Er MUSS aus dem issuerKeyHash die URL des entsprechenden OCSP-Responders in der
	   TI ermitteln und den OCSP-Request weiterleiten.
	4. Er MUSS die erhaltenen OCSP-Response unveraendert an das E-Rezept-FdV
	   weiterreichen.
</requirement>

<requirement conformance="MAY" key="IG-WF-CORE-32" title="E-Rezept-Fachdienst - Caching OCSP-Antworten (A_20025)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst KANN OCSP-Antworten aus A_20024 bis zu 4 Stunden cachen
	und bei einer entsprechend passenden OCSP-Anfrage aus dem Cache ausliefern.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-33" title="E-Rezept-Fachdienst - OCSP-Stapling (A_20026)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS an der HTTPS-Schnittstelle zum Internet OCSP-Stapling
	gemaess [RFC-6066] unterstuetzen.
</requirement>

## 5.8.4 Sicherheit der Netzuebergaenge

<requirement conformance="SHALL" key="IG-WF-CORE-34" title="E-Rezept-Fachdienst - Sicherung zum Transportnetz Internet durch Paketfilter (A_19813)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS zum Transportnetz Internet durch einen Paketfilter
	(ACL) gesichert werden, welcher ausschliesslich die erforderlichen Protokolle
	weiterleitet. Der Paketfilter MUSS frei konfigurierbar sein auf Grundlage von
	Informationen aus OSI-Layer 3 und 4 (Quell- und Zieladresse, IP-Protokoll, Ports).
</requirement>

<requirement conformance="SHALL NOT" key="IG-WF-CORE-35" title="E-Rezept-Fachdienst - Platzierung des Paketfilters Internet (A_19814)" version="0">
	<meta lockversion="false"/>
	Der Paketfilter des E-Rezept-Fachdienstes, zum Schutz in Richtung Transportnetz
	Internet, DARF NICHT physisch auf Systemen der VAU des E-Rezept-Fachdienstes oder
	dem vorgeschalteten TLS-terminierenden Load Balancer implementiert werden.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-36" title="E-Rezept-Fachdienst - Richtlinien fuer den Paketfilter zum Internet (A_19815-03)" version="0">
	<meta lockversion="false"/>
	Der Paketfilter des E-Rezept-Fachdienstes MUSS die Weiterleitung von IP-Paketen an
	der Schnittstelle zum Internet auf die folgenden Protokolle beschraenken:
	1. HTTPS.
	2. OCSP-Zugriffe fuer das OCSP-Stapling nach A_20026, ggf. notwendige DNS-Anfragen.
	3. Zugriff auf den FHIR-VZD.
	4. Zugriff auf Webdienste des BfArM.
	5. Zugriff auf die authentisierten Push Gateways.
	Ein Verbindungsaufbau aus dem E-Rezept-Fachdienst in Richtung Internet MUSS
	unterbunden werden, mit Ausnahme der Verbindungen aus Punkten 2 bis 5.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-37" title="E-Rezept-Fachdienst - OCSP-Status fuer das OCSP-Stapling (A_20022)" version="0">
	<meta lockversion="false"/>
	Der Paketfilter des E-Rezept-Fachdienstes MUSS bezueglich des OCSP-Stapling die
	folgenden Vorgaben umsetzen:
	1. Initiale Ermittlung der IP-Adresse(n) des OCSP-Responders.
	2. Whitelisting dieser IP-Adresse(n) per stateful Firewalling.
	3. Regelmaessiger Bezug der OCSP-Response.
	4. Pruefung der OCSP-Responses (Signatur, CertID).
	5. Verwerfen ungueltiger/abgelaufener OCSP-Responses; TLS ohne Stapling falls
	   keine gueltige OCSP-Response verfuegbar ist.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-38" title="E-Rezept-Fachdienst - Verhalten bei Vollauslastung (A_19824)" version="0">
	<meta lockversion="false"/>
	Der Paketfilter des E-Rezept-Fachdienstes MUSS so konfiguriert sein, dass bei
	Vollauslastung der Systemressourcen keine weiteren Verbindungen angenommen werden.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-39" title="E-Rezept-Fachdienst - Verbindungen von Clients zu Verarbeitungskontexten der VAU ueber den Eingangspunkt (A_19720)" version="0">
	<meta lockversion="false"/>
	Der Eingangspunkt des E-Rezept-Fachdienstes MUSS Verbindungen von Clients
	ausschliesslich ueber TLS akzeptieren, die TLS-Verbindung terminieren und HTTP
	Requests/Responses zwischen Client und Verarbeitungskontext vermitteln.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-40" title="E-Rezept-Fachdienst - Richtlinien zum TLS-Verbindungsaufbau (A_19823)" version="0">
	<meta lockversion="false"/>
	Der Eingangspunkt des E-Rezept-Fachdienstes MUSS sich beim TLS-Verbindungsaufbau
	mit einem Extended Validation TLS-Zertifikat eines Herausgebers gemaess
	[CAB Forum] authentisieren. Das Zertifikat MUSS an die jeweilige Schnittstelle des
	Eingangspunkts gebunden werden.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-41" title="E-Rezept-Fachdienst - Zugriff auf Webdienste - Deaktivieren von Uebertragungen (A_27859)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS eine Konfiguration fuer die Ausfuehrung der folgenden
	Anwendungsfaelle vorsehen, um die Ausfuehrung bei Vorfaellen deaktivieren zu
	koennen: Uebertragen digitaler Durchschlag E-T-Rezept.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-42" title="Anbieter E-Rezept-Fachdienst - Zugriff auf Webdienste - Betrieblicher Prozess Deaktivieren von Uebertragungen (A_27860)" version="0">
	<meta lockversion="false"/>
	Der Anbieter des E-Rezept-Fachdienstes MUSS einen betrieblichen Prozess
	unterstuetzen, mittels dem die Konfiguration des Deaktivierens von
	Anwendungsfaellen angepasst werden kann.
</requirement>

## 5.8.5 Vertrauenswuerdige Ausfuehrungsumgebung (VAU)

<requirement conformance="SHALL" key="IG-WF-CORE-43" title="E-Rezept-Fachdienst - Umsetzung der fachlichen Operationen in einer VAU (A_19683)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS die Verarbeitung aller fachlichen Operationen des
	Fachdienstes in einer Vertrauenswuerdigen Ausfuehrungsumgebung umsetzen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-44" title="E-Rezept-Fachdienst - Verarbeitungskontext der VAU (A_19684)" version="0">
	<meta lockversion="false"/>
	Der Verarbeitungskontext des E-Rezept-Fachdienstes MUSS saemtliche physikalischen
	Systemkomponenten sowie Softwarekomponenten umfassen, deren Sicherheitseigenschaften
	den Schutz der personenbezogenen medizinischen Daten im Klartext beeinflussen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-45" title="E-Rezept-Fachdienst - Verschluesselung von ausserhalb des Verarbeitungskontextes der VAU gespeicherten Daten (A_19688)" version="0">
	<meta lockversion="false"/>
	Der Verarbeitungskontext MUSS sicherstellen, dass saemtliche schuetzenswerten Daten
	vor einer Speicherung ausserhalb der VAU verschluesselt werden. Es MUESSEN
	Schluessel pro E-Rezept verwendet oder mindestens einmal pro Sekunde gewechselt
	werden.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-46" title="E-Rezept-Fachdienst - Ableitung der Persistenzschluessel durch ein HSM (A_19699)" version="0">
	<meta lockversion="false"/>
	Der Verarbeitungskontext MUSS die zur Verschluesselung der persistierten
	E-Rezept-Daten verwendeten Schluessel von einem HSM innerhalb der VAU abrufen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-47" title="E-Rezept-Fachdienst - Ableitung der Persistenzschluessel aus Merkmal der E-Rezepte (A_19700)" version="0">
	<meta lockversion="false"/>
	Das HSM der VAU MUSS eine Schnittstelle zur Ableitung symmetrischer Schluessel
	bereitstellen und zur Ableitung ein nach der ersten Erstellung unveraenderliches
	Merkmal des E-Rezept-Datensatzes verwenden.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-48" title="E-Rezept-Fachdienst - Geschuetzte Weitergabe von Daten an autorisierte Nutzer durch die VAU (A_19694)" version="0">
	<meta lockversion="false"/>
	Der Verarbeitungskontext MUSS sicherstellen, dass saemtliche schuetzenswerten Daten
	ausschliesslich ueber sichere Verbindungen an autorisierte Nutzer weitergegeben
	werden.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-49" title="E-Rezept-Fachdienst - Transportverschluesselte Uebertragung von Daten mit PVS (A_19262)" version="0">
	<meta lockversion="false"/>
	Der Verarbeitungskontext MUSS sicherstellen, dass er nur transportverschluesselt
	mit dem PVS kommuniziert.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-50" title="E-Rezept-Fachdienst - Transportverschluesselte Uebertragung von Daten mit AVS (A_19263)" version="0">
	<meta lockversion="false"/>
	Der Verarbeitungskontext MUSS sicherstellen, dass er nur transportverschluesselt
	mit dem AVS kommuniziert.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-51" title="E-Rezept-Fachdienst - Transportverschluesselte Uebertragung von Daten mit FdV (A_19264)" version="0">
	<meta lockversion="false"/>
	Der Verarbeitungskontext MUSS sicherstellen, dass er nur transportverschluesselt
	mit dem FdV kommuniziert.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-52" title="E-Rezept-Fachdienst - Vertrauliche Kommunikation (A_19265)" version="0">
	<meta lockversion="false"/>
	Der Verarbeitungskontext MUSS sicherstellen, dass er nur transportverschluesselt
	mit Komponenten ausserhalb des Verarbeitungskontextes kommuniziert.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-53" title="E-Rezept-Fachdienst - Authentisierung gegenueber Clients (A_19267)" version="0">
	<meta lockversion="false"/>
	Der Verarbeitungskontext MUSS sich gegenueber Clients mittels der
	Fachdienstidentitaet oid_erp-vau mit Zertifikatsprofil C.FD.ENC ausweisen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-54" title="E-Rezept-Fachdienst - Isolation zwischen Verarbeitungskontexten der VAU (A_19702)" version="0">
	<meta lockversion="false"/>
	Die VAU MUSS die Verarbeitungen eines Verarbeitungskontextes von denen anderer
	Verarbeitungskontexte trennen, sodass ein Einwirken zwischen Kontexten technisch
	ausgeschlossen ist.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-55" title="E-Rezept-Fachdienst - Unabhaengige Skalierung der Dienst-Ressourcen (A_19726-01)" version="0">
	<meta lockversion="false"/>
	Die VAU MUSS fuer die Anwendergruppen Leistungserbringer und Versicherte
	sicherstellen, dass eine Ueberlastung einer Gruppe keine Beeintraechtigung der
	anderen Gruppe verursacht.
</requirement>

### 5.8.5.2 Ausschluss von nicht autorisierten Zugriffen aus dem Betriebsumfeld

<requirement conformance="SHALL" key="IG-WF-CORE-56" title="E-Rezept-Fachdienst - Isolation der VAU von Datenverarbeitungsprozessen des Anbieters (A_19704)" version="0">
	<meta lockversion="false"/>
	Die VAU MUSS die Datenverarbeitungsprozesse in ihren Verarbeitungskontexten von
	allen sonstigen Datenverarbeitungsprozessen des Anbieters trennen, sodass der
	Anbieter vom Zugriff auf schuetzenswerte Daten ausgeschlossen ist.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-57" title="E-Rezept-Fachdienst - Ausschluss von Manipulationen an der Software der VAU (A_19706)" version="0">
	<meta lockversion="false"/>
	Die VAU MUSS eine Manipulation der eingesetzten Software erkennen und eine
	Ausfuehrung der manipulierten Software verhindern.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-58" title="E-Rezept-Fachdienst - Ausschluss von Manipulationen an der Hardware der VAU (A_19707)" version="0">
	<meta lockversion="false"/>
	Die VAU MUSS die Integritaet der eingesetzten Hardware schuetzen und
	Manipulationen an der Hardware ausschliessen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-59" title="E-Rezept-Fachdienst - Kontinuierliche Wirksamkeit des Manipulationsschutzes der VAU (A_19708)" version="0">
	<meta lockversion="false"/>
	Die VAU MUSS den Ausschluss von Manipulationen an Hardware und Software mit
	Mitteln umsetzen, deren dauerhafte Wirksamkeit gewaehrleistet ist.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-60" title="E-Rezept-Fachdienst - Kein physischer Zugang des Anbieters zu Systemen der VAU (A_19709)" version="0">
	<meta lockversion="false"/>
	Die VAU MUSS sicherstellen, dass niemand, auch nicht der Anbieter, waehrend der
	Verarbeitung personenbezogener medizinischer Daten Zugriff auf physische
	Schnittstellen der Systeme erlangen kann.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-61" title="E-Rezept-Fachdienst - Nutzdatenbereinigung vor physischem Zugang zu Systemen der VAU (A_19710)" version="0">
	<meta lockversion="false"/>
	Die VAU MUSS sicherstellen, dass physischer Zugang zu Hardware-Komponenten der
	Verarbeitungskontexte nur erfolgt, nachdem keine Nutzdaten extrahiert werden
	koennen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-62" title="E-Rezept-Fachdienst - Private Schluessel von Dienstzertifikaten im HSM (A_19711-01)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS die privaten Schluessel der Dienstzertifikate im HSM
	erzeugen und anwenden. Die Prueftiefe des HSM MUSS den in A_19712 angegebenen
	Standards entsprechen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-63" title="E-Rezept-Fachdienst - Einsatz zertifizierter HSM (A_19712)" version="0">
	<meta lockversion="false"/>
	Der Anbieter des E-Rezept-Fachdienstes MUSS beim Einsatz eines HSM sicherstellen,
	dass dessen Eignung durch eine erfolgreiche Evaluierung nachgewiesen wurde. Als
	Evaluierungsschemata kommen Common Criteria, ITSEC oder FIPS in Frage. Die
	Prueftiefe MUSS mindestens FIPS 140-2 Level 3, Common Criteria EAL 4+ mit hohem
	Angriffspotenzial oder ITSEC E3 der Staerke "hoch" entsprechen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-64" title="E-Rezept-Fachdienst - HSM-Kryptographieschnittstelle nur fuer Instanzen der VAU (A_19713)" version="0">
	<meta lockversion="false"/>
	Die VAU MUSS technisch sicherstellen, dass nur Instanzen der VAU Zugriff auf die
	Kryptographieschnittstelle des HSM zur Nutzung des privaten Schluesselmaterials
	erhalten.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-65" title="E-Rezept-Fachdienst - Sicherer Kanal vom Client zum Verarbeitungskontext der VAU (A_19714)" version="0">
	<meta lockversion="false"/>
	Die VAU MUSS den Aufbau eines vertraulichen und integritaetsgeschuetzten
	Kommunikationskanals zwischen einem Client und einem Verarbeitungskontext
	erzwingen, bevor fachliche Schnittstellen nutzbar sind.
</requirement>

### 5.8.5.3 Konsistenz des Systemzustands, Logging und Monitoring

<requirement conformance="SHALL" key="IG-WF-CORE-66" title="E-Rezept-Fachdienst - Konsistenter Systemzustand des Verarbeitungskontextes der VAU (A_19715)" version="0">
	<meta lockversion="false"/>
	Die VAU MUSS sicherstellen, dass ein konsistenter Zustand des
	Verarbeitungskontextes auch bei Bedienfehlern oder technischen Problemen erhalten
	bleibt bzw. wiederhergestellt werden kann.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-67" title="E-Rezept-Fachdienst - Datenschutzkonformes Logging und Monitoring der VAU (A_19716)" version="0">
	<meta lockversion="false"/>
	Die VAU MUSS Logging- und Monitoring-Informationen so erheben und verarbeiten,
	dass mit technischen Mitteln ausgeschlossen ist, dass vertrauliche oder zur
	Profilbildung geeignete Daten dem Anbieter oder Dritten bekannt werden.
</requirement>

### 5.8.5.4 Client-Verbindungen zum Verarbeitungskontext

<requirement conformance="SHALL" key="IG-WF-CORE-68" title="E-Rezept-Fachdienst - Verarbeitungskontexte der VAU ueber gemeinsame Host-Adressen erreichbar (A_19719)" version="0">
	<meta lockversion="false"/>
	Die VAU MUSS ihre Verarbeitungskontexte ueber gemeinsame IP-Adressen und Ports des
	Eingangspunkts des Fachdienstes erreichbar machen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-69" title="E-Rezept-Fachdienst - Identitaet des Verarbeitungskontextes fuer Clients (A_19724)" version="0">
	<meta lockversion="false"/>
	Der Verarbeitungskontext MUSS sich gegenueber Clients mittels der
	Fachdienstidentitaet oid_erp-vau mit Zertifikatsprofil C.FD.ENC ausweisen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-70" title="E-Rezept-Fachdienst - Sicherer Kanal zum Verarbeitungskontext der VAU auf Inhaltsebene (A_19721)" version="0">
	<meta lockversion="false"/>
	Der Eingangspunkt MUSS Clients den Aufbau eines sicheren Kanals auf Inhaltsebene
	zum Verarbeitungskontext ermoeglichen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-71" title="E-Rezept-Fachdienst - Automatisierter Abbau des sicheren Kanals (A_19722)" version="0">
	<meta lockversion="false"/>
	Der Verarbeitungskontext MUSS den sicheren Kanal zu einem Client nach Abschluss
	einer fachlichen Operation abbauen, sodass anschliessend keine Zugriffe ohne neue
	Verbindung moeglich sind.
</requirement>

### 5.8.5.5 gematik-Logdaten

<requirement conformance="SHALL" key="IG-WF-CORE-72" title="E-Rezept-Fachdienst - Pseudonymisieren der gematik-Logdaten - geheimer Schluessel nur in VAU (A_27560)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS sicherstellen, dass der fuer das Pseudonymisieren der
	gematik-Logdaten benoetigte geheime Schluessel key_pn_log im Klartext
	ausschliesslich innerhalb einer VAU-Instanz verarbeitet wird.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-73" title="E-Rezept-Fachdienst - Pseudonymisieren der gematik-Logdaten - Einbringen des Schluessels im 4-Augen-Prinzip (A_27561)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS sicherstellen, dass der geheime Schluessel key_pn_log
	ausschliesslich im 4-Augen-Prinzip in den E-Rezept-Fachdienst eingebracht werden
	kann.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-74" title="Anbieter E-Rezept-Fachdienst - Pseudonymisieren der gematik-Logdaten - Einbringen des Schluessels im 4-Augen-Prinzip (A_27562)" version="0">
	<meta lockversion="false"/>
	Der Anbieter des E-Rezept-Fachdienstes MUSS den geheimen Schluessel key_pn_log
	ausschliesslich im 4-Augen-Prinzip einbringen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-75" title="Anbieter E-Rezept-Fachdienst - Pseudonymisieren der gematik-Logdaten - unverzueglicher Schluesselwechsel (A_27563)" version="0">
	<meta lockversion="false"/>
	Der Anbieter des E-Rezept-Fachdienstes MUSS den geheimen Schluessel key_pn_log
	unverzueglich nach Bereitstellung durch die gematik wechseln.
</requirement>