Diese Seite beschreibt Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der `Communication`-Endpunkte.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gematik.de/fhir/tiflow/{{ site.data.constants.tiflow_core_version }}/query-api-communication-req-fd.html)

### Modulspezifische Anforderungen

#### POST /Communication

Für Prüfung Payload siehe [Datenmodell Payload für Communication-Query](./query-api-communication-req-data.html)

<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-A143" title="TI-Flow-Fachdienst - Einstellen von Communications - FlowType 162 - FHIR-Validierung" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf des Endpunkts `POST /Communication` unter den benannten Prüfbedingungen die folgende Profilvalidierung durchführen:

  <table>
    <thead>
      <tr>
        <th>Prüfbedingung</th>
        <th>Profil</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Rolle: oid_versicherter</td>
        <td><code>https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq</code></td>
      </tr>
      <tr>
        <td>Rolle: oid_kostentraeger</td>
        <td><code>https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DiGA</code></td>
      </tr>
    </tbody>
  </table>

und bei negativem Prüfergebnis die Operation mit dem folgenden Fehler abbrechen:

<table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>400 - Bad Request</td>
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
            <td>SVC_VALIDATION_FAILED</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>FHIR Profile validation failed</td>
        </tr>
    </table> 

</requirement>