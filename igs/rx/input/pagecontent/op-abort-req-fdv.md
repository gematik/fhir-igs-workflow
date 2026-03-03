### Anforderungen aus der Core Spezifikation

{% include core.op-abort-req-fdv.md %}

### Modulspezifische Anforderungen

<!-- A_21362-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-5" title="E-Rezept-FdV: E-Rezept löschen - Flowtype 169 / 209 - nur wenn beliefert" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das E-Rezept-FdV DARF im Anwendungsfall "E-Rezept löschen" dem Nutzer das Löschen von E-Rezepten mit dem Flowtype 169 oder 209 NICHT ermöglichen, wenn der Task einen Status ungleich "completed" hat.
</requirement>
