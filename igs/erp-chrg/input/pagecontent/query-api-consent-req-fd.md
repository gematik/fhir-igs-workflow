Diese Seite beschreibt Anforderungen am E-Rezept-Fachdienst zur Nutzung der `Consent`-Query-Endpunkte.

### POST /Consent (Einwilligung erteilen)

<requirement conformance="SHALL" key="IG-ERP-CHRG-219" title="E-Rezept-Fachdienst – Consent schreiben – Rollenprüfung Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Einwilligung nicht durch Unberechtigte erteilt werden kann.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-220" title="E-Rezept-Fachdienst – Consent schreiben – Prüfung KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent sicherstellen, dass die KVNR im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests und die KVNR in Consent.patient.identifier übereinstimmen, damit eine Einwilligung für einen Versicherten nicht durch Dritte erteilt werden kann. Im Fehlerfall muss der Http-Request mit dem Http-Fehlercode 403 abgewiesen werden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-221" title="E-Rezept-Fachdienst – Consent schreiben – FHIR-Validierung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS die im HTTP-POST-Operation auf die Ressource Consent übertragene Consent-Ressource gegen das FHIR-Profil Consent prüfen und bei Nicht-Konformität das Anlegen der Ressource im E-Rezept-Fachdienst mit dem http-Status-Code 400 ablehnen, damit nur FHIR-valide Ressourcen in den E-Rezept-Fachdienst hochgeladen werden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-222" title="E-Rezept-Fachdienst – Consent schreiben – nur eine Einwilligung CHARGCONS pro KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent sicherstellen, dass noch keine Consent-Ressource für die KVNR im ACCESS_TOKEN und Consent.category.coding.code = CHARGCONS gespeichert ist, um maximal eine Einwilligung für den Versicherten zu speichern. Im Fehlerfall muss der Http-Request mit dem Http-Fehlercode 409 abgewiesen werden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-223" title="E-Rezept-Fachdienst – Consent schreiben – Persistieren" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent – falls bei den Prüfungen keine Fehler aufgetreten sind, welche zum Abbruch der Operation führen – die übermittelte Ressource persistieren.
</requirement>

### GET /Consent (Einwilligung einsehen)

<requirement conformance="SHALL" key="IG-ERP-CHRG-217" title="E-Rezept-Fachdienst – Consent lesen – Rollenprüfung Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Consent sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit die Information zur Einwilligung nicht durch Unberechtigte ausgelesen werden kann.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-218" title="E-Rezept-Fachdienst – Consent lesen – Filter Consent auf KVNR des Versicherten" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Consent die dem Versicherten zugeordneten Consent-Ressourcen anhand der KVNR des Versicherten im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren und in den Response aufnehmen, die in Consent.patient.identifier die entsprechende KVNR des begünstigten Versicherten referenziert haben, damit ausschließlich Versicherte ihre eigenen Informationen zu Einwilligungen einsehen können.
</requirement>

### DELETE /Consent (Einwilligung widerrufen)

<requirement conformance="SHALL" key="IG-ERP-CHRG-212" title="E-Rezept-Fachdienst – Consent löschen – alles Löschen verbieten" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent ohne Angabe ?category mit dem HTTP-Fehlercode 405 ablehnen, um das Löschen mehrerer Ressourcen über einen Request zu verhindern.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-213" title="E-Rezept-Fachdienst – Consent löschen – Rollenprüfung Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am E-Rezept-Fachdienst aufrufen dürfen, damit die Information zur Einwilligung nicht durch Unberechtigte gelöscht werden kann.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-214" title="E-Rezept-Fachdienst – Consent löschen – Prüfung category" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent prüfen, dass der für ?category angegebene Wert im System https://gematik.de/fhir/erpchrg/CodeSystem/GEM_ERPCHRG_CS_ConsentType enthalten ist und bei fehlerhafter Prüfung den Request mit dem Fehler 400 abbrechen, damit nur Löschrequests für definierte Consent-Typen ausgeführt werden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-215" title="E-Rezept-Fachdienst – Consent löschen – Löschen der bestehenden Abrechnungsinformationen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent mit ?category=CHARGCONS alle dem Versicherten zugeordneten ChargeItem-Ressourcen (ChargeItem.subject.identifier) anhand der KVNR des Versicherten im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren und löschen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-216" title="E-Rezept-Fachdienst – Consent löschen – Löschen der Consent" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent die Ressource löschen, bei der Consent.patient.identifier der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests sowie Consent.category.coding.code dem in ?category übermittelten Wert entspricht.
</requirement>
