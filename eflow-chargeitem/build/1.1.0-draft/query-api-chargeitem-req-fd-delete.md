<!--A_22112-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-166" title="E-Rezept-Fachdienst – Abrechnungsinformation löschen – alles Löschen verbieten" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS den Aufruf der Operation DELETE /ChargeItem ohne Angabe einer konkreten über &#60;id&#62; adressierte ChargeItem Ressource mit dem HTTP-Fehlercode 405 ablehnen, um das Löschen mehrerer Ressourcen über einen Request zu verhindern.
</requirement>

<!--A_22113-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-167" title="E-Rezept-Fachdienst – Abrechnungsinformation löschen – Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource sicherstellen, dass ausschließlich Nutzer in der Rolle 
- oid_versicherter 
die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Abrechnungsinformation nicht durch Unberechtigte gelöscht werden kann.
</requirement>

<!--A_22114-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-168" title="E-Rezept-Fachdienst – Abrechnungsinformation löschen – Prüfung KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in ChargeItem.subject.identifier hinterlegte KVNR des begünstigten Versicherten prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich der begünstigte Versicherte eine Abrechnungsinformation löscht.
</requirement>

<!--A_22117-01-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-169" title="E-Rezept-Fachdienst – Abrechnungsinformation löschen – zu löschende Ressourcen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Löschen einer ChargeItem-Ressource auch 
- die in ChargeItem.supportingInformation referenzierten Ressourcen des Verordnungsdatensatzes, des PKV-Abgabedatensatzes und der Quittung,
- alle Communication mit Communication.basedOn = ChargeItem.id, 
löschen.
</requirement>