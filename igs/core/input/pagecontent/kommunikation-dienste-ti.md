
### Kommunikation zu den Diensten der TI

Ein Clientsystem nutzen für die Kommunikation zu den Diensten der TI TLS-Verbindungen. Es verbindet sich bspw. mit dem TI-Flow-Fachdienst, PoPP-Service oder FHIR-VZD.

<!-- A_19451-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A155" title="CS: Lokalisierung TI-Flow-Fachdienst" version="0">
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
    <actor name="NCPeH_ePeDA" description="ePrescription/eDispensation Land-A National Contact Point for eHealth">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Das Clientsystem des TI-Flow-Fachdienstes MUSS für die Kommunikation mit dem TI-Flow-Fachdienst die Endpunkte der Schnittstellen gemäß [gemSpec_FD_eRP]#5.1 Servicelokalisierung nutzen.
</requirement>

<!-- ToDo: Link gemSpec_FD_eRP#5.1 Servicelokalisierung auflösen -->

Die Abfrage beim Namensdienst der TI erfolgt über einen DNS-Lookup. Hierfür muss der Konnektor als DNS-Resolver konfiguriert sein.
<!-- ToDo: wie erfolgt Namensauflösung für Clientsysteme in der TI2.0 -->

<!-- A_19744-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A156" title="CS: Endpunkt Schnittstelle TI-Flow-Fachdienst" version="0">
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
    <actor name="NCPeH_ePeDA" description="ePrescription/eDispensation Land-A National Contact Point for eHealth">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Das Clientsystem des TI-Flow-Fachdienstes MUSS für die Kommunikation mit dem TI-Flow-Fachdienst die URL mit dem Port 443 bilden.
</requirement>

<!-- A_19234-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A157" title="CS: Kommunikation über TLS-Verbindung" version="0">
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
    <actor name="NCPeH_ePeDA" description="ePrescription/eDispensation Land-A National Contact Point for eHealth">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Das Clientsystem des TI-Flow-Fachdienstes MUSS für die Anwendungsfälle der Anwendung E-Rezept mit den Diensten der TI ausschließlich über TLS kommunizieren.
</requirement>

Es gelten die Vorgaben aus [gemSpec_Krypt] für TLS.

<!-- A_19235-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A158" title="CS: Unzulässige TLS-Verbindungen ablehnen" version="0">
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
    <actor name="NCPeH_ePeDA" description="ePrescription/eDispensation Land-A National Contact Point for eHealth">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Das Clientsystem des TI-Flow-Fachdienst MUSS bei jedem Verbindungsaufbau zum TI-Flow-Fachdienst diesen anhand seines TLS-Zertifikats authentifizieren und MUSS die Verbindungen ablehnen, falls die Authentifizierung fehlschlägt.
</requirement>

### Verschlüsselte Kommunikation zur VAU des TI-Flow-Fachdienstes  
  
Die Kommunikation zum TI-Flow-Fachdienst wird zusätzlich zu TLS über einen sicheren Kanal (Verschlüsselung auf Http-Ebene) zwischen dem PS und der Vertrauenswürdigen Ausführungsumgebung (VAU) im TI-Flow-Fachdienst gesichert. 

<!-- A_19741-01, A_19740-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A162" title="CS: Umsetzung sicherer Kanal zur VAU des TI-Flow-Fachdienstes" version="0">
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
    <actor name="NCPeH_ePeDA" description="ePrescription/eDispensation Land-A National Contact Point for eHealth">
        <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
    </actor>
    Das Clientsystem des TI-Flow-Fachdienstes MUSS für alle Anfragen an den TI-Flow-Fachdienst für
	<ul>
	<li>die Abfrage des capability statement</li>
	<li>den Zugriff auf Task, MedicationDispense, Communication, Consent, Prescription, AuditEvent oder access-permission Ressourcen</li>
	</ul>
	das Kommunikationsprotokoll zwischen VAU des TI-Flow-Fachdienstes und Clientsysteme des TI-Flow-Fachdienstes in der Rolle TI-Flow-Client nutzen.
</requirement>

Für Informationen zum Kommunikationsprotokoll zwischen E-Rezept-FdV und der VAU des TI-Flow-Fachdienstes siehe [gemSpec_Krypt]#E-Rezept-spezifische Vorgaben und [gemSpec_Krypt]#ZETA/ASL (VAU-Protokoll).

<!-- TI-Flow-26_2 BSI_16 -->
<requirement conformance="MAY" key="IG-TIFLOW-CORE-A459" title="CS: Alternative VAU-Zertifikat-Verifikation mittels Konnektor" version="0">
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
    Das Clientsystem des TI-Flow-Fachdienstes KANN als Alternative zur Umsetzung des TUC_PKI_018 gemäß [gemSpec_Krypt]#A_21216 für die Prüfung des VAU-Zertifikates die VerifyCertificate Operation des Konnektors/Basis Consumers nach folgendem Verfahren nutzen:
    <ol>
    <li>Beziehen des VAU-Zertifikates von /VAUCertificate</li>
    <li>Lokales Speichern der aktuellen Zeit mit dem VAU-Zertifikat als Tupel</li>
    <li>Prüfung des VAU-Zertifikates mittels der Konnektor-Operation VerifyCertificate</li>
    <li>Abbruch falls INVALID</li>
    <li>Wenn (get_current_time() &lt; gespeicherte Zeit + 12h): VAU-Zertifikat wird als gültig angesehen und verwendet; andernfalls (get_current_time() &gt;= gespeicherte Zeit + 12h): VAU-Zertifikat erneut beziehen (siehe Punkt 1)</li>
    </ol>
</requirement>

