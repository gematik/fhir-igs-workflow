Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an Clientsysteme für die Nutzung der Operation `$create`.

<!-- ToDo Ablaufdiagramm Anwendungsfall -->


<!-- A_19276 -->
<requirement conformance="SHALL" key="IG-WF-CORE-36" title="PS verordnende LEI: E-Rezept erstellen - E-Rezept-ID abrufen" version="0">
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

<!-- A_22893 -->
<requirement conformance="SHALL" key="IG-WF-CORE-36" title="PS verordnende LEI: E-Rezept erstellen - Gleichheit Ausstellungsdatum und QES Erstellung" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_verordnend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der verordnenden LEI MUSS sicherstellen, dass das Datum authoredOn des Verordnungsdatensatzes dem Datum in QES.Erstellung im Signaturobjekt entspricht.
</requirement>