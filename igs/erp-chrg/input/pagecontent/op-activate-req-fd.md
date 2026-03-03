Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$activate`.

### Modulspezifische Anforderungen

<!--A_22347-01-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-164" title="E-Rezept-Fachdienst – Task aktivieren – Flowtype 200/209 – Prüfung Coverage Type" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task des Flowtype Task.extension:flowType = 200 oder 209 mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$activate prüfen, ob Coverage.type.coding.code mit dem Wert "PKV" belegt ist und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen, um sicherzustellen, dass diese Workflows nur für E-Rezepte für PKV-Versicherte genutzt werden.
</requirement>
