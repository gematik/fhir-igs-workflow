Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `Communication`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

{% include core.query-api-communication-req-fdv.md %}

### Modulspezifische Anforderungen

<!-- A_26007 -->
<requirement conformance="MAY" key="IG-TIFLOW-DiGA-28248ZWF" title="E-Rezept-FdV: E-Rezept zuweisen - Flowtype 162 - Kostenträger auswählen" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FdV">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das E-Rezept-FdV KANN im Anwendungsfall "E-Rezept einer abgebenden Institution zuweisen" es dem Nutzer ermöglichen, für E-Rezepte mit dem Flowtype 162 einen Kostenträger zum Zuweisen einer DiGA auszuwählen.
</requirement>

Die Auswahl kann mit dem Anwendungsfall "Kostenträger suchen" erfolgen.

Beim Zuweisen einer DiGA-Verordnung ist keine freie Textnachricht vorgesehen, um eine maschinelle Verarbeitung zur Bereitstellung des Freischaltcodes zu ermöglichen.