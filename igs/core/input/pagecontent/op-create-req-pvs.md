Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an das PVS für die Nutzung der Operation `$create`.

<!-- A_19275 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-227" title="PS verordnende LEI: E-Rezept erstellen - E-Rezept-Bundle erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
        Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden erstellen" eine Bundle-FHIR-Ressource gemäß Profilierung https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle Rezept-ID aus der Task-Ressource als Identifier erstellen.
</requirement>

Dieses Bundle wird in diesem Dokument als E-Rezept-Bundle bezeichnet. Ein E-Rezept-Bundle enthält genau eine Verordnungszeile.

Das PS der verordnenden LEI darf FHIR-Extensions nicht im Verordnungsdatensatz verwenden, die nicht explizit gemäß KBV-Profilversion "kbv.ita.erp" bzw. "kbv.itv.evdga" beschrieben sind.

<!-- A_22893 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-228" title="PS verordnende LEI: E-Rezept erstellen - Gleichheit Ausstellungsdatum und QES Erstellung" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_verordnend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der verordnenden LEI MUSS sicherstellen, dass das Datum authoredOn des Verordnungsdatensatzes dem Datum in QES.Erstellung im Signaturobjekt entspricht.
</requirement>

Es gelten weitere modulspezifische Anforderungen für den Verordnungsdatensatz.


<!-- A_19276 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-229" title="PS verordnende LEI: E-Rezept erstellen - E-Rezept-ID abrufen" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_verordnend">
    <testProcedure id="Konformitätserklärung"/>
  </actor>
  Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden erstellen" für das E-Rezept die HTTP-Operation POST /Task/$create mit
  <ul>
    <li>ACCESS_TOKEN im Authorization-Header</li>
    <li>Rezept-Typ im FlowType als Parameter der FHIR-Operation $create für Task </li>
  </ul>
  ausführen.
</requirement>

Für weitere Informationen siehe Operation "E-Rezept erstellen" aus der API-Schnittstelle [E-Rezept API Dokumentation].

Der Value-Katalog für FlowType ist in [gemSpec_DM_eRp] beschrieben.

Der Response des Fachdienstes liefert
- die Rezept-ID (Task.Identifier mit "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PrescriptionId"), mit der das E-Rezept-Bundle vervollständigt wird,
- die Task-ID (Task.id), mit dem der Task bei Aufrufen des E-Rezept-Fachdienstes referenziert wird,
- und den AccessCode (Task.Identifier mit "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_AccessCode"), welcher für den Zugriff auf das E-Rezept im Fachdienst berechtigt

Hinweis: Die Task-ID entspricht der Rezept-ID.
