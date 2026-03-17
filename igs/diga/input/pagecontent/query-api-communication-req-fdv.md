Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `Communication`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

{% include core.query-api-communication-req-fdv.md %}

### Modulspezifische Anforderungen

#### Nachricht versenden

##### Verordnung zuweisen

<!-- A_26007 -->
<requirement conformance="MAY" key="IG-TIFLOW-DIGA-5" title="E-Rezept-FdV: E-Rezept zuweisen - Flowtype 162 - Kostenträger auswählen" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FdV">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das E-Rezept-FdV KANN im Anwendungsfall "E-Rezept einer abgebenden Institution zuweisen" es dem Nutzer ermöglichen, für E-Rezepte mit dem Flowtype 162 einen Kostenträger zum Zuweisen einer DiGA auszuwählen.
</requirement>

Die Auswahl kann mit dem Anwendungsfall "Kostenträger suchen" erfolgen.

Beim Zuweisen einer DiGA-Verordnung ist keine freie Textnachricht vorgesehen, um eine maschinelle Verarbeitung zur Bereitstellung des Freischaltcodes zu ermöglichen.

<!-- A_19201-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-6" title="E-Rezept-FdV: Verordnung zuweisen - Nachricht erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen" eine FHIR Ressource Communication des Profils https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq mit  
    <ul>
      <li>Telematik-ID der ausgewählten abgebenden LEI in recipient</li>
      <li>E-Rezept-Token in basedOn reference auf Task inkl. AccessCode als "/Task/&lt;id&gt;/$accept?ac=..." </li>
    </ul>
    erstellen.
</requirement>