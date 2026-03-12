Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die `Task`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

{% include core.query-api-task-req-fd.md %}

### Modulspezifische Anforderungen

#### GET /Task

##### Workflowspezifische Anforderungen

<!-- A_21360-01 -->
<requirement conformance="SHALL NOT" key="IG-TIFLOW-RX-20" title="E-Rezept-Fachdienst - Liste Task abrufen - Flowtype 169 / 209 - Versicherter keine Einlöseinformationen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der E-Rezept-Fachdienst DARF den AccessCode beim Zugriff durch den Versicherten NICHT an das E-Rezept-Frontend des Versicherten herausgeben, wenn der Flowtype des Tasks den Wert für die Workflowsteuerung durch Leistungserbringer enthält (169, 209).
</requirement>

<!-- ToDo: Dubliziern A_21360-01 für einzelabruf -->

#### GET /Task/<id>

##### Workflowspezifische Anforderungen

<!-- A_26148 -->
<requirement conformance="SHALL" key="IG-TIFLOW-RX-21" title="E-Rezept-Fachdienst - Task abrufen - Flowtype 169/209 - Nicht verfügbar bei KVNR-Mismatch" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen /Task/&lt;id&gt; durch einen Versicherten, wenn Task.extension:flowType = 169 oder 209 und die KVNR des Aufrufenden (KVNR des ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests) ungleich der KVNR in Task.for ist, mit dem Fehler 403 abbrechen.
</requirement>
