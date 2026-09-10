Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für die `Task`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/{{ site.data.constants.tiflow_core_version }}/menu-schnittstellen-query-api.html)

### Modulspezifische Anforderungen

<requirement conformance="SHALL NOT" key="IG-TIFLOW-DIGA-A132" title="TI-Flow-Fachdienst - Flowtype 162 - kein Liste Task abrufen" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst DARF die Schnittstelle `GET /Task` für das Anwendungsmodul DiGA mit dem HTTP-Header `X-PoPP-Token` NICHT unterstützen und bei Aufruf mit dem Fehler
    <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>501 - Not Implemented</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>invalid</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>TIFLOW_NOT_SUPPORTED</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>This API is not supported.</td>
        </tr>
      </table>
     abbrechen.
</requirement>

<requirement conformance="SHALL NOT" key="IG-TIFLOW-DIGA-A133" title="TI-Flow-Fachdienst - Flowtype 162 - kein Task aktualisieren" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst DARF die Schnittstelle `PATCH /Task` für das Anwendungsmodul DiGA NICHT unterstützen und bei Aufruf mit dem Fehler
    <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>501 - Not Implemented</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>invalid</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>TIFLOW_NOT_SUPPORTED</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>This API is not supported.</td>
        </tr>
      </table>
     abbrechen.
</requirement>