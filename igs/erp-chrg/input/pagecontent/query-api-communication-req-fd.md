Diese Seite beschreibt Anforderungen am TI-Flow-Fachdienst zur Nutzung der `Communication`-Endpunkte.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gematik.de/fhir/tiflow/{{ site.data.constants.tiflow_core_version }}/query-api-communication-req-fd.html)

### Modulspezifische Anforderungen

#### POST /Communication

Für Prüfung Payload siehe [Datenmodell Payload für Communication-Query](./query-api-communication-req-data.html)

<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-A103" title="TI-Flow-Fachdienst - Abrechnungsinformationen - Einstellen von Communications - FHIR-Validierung" version="0">
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
        <td><code>https://gematik.de/fhir/erp/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReq</code></td>
      </tr>
      <tr>
        <td>Rolle: oid_oeffentliche_apotheke, oid_krankenhausapotheke</td>
        <td><code>https://gematik.de/fhir/erp/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReply</code></td>
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

<!--A_22734-01-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-A96" title="TI-Flow-Fachdienst - Nachricht einstellen - Prüfung Existenz ChargeItem" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Einstellen einer Nachricht der Profile GEM_ERPCHRG_PR_Communication_ChargChangeReq oder GEM_ERPCHRG_PR_Communication_ChargChangeReply über die HTTP-Operation POST auf den Endpunkt /Communication prüfen und, wenn Communication.basedOn eine nicht existierende ChargeItem Ressource referenziert, mit dem folgenden Fehler:
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
            <td>TIFLOW_CHARGEITEM_NOT_FOUND</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table> 
    abbrechen, um Spam und nicht-rezeptbezogene Kommunikation zu verhindern.
</requirement>
