
### Kommunikation zu den Diensten der TI

Clientsysteme nutzen TLS-Verbindungen für die Kommunikation zu den Diensten der TI. Es verbindet sich mit dem E-Rezept-Fachdienst und einem Identity Provider.

<!-- A_19451-02 -->
<requirement conformance="SHALL" key="" title="CS: Lokalisierung E-Rezept-Fachdienst" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="Anb_NCPeH_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Das Clientsystem des E-Rezept-Fachdienstes MUSS für die Kommunikation mit dem E-Rezept-Fachdienst die Endpunkte der Schnittstellen gemäß [gemSpec_FD_eRP#5.1 Servicelokalisierung] nutzen.
</requirement>

<!-- ToDo: Link auflösen -->

Die Abfrage beim Namensdienst der TI erfolgt über einen DNS-Lookup. Hierfür muss der Konnektor als DNS-Resolver konfiguriert sein.

<!-- A_19744-01 -->
<requirement conformance="SHALL" key="" title="CS: Endpunkt Schnittstelle E-Rezept-Fachdienst" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="Anb_NCPeH_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Das Clientsystem des E-Rezept-Fachdienstes MUSS für die Kommunikation mit dem E-Rezept-Fachdienst die URL mit dem Port 443 bilden.
</requirement>

Die Informationen zu den Endpunkten des Identity Providers ermittelt das Primärsystem aus dem Discovery Document. Für Informationen zum Discovery Document siehe auch [gemSpec_IDP_Dienst#Authorization Server Metadata (Discovery Document)]. Das Discovery Document ist vom IDP-Dienst unter der URL /.well-known/openid-configuration abrufbar. 

Die URL des Downloadpunktes im zentralen Netz der TI lautet: "https://idp.zentral.idp.splitdns.ti-dienste.de/.well-known/openid-configuration" [gemSpec_IDP_Dienst#A_19874-*].

<!-- A_19234-01 -->
<requirement conformance="SHALL" key="" title="CS: Kommunikation über TLS-Verbindung" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="Anb_NCPeH_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Das Clientsystem des E-Rezept-Fachdienstes MUSS für die Anwendungsfälle der Anwendung E-Rezept mit den Diensten der TI ausschließlich über TLS kommunizieren.
</requirement>

Es gelten die Vorgaben aus [gemSpec_Krypt] für TLS.

<!-- A_19235-02 -->
<requirement conformance="SHALL" key="" title="CS: Unzulässige TLS-Verbindungen ablehnen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="Anb_NCPeH_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Das Clientsystem des E-Rezept-Fachdienst MUSS bei jedem Verbindungsaufbau zum E-Rezept-Fachdienst oder IDP-Dienst diesen anhand seines TLS-Zertifikats authentifizieren und MUSS die Verbindungen ablehnen, falls die Authentifizierung fehlschlägt.
</requirement>

<!-- A_20015-02, A_20014-04 -->
<requirement conformance="SHALL" key="" title="CS: HTTP-Header user-agent" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="Anb_NCPeH_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das Clientsystem des E-Rezept-Fachdienstes MUSS in alle HTTP-Requests an den E-Rezept-Fachdienst und IDP-Dienst im äußeren HTTP-Request den HTTP-Header user-agent gemäß [RFC7231] mit &lt;Produktname&gt;/&lt;Produktversion&gt; &lt;Herstellername&gt;/&lt;client_id&gt; mit 
    <ul>
    <li>&lt;Produktname&gt; gemäß eigener Definition, Länge 1-20 Zeichen, Zeichenvorrat [0-9a-zA-Z\-\.]</li>
    <li>&lt;Produktversion&gt; gemäß Produktidentifikation</li>
    <li>&lt;Herstellername&gt; gemäß eigener Definition, Länge 1-20 Zeichen, Zeichenvorrat [0-9a-zA-Z\-\.] </li>
    <li>&lt;client_id&gt; gemäß Registrierung bei der gematik</li>
    des Clientsystems befüllen.
</requirement>

<!-- A_21568-02 -->
<requirement conformance="SHALL" key="" title="CS: HTTP-Header X-erp-user" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="Anb_NCPeH_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das Clientsystem des E-Rezept-Fachdienstes MUSS in alle Anfragen an den E-Rezept-Fachdienst im äußeren HTTP-Request den HTTP-Header "X-erp-user" mit dem Wert
    <ul>
    <li>"l" (kleines L) als PS eines Leistungserbringers</li>
    <li>"k" als CS eines Kostenträgers</li>
    <li>"v" als E-Rezept-FdV oder</li>
    <li>"n" als NCPeH-FDeinfügen.</li>
    </ul>
</requirement>

<!-- A_21569-01, A_21570-01  -->
<requirement conformance="SHALL" key="" title="CS: HTTP-Header X-erp-resource" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="Anb_NCPeH_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das Clientsystem des E-Rezept-Fachdienstes MUSS in alle Anfragen an den E-Rezept-Fachdienst im äußeren HTTP-Request den HTTP-Header "X-erp-resource" mit dem Wert gemäß der angefragten Ressource im FHIR-Request einfügen.
</requirement>

<table>
<tr>
<th>API / Operation</th>
<th>X-erp-resource</th>
</tr>
<tr>
<td>Query API: AuditEvent</td>
<td>AuditEvent</td>
</tr>
<tr>
<td>Query API: ChargeItem</td>
<td>ChargeItem</td>
</tr>
<tr>
<td>Query API: Consent</td>
<td>Consent</td>
</tr>
<tr>
<td>Query API: Communication</td>
<td>Communication</td>
</tr>
<tr>
<td>GET /Device</td>
<td>Device</td>
</tr>
<tr>
<td>GET /metadata</td>
<td>metadata</td>
</tr>
<tr>
<td>POST /Subscription</td>
<td>Subscription</td>
</tr>
<tr>
<td>Query API: Task<br>POST /Task *</td>
<td>Task</td>
</tr>
<tr>
<td>POST /$get-eu-prescriptions</td>
<td>Prescription</td>
</tr>
<tr>
<td>GET /$read-eu-access-permission<br>POST /$grant-eu-access-permission<br>DELETE /$revoke-eu-access-permission</td>
<td>access-permission</td>
</tr>
</table>


### Verschlüsselte Kommunikation zur VAU des E-Rezept-Fachdienstes  
  
Die Kommunikation zum E-Rezept-Fachdienst wird zusätzlich zu TLS über einen sicheren Kanal (Verschlüsselung auf Http-Ebene) zwischen dem PS und der Vertrauenswürdigen Ausführungsumgebung (VAU) im E-Rezept-Fachdienst gesichert. 

<!-- A_19741-01 -->
<requirement conformance="SHALL" key="" title="CS: Umsetzung sicherer Kanal zur VAU des E-Rezept-Fachdienstes" version="0">
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
        <testProcedure id="Produktgutachten"/>
    </actor>
    Das Clientsystem des E-Rezept-Fachdienstes MUSS für alle Anfragen an den E-Rezept-Fachdienst für
	<ul>
	<li>die Abfrage des capability statement</li>
	<li>den Zugriff auf Task, Communication, Consent, Prescription oder access-permission Ressourcen</li>
	</ul>
	das Kommunikationsprotokoll zwischen E-Rezept-VAU und E-Rezept-Clients in der Rolle E-Rezept-Client nutzen.
</requirement>

Für Informationen zum Kommunikationsprotokoll zwischen E-Rezept-FdV und der VAU des E-Rezept-Fachdienstes siehe [gemSpec_Krypt#E-Rezept-spezifische Vorgaben] und [gemSpec_Krypt#VAU-Protokoll für E-Rezept].

Alternativ zur Umsetzung des TUC_PKI_018 gemäß [gemSpec_Krypt#A_21216] soll das Primärsystem für die Prüfung des VAU-Zertifikates die VerifyCertificate Operation des Konnektors/Basis Consumers nutzen.

Folgendes kann umgesetzt werden:
<ol>
<li>Beziehen des VAU-Zertifikat von /VAUCertificate</li>
<li>Lokales Speichern der aktuellen Zeit mit dem VAU-Zertifikat als Tupel</li>
<li>Prüfen des VAU-Zertifikates mittels der Konnektor-Operation VerifyCertificate</li>
<li>Abbrechen falls INVALID</li>
<li>
(5) if (get_current_time() < gespeicherte Zeit + 12h) { VAU-Zertifikat wird als gültig angesehen, Nutzen des VAU-Zertifikat } <br>
if (get_current_time() >= gespeicherte Zeit + 12h) { VAU-Zertifikat neu beziehen, siehe (1)}
</li>
</ol>

Hinweis zum Fehlerhandling: Nur wenn der äußere Response der E-Rezept-Fachdienstes den Response-Code 200 liefert, enthält der payload eine mittels VAU-Protokoll verschlüsselte Response. Liefert der äußere Response eine Code >= 400, ist im VAUProtokoll ein Fehler aufgetreten. Das PS muss nicht versuchen, den payload zu entschlüsseln.
