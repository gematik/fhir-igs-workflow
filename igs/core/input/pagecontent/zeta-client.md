### Nutzung ZETA durch Clientsystme 

Zur Umsetzung der ZETA Architektur müssen Clientsysteme folgende Anforderungen erfüllen.

<!-- ToDo: ZETA Stufe 2 wird zusätzlich FdV betrachten. Hier sind nach Finalisierung der Stufe 2 entsprechend zu reviewn und zu ergänzen. -->

<requirement conformance="SHALL" key="" title="CS: ZETA Client" version="0">
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
    <actor name="NCPeH_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Das Clientsystem des TI-Flow-Fachdienstes MUSS die ZETA Client Funktionen gemäß [gemSST_PS_ZETA] umsetzen.
</requirement>

<!-- ToDo: link auflösen, Dokument ist noch nicht veröffentlicht -->

<requirement conformance="SHALL" key="" title="CS: ZETA Client - Kommunikation mit Fachdienst" version="0">
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
    <actor name="NCPeH_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Das Clientsystem des TI-Flow-Fachdienstes MUSS sicherstellen, dass jegliche Kommunikation mit dem TI-FlowFachdienst über den ZETA Client erfolgt.
</requirement>

Hinweis: Der Zeta-Client beinhaltet zwingend zu nutzende Kommunikationsfunktionen wie TLS, ZETA/ASL-Kanal und weitere (siehe [gemSpec_ZETA])

<requirement conformance="SHALL" key="" title="CS: ZETA Client - Authentisierung" version="0">
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
    <actor name="NCPeH_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Ein Clientsystem des TI-Flow-Fachdienstes MUSS zur Authentisierung der Institution das Verfahren mittels SM(C)-B signiertem Client Assertion JWT und DPoP gemäß [RFC7523] und [RFC9449] verwenden.
</requirement>

<requirement conformance="SHALL" key="" title="CS: ZETA Client - ZETA/ASL-Kanal" version="0">
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
    <actor name="NCPeH_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Ein Clientsystem des TI-Flow-Fachdienstes MUSS für jede Anfrage an den TI-Flow-Fachdienst die ZETA Client Funktion mit aktivem ZETA/ASL-Kanal verwenden.
</requirement>
