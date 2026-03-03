Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$accept`.

### Modulspezifische Anforderungen

<!--A_22110-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-163" title="E-Rezept-Fachdienst – Task akzeptieren – Flowtype 200/209 – Einwilligung ermitteln" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task des Flowtype Task.extension:flowType = 200 oder 209 mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$accept, wenn für die KVNR des begünstigten Versicherten (Task.for) eine Consent Ressource mit Consent.patient.identifier = KVNR und Consent.category.coding.code = "CHARGCONS" existiert, das Response Bundle um die Consent Ressource ergänzen, um der abgebenden LEI die Information zu übermitteln, ob der Versicherte eine Einwilligung zum Speichern der Abrechnungsinformationen auf dem E-Rezept-Fachdienst erteilt hat.
</requirement>
