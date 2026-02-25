<!--A_22879-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-181" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern (PATCH) – alles Ändern verbieten" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation PATCH auf den Endpunkt /ChargeItem ohne Angabe einer &#60;id&#62; für eine konkrete Ressource mit dem HTTP-Fehlercode 405 ablehnen, um das Ändern mehrerer Ressourcen über einen Request zu verhindern.
</requirement>

<!--A_22875-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-182" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern (PATCH) – Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-PATCH-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource sicherstellen, dass ausschließlich Nutzer in der Rolle oid_versicherter die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Abrechnungsinformation nicht durch Unberechtigte aktualisiert werden kann.
</requirement>

<!--A_22877-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-183" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern (PATCH) – Versicherter – Prüfung KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PATCH-Operation auf eine konkrete über &#60;id&#62; adressierte /ChargeItem/&#60;id&#62; Ressource durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die im gespeicherten Datensatz in ChargeItem.subject.identifier hinterlegte KVNR des begünstigten Versicherten prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich der begünstigte Versicherte eine Abrechnungsinformation ändert.
</requirement>

<!--A_27566-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-45416QLJ" title="E-Rezept-Fachdienst - Abrechnungsinformation ändern (PATCH) - FHIR-Validierung Parameters" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS die in der HTTP-PATCH-Operation auf die Ressource Chargeltem übertragene Parameters Ressource gegen das FHIR-Profil GEM_ERPCHRG_PR_PAR_Patch_ChargeItem_Input prüfen und bei Nicht-Konformität das Verarbeiten der Ressource im E-Rezept-Fachdienst mit dem http-Status-Code 400 ablehnen.
</requirement>