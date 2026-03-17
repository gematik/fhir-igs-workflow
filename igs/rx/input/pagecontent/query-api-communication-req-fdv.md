Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `Communication`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

{% include core.query-api-communication-req-fdv.md %}

### Modulspezifische Anforderungen

#### Nachricht versenden

##### Zuweisen

<!-- A_21402-02 -->
<requirement conformance="SHALL NOT" key="IG-TIFLOW-ERP-15" title="E-Rezept-FdV: Anfrage Belieferung - Flowtype 162 / 169 / 209 - Anfrage nicht zulässig" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV DARF es dem Nutzer NICHT ermöglichen, für ein E-Rezept mit dem Flowtype 162, 169 oder 209 eine Anfrage zur Belieferung an eine abgebende Institution zu senden.
</requirement>
<!-- ToDo: A_21402-02 ist abgekündigt -->

<!-- A_21403-02 -->
<requirement conformance="SHALL NOT" key="IG-TIFLOW-ERP-16" title="E-Rezept-FdV: E-Rezept zuweisen - Flowtype 169 / 209 - Zuweisen nicht zulässig" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
     Das E-Rezept-FdV DARF im Anwendungsfall "E-Rezept einer Apotheke zuweisen" es dem Nutzer NICHT ermöglichen, ein E-Rezept mit dem Flowtype 169 oder 209 an eine Apotheke zuzuweisen.
</requirement>

<!-- A_27833 -->
<requirement conformance="SHALL NOT" key="IG-TIFLOW-ERP-17" title="E-Rezept-FdV: E-Rezept zuweisen- Flowtype 166 - Zuweisen als Versand nicht zulässig" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
     Das E-Rezept-FdV DARF im Anwendungsfall "E-Rezept einer Apotheke zuweisen" für ein E-Rezept mit dem Flowtype 166 es dem Nutzer NICHT ermöglichen ein E-T-Rezept mit der Belieferungsart "Postversand" an eine Apotheke zuzuweisen.
</requirement>

<!-- A_26326 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-18" title="E-Rezept-FdV: E-Rezept zuweisen - Beginn Gültigkeit prüfen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
     Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen" prüfen, ob bei Teilverordnungen von Mehrfachverordnungen (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) der Beginn der Einlösefrist (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) erreicht ist und in diesem Fall den Anwendungsfall abbrechen.
</requirement>

<!-- A_20011-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-19" title="E-Rezept-FdV: E-Rezept zuweisen - Textnachricht ohne Link" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen" prüfen, dass die durch den Nutzer erfasst Textnachricht keinen Internet-Link und keine Non-Printable-Characters enthält und die Textnachricht nur bei erfolgreicher Prüfung weiterverarbeiten.
</requirement>


<!-- A_21361-02 -->
<requirement conformance="SHALL NOT" key="IG-TIFLOW-ERP-20" title="E-Rezept-FdV: Vertreterkommunikation - Flowtype 169 / 209 - Vertreterkommunikation nicht zulässig" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
     Das E-Rezept-FdV DARF NICHT im Anwendungsfall "Vertreterkommunikation" es dem Nutzer ermöglichen, bezüglich einem E-Rezept mit dem Flowtype 169 oder 209 mit einem Vertreter zu kommunizieren.
</requirement>

<!-- A_28542 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-21" title="E-Rezept-FdV: E-Rezept zuweisen - Zuweisen - Payload" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen" im Rahmen der Belieferung eines Arzneimittels für den payload_contentstring einen JSON Datensatz mit communicationType = "order" erstellen.
</requirement>

<!-- A_28544 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-22" title="E-Rezept-FdV: E-Rezept zuweisen - Auf Nachricht antworten - Payload" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen" im Rahmen der Belieferung eines Arzneimittels , wenn der Nutzer auf eine empfangene Nachricht einer Apotheke antwortet, für den payload_contentstring einen JSON Datensatz mit communicationType = "text" erstellen.
</requirement>

siehe [Datenmodell Payload für Communication-Query](./query-api-communication-req-data.html)

<!-- A_19201-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-23" title="E-Rezept-FdV: E-Rezept zuweisen - Nachricht erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen" eine FHIR Ressource Communication des Profils https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq mit  
    <ul>
      <li>Telematik-ID der ausgewählten abgebenden LEI in recipient</li>
      <li>Textnachricht in payload contentString</li>
      <li>E-Rezept-Token in basedOn reference auf Task inkl. AccessCode als "/Task/&lt;id&gt;/$accept?ac=..." </li>
    </ul>
    erstellen.
</requirement>