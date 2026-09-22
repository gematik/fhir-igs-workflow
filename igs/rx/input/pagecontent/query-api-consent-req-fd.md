### Anforderungen der Schnittstelle aus der Core-Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gematik.de/fhir/tiflow/{{ site.data.constants.tiflow_core_version }}/query-api-consent-req-fd.html)

### Anforderungen der Schnittstelle aus diesem Modul

#### POST /Consent

<!-- A_22351 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A316" title="TI-Flow-Fachdienst - Consent schreiben - FHIR-Validierung" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf des Endpunkts `POST /Consent` unter den benannten Prüfbedingungen die folgende Profilvalidierung durchführen:

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
        <td><code>https://gematik.de/fhir/erp/StructureDefinition/GEM-ERPEU-PR-Consent</code></td>
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

#### DELETE /Consent

<!-- A_27131 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A256" title="TI-Flow-Fachdienst - Consent löschen - EUDISPCONS - Löschen Zugriffsberechtigung" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt `/Consent` mit `?category=EUDISPCONS` alle dem Versicherten zugeordneten Zugriffsberechtigungen anhand des zeta-user-info.identifier des Nutzers (KVNR) identifizieren und löschen.
</requirement>
