In diesem Abschnitt werden allgemeingültige Funktionsmerkmale des E-Rezept-Fachdienst und seinen Schnittstellen beschrieben.

### RESTful API

<!-- A_19536 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-336" title="E-Rezept-Fachdienst - RESTful API" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS seine Schnittstellen für alle Zugriffe auf alle Datenobjekte und alle Ressourcen in einer RESTful API gemäß der FHIR-Spezifikation in http://hl7.org/fhir/http.html der Version v4.0.1 R4 umsetzen.
</requirement>

<!-- A_19537 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-337" title="E-Rezept-Fachdienst - RESTful API MimeType fhir+xml" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS in seinen Schnittstellen für die Zugriffe durch Leistungserbringer und Leistungserbringerinstitutionen standardmäßig den MimeType application/fhir+xml akzeptieren und in Responses verwenden.
</requirement>

<!-- A_19538 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-338" title="E-Rezept-Fachdienst - RESTful API MimeType fhir+json" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS in seinen Schnittstellen für die Zugriffe durch Versicherte standardmäßig den MimeType application/fhir+json akzeptieren und in Responses verwenden.
</requirement>

<!-- A_19539 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-339" title="E-Rezept-Fachdienst - RESTful API MimeType Aufrufparameter" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS in seinen Schnittstellen einen von der Standardfestlegung abweichenden MimeType umsetzen, wenn der jeweilige Client eine entsprechende Anforderung in der Aufrufschnittstelle über den URL-Parameter _format=fhir+xml bzw. _format=fhir+json gemäß http://hl7.org/fhir/http.html#general oder mittels des Accept-Attributs im HTTP-Request-Header als application/fhir+xml bzw. application/fhir+json anfordert, damit Clientsysteme ein für sie leichter verarbeitbares Format in der Antwort erhalten können.
</requirement>

<!-- A_20171 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-340" title="E-Rezept-Fachdienst - RESTful API CapabilityStatement" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS an seinen Schnittstellen eine http-GET-Operation auf den Endpunkt /metadata erlauben, in welcher er ein CapabilityStatement gemäß https://www.hl7.org/fhir/capabilitystatement.html veröffentlicht, welches die vom E-Rezept-Fachdienst verarbeiteten Ressourcen mit den zugehörigen http-Operationen der angebotenen REST-Schnittstelle auflistet: 
    <ul>
     <li>Task – GET-, POST-Operation, FHIR-Operations für die Workflow-Steuerung und Einsicht durch den Versicherten </li>
     <li>MedicationDispense – GET-Operation für das Einsehen der Medikamentinformationen durch den Versicherten </li>
     <li>Communication – GET-, POST, DELETE-Operation für das Senden, Empfangen und Löschen von Nachrichten </li>
     <li>AuditEvent – GET-Operation für die Einsicht in Protokolleinträge durch den Versicherten </li>
     <li>Device – GET-Operation mit statischen Informationen zur serverseitigen Signatur damit der Client eine Information über die FHIR-Kompatibilität zum Fachdienst erhält.</li>
     </ul>
</requirement>

### E-Rezept ID

Die E-Rezept-ID wird durch den E-Rezept-Fachdienst beim Anlegen eines Tasks für den Workflow des E-Rezepts erstellt.

<!-- A_19217-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-348" title="Aufbau E-Rezept-ID" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS E-Rezept-IDs erzeugen und verwalten, welche der Syntax "aaa.bbb.bbb.bbb.bbb.cc" und der folgenden Semantik genügen 
     
     <table>
  <thead>
    <tr>
      <th></th>
      <th>Bedeutung</th>
      <th>Datentyp</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>aaa</td>
      <td>E-Rezept-Typ</td>
      <td>alphanummerisch, mit der Belegung gemäß "flowType" in <a href="https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType">https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType</a></td>
    </tr>
    <tr>
      <td>bbb.bbb.bbb.bbb</td>
      <td>fortlaufende Rezeptnummer</td>
      <td>nummerisch, 12-stellig</td>
    </tr>
    <tr>
      <td>cc</td>
      <td>Prüfnummer Verfahren gemäß [ISO 7064]</td>
      <td>nummerisch</td>
    </tr>
  </tbody>
</table>
     
     damit Tippfehler in der manuellen Erfassung erkannt werden können und die E-Rezept-ID über 11 Jahre eine eineindeutige Zuordnung zwischen allen Datenobjekten im E-Rezept-Workflow erlaubt.
</requirement>

<!-- A_19218 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-349" title="Prüfung E-Rezept-ID" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Alle Produkttypen, die eine E-Rezept-ID aus externen Systemen einlesen oder von Benutzern entgegen nehmen, MÜSSEN die E-Rezept-ID gegen ihre Prüfziffer nach dem Modulo-97-Verfahren gemäß [ISO 7064] prüfen und bei Ungültigkeit die Weiterverarbeitung verhindern, damit Benutzerfehleingaben vor der Verarbeitung erkannt werden.
</requirement>

### Verarbeitung von Datensätzen

Es gelten folgende Anforderungen und Vorgaben zur Verarbeitung und Interpretation von Zeichen- und Datensätzen im E-Rezept-Fachdienst.

Für die Kommunikation und die Interoperabilität müssen bezüglich Datensätzen einheitliche Vorgaben gelten. Laut FHIR Spezifikation wird für XML und JSON Datensätze das Character Encoding "UTF-8" vorgegeben. Byte Order Marks (BOM) werden nicht angeben.

<!-- A_28428  -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-362" title="E-Rezept-Fachdienst - Verarbeitung von Datensätzen - Deserialisierung von PKCS#7 Enveloping-Daten" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Verarbeiten von PKCS#7 Enveloping-Daten die Anforderungen zur Verarbeitung von Datensätzen im E-Rezept-Fachdienst anwenden.
</requirement>

<!-- A_28427 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-363" title="E-Rezept-Fachdienst - Verarbeitung von Datensätzen - Forcieren von UTF-8 ohne BOM" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E‑Rezept‑Fachdienst MUSS eingehende Datensätze strikt als UTF‑8 ohne Byte Order Mark (BOM) decodieren und bei fehlgeschlagener Decodierung oder beim Vorhandensein eines BOM die Verarbeitung mit einer HTTP‑Antwort 400 (Bad Request) und geeigneter Fehlermeldung abbrechen.
</requirement>

<!-- A_28429 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-364" title="Character Encoding für E-Rezept-Fachdienst" version="0">
    <meta lockversion="false"/>
            <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Produkttest"/>
    </actor>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Clientsysteme des E-Rezept-Fachdienstes MÜSSEN für die Kommunikation mit dem E-Rezept-Fachdienst ausschließlich das Character Encoding UTF-8 verwenden.
</requirement>

<!-- A_28430 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-365" title="Verbot Angabe von BOM für E-Rezept-Fachdienst" version="0">
    <meta lockversion="false"/>
        <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Produkttest"/>
    </actor>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Clientsysteme des E-Rezept-Fachdienstes DÜRFEN für die Kommunikation mit dem E-Rezept-Fachdienst in Datensätzen ein Byte Order Mark (BOM) NICHT angeben.
</requirement>
