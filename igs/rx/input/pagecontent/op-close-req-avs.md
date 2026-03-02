Diese Seite enthält die normativen Anforderungen an das AVS für die Operation `$close`.

### Anforderungen aus der Core Spezifikation

{% include core-op-close-req-avs.md %}

### Modulspezifische Anforderungen

<!-- A_19288-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-29" title="PS abgebende LEI:  Quittung abrufen - Dispensierinformationen erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI MUSS im Anwendungsfall "Quittung abrufen" die Dispensierinformationen nach den Vorgaben aus "Erstellen von Dispensierinformationen" erzeugen, wenn sie übermittelt werden sollen.
</requirement>

<!-- A_27840 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-217" title="PS abgebende LEI: Quittung abrufen - Abruf der Quittung durchführen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS den Anwendungsfall "Quittung abrufen" für Verordnungen, welche abschließend verarbeitet wurden, ausführen, um den Workflow am E-Rezept-Fachdienst abzuschließen.
</requirement>
