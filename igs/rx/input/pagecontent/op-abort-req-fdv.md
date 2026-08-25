### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/{{ site.data.constants.tiflow_core_version }}/index.html)

### Modulspezifische Anforderungen

<!-- A_21362-02 -->
<requirement conformance="SHALL NOT" key="IG-TIFLOW-ERP-A16" title="E-Rezept-FdV: E-Rezept löschen - Flowtype 169 / 209 - nur wenn beliefert" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV" description="E-Rezept-Frontend des Versicherten">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
     Das E-Rezept-FdV DARF im Anwendungsfall "E-Rezept löschen" dem Nutzer das Löschen von E-Rezepten mit dem Flowtype 169 oder 209 NICHT ermöglichen, wenn der Task einen Status ungleich "completed" hat.
</requirement>
