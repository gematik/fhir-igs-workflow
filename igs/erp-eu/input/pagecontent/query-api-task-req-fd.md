### Anforderungen der Schnittstelle aus diesem Modul

#### PATCH

Der Zugriff mittels der HTTP-Operation PATCH steht ausschließlich dem Versicherten zur Verfügung. Die PATCH-Operation führt zu keiner Statusänderung des Tasks.

<!-- A_27548 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-14" title="E-Rezept-Fachdienst – Task markieren - alles Markieren verbieten" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation PATCH auf den Endpunkt /Task ohne Angabe einer &lt;id&gt; für eine konkrete Ressource mit dem HTTP-Fehlercode 405 ablehnen, um das Markieren mehrerer Ressourcen über einen Request zu verhindern.
</requirement>

<!-- A_27549 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-15" title="E-Rezept-Fachdienst - Task markieren - Versicherter - Rollenprüfung Versicherter markiert Rezepte" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS bei Aufruf der HTTP-PATCH-Operation auf den Endpunkt /Task/&lt;id&gt; sicherstellen, dass ausschließlich Versicherte in der Rolle: oid_versicherter, die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle professionOID des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte markiert werden können.
</requirement>

<!-- A_27550 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-16" title="E-Rezept-Fachdienst -Task markieren -Versicherter - Prüfung KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PATCH-Operation auf eine konkrete über &lt;id&gt; adressierte /Task/&lt;id&gt; Ressource durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die im gespeicherten Datensatz in Task.for.identifier hinterlegte KVNR des begünstigten Versicherten prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich der begünstigte Versicherte als Berechtigter einen Task ändert.
</requirement>

<!-- A_27551 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-17" title="E-Rezept-Fachdienst -Task markieren -Versicherter - FHIR-Validierung Parameters" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PATCH-Operation auf eine konkrete über &lt;id&gt; adressierte /Task/&lt;id&gt; Ressource durch einen Versicherten auf die Ressource übertragene Parameters Ressource gegen das FHIR-Profil GEM_ERPEU_PR_PAR_PATCH_Task_Input prüfen und bei Nicht-Konformität den Aufruf mit dem http-Status-Code 400 ablehnen, damit nur FHIR-valide Ressourcen in den E-Rezept-Fachdienst akzeptiert werden.
</requirement>

<!-- A_27552 -->
<requirement conformance="SHALL" key="IG-TIFLOW-EU-18" title="E-Rezept-Fachdienst -Task markieren -Versicherter - Änderung Markierung Task Ressource" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PATCH-Operation auf eine konkrete über &lt;id&gt; adressierte /Task/&lt;id&gt; Ressource durch einen Versicherten, den im Parameter `eu-isRedeemableByPatientAuthorization` enthaltenen boolschen Wert in `Task.extension:eu-isRedeemableByPatientAuthorization.valueBoolean` setzen.
</requirement>
