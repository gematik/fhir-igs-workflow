Diese Seite enthält die normativen Anforderungen an das PVS für die Operation `$activate`.

### Anforderungen aus der Core Spezifikation

{% include core.op-activate-req-pvs.md %}

### Modulspezifische Anforderungen

### Anforderungen im Rahmen des Moduls Arzneimittel
<!-- A_19275 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-255" title="PS verordnende LEI: E-Rezept erstellen - E-Rezept-Bundle erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
        Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden erstellen" eine Bundle-FHIR-Ressource gemäß Profilierung https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle Rezept-ID aus der Task-Ressource als Identifier erstellen.
</requirement>

### Anforderungen Workflow 200, 209
<!-- A_22541-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-256" title="PS verordnende LEI: E-Rezept erstellen - Flowtype 200/209 - KVNR als Identifier" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
        Das PS der verordnenden LEI MUSS im Verordnungsdatensatz für ein E-Rezept des Flowtype 200 oder 209 als Identifier des Patienten in Patient.identifer.value die KVNR des Versicherten verwenden.
</requirement>
<!-- A_22542-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-257" title="PS verordnende LEI: E-Rezept erstellen - Flowtype 200/209 - Versicherungstyp PKV" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
        Das PS der verordnenden LEI MUSS im Verordnungsdatensatz für ein E-Rezept des Flowtype 200 oder 209 für Coverage.type.coding.code den Wert "PKV" verwenden.
</requirement>

### Anforderungen für Mehrfachverordnung
<!-- A_22636 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-258" title="PS verordnende LEI: E-Rezept erstellen - Mehrfachverordnung - Beginn Einlösefrist" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
        Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden erstellen" beim Erstellen des E-Rezept-Bundles für die Teilverordnung einer Mehrfachverordnung den Beginn der Einlösefrist der Teilverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) angeben.
</requirement>

### Anforderungen Workflow 166
<!-- A_27834 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-259" title="PS verordnende LEI: E-Rezept erstellen - Flowtype 166 - zulässige Signatur Arzt" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
        Das PS der verordnenden LEI MUSS sicherstellen, dass ein Verordnungsdatensatz für ein E-Rezept des Flowtype 166 nur mit einem HBA mit der zulässigen ProfessionOID oid_arzt signiert werden kann.
</requirement>
<!-- A_27835 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-260" title="PS verordnende LEI: E-Rezept erstellen - Flowtype 166 - Reichdauer nach Vorgaben" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
        Das PS der verordnenden LEI MUSS im Verordnungsdatensatz für ein E-Rezept des Flowtype 166 sicherstellen, dass die maximale Reichdauer entsprechend den gesetzlichen Vorgaben nicht überschritten wird.
</requirement>
<!-- A_27836 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-261" title="PS verordnende LEI: E-Rezept erstellen - Flowtype 166 - Bestätigungen nach §3a Abs. 2, 5 AMVV" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
<table>
  <thead>
    <tr>
      <th>Anzeige der fachlichen Bestätigung*</th>
      <th>Häufigkeit der Abfrage des Nutzers</th>
      <th>Zulässigkeit der Vorbefüllung durch das PS</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Alle Sicherheitsbestimmungen gemäß der Fachinformation entsprechender Fertigarzneimittel werden eingehalten</td>
      <td>Bei jedem Verordnungsvorgang</td>
      <td>"nein" ist zulässig, "ja" ist nicht zulässig</td>
    </tr>
    <tr>
      <td>Ich verfüge über ausreichende Sachkenntnisse zur Verschreibung von Arzneimitteln nach § 3a AMVV</td>
      <td>Einmalig aktiv abfragen, danach darf das Feld im Verordnungsvorgang angezeigt, aber vorbefüllt werden.</td>
      <td>"nein" ist zulässig, "ja" ist ab der zweiten Verordnung zulässig</td>
    </tr>
    <tr>
      <td>Der Patientin bzw. dem Patienten wurde vor Beginn der Behandlung medizinisches Informationsmaterial gemäß den Anforderungen der Fachinformation entsprechender Arzneimittel ausgehändigt.</td>
      <td>Bei jedem Verordnungsvorgang</td>
      <td>"nein" ist zulässig, "ja" ist nicht zulässig</td>
    </tr>
    <tr>
      <td>Behandlung erfolgt außerhalb der zugelassenen Anwendungsgebiete (Off-Label)</td>
      <td>Bei jedem Verordnungsvorgang</td>
      <td>"nein" ist zulässig, "ja" ist nicht zulässig</td>
    </tr>
    <tr>
      <td>Bei der Patientin handelt es sich um eine gebärfähige Frau</td>
      <td>Bei jedem Verordnungsvorgang</td>
      <td>"nein" und "ja" sind zulässig</td>
    </tr>
  </tbody>
</table>
</requirement>

### Patientenausdruck

<requirement conformance="SHALL NOT" key="IG-TIFLOW-RX-262" title="PS verordnende LEI: E-Rezept erstellen - Flowtype 169/209 -kein Patientenausdruck" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das PS der verordnenden LEI DARF für E-Rezepte des Workflowtype mit Steuerung durch den Leistungserbringer (169, 209) NICHT einen Patientenausdruck erstellen.
</requirement>


### Anforderungen Workflow 169
<!-- ToDo: Der folgende Abschnitt hat mit dem Zuweisen und weniger mit dem E-Rezept einstellen zu tun. -->

<!-- A_21400 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-263" title="PS verordnende LEI: Übergabe E-Rezept-Token an Apotheke" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
        Das PS der verordnenden LEI MUSS es dem Nutzer ermöglichen, die Einlöseinformationen (Task.id und AccessCode) als E-Rezept-Token über ein geeignetes Übermittlungsverfahren an eine Apotheke der Wahl zu schicken.
</requirement>
<!-- A_21349 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-264" title="PS: Schutz des E-Rezept-Tokens bei Übertragung" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
        Das Primärsystem MUSS für die Übertragung von E-Rezept-Token ein Verfahren nutzen, dass die sehr hohe Vertraulichkeit des E-Rezept-Tokens und seine Integrität schützt.
</requirement>
<!-- A_21453 -->
<requirement conformance="MAY" key="IG-TIFLOW-RX-265" title="PS verordnende LEI: Herstellende Apotheke für Übermittlungsverfahren" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
        Das PS der verordnenden LEI KANN die Auswahl und Verwaltung von herstellenden Apotheken für die Übermittlung der E-Rezept-Einlöseinformationen ermöglichen.
</requirement>
