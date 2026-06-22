
### Kommunikation zu den Diensten der TI

Ein Clientsystem nutzen für die Kommunikation zu den Diensten der TI TLS-Verbindungen. Es verbindet sich bspw. mit dem TI-Flow-Fachdienst, PoPP-Service oder FHIR-VZD.

<!-- A_19451-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-155" title="CS: Lokalisierung TI-Flow-Fachdienst" version="1">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend" description="E-Rezept-Schnittstelle eines verordnenden PS (Leistungserbringer)">
        <testProcedure id="Konformitätsbestätigung">funkt. Eignung: Konformitätsbestätigung</testProcedure>
    </actor>
    <actor name="PS_E-Rezept_abgebend" description="E-Rezept-Schnittstelle eines abgebenden PS (Apotheke)">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="CS_E-Rezept_KTR" description="CS-Schnittstelle für E-Rezept/Kostenträger">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="Anb_NCPeH_FD" description="Anbieter eines NCPeH-Fachdienstes">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Das Clientsystem des TI-Flow-Fachdienstes MUSS für die Kommunikation mit dem TI-Flow-Fachdienst die Endpunkte der Schnittstellen gemäß [gemSpec_FD_eRP]#5.1 Servicelokalisierung nutzen.
</requirement>

<!-- ToDo: Link gemSpec_FD_eRP#5.1 Servicelokalisierung auflösen -->

Die Abfrage beim Namensdienst der TI erfolgt über einen DNS-Lookup. Hierfür muss der Konnektor als DNS-Resolver konfiguriert sein.
<!-- ToDo: wie erfolgt Namensauflösung für Clientsysteme in der TI2.0 -->

<!-- A_19744-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-156" title="CS: Endpunkt Schnittstelle TI-Flow-Fachdienst" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend" description="E-Rezept-Schnittstelle eines verordnenden PS (Leistungserbringer)">
        <testProcedure id="Konformitätsbestätigung">funkt. Eignung: Konformitätsbestätigung</testProcedure>
    </actor>
    <actor name="PS_E-Rezept_abgebend" description="E-Rezept-Schnittstelle eines abgebenden PS (Apotheke)">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="CS_E-Rezept_KTR" description="CS-Schnittstelle für E-Rezept/Kostenträger">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="Anb_NCPeH_FD" description="Anbieter eines NCPeH-Fachdienstes">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Das Clientsystem des TI-Flow-Fachdienstes MUSS für die Kommunikation mit dem TI-Flow-Fachdienst die URL mit dem Port 443 bilden.
</requirement>

<!-- A_19234-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-157" title="CS: Kommunikation über TLS-Verbindung" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend" description="E-Rezept-Schnittstelle eines verordnenden PS (Leistungserbringer)">
        <testProcedure id="Konformitätsbestätigung">funkt. Eignung: Konformitätsbestätigung</testProcedure>
    </actor>
    <actor name="PS_E-Rezept_abgebend" description="E-Rezept-Schnittstelle eines abgebenden PS (Apotheke)">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="CS_E-Rezept_KTR" description="CS-Schnittstelle für E-Rezept/Kostenträger">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="Anb_NCPeH_FD" description="Anbieter eines NCPeH-Fachdienstes">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Das Clientsystem des TI-Flow-Fachdienstes MUSS für die Anwendungsfälle der Anwendung E-Rezept mit den Diensten der TI ausschließlich über TLS kommunizieren.
</requirement>

Es gelten die Vorgaben aus [gemSpec_Krypt] für TLS.

<!-- A_19235-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-158" title="CS: Unzulässige TLS-Verbindungen ablehnen" version="1">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend" description="E-Rezept-Schnittstelle eines verordnenden PS (Leistungserbringer)">
        <testProcedure id="Konformitätsbestätigung">funkt. Eignung: Konformitätsbestätigung</testProcedure>
    </actor>
    <actor name="PS_E-Rezept_abgebend" description="E-Rezept-Schnittstelle eines abgebenden PS (Apotheke)">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="CS_E-Rezept_KTR" description="CS-Schnittstelle für E-Rezept/Kostenträger">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="Anb_NCPeH_FD" description="Anbieter eines NCPeH-Fachdienstes">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Das Clientsystem des TI-Flow-Fachdienst MUSS bei jedem Verbindungsaufbau zum TI-Flow-Fachdienst diesen anhand seines TLS-Zertifikats authentifizieren und MUSS die Verbindungen ablehnen, falls die Authentifizierung fehlschlägt.
</requirement>

<!-- A_20015-02, A_20014-04 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-159" title="CS: HTTP-Header user-agent" version="1">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend" description="E-Rezept-Schnittstelle eines verordnenden PS (Leistungserbringer)">
        <testProcedure id="Konformitätsbestätigung">funkt. Eignung: Konformitätsbestätigung</testProcedure>
    </actor>
    <actor name="PS_E-Rezept_abgebend" description="E-Rezept-Schnittstelle eines abgebenden PS (Apotheke)">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="CS_E-Rezept_KTR" description="CS-Schnittstelle für E-Rezept/Kostenträger">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="Anb_NCPeH_FD" description="Anbieter eines NCPeH-Fachdienstes">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    <actor name="eRp_FdV" description="E-Rezept-Frontend des Versicherten">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Das Clientsystem des TI-Flow-Fachdienstes MUSS in alle HTTP-Requests an den TI-Flow-Fachdienst im äußeren HTTP-Request den HTTP-Header user-agent gemäß [RFC7231] mit &lt;Produktname&gt;/&lt;Produktversion&gt; &lt;Herstellername&gt;/&lt;client_id&gt; mit 
    <ul>
        <li>&lt;Produktname&gt; gemäß eigener Definition, Länge 1-20 Zeichen, Zeichenvorrat [0-9a-zA-Z\-\.]</li>
        <li>&lt;Produktversion&gt; gemäß Produktidentifikation</li>
        <li>&lt;Herstellername&gt; gemäß eigener Definition, Länge 1-20 Zeichen, Zeichenvorrat [0-9a-zA-Z\-\.] </li>
        <li>&lt;client_id&gt; gemäß Registrierung bei der gematik</li>
    </ul>
    des Clientsystems befüllen.
</requirement>

<!-- A_21568-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-160" title="CS: HTTP-Header X-erp-user" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend" description="E-Rezept-Schnittstelle eines verordnenden PS (Leistungserbringer)">
        <testProcedure id="Konformitätsbestätigung">funkt. Eignung: Konformitätsbestätigung</testProcedure>
    </actor>
    <actor name="PS_E-Rezept_abgebend" description="E-Rezept-Schnittstelle eines abgebenden PS (Apotheke)">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="CS_E-Rezept_KTR" description="CS-Schnittstelle für E-Rezept/Kostenträger">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="Anb_NCPeH_FD" description="Anbieter eines NCPeH-Fachdienstes">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    <actor name="eRp_FdV" description="E-Rezept-Frontend des Versicherten">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Das Clientsystem des TI-Flow-Fachdienstes MUSS in alle Anfragen an den TI-Flow-Fachdienst im äußeren HTTP-Request den HTTP-Header "X-erp-user" mit dem Wert
    <ul>
    <li>"l" (kleines L) als PS eines Leistungserbringers</li>
    <li>"k" als CS eines Kostenträgers</li>
    <li>"v" als E-Rezept-FdV oder</li>
    <li>"n" als NCPeH-FD</li>
    </ul>
    einfügen.
</requirement>

<!-- A_21569-01, A_21570-01  -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-161" title="CS: HTTP-Header X-erp-resource" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend" description="E-Rezept-Schnittstelle eines verordnenden PS (Leistungserbringer)">
        <testProcedure id="Konformitätsbestätigung">funkt. Eignung: Konformitätsbestätigung</testProcedure>
    </actor>
    <actor name="PS_E-Rezept_abgebend" description="E-Rezept-Schnittstelle eines abgebenden PS (Apotheke)">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="CS_E-Rezept_KTR" description="CS-Schnittstelle für E-Rezept/Kostenträger">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="Anb_NCPeH_FD" description="Anbieter eines NCPeH-Fachdienstes">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    <actor name="eRp_FdV" description="E-Rezept-Frontend des Versicherten">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Das Clientsystem des TI-Flow-Fachdienstes MUSS in alle Anfragen an den TI-Flow-Fachdienst im äußeren HTTP-Request den HTTP-Header "X-erp-resource" mit dem Wert gemäß der angefragten Ressource im FHIR-Request einfügen.
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
<div><figcaption><strong>Tabelle: </strong>HTTP-Header "X-erp-resource"</figcaption></div>


### Verschlüsselte Kommunikation zur VAU des TI-Flow-Fachdienstes  
  
Die Kommunikation zum TI-Flow-Fachdienst wird zusätzlich zu TLS über einen sicheren Kanal (Verschlüsselung auf Http-Ebene) zwischen dem PS und der Vertrauenswürdigen Ausführungsumgebung (VAU) im TI-Flow-Fachdienst gesichert. 

<!-- A_19741-01, A_19740-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-162" title="CS: Umsetzung sicherer Kanal zur VAU des TI-Flow-Fachdienstes" version="1">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend" description="E-Rezept-Schnittstelle eines verordnenden PS (Leistungserbringer)">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="PS_E-Rezept_abgebend" description="E-Rezept-Schnittstelle eines abgebenden PS (Apotheke)">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="CS_E-Rezept_KTR" description="CS-Schnittstelle für E-Rezept/Kostenträger">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="Anb_NCPeH_FD" description="Anbieter eines NCPeH-Fachdienstes">
        <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
    </actor>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Das Clientsystem des TI-Flow-Fachdienstes MUSS für alle Anfragen an den TI-Flow-Fachdienst für
	<ul>
	<li>die Abfrage des capability statement</li>
	<li>den Zugriff auf Task, MedicationDispense, Communication, Consent, Prescription, AuditEvent oder access-permission Ressourcen</li>
	</ul>
	das Kommunikationsprotokoll zwischen VAU des TI-Flow-Fachdienstes und Clientsysteme des TI-Flow-Fachdienstes in der Rolle TI-Flow-Client nutzen.
</requirement>

Für Informationen zum Kommunikationsprotokoll zwischen E-Rezept-FdV und der VAU des TI-Flow-Fachdienstes siehe [gemSpec_Krypt]#E-Rezept-spezifische Vorgaben und [gemSpec_Krypt]#ZETA/ASL (VAU-Protokoll).

Alternativ zur Umsetzung des TUC_PKI_018 gemäß [gemSpec_Krypt]#A_21216 soll das Primärsystem für die Prüfung des VAU-Zertifikates die VerifyCertificate Operation des Konnektors/Basis Consumers nutzen.

<!-- ToDo: Anpassen auf ASL -->
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

Hinweis zum Fehlerhandling: Nur wenn der äußere Response der TI-Flow-Fachdienstes den Response-Code 200 liefert, enthält der payload eine mittels ASL-Protokoll verschlüsselte Response. Liefert der äußere Response eine Code >= 400, ist im ASL-Protokoll ein Fehler aufgetreten. Das PS muss nicht versuchen, den payload zu entschlüsseln.
