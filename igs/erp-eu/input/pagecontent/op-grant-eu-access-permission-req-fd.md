### Anforderungen der Schnittstelle aus diesem Modul

<!-- A_27088 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-55" title="E-Rezept-Fachdienst - Zugriffsberechtigung schreiben - Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /$grant-eu-access-permission die Rolle professionOID des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am E-Rezept-Fachdienst aufrufen dürfen, damit eine Zugriffsberechtigte nicht durch Unberechtigte erteilt werden kann.
</requirement>

<!-- A_27089 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-56" title="E-Rezept-Fachdienst - Zugriffsberechtigung schreiben - Prüfung Einwillung für KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /$grant-eu-access-permission die KVNR des Versicherten im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ein Consent-Datensatz mit Consent.patient.identifier = KVNR und Consent.category.coding.code = EUDISPCONS existiert und bei fehlgeschlagener Prüfung die Operation mit dem HTTP-Fehlercode 403 und dem OperationOutcome "Das Erstellen einer Zugriffsberechtigung ist erst zulässig, wenn eine Einwilligung durch den Nutzer zum Einlösen von E-Rezepten im europäischen Ausland erteilt wurde." abbrechen, damit nur Versicherte eine Zugriffsberechtigung schreiben, die eine Einwilligung erteilt haben.
</requirement>

<!-- A_27090 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-57" title="E-Rezept-Fachdienst - Zugriffsberechtigung schreiben - Prüfung Ländercode" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /$grant-eu-access-permission prüfen, dass der im Request übermittelte Ländercode (Parameters.parameter:countryCode) einem Land entspricht, welches die Anwendung ePrescription/eDispensation Szenario Land A unterstützt und bei fehlschlagender Prüfung die Operation mit dem HTTP-Fehlercode 409 und dem OperationOutcome "Für das angefragte Land ist Einlösen von E-Rezepten nicht möglich." abbrechen, damit der Versicherte nur für zulässige europäische Länder eine Zugriffsberechtigung erteilt.
</requirement>

<!-- A_27091 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-58" title="E-Rezept-Fachdienst - Zugriffsberechtigung schreiben - Prüfung Zugriffscode" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /$grant-eu-access-permission prüfen, dass der im Request übermittelte Zugriffscode (Parameters.parameter:accessCode) das korrekte Format hat und bei fehlschlagender Prüfung die Operation mit dem HTTP-Fehlercode 400 und dem OperationOutcome "Der übermittelte Zugriffscode ist nicht zulässig." abbrechen.
</requirement>

<!-- A_27092 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-59" title="E-Rezept-Fachdienst - Zugriffsberechtigung schreiben - Löschen bestehender Zugriffsberechtigung" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /$grant-eu-access-permission prüfen, ob für die im Request übermittelte KVNR Zugriffsberechtigungen gespeichert sind und falls ja, diese löschen.
</requirement>

<!-- A_27093 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-60" title="E-Rezept-Fachdienst - Zugriffsberechtigung schreiben - Neue Zugriffsberechtigung speichern" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /$grant-eu-access-permission mit dem im Request übermittelten KVNR, Zugriffscode und Ländercode eine neue Zugriffsberechtigung speichern und den Wert valid_until auf aktuellen Zeitpunkt + 1h setzen.
</requirement>

<!-- A_27094 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-61" title="E-Rezept-Fachdienst - Zugriffsberechtigung schreiben - Response" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS im Response zu einem Aufruf der HTTP-POST-Operation auf den Endpunkt /$grant-eu-access-permission eine Ressource des Profils [GEM_ERP_PR_PAR_EU_Access_Authorization_Response] mit den Daten des gespeicherten Datensatz zur Zugriffsberechtigung übermitteln.
</requirement>




<!-- ToDo: Die Afo soll an einen geeigneten Ort verschoben werden. -->

<!-- A_27083 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-62" title="E-Rezept-Fachdienst - Zugriffsberechtigung - periodische Bereinigung" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS periodisch prüfen, dass keine zeitlich ungültigen Zugriffsberechtigungen gespeichert sind.
</requirement>
