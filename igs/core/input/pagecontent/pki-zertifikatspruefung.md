### Zertifikatsprüfung

Clientsysteme verwenden bei den in TAB_ILFERP_012 dargestellten Aktivitäten Zertifikate.

<table>
<tr>
<th>Aktivität</th>
<th>Zertifikat der TI</th>
<th>Zertifikatstyp</th>
<th>Rollen-OID</th>
<th>Nutzung</th>
</tr>
<tr>
<td>TLS-Verbindungsaufbau zum TI-Flow-Fachdienst</td>
<td>nein</td>
<td>TLS Internet Zertifikat</td>
<td>n/a</td>
<td>aktiv</td>
</tr>
<tr>
<td>TLS-Verbindungsaufbau zum Verzeichnisdienst der TI</td>
<td>nein</td>
<td>TLS Internet Zertifikat</td>
<td>n/a</td>
<td>aktiv</td>
</tr>
<tr>
<td>TLS-Verbindungsaufbau zum IDP-Dienst</td>
<td>nein</td>
<td>TLS Internet Zertifikat</td>
<td>n/a</td>
<td>aktiv</td>
</tr>
<tr>
<td>Aufbau sicherer Kanal zur VAU des TI-Flow-Fachdienstes</td>
<td>ja</td>
<td>C.FD.ENC</td>
<td>oid_erp-vau</td>
<td>aktiv</td>
</tr>
<tr>
<td>Nur für PS der abgebenden LEI: Signaturzertifikat TI-Flow-Fachdienst</td>
<td>ja</td>
<td>C.FD.OSIG</td>
<td>oid_erezept</td>
<td>aktiv</td>
</tr>
</table>
<div><figcaption><strong>Tabelle: </strong>Zertifikatsnutzung"</figcaption></div>

Es gelten folgende übergreifende Festlegungen für die Prüfung aktiv durch ein Clientsystem genutzter Zertifikate.

<!-- A_20769-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-302" title="CS: verpflichtende Zertifikatsprüfung" version="0">
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
    Das Clientsystem des TI-Flow-Fachdienst MUSS alle Zertifikate, die es aktiv verwendet (bspw. TLS-Verbindungsaufbau), auf Integrität und Authentizität prüfen. Falls die Prüfung kein positives Ergebnis ("gültig") liefert, so MUSS es die von dem Zertifikat und den darin enthaltenen Attributen (bspw. öffentliche Schlüssel) abhängenden Arbeitsabläufe ablehnen. <br>
	Das Clientsystem des TI-Flow-Fachdienst MUSS alle öffentlichen Schlüssel, die es verwenden will, auf eine positiv verlaufene Zertifikatsprüfung zurückführen können.
</requirement>

"Ein Zertifikat aktiv verwenden" bedeutet im Sinne von A_20769, dass ein Clientsystem einen dort aufgeführten öffentlichen Schlüssel innerhalb einer kryptografischen Operation (Signaturprüfung, Verschlüsselung, Signaturprüfung von öffentlichen (EC)DH-Schlüsseln etc.) nutzt. Erhält ein Clientsystem bspw. einen ACCESS_TOKEN, in dem Signaturen und Zertifikate enthalten sind, und behandelt es diesen Token als opakes Datenobjekt, ohne die Zertifikate darin gesondert zu betrachten, dann verwendet das Primärsystem diese Zertifikate im Sinne von A_20769 passiv.

#### Zertifikatsprüfung von Zertifikaten der TI


<!-- A_20764 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-303" title="CS: Prüfung TI-Zertifikate" version="0">
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
    Das Primärsystem MUSS bei der Prüfung von X.509-Zertifikaten der TI den CertificateService des Konnektors mit der Operation VerifyCertificate gemäß [gemSpec_Kon#4.1.9.5.3] verwenden und dabei
    <ul>
    <li>das zu prüfende Zertifikat als Parameter X509Certificate verwenden</li>
    <li>die aktuelle Systemzeit als Parameter VerificationTime verwenden</li>
    </ul>
    Das Primärsystem MUSS bei Prüfung eines C.FD.ENC den Rückgabewert in RoleList gegen die erwartete Rollen-OID gemäß TAB_ILFERP_012 prüfen und bei Abweichungen die Benutzung des Zertifikats für einen Verbindungsaufbau zur VAU ablehnen.
</requirement>

#### Zertifikatsprüfung von Internet-Zertifikaten

Folgende Vorgaben gelten für die Prüfung von Internet-Zertifikaten.

<!-- A_20091-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-304" title="CS: Prüfung der Zertifikate für TLS-Verbindung zu TI-Flow-Fachdienst und IDP-Dienst" version="0">
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
    Das Clientsystem des TI-Flow-Fachdienst MUSS für die Prüfung eines Zertifikats für den TLS-Verbindungsaufbau zum TI-Flow-Fachdienst und IDP das Zertifikat auf ein CA-Zertifikat einer CA, die die "CA/Browser Forum Baseline Requirements for the Issuance and Management of Publicly-Trusted Certificates" [Baseline Requirements for TLS Server Certificates] erfüllt, kryptographisch (Signaturprüfung) zurückführen können. Ansonsten MUSS es das Zertifikat als "ungültig" bewerten.Das Clientsystem des TI-Flow-Fachdienst MUSS die zeitliche Gültigkeit des Zertifikats prüfen. Falls diese Prüfung negativ ausfällt, muss es das Zertifikat als "ungültig" bewerten.
</requirement>

Hinweis: Der erste Teil von A_20091-* ist gleichbedeutend damit, dass das CA-Zertifikat im Zertifikats-Truststore eines aktuellen Webbrowsers ist.