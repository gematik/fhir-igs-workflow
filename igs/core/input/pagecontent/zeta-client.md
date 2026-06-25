### Nutzung ZETA durch Clientsystme 

Zur Umsetzung der ZETA Architektur müssen Clientsysteme folgende Anforderungen erfüllen.

<!-- ToDo: ZETA Stufe 2 wird zusätzlich FdV betrachten. Hier sind nach Finalisierung der Stufe 2 entsprechend zu reviewn und zu ergänzen. -->

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A434" title="CS: ZETA Client" version="0">
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
    Das Clientsystem des TI-Flow-Fachdienstes MUSS die ZETA Client Funktionen gemäß [gemSST_PS_ZETA_V] umsetzen.
</requirement>

<!-- ToDo: link auflösen, Dokument ist noch nicht veröffentlicht. ZETA plant , es später bereitzustellen. -->

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A435" title="CS: ZETA Client - Kommunikation mit Fachdienst" version="0">
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
    Das Clientsystem des TI-Flow-Fachdienstes MUSS sicherstellen, dass jegliche Kommunikation mit dem TI-FlowFachdienst über den ZETA Client erfolgt.
</requirement>

Hinweis: Der Zeta-Client beinhaltet zwingend zu nutzende Kommunikationsfunktionen wie TLS, ZETA/ASL-Kanal und weitere (siehe [gemSpec_ZETA])

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A436" title="CS: ZETA Client - Authentisierung" version="0">
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
    Das Clientsystem des TI-Flow-Fachdienstes MUSS zur Authentisierung der Institution das Verfahren mittels SM(C)-B signiertem Client Assertion JWT und DPoP gemäß [RFC7523] und [RFC9449] verwenden.
</requirement>

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A437" title="CS: ZETA Client - ZETA/ASL-Kanal" version="0">
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
    Das Clientsystem des TI-Flow-Fachdienstes MUSS für jede Anfrage an den TI-Flow-Fachdienst die ZETA Client Funktion mit aktivem ZETA/ASL-Kanal verwenden.
</requirement>
