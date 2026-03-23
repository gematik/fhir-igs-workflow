Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `Task`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

{% include core.query-api-task-req-fdv.md %}

### Modulspezifische Anforderungen

#### GET /Task

##### Workflowspezifische Anforderungen

<!-- A_27832 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-103" title="E-Rezept-FdV: Flowtype 166 - Hinweis auf Workflow-Besonderheit" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
     Das E-Rezept-FdV MUSS den Nutzer bei der Einsicht in ein E-Rezept mit dem Flowtype 166 darauf hinweisen, dass bei diesem Vorgang seine Einlösemöglichkeiten beschränkt sind und das Rezept eine verkürzte Gültigkeit aufweist.
</requirement>
