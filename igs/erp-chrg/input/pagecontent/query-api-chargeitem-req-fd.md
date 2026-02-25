Diese Seite beschreibt Anforderungen am E-Rezept-Fachdienst zur Nutzung der `ChargeItem`-Query-Endpunkte.

## Allgemeine Regeln
<!--A_22111-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-165" title="E-Rezept-Fachdienst – ChargeItem – unzulässige Operationen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS alle Zugriffe auf die Ressource ChargeItem mittels der HTTP-Operationen HEAD unterbinden, damit keine unzulässigen Operationen auf die Informationen zu Abrechnungsinformationen ausgeführt werden können.
</requirement>