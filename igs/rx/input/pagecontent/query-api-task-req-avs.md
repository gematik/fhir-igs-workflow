Diese Seite beschreibt Anforderungen an das AVS zur Nutzung der `Task`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

{% include core.query-api-task-req-avs.md %}


### Modulspezifische Anforderungen

#### E-Rezepte von Versicherten abrufen (PoPP)

Mit diesem Anwendungsfall kann die abgebende LEI die Zugriffsinformationen zu allen einlösbaren E-Rezepten von einem Versicherten, dessen eGK mit einem im Rahmen von PoPP zulässigen Kartenlesegerät eingelesen wurde, vom TI-Flow-Fachdienst abrufen.

<!-- A_22435-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-10" title="PS abgebende LEI: E-Rezepte von Versicherten abrufen (PoPP) - PoPP-Token abrufen" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" einen PoPP-Token vom PoPP-Service abrufen.
</requirement>

Für die Umsetzung siehe [spec-ilf-popp-client].
<!-- ToDo: Link auflösen -->

Hinweis: Im Response des PoPP-Service erhält das PS den PoPP-Token im JWT Compact Serialization Format (s. gemSpec_PoPP_Service#A_26432). Das PS gibt den PoPP-Token im gleichen Format an den TI-Flow-Fachdienst weiter.

<!-- A_22437-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-11" title="PS abgebende LEI: E-Rezepte von Versicherten abrufen (PoPP) - E-Rezepte abrufen" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" die HTTP-Operation GET /Task mit
  <ul>
  <li>ACCESS_TOKEN im Authorization-Header</li>
  <li>PoPP-Token in HTTP-Header X-PoPP-Token</li>
  </ul>
  ausführen.
</requirement>

Im Response ist eine Liste von Tasks enthalten. Für jeden Task sind u.a. folgende Informationen enthalten: Task-ID und AccessCode.

Auf Basis dieser Informationen können die Verordnungsdatensätze zu den E-Rezepten vom TI-Flow-Fachdienst abgerufen werden. Erst dann sind die Inhalte der Verordnungen im AVS bekannt und können mit dem Versicherten abgestimmt werden.

Abgerufene Rezepte, welche nicht durch die Apotheke beliefert werden, müssen durch die Apotheke zurückgegeben (Anwendungsfall "E-Rezept durch Abgebenden zurückgeben") werden.

<!-- A_23152 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-12" title="PS abgebende LEI: E-Rezepte von Versicherten abrufen - nicht belieferte E-Rezepte zurückgeben" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezepte von Versicherten abrufen" den Nutzer geeignet unterstützen, heruntergeladene und damit reservierte E-Rezepte, welche nicht beliefert werden, wieder zurückzugeben, um dem Versicherten zu ermöglichen, diese in einer anderen Apotheke einzulösen.
</requirement>
