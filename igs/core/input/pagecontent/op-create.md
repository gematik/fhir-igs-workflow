# Operation `$create` (Task erzeugen)

Die Operation `$create` ist die moduluebergreifende Basisoperation zum Anlegen eines `Task`.

<requirement conformance="SHALL" key="IG-WF-CORE-OP-001" title="E-Rezept-Fachdienst - Task erzeugen - Rollenpruefung (A_19018-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Erzeugen eines Tasks mittels HTTP-POST/$create-Operation die Rolle "professionOID" des Aufrufenden im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich verordnende Leistungserbringer in der Rolle oid_praxis_arzt, oid_zahnarztpraxis, oid_praxis_psychotherapeut, oid_krankenhaus, oid_institution-vorsorge-reha die Operation im Fachdienst aufrufen duerfen, damit E-Rezepte nicht durch zur Verordnung Unberechtigte eingestellt werden koennen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-OP-002" title="E-Rezept-Fachdienst - Task erzeugen - Schemavalidierung Rezept anlegen (A_19257-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS die im Body der HTTP-POST-Operation auf die Ressource Task uebertragenen Parameter gegen das Schema http://gematik.de/fhir/erp/OperationDefinition/CreateOperationDefinition pruefen und bei Nicht-Konformitaet das Anlegen der Ressource im Fachdienst mit dem http-Status-Code 400 beantworten, damit kein Schadcode und keine "fachfremden" Daten in den E-Rezept-Fachdienst hochgeladen werden.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-OP-003" title="E-Rezept-Fachdienst - Parametrierung Task fuer Workflow-Typ (A_19112)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Erzeugen eines Tasks mittels HTTP-POST/$create-Operation den Parameter workflowType (Rezepttyp) aus dem HTTP-Body des POST-Requests entnehmen, als Attribut Task.extension:flowType des zu erstellenden Tasks verwenden und bei Fehlen bzw. Nicht-Konformitaet des Parameters den Request als unzulaessig abweisen, damit auf Basis dieser Parameter ausschliesslich gueltige Workflows gestartet werden koennen und dem Versicherten bei Einsicht des Tasks der Weg in entweder eine Apotheke oder ein Sanitaetshaus oder eine andere zustaendige Einrichtung gewiesen werden kann.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-OP-004" title="E-Rezept-Fachdienst - Ergaenzung Performer-Typ fuer Einloeseinstitutstyp (A_19214)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Erzeugen eines Tasks das Feld Task.performerType aus dem uebergebenen, gueltigen Parameter Task.extension:flowType gemaess der Prozessparameter [gemSpec_DM_eRp#19445] uebernehmen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-OP-005" title="E-Rezept-Fachdienst - Task erzeugen - Generierung Rezept-ID (A_19019-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Anlegen eines neuen Tasks eine Rezept-ID gemaess der Bildungsregel [gemSpec_DM_eRp#19217] generieren und als Identifier mit Namingsystem https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PrescriptionId dem Task hinzufuegen und sicherstellen, dass diese Rezept-ID innerhalb von 11 Jahren nach ihrer Erzeugung nicht erneut vergeben wird, damit es innerhalb der Aufbewahrungsfrist der Abrechnungsdaten bei den Krankenkassen zu keinen Dubletten kommt.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-OP-006" title="E-Rezept-Fachdienst - Task erzeugen - Task-ID=Rezept-ID (A_23227)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Erzeugen eines neuen Tasks die Rezept-ID, welche mit Task an das verordnende Primaersystem uebermittelt wird, als Task-ID verwenden.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-OP-007" title="E-Rezept-Fachdienst - Task erzeugen - Generierung AccessCode (A_19021-02)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Erzeugen eines Tasks mittels HTTP-POST/$create-Operation eine 256 Bit Zufallszahl mit einer Mindestentropie von 120 Bit erzeugen, hexadezimal kodieren ([0-9a-f]{64}) und diese im zu speichernden Task als externe ID in Task.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode hinzufuegen, damit nachfolgende Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-OP-008" title="E-Rezept-Fachdienst - Status draft (A_19114)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS die zulaessige Anlage eines Tasks mittels HTTP-POST/$create-Operation im Status Task.status = draft vollziehen und beim erfolgreichen Abschluss der Operation die angelegte Ressource Task im HTTP-Body der HTTP-Response zurueckgeben, damit der verordnende Leistungserbringer die generierte Rezept-ID fuer die QES verwenden kann.
</requirement>
