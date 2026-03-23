
### Authentifizierung einer Leistungserbringerinstitution / Kostenträger

Das Clientsystem einer Leistungserbringerinstitution oder eines Kostenträgers  authentisiert sich für Zugriffe auf Dienste der TI im Rahmen der Anwendung E-Rezept gegenüber dem IDP-Dienst.

Das Clientsystem übernimmt hierbei, wenn kein gültiger "ACCESS_TOKEN" vorliegt, neben der Rolle der Anwendungsfrontend-Applikation auch die Aufgabe des Authenticator-Moduls (der in [RFC6749 # section-4.1] beschriebene t), um das zum Zugriff auf Fachdienste benötigte "ACCESS_TOKEN" zu beantragen. Hierfür wird am Authorization-Endpunkt des IDP-Dienstes ein "AUTHORIZATION_CODE" beantragt, der nach erfolgreicher Verifikation am Token-Endpunkt des IDP-Dienstes gegen ein "ID_TOKEN" und ein "ACCESS_TOKEN" getauscht wird.

Die für die Beantragung des "AUTHORIZATION_CODE" im Challenge-Response-Verfahren notwendige elektronische Signatur mit der AUT-Identität einer SMC-B der LEI / des Kostenträgers lässt das Cleintsystem über die Schnittstellen des Konnektors resp. Basis Consumer generieren. Im Fall einer bereits freigeschalteten Smartcard passiert diese Aktion ohne Interaktion mit dem Nutzer im Hintergrund. 

Der IDP-Dienst führt die Identifikation der Institution durch, und stattet diese anschließend mit "ID_TOKEN" gemäß [openid-connect-core 1.0 # IDToken] und "ACCESS_TOKEN" gemäß [RFC6749 # section-1.4 & RFC6749 # section-5] aus. Dabei wurde aus Sicherheitsaspekten der "Authorization Code Grant" gemäß [RFC6749 # section-4.1] gewählt, welcher in identischem Ablauf auch für mobile Endgeräte mit getrennten Komponenten für Authenticator-Modul und Anwendungsfrontend anwendbar ist. Um dem erforderlichen Sicherheitsniveau gerecht zu werden, wird zudem die Verwendung von PKCE (Proof Key for Code Exchange by OAuth Public Clients) gemäß [RFC7636] vorgesehen.

Der IDP-Dienst selbst teilt sich in mehrere statisch adressierte Teildienste auf. Diese umfassen:
- Discovery-Endpunkt ("OAuth 2.0 Authorization Server Metadata" [RFC8414])
- Authorization-Endpunkt (Teil des "The OAuth 2.0 Authorization Framework" [RFC6749])
- Token-Endpunkt [RFC6749 # section-3.2]

Für weitere Informationen zum IDP-Dienst und zum Ablauf der Authentisierung siehe [gemSpec_IDP_Dienst] und [gemSpec_IDP_Frontend].

#### Übergreifende Festlegungen zur Nutzung des IDP-Dienstes

Zur Nutzung des IDP-Dienstes gelten einige grundlegende Voraussetzungen, welche das PS erfüllen muss.

<!-- A_20654-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-1" title="CS: Registrierung des Clientsystems des E-Rezept-Fachdienstes" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="Anb_NCPeH_FD">
        <testProcedure id="testProcedureAN01"/>
    </actor>
    Der Hersteller des Clientsystem des E-Rezept-Fachdienstes MUSS sich über einen organisatorischen Prozess beim Anbieter des IDP-Dienstes für die Dienste, für welche Token abgerufen werden sollen, registrieren. Der IDP-Dienst vergibt dabei eine "client_id". Diese "client_id" MUSS vom Clientsystem bei Nutzung des IDP-Dienstes übertragen werden.
</requirement>

<!-- A_20655-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-2" title="CS: Regelmäßiges Einlesen des Discovery Document" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Das Clientsystem MUSS das Discovery Document (DD) [RFC8414] regelmäßig alle 24 Stunden einlesen und auswerten, und danach die darin aufgeführten URI zu den benötigten öffentlichen Schlüsseln (PUKs) und Diensten verwenden.
    Der Downloadpunkt wird als Teil der organisatorischen Registrierung des Clientsystems beim IDP-Dienst übergeben.
    Das Clientsystem MUSS den Downloadpunkt des Discovery Document als konfigurierbaren Parameter speichern.
</requirement>

<!-- A_20656-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-3" title="CS: Prüfung der Signatur des Discovery Document" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Das Clientsystem MUSS die JWS (JSON Web Signature) [RFC7515#section-3] Signatur des Discovery Document auf mathematische Korrektheit sowie auf Gültigkeit des ausstellenden Zertifikates innerhalb der TI prüfen. Das Clientsystem MUSS, wenn es den Konnektor oder den Basis-Consumer nutzt, die Gültigkeit des Zertifikates mit der Operation "VerifyCertificate" prüfen.
</requirement>

Für die Prüfung des ausstellenden Zertifikats mittels Konnektor siehe [gemSpec_Kon#4.1.9.5.3] bzw. [gemILF_PS#4.4.4.3].

Für die Prüfung des ausstellenden Zertifikats mittels Basis-Consumer siehe [gemSpec_Basis_KTR_Consumer#A_17429].

Hinweis: Der genaue Aufbau entspricht [gemSpec_IDP_Dienst#Kapitel 7.7 Aufbau des Discovery Document]. 

Bei Aufruf der Funktion "VerifyDocument" an der Außenschnittstelle des Konnektors ist es nicht möglich, direkt auch eine Prüfung des Zertifikatstyps und der Rollen-OID durchzuführen.

<!-- A_20657-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-4" title="CS: Prüfung Typ und Rolle des Signaturzertifikats des Discovery Document" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Das Clientsystem MUSS die Signatur des Discovery Document auf ein zeitlich gültiges C.FD.SIG-Zertifikat mit der Rollen-OID "oid_idpd" zurückführen können.
</requirement>

Hinweis: Zur Durchführung der Prüfungen gemäß A_20657-* und ähnlicher Anforderungen ist zu verifizieren, ob im Feld certificatePolicies (2.5.29.32) des Zertifikates der richtige Zertifikatstyp FD.SIG (1.2.276.0.76.4.203) gemäß [gemSpec_OID#Tabelle Tab_PKI_405] eingetragen ist und sich in der Admission (1.3.36.8.3.3) des Zertifikats die richtige "oid_idpd" (1.2.276.0.76.4.260) findet.

<!-- A_20658-01, A_19482-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-5" title="CS: Sicheres Löschen der Token" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Produktgutachten"/>
    </actor>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das Clientsystem MUSS, wenn es kontrolliert beendet wird, vorhandene ACCESS_TOKEN, ID_TOKEN und AUTHORIZATION_CODE-Objekte sicher löschen.
</requirement>

Darüber hinaus gelten für die Kommunikation mit dem IDP-Dienst die Vorgaben aus 5.1.1 - Kommunikation zu den Diensten der TI.

<!-- A_21337-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-6" title="CS: Sicheres Löschen von TOKEN bei zeitlichem Ablauf" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Produktgutachten"/>
    </actor>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das Clientsystem MUSS vorhandene ACCESS_TOKEN, ID_TOKEN und AUTHORIZATION_CODE-Objekte nach Ablauf ihrer Gültigkeit sicher löschen.
</requirement>

<!-- A_21338-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-7" title="CS: Sichere Speicherung der Token" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Das Clientsystem MUSS empfangene ACCESS_TOKEN, ID_TOKEN und AUTHORIZATION_CODE-Objekte gegen unberechtigten Zugriff schützen.
</requirement>

#### Abruf von Token beim IDP-Dienst

Im Folgenden wird der Ablauf der Token-Beantragung und Ausstellung detaillierter beschrieben und – wo für das Clientsystem notwendig – mit entsprechenden Anforderungen hinterlegt.

Im ersten Schritt erzeugt sich das Primärsystem einen zufälligen "CODE_VERFIER" und bildet darüber den Hash "CODE_CHALLENGE". Mit dessen Hilfe kann es sich im späteren Verlauf als valider Empfänger des Tokens ausweisen.

<!-- A_20659-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-8" title="CS: Erzeugen des CODE_VERIFIER" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Das Clientsystem MUSS zur Laufzeit einen CODE_VERIFIER (Zufallswert) gemäß [RFC7636#section-4.1] bilden. Der CODE_VERIFIER MUSS eine Länge von mindestens 43 und maximal 128 Zeichen enthalten. Dabei sind die folgenden Zeichen zulässig: [A-Z] / [a-z] / [0-9] / "-" / "." / "_" / "~".
</requirement>

<!-- A_20660-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-9" title="CS: Erzeugen des Hash-Werts des CODE_VERIFIER" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Das Clientsystem MUSS über den CODE_VERIFIER einen SHA256-HASH-Wert, die sogenannte CODE_CHALLENGE, gemäß [RFC7636#section-4.2] bilden.

    code_challenge = BASE64URL-ENCODE(SHA256(ASCII(code_verifier)))
</requirement>

Anschließend werden der gehashte Zufallswert und die notwendigen Angaben als "CODE_CHALLENGE" beim Authorization-Endpunkt des IDP-Dienstes eingereicht.

<!-- A_20661-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-10" title="CS: Anfrage des AUTHORIZATION_CODE für ein ACCESS_TOKEN" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Das Clientsystem MUSS den Antrag zum AUTHORIZATION_CODE für ein ACCESS_TOKEN beim Authorization-Endpunkt (URI_AUTH) in Form eines HTTP/1.1 GET Request stellen und dabei die folgenden Attribute anführen:
    <ul>
        <li>"response_type"</li>
        <li>"scope"</li>
        <li>"client_id"</li>
        <li>"redirect_uri"</li>
        <li>"code_challenge" (Hashwert des "code_verifier") [RFC7636#section-4.2]</li>
        <li>"code_challenge_method" HASH-Algorithmus (S256) [RFC7636#section-4.3]</li>
    </ul>
</requirement>

Der Authorization-Endpunkt legt nun eine "session_id" an, stellt alle nötigen Informationen zusammen und erzeugt das "CHALLENGE_TOKEN". Darüber hinaus stellt der Authorization-Endpunkt den im Claim des entsprechenden Fachdienstes vereinbarten "Consent" zusammen, welcher die für dessen Funktion notwendigen Attribute beinhaltet.

Der Authorization-Endpunkt liefert als Response zur Anfrage des "AUTHORIZATION_CODE" einen "CHALLENGE_TOKEN", um die Identität der LEI zu bestätigen, sowie den "consent" des im "scope" angefragten Fachdienstes.

<!-- A_20662-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-11" title="CS: Annahme des user_consent und des CHALLENGE_TOKEN" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das Clientsystem MUSS den "user_consent" und den CHALLENGE_TOKEN vom Authorization-Endpunkt des IDP-Dienstes annehmen. Der Authorization-Endpunkt liefert diese als Antwort auf den Authorization-Request des Clientsystems.
</requirement>

<!-- A_20663-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-12" title="CS: Annahme des user_consent und des CHALLENGE_TOKEN" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Das Clientsystem MUSS die Signatur des CHALLENGE_TOKEN gegen den aktuellen öffentlichen Schlüssel des Authorization-Endpunktes PUK_IDP_SIG prüfen. Liegt dem Clientsystem der öffentliche Schlüssel des Authorization-Endpunktes noch nicht vor, MUSS es diesen gemäß dem "kid"-Parameter "puk_idp_sig" aus dem Discovery Document abrufen.
</requirement>

Das Clientsystem verwendet nun die AUT-Identität der SM-B der Institution und deren Konnektor/Basis Consumer, um das gehashte "CHALLENGE_TOKEN" des IDP-Dienstes zu signieren. Wenn es sich um eine erstmalige Anmeldung des Benutzers bei diesem Fachdienst handelt, werden diesem darüber hinaus die für den Zugriff übermittelten Daten der LEI angezeigt.

<!-- A_20664 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-13" title="Bestätigung des Consent" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das Primärsystem MUSS dem Nutzer einmalig vor der Signatur der "challenge" anzeigen, dass ein tokenbasierter Zugriff auf den im "scope" genannten Dienst initiiert wird.
</requirement>
<!-- ToDo: erscheint nicht sehr sinnvoll für KTR -->

Hinweis: Die erfolgte Zustimmung des Nutzers darf gespeichert werden und weitere Abfragen können entfallen.

<!-- A_20665-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-14" title="CS: Signatur der Challenge des IdP-Dienstes" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Das Clientsystem MUSS, wenn es sich mit seiner SM-B authentisiert, den CHALLENGE_TOKEN des IdP-Dienstes mit der Identität ID.HCI.AUT der SM-B signieren. Das Clientsystem MUSS, wenn es den Konnektor oder den Basis-Consumer nutzt, für das Signieren die Operation ExternalAuthenticate verwenden und als zu signierende Daten BinaryString den SHA-256-Hashwert des CHALLENGE_TOKEN in Base64-Codierung übergeben.
</requirement>

Hinweis: Der Aufbau der Anfrage und der einzureichenden Objekte entspricht [gemSpec_IDP_Dienst#Kapitel 7.3 Authentication Request].

Hinweis: Aktuell befinden sich vornehmlich SMC-B der Generation G2 im Feld. Bei diesen ist für die Signatur, entsprechend dem Default des Konnektors, das Verfahren RSASSA-PSS zu nutzen. Wenn eine SMC-B G2.1-Karte vorhanden ist, ist ECDSA zu priorisieren. Beide Verfahren werden durch den IDP-Dienst unterstützt.

Für weitere Informationen siehe Kapitel "Als Nutzer gegenüber der Telematikinfrastruktur authentisieren" in der API-Schnittstelle [E-Rezept API Dokumentation].

<!-- A_20666-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-15" title="Auslesen des Authentisierungszertifikates" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das Primärsystem MUSS das Zertifikat C.HCI.AUT der SM-B über die Operation ReadCardCertificate des Konnektors gemäß [gemSpec_Kon#4.1.9.5.2] bzw. [gemILF_PS#4.4.4.2] auslesen.
</requirement>

Hinweis: Im Rahmen der Signatur wird auf privates Schlüsselmaterial zugegriffen. Die verwendeten Karten müssen sich daher in einem erhöhten Sicherheitszustand befinden, der ggf. erst durch eine PIN-Eingabe hergestellt werden muss. Das Primärsystem muss den Kartenzustand abfragen und die Karte ggf. durch den Nutzer freischalten lassen. Mit dem (optionalen) Einblenden eines Hinweises der Form "Bitte beachten Sie die Anzeige an Ihrem Kartenterminal" muss das Primärsystem dafür sorgen, dass die Abfrage einer PIN-Eingabe am Kartenterminal vom Benutzer nicht übersehen wird.

Anschließend werden die signierte "challenge" und das verwendete Authentisierungszertifikat der Smartcard an den IDP-Dienst übermittelt.

<!-- A_20667-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-16" title="CS: Response auf die Challenge des Authorization-Endpunktes" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Produkttest"/>
    </actor>
    Das Clientsystem MUSS das eingereichte CHALLENGE_TOKEN zusammen mit der von der Smartcard signierten Challenge-Signatur "signed_challenge" und dem Authentifizierungszertifikat der Smartcard, mit dem öffentlichen Schlüssel des Authorization-Endpunktes PUK_IDP_ENC verschlüsselt, in Form eines HTTP-POST-Requests senden.
</requirement>

Hinweis: Der Aufbau der Anfrage und der einzureichenden Objekte entspricht [gemSpec_IDP_Dienst#Kapitel 7.3 Authentication Request].

Hinweis: Das Signieren und Verschlüsseln des "CHALLENGE_TOKEN" ist durch die Verwendung eines Nested JWT (angelehnt an den folgenden Draft: https://tools.ietf.org/html/draft-yusef-oauth-nested-jwt-03) zu realisieren. Im cty-Header ist "NJWT" zu setzen, um anzuzeigen, dass es sich um einen Nested JWT handelt. Das Signieren wird dabei durch die Verwendung einer JSON Web Signature (JWS) [RFC7515 # section-3 - Compact Serialization] gewährleistet. Die Verschlüsselung des signierten Token wird durch die Nutzung der JSON Web Encryption (JWE) [RFC7516 # section-3] sichergestellt. Als Verschlüsselungsalgorithmus ist ECDH-ES (Elliptic Curve Diffie-Hellman Ephemeral Static key agreement) vorgesehen.

Der Authorization-Endpunkt validiert nun die "session" sowie die "signed_challenge" und prüft das Zertifikat der LEI. Anschließend verknüpft er die "session" mit der Identität aus dem Authentisierungszertifikat und erstellt einen "AUTHORIZATION_CODE", welchen er als Antwort zurücksendet.

Das Clientsystem empfängt nun diesen "AUTHORIZATION_CODE" vom IDP-Dienst und reicht ihn zusammen mit dem KEY_VERIFIER beim Token-Endpunkt ein.

<!-- A_20668-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-17" title="CS: Annahme des AUTHORIZATION_CODE" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Das Clientsystem MUSS den vom Authorization-Endpunkt als Antwort auf die signierte Challenge gesendeten AUTHORIZATION_CODE verarbeiten. Das Clientsystem MUSS das AUTHORIZATION_CODE ablehnen, wenn dieser außerhalb der mit dem Authorization-Endpunkt etablierten TLS-Verbindung übertragen wird.
</requirement>

<!-- A_21333-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-18" title="CS: Erzeugung des Token-Key" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Das Clientsystem MUSS vor dem Abrufen von ID_Token und ACCESS_Token einen zufälligen 256bit-AES-Schlüssel ("Token Key") erzeugen.
</requirement>

<!-- A_21334-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-19" title="CS: Erzeugung des KEY_VERIFIER" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Produkttest"/>
    </actor>
    Das Clientsystem MUSS den KEY_VERIFIER bilden, indem "Token Key" und CODE_VERIFIER in einem JSON-Objekt kodiert werden.
</requirement>

Hinweis: Der Aufbau des "KEY_VERIFIER" entspricht [gemSpec_IDP_Dienst#Kapitel 7.5 Token Request].

<!-- A_20671-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-20" title="CS: Einreichen des AUTHORIZATION_CODE beim Token-Endpunkt" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Produkttest"/>
    </actor>
    Das Clientsystem MUSS den "Key_Verifier" mittels JWE und PUK_IDP_ENC verschlüsseln und zusammen mit dem AUTHORIZATION_CODE TLS-gesichert und als HTTP/1.1 POST Request an den Token-Endpunkt senden.
</requirement>

Hinweis: Der Aufbau der Anfrage entspricht [gemSpec_IDP_Dienst#Kapitel 7.5 Token Request].

Als Verschlüsselungsalgorithmus ist ECDH-ES (Elliptic Curve Diffie-Hellman Ephemeral Static key agreement) vorgesehen.

Der Token-Endpunkt validiert den "CODE_VERFIER" und gleicht diesen mit der "code_challenge" ab. Dann erzeugt er die erforderlichen Token und verschlüsselt beide mit dem "Token-Key".

Das Primärsystem erhält nun den signierten "ID_TOKEN" und den "ACCESS_TOKEN" vom Token-Endpunkt und prüft die Signatur des "ID_TOKEN".

<!-- A_20672-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-21" title="CS: Annahme des ID_TOKEN" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Das Clientsystem MUSS das vom Token-Endpunkt ausgegebene ID_TOKEN als HTTP/1.1 Statusmeldung 200 verarbeiten und mittels "Token Key" entschlüsseln. Das Clientsystem MUSS das ID_TOKEN ablehnen, wenn dieses außerhalb der mit dem Token-Endpunkt etablierten TLS-Verbindung übertragen wird oder nicht mit dem vorher übermittelten "Token Key" verschlüsselt war.
</requirement>

Hinweis: Der Aufbau der Antwort und des "ID_TOKEN" entspricht [gemSpec_IDP_Dienst#Kapitel 7.6 Token Response].

<!-- A_20673-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-22" title="CS: Annahme des ACCESS_TOKEN" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Das Clientsystem MUSS das vom Token-Endpunkt ausgegebene ACCESS_TOKEN in der HTTP/1.1 Statusmeldung 200 verarbeiten und mittels "Token Key" entschlüsseln. Das Clientsystem MUSS das ACCESS_TOKEN ablehnen, wenn dieses außerhalb der mit dem Token-Endpunkt etablierten TLS-Verbindung übertragen wird oder nicht mit dem vorher übermittelten "Token Key" verschlüsselt war.
</requirement>

Hinweis: Der Aufbau der Antwort und des "ACCESS_TOKEN" entspricht [gemSpec_IDP_Dienst#Kapitel 7.6 Token Response].

<!-- A_20674-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-23" title="CS: Formale Prüfung der Signatur des ID_TOKEN und des ACCESS_TOKEN" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Produkttest"/>
    </actor>
    Das Clientsystem MUSS die Signatur des ACCESS_TOKEN und ID_TOKEN mathematisch prüfen und auf ein gültiges C.FD.SIG-Zertifikat mit der Rollen-OID "oid_idpd" zurückführen.
</requirement>

Zur Prüfung von Zertifikatstyp- und Rollen-OID siehe Hinweis zu A_20657-*.

<!-- A_20675-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-24" title="CS: Gültigkeitsprüfung des Signaturzertifikats des ACCESS_TOKEN innerhalb der TI" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Das Clientsystem MUSS das zur Signatur des ACCESS_TOKEN verwendete Zertifikat auf Gültigkeit innerhalb der TI prüfen. Das Clientsystem MUSS, wenn es den Konnektor oder den Basis-Consumer nutzt, mit der Operation "VerifyCertificate" prüfen.
</requirement>

Für die Prüfung mittels Konnektor siehe [gemSpec_Kon#4.1.9.5.3] bzw. [gemILF_PS#4.4.4.3].

Für die Prüfung mittels Basis-Consumer siehe [gemSpec_Basis_KTR_Consumer#A_17429].

Im weiteren Verlauf kann der "ACCESS_TOKEN" innerhalb seiner Gültigkeitsdauer bei verschiedenen Aufrufen des Fachdienstes eingereicht werden. Der Fachdienst entschlüsselt das "ACCESS_TOKEN" mit seinem privaten Schlüssel, validiert es, zieht die notwendigen Informationen entsprechend seinem Claim heraus und verwendet diese für seine fachlichen Operationen.


### Authentifizierung eines Versicherten

Der Nutzer des E-Rezept-FdV muss sich für Zugriffe auf den E-Rezept-Fachdienst gegenüber der TI authentifizieren.

Die Authentisierung kann gegenüber dem IDP-Dienst mittels eGK unter Kenntnis der PIN der eGK oder mit der GesundheitsID, d.h. Nutzerauthentisierung gegenüber dem sektoralen IDP, erfolgen.

<!-- A_25224 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-25" title="E-Rezept-FdV: Authentisierung E-Rezept-Fachdienst" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das E-Rezept-FdV MUSS mindestens ein Verfahren zur Authentisierung des Nutzers gegenüber dem E-Rezept-Fachdienst unterstützen.
</requirement>

<!-- A_20167-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-26" title="E-Rezept-FdV: Authentisierung E-Rezept-Fachdienst - IDP-Dienst - Rolle Anwendungsfrontend und optional Authenticator-Modul" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Das E-Rezept-FdV MUSS, wenn es eine Authentifizierung des Nutzers über den IDP-Dienst, in seiner Rolle als Authorization-Server, unterstützt, entweder als anfragendes Anwendungsfrontend und Authenticator-Modul oder, wenn ein Authenticator-Modul in einer anderen für die TI zugelassene App genutzt wird, als anfragendes Anwendungsfrontend agieren.
</requirement>

<!-- A_25225 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-27" title="E-Rezept-FdV: Authentisierung E-Rezept-Fachdienst - sektoraler IDP - Rolle Anwendungsfrontend" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das E-Rezept-FdV MUSS, wenn es eine Authentifizierung des Nutzers über einen sektoralen IDP unterstützt, als anfragendes Anwendungsfrontend agieren.
</requirement>

Für Informationen zum Ablauf der Authentisierung siehe [gemSpec_IDP_Dienst] und [gemSpec_IDP_Frontend].

Das E-Rezept-FdV erhält bei erfolgreicher Authentisierung einen Authentisierungstoken (ACCESS_TOKEN), welcher an den E-Rezept-Fachdienst weitergeleitet wird.

<!-- A_20117-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-28" title="E-Rezept-FdV: Zugriff E-Rezept-Fachdienst - Authentisierung wenn kein gültiger ACCESS_TOKEN" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das E-Rezept-FdV MUSS, falls für den Aufruf einer Operation am E-Rezept-Fachdienst kein gültiger ACCESS_TOKEN  vorliegt, sich gegenüber dem E-Rezept-Fachdienst authentisieren.
</requirement>

<b>Gast Login</b>

Das E-Rezept-FdV KANN die Authentisierung am sektoralen IDP mittels eGK und PIN, ohne GesundheitsID, unterstützen.

<!-- A_28409 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-29" title="E-Rezept-FdV: Authentisierung mit eGK und PIN (Gast-Login) - Parameter" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das E-Rezept-FdV MUSS, wenn es die Authentisierung am sektoralen IDP mittels eGK und PIN ohne GesundheitsID, unterstützt, zur Signalisierung des Gast-Login mit eGK und PIN den Parameter x-authorize-egk im Authorization Request an den E-Rezept-Authorization Server verwenden.
</requirement>

