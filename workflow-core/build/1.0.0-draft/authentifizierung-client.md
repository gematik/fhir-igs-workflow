# Authentifizierung von Clientsystemen - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **Authentifizierung von Clientsystemen**

## Authentifizierung von Clientsystemen

### Authentifizierung einer Leistungserbringerinstitution / Kostenträger

Das Clientsystem einer Leistungserbringerinstitution oder eines Kostenträgers authentisiert sich für Zugriffe auf Dienste der TI im Rahmen der Anwendung E-Rezept gegenüber dem IDP-Dienst.

Das Clientsystem übernimmt hierbei, wenn kein gültiger “ACCESS_TOKEN” vorliegt, neben der Rolle der Anwendungsfrontend-Applikation auch die Aufgabe des Authenticator-Moduls (der in [RFC6749 # section-4.1] beschriebene t), um das zum Zugriff auf Fachdienste benötigte “ACCESS_TOKEN” zu beantragen. Hierfür wird am Authorization-Endpunkt des IDP-Dienstes ein “AUTHORIZATION_CODE” beantragt, der nach erfolgreicher Verifikation am Token-Endpunkt des IDP-Dienstes gegen ein “ID_TOKEN” und ein “ACCESS_TOKEN” getauscht wird.

Die für die Beantragung des “AUTHORIZATION_CODE” im Challenge-Response-Verfahren notwendige elektronische Signatur mit der AUT-Identität einer SMC-B der LEI / des Kostenträgers lässt das Cleintsystem über die Schnittstellen des Konnektors resp. Basis Consumer generieren. Im Fall einer bereits freigeschalteten Smartcard passiert diese Aktion ohne Interaktion mit dem Nutzer im Hintergrund.

Der IDP-Dienst führt die Identifikation der Institution durch, und stattet diese anschließend mit “ID_TOKEN” gemäß [openid-connect-core 1.0 # IDToken] und “ACCESS_TOKEN” gemäß [RFC6749 # section-1.4 & RFC6749 # section-5] aus. Dabei wurde aus Sicherheitsaspekten der “Authorization Code Grant” gemäß [RFC6749 # section-4.1] gewählt, welcher in identischem Ablauf auch für mobile Endgeräte mit getrennten Komponenten für Authenticator-Modul und Anwendungsfrontend anwendbar ist. Um dem erforderlichen Sicherheitsniveau gerecht zu werden, wird zudem die Verwendung von PKCE (Proof Key for Code Exchange by OAuth Public Clients) gemäß [RFC7636] vorgesehen.

Der IDP-Dienst selbst teilt sich in mehrere statisch adressierte Teildienste auf. Diese umfassen:

* Discovery-Endpunkt (“OAuth 2.0 Authorization Server Metadata” [RFC8414])
* Authorization-Endpunkt (Teil des “The OAuth 2.0 Authorization Framework” [RFC6749])
* Token-Endpunkt [RFC6749 # section-3.2]

Für weitere Informationen zum IDP-Dienst und zum Ablauf der Authentisierung siehe [gemSpec_IDP_Dienst] und [gemSpec_IDP_Frontend].

#### Übergreifende Festlegungen zur Nutzung des IDP-Dienstes

Zur Nutzung des IDP-Dienstes gelten einige grundlegende Voraussetzungen, welche das PS erfüllen muss.

Der Hersteller des Clientsystem des E-Rezept-Fachdienstes MUSS sich über einen organisatorischen Prozess beim Anbieter des IDP-Dienstes für die Dienste, für welche Token abgerufen werden sollen, registrieren. Der IDP-Dienst vergibt dabei eine "client_id". Diese "client_id" MUSS vom Clientsystem bei Nutzung des IDP-Dienstes übertragen werden.

Das Clientsystem MUSS die JWS (JSON Web Signature) [RFC7515#section-3] Signatur des Discovery Document auf mathematische Korrektheit sowie auf Gültigkeit des ausstellenden Zertifikates innerhalb der TI prüfen. Das Clientsystem MUSS, wenn es den Konnektor oder den Basis-Consumer nutzt, die Gültigkeit des Zertifikates mit der Operation "VerifyCertificate" prüfen.
Für die Prüfung des ausstellenden Zertifikats mittels Konnektor siehe [gemSpec_Kon#4.1.9.5.3] bzw. [gemILF_PS#4.4.4.3].

Für die Prüfung des ausstellenden Zertifikats mittels Basis-Consumer siehe [gemSpec_Basis_KTR_Consumer#A_17429].

Hinweis: Der genaue Aufbau entspricht [gemSpec_IDP_Dienst#Kapitel 7.7 Aufbau des Discovery Document].

Bei Aufruf der Funktion “VerifyDocument” an der Außenschnittstelle des Konnektors ist es nicht möglich, direkt auch eine Prüfung des Zertifikatstyps und der Rollen-OID durchzuführen.

Das Clientsystem MUSS die Signatur des Discovery Document auf ein zeitlich gültiges C.FD.SIG-Zertifikat mit der Rollen-OID "oid_idpd" zurückführen können.
Hinweis: Zur Durchführung der Prüfungen gemäß A_20657-* und ähnlicher Anforderungen ist zu verifizieren, ob im Feld certificatePolicies (2.5.29.32) des Zertifikates der richtige Zertifikatstyp FD.SIG (1.2.276.0.76.4.203) gemäß [gemSpec_OID#Tabelle Tab_PKI_405] eingetragen ist und sich in der Admission (1.3.36.8.3.3) des Zertifikats die richtige “oid_idpd” (1.2.276.0.76.4.260) findet.

Das Clientsystem MUSS, wenn es kontrolliert beendet wird, vorhandene ACCESS_TOKEN, ID_TOKEN und AUTHORIZATION_CODE-Objekte sicher löschen.
Darüber hinaus gelten für die Kommunikation mit dem IDP-Dienst die Vorgaben aus 5.1.1 - Kommunikation zu den Diensten der TI.

Das Clientsystem MUSS vorhandene ACCESS_TOKEN, ID_TOKEN und AUTHORIZATION_CODE-Objekte nach Ablauf ihrer Gültigkeit sicher löschen.

Das Clientsystem MUSS empfangene ACCESS_TOKEN, ID_TOKEN und AUTHORIZATION_CODE-Objekte gegen unberechtigten Zugriff schützen.
#### Abruf von Token beim IDP-Dienst

Im Folgenden wird der Ablauf der Token-Beantragung und Ausstellung detaillierter beschrieben und – wo für das Clientsystem notwendig – mit entsprechenden Anforderungen hinterlegt.

Im ersten Schritt erzeugt sich das Primärsystem einen zufälligen “CODE_VERFIER” und bildet darüber den Hash “CODE_CHALLENGE”. Mit dessen Hilfe kann es sich im späteren Verlauf als valider Empfänger des Tokens ausweisen.

Das Clientsystem MUSS zur Laufzeit einen CODE_VERIFIER (Zufallswert) gemäß [RFC7636#section-4.1] bilden. Der CODE_VERIFIER MUSS eine Länge von mindestens 43 und maximal 128 Zeichen enthalten. Dabei sind die folgenden Zeichen zulässig: [A-Z] / [a-z] / [0-9] / "-" / "." / "_" / "~".

Das Clientsystem MUSS über den CODE_VERIFIER einen SHA256-HASH-Wert, die sogenannte CODE_CHALLENGE, gemäß [RFC7636#section-4.2] bilden. code_challenge = BASE64URL-ENCODE(SHA256(ASCII(code_verifier)))
Anschließend werden der gehashte Zufallswert und die notwendigen Angaben als “CODE_CHALLENGE” beim Authorization-Endpunkt des IDP-Dienstes eingereicht.

Das Clientsystem MUSS den Antrag zum AUTHORIZATION_CODE für ein ACCESS_TOKEN beim Authorization-Endpunkt (URI_AUTH) in Form eines HTTP/1.1 GET Request stellen und dabei die folgenden Attribute anführen:
* "response_type"
* "scope"
* "client_id"
* "redirect_uri"
* "code_challenge" (Hashwert des "code_verifier") [RFC7636#section-4.2]
* "code_challenge_method" HASH-Algorithmus (S256) [RFC7636#section-4.3]

Der Authorization-Endpunkt legt nun eine “session_id” an, stellt alle nötigen Informationen zusammen und erzeugt das “CHALLENGE_TOKEN”. Darüber hinaus stellt der Authorization-Endpunkt den im Claim des entsprechenden Fachdienstes vereinbarten “Consent” zusammen, welcher die für dessen Funktion notwendigen Attribute beinhaltet.

Der Authorization-Endpunkt liefert als Response zur Anfrage des “AUTHORIZATION_CODE” einen “CHALLENGE_TOKEN”, um die Identität der LEI zu bestätigen, sowie den “consent” des im “scope” angefragten Fachdienstes.

Das Clientsystem MUSS den "user_consent" und den CHALLENGE_TOKEN vom Authorization-Endpunkt des IDP-Dienstes annehmen. Der Authorization-Endpunkt liefert diese als Antwort auf den Authorization-Request des Clientsystems.

Das Clientsystem MUSS die Signatur des CHALLENGE_TOKEN gegen den aktuellen öffentlichen Schlüssel des Authorization-Endpunktes PUK_IDP_SIG prüfen. Liegt dem Clientsystem der öffentliche Schlüssel des Authorization-Endpunktes noch nicht vor, MUSS es diesen gemäß dem "kid"-Parameter "puk_idp_sig" aus dem Discovery Document abrufen.
Das Clientsystem verwendet nun die AUT-Identität der SM-B der Institution und deren Konnektor/Basis Consumer, um das gehashte “CHALLENGE_TOKEN” des IDP-Dienstes zu signieren. Wenn es sich um eine erstmalige Anmeldung des Benutzers bei diesem Fachdienst handelt, werden diesem darüber hinaus die für den Zugriff übermittelten Daten der LEI angezeigt.

Das Primärsystem MUSS dem Nutzer einmalig vor der Signatur der "challenge" anzeigen, dass ein tokenbasierter Zugriff auf den im "scope" genannten Dienst initiiert wird.
Hinweis: Die erfolgte Zustimmung des Nutzers darf gespeichert werden und weitere Abfragen können entfallen.

Das Clientsystem MUSS, wenn es sich mit seiner SM-B authentisiert, den CHALLENGE_TOKEN des IdP-Dienstes mit der Identität ID.HCI.AUT der SM-B signieren. Das Clientsystem MUSS, wenn es den Konnektor oder den Basis-Consumer nutzt, für das Signieren die Operation ExternalAuthenticate verwenden und als zu signierende Daten BinaryString den SHA-256-Hashwert des CHALLENGE_TOKEN in Base64-Codierung übergeben.
Hinweis: Der Aufbau der Anfrage und der einzureichenden Objekte entspricht [gemSpec_IDP_Dienst#Kapitel 7.3 Authentication Request].

Hinweis: Aktuell befinden sich vornehmlich SMC-B der Generation G2 im Feld. Bei diesen ist für die Signatur, entsprechend dem Default des Konnektors, das Verfahren RSASSA-PSS zu nutzen. Wenn eine SMC-B G2.1-Karte vorhanden ist, ist ECDSA zu priorisieren. Beide Verfahren werden durch den IDP-Dienst unterstützt.

Für weitere Informationen siehe Kapitel “Als Nutzer gegenüber der Telematikinfrastruktur authentisieren” in der API-Schnittstelle [E-Rezept API Dokumentation].

Das Primärsystem MUSS das Zertifikat C.HCI.AUT der SM-B über die Operation ReadCardCertificate des Konnektors gemäß [gemSpec_Kon#4.1.9.5.2] bzw. [gemILF_PS#4.4.4.2] auslesen.
Hinweis: Im Rahmen der Signatur wird auf privates Schlüsselmaterial zugegriffen. Die verwendeten Karten müssen sich daher in einem erhöhten Sicherheitszustand befinden, der ggf. erst durch eine PIN-Eingabe hergestellt werden muss. Das Primärsystem muss den Kartenzustand abfragen und die Karte ggf. durch den Nutzer freischalten lassen. Mit dem (optionalen) Einblenden eines Hinweises der Form “Bitte beachten Sie die Anzeige an Ihrem Kartenterminal” muss das Primärsystem dafür sorgen, dass die Abfrage einer PIN-Eingabe am Kartenterminal vom Benutzer nicht übersehen wird.

Anschließend werden die signierte “challenge” und das verwendete Authentisierungszertifikat der Smartcard an den IDP-Dienst übermittelt.

Das Clientsystem MUSS das eingereichte CHALLENGE_TOKEN zusammen mit der von der Smartcard signierten Challenge-Signatur "signed_challenge" und dem Authentifizierungszertifikat der Smartcard, mit dem öffentlichen Schlüssel des Authorization-Endpunktes PUK_IDP_ENC verschlüsselt, in Form eines HTTP-POST-Requests senden.
Hinweis: Der Aufbau der Anfrage und der einzureichenden Objekte entspricht [gemSpec_IDP_Dienst#Kapitel 7.3 Authentication Request].

Hinweis: Das Signieren und Verschlüsseln des “CHALLENGE_TOKEN” ist durch die Verwendung eines Nested JWT (angelehnt an den folgenden Draft: https://tools.ietf.org/html/draft-yusef-oauth-nested-jwt-03) zu realisieren. Im cty-Header ist “NJWT” zu setzen, um anzuzeigen, dass es sich um einen Nested JWT handelt. Das Signieren wird dabei durch die Verwendung einer JSON Web Signature (JWS) [RFC7515 # section-3 - Compact Serialization] gewährleistet. Die Verschlüsselung des signierten Token wird durch die Nutzung der JSON Web Encryption (JWE) [RFC7516 # section-3] sichergestellt. Als Verschlüsselungsalgorithmus ist ECDH-ES (Elliptic Curve Diffie-Hellman Ephemeral Static key agreement) vorgesehen.

Der Authorization-Endpunkt validiert nun die “session” sowie die “signed_challenge” und prüft das Zertifikat der LEI. Anschließend verknüpft er die “session” mit der Identität aus dem Authentisierungszertifikat und erstellt einen “AUTHORIZATION_CODE”, welchen er als Antwort zurücksendet.

Das Clientsystem empfängt nun diesen “AUTHORIZATION_CODE” vom IDP-Dienst und reicht ihn zusammen mit dem KEY_VERIFIER beim Token-Endpunkt ein.

Das Clientsystem MUSS den vom Authorization-Endpunkt als Antwort auf die signierte Challenge gesendeten AUTHORIZATION_CODE verarbeiten. Das Clientsystem MUSS das AUTHORIZATION_CODE ablehnen, wenn dieser außerhalb der mit dem Authorization-Endpunkt etablierten TLS-Verbindung übertragen wird.

Das Clientsystem MUSS vor dem Abrufen von ID_Token und ACCESS_Token einen zufälligen 256bit-AES-Schlüssel ("Token Key") erzeugen.

Das Clientsystem MUSS den KEY_VERIFIER bilden, indem "Token Key" und CODE_VERIFIER in einem JSON-Objekt kodiert werden.
Hinweis: Der Aufbau des “KEY_VERIFIER” entspricht [gemSpec_IDP_Dienst#Kapitel 7.5 Token Request].

Das Clientsystem MUSS den "Key_Verifier" mittels JWE und PUK_IDP_ENC verschlüsseln und zusammen mit dem AUTHORIZATION_CODE TLS-gesichert und als HTTP/1.1 POST Request an den Token-Endpunkt senden.
Hinweis: Der Aufbau der Anfrage entspricht [gemSpec_IDP_Dienst#Kapitel 7.5 Token Request].

Als Verschlüsselungsalgorithmus ist ECDH-ES (Elliptic Curve Diffie-Hellman Ephemeral Static key agreement) vorgesehen.

Der Token-Endpunkt validiert den “CODE_VERFIER” und gleicht diesen mit der “code_challenge” ab. Dann erzeugt er die erforderlichen Token und verschlüsselt beide mit dem “Token-Key”.

Das Primärsystem erhält nun den signierten “ID_TOKEN” und den “ACCESS_TOKEN” vom Token-Endpunkt und prüft die Signatur des “ID_TOKEN”.

Das Clientsystem MUSS das vom Token-Endpunkt ausgegebene ID_TOKEN als HTTP/1.1 Statusmeldung 200 verarbeiten und mittels "Token Key" entschlüsseln. Das Clientsystem MUSS das ID_TOKEN ablehnen, wenn dieses außerhalb der mit dem Token-Endpunkt etablierten TLS-Verbindung übertragen wird oder nicht mit dem vorher übermittelten "Token Key" verschlüsselt war.
Hinweis: Der Aufbau der Antwort und des “ID_TOKEN” entspricht [gemSpec_IDP_Dienst#Kapitel 7.6 Token Response].

Das Clientsystem MUSS das vom Token-Endpunkt ausgegebene ACCESS_TOKEN in der HTTP/1.1 Statusmeldung 200 verarbeiten und mittels "Token Key" entschlüsseln. Das Clientsystem MUSS das ACCESS_TOKEN ablehnen, wenn dieses außerhalb der mit dem Token-Endpunkt etablierten TLS-Verbindung übertragen wird oder nicht mit dem vorher übermittelten "Token Key" verschlüsselt war.
Hinweis: Der Aufbau der Antwort und des “ACCESS_TOKEN” entspricht [gemSpec_IDP_Dienst#Kapitel 7.6 Token Response].

Das Clientsystem MUSS die Signatur des ACCESS_TOKEN und ID_TOKEN mathematisch prüfen und auf ein gültiges C.FD.SIG-Zertifikat mit der Rollen-OID "oid_idpd" zurückführen.
Zur Prüfung von Zertifikatstyp- und Rollen-OID siehe Hinweis zu A_20657-*.

Das Clientsystem MUSS das zur Signatur des ACCESS_TOKEN verwendete Zertifikat auf Gültigkeit innerhalb der TI prüfen. Das Clientsystem MUSS, wenn es den Konnektor oder den Basis-Consumer nutzt, mit der Operation "VerifyCertificate" prüfen.
Für die Prüfung mittels Konnektor siehe [gemSpec_Kon#4.1.9.5.3] bzw. [gemILF_PS#4.4.4.3].

Für die Prüfung mittels Basis-Consumer siehe [gemSpec_Basis_KTR_Consumer#A_17429].

Im weiteren Verlauf kann der “ACCESS_TOKEN” innerhalb seiner Gültigkeitsdauer bei verschiedenen Aufrufen des Fachdienstes eingereicht werden. Der Fachdienst entschlüsselt das “ACCESS_TOKEN” mit seinem privaten Schlüssel, validiert es, zieht die notwendigen Informationen entsprechend seinem Claim heraus und verwendet diese für seine fachlichen Operationen.

