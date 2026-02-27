Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$create`.

<!-- A_19018-01 -->
<requirement conformance="SHALL" key="IG-WF-CORE-11" title="E-Rezept-Fachdienst - Task erzeugen - Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Erzeugen eines Tasks mittels HTTP-POST/$create-Operation die Rolle "professionOID" des Aufrufenden im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich verordnende Leistungserbringer in der Rolle
    <ul>
        <li>oid_praxis_arzt</li>
        <li>oid_zahnarztpraxis</li>
        <li>oid_praxis_psychotherapeut</li>
        <li>oid_krankenhaus</li>
        <li>oid_institution-vorsorge-reha</li>
    </ul> 
    die Operation im Fachdienst aufrufen dürfen, damit E-Rezepte nicht durch zur Verordnung Unberechtigte eingestellt werden können.
</requirement>

<!-- A_19257-01 -->
<requirement conformance="SHALL" key="IG-WF-CORE-11" title="E-Rezept-Fachdienst - Task erzeugen - Schemavalidierung Rezept anlegen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS die im Body der HTTP-POST-Operation auf die Ressource Task übertragenen Parameter gegen das Schema http://gematik.de/fhir/erp/OperationDefinition/CreateOperationDefinition prüfen und bei Nicht-Konformität das Anlegen der Ressource im Fachdienst mit dem http-Status-Code 400 beantworten, damit kein Schadcode und keine "fachfremden" Daten in den E-Rezept-Fachdienst hochgeladen werden.
</requirement>

<!-- A_19112 -->
<requirement conformance="SHALL" key="IG-WF-CORE-11" title="E-Rezept-Fachdienst - Task erzeugen - Parametrierung Task für Workflow-Typ" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Erzeugen eines Tasks mittels HTTP-POST/$create-Operation den Parameter workflowType (Rezepttyp) aus dem HTTP-Body des POST-Requests entnehmen, als Attribut Task.extension:flowType des zu erstellenden Tasks verwenden und bei Fehlen bzw. Nicht-Konformität des Parameters den Request als unzulässig abweisen, damit auf Basis dieser Parameter ausschließlich gültige Workflows gestartet werden können und dem Versicherten bei Einsicht des Tasks der Weg in entweder eine Apotheke oder ein Sanitätshaus oder eine andere zuständige Einrichtung gewiesen werden kann.
</requirement>

<!-- A_19214 -->
<requirement conformance="SHALL" key="IG-WF-CORE-11" title="E-Rezept-Fachdienst - Task erzeugen - Ergänzung Performer-Typ für Einlöseinstitutstyp" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Erzeugen eines Tasks das Feld Task.performerType aus dem übergebenen, gültigen Parameter Task.extension:flowType gemäß der Prozessparameter [gemSpec_DM_eRp#A_19445-*] übernehmen.
</requirement>
<!-- ToDo: Achtung, die Afo wurde zwichenzeitlich aufgeteilt. Muss neu ggf WF-spezifisch formuliert werden. Warum wird diese Eigenschaft nicht beim activate gesetzt?  -->

<!-- A_19019-01 -->
<requirement conformance="SHALL" key="IG-WF-CORE-11" title="E-Rezept-Fachdienst - Task erzeugen - Generierung Rezept-ID" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Anlegen eines neuen Tasks eine Rezept-ID gemäß der Bildungsregel [gemSpec_DM_eRp#A_19217-*] generieren und als Identifier mit Namingsystem https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PrescriptionId dem Task hinzufügen und sicherstellen, dass diese Rezept-ID innerhalb von 11 Jahren nach ihrer Erzeugung nicht erneut vergeben wird, damit es innerhalb der Aufbewahrungsfrist der Abrechnungsdaten bei den Krankenkassen zu keinen Dubletten kommt.
</requirement>

<!-- A_23227 -->
<requirement conformance="SHALL" key="IG-WF-CORE-11" title="E-Rezept-Fachdienst - Task erzeugen - Task-ID=Rezept-ID" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Erzeugen eines neuen Tasks die Rezept-ID, welche mit Task an das verordnende Primärsystem übermittelt wird, als Task-ID verwenden.
</requirement>

<!-- A_19021-02 -->
<requirement conformance="SHALL" key="IG-WF-CORE-11" title="E-Rezept-Fachdienst - Task erzeugen - Generierung AccessCode" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Erzeugen eines Tasks mittels HTTP-POST/$create-Operation eine 256 Bit Zufallszahl mit einer Mindestentropie von 120 Bit erzeugen, hexadezimal kodieren ([0-9a-f]{64}) und diese im zu speichernden Task als externe ID in Task.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode hinzufügen, damit nachfolgende Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.
</requirement>

<!-- A_19114 -->
<requirement conformance="SHALL" key="IG-WF-CORE-11" title="E-Rezept-Fachdienst - Task erzeugen - Status draft" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS die zulässige Anlage eines Tasks mittels HTTP-POST/$create-Operation im Status Task.status = draft vollziehen und beim erfolgreichen Abschluss der Operation die angelegte Ressource Task im HTTP-Body der HTTP-Response zurückgeben, damit die verordnende Leistungserbringerinstitution die generierte Rezept-ID für die QES verwenden kann.
</requirement>