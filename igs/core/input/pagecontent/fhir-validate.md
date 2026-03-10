Der E-Rezept-Fachdienst validiert bei Operationen von Clientsystemen übermittelte FHIR-Ressourcen. Die folgenden Anforderungen beschreiben Mindestprüfungen.

<!-- A_23384-05 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-335" title="E-Rezept-Fachdienst - Prüfung Gültigkeit FHIR Ressourcen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS bei der Prüfung der zeitlichen Gültigkeit einer FHIR Ressource den Wert aus dem Element gemäß folgender Tabelle zugrunde legen. 

  <table>
    <thead>
      <tr>
        <th>Bezeichnung</th>
        <th>Package</th>
        <th>FHIR Profil</th>
        <th>Element/Zeitpunkt</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>KBV Verordnungsdatensatz</td>
        <td><code>kbv.ita.erp</code></td>
        <td><code>KBV_PR_ERP_Prescription</code></td>
        <td><code>MedicationRequest.authoredOn</code></td>
      </tr>
      <tr>
        <td>KBV Verordnungsdatensatz DiGA</td>
        <td><code>kbv.itv.evdga</code></td>
        <td><code>KBV_PR_EVDGA_HealthAppRequest</code></td>
        <td><code>DeviceRequest.authoredOn</code></td>
      </tr>
      <tr>
        <td>Communication</td>
        <td><code>de.gematik.erezept-workflow.r4</code></td>
        <td>
          <code>Gem_ErxCommunicationDispReq</code>
          <code>Gem_ErxCommunicationInfoReq</code>
          <code>Gem_ErxCommunicationReply</code>
          <code>Gem_ErxCommunicationDispRepresentative</code>
          <code>GEM_ERP_PR_Communication_DispReq</code>
          <code>GEM_ERP_PR_Communication_InfoReq</code>
          <code>GEM_ERP_PR_Communication_Reply</code>
          <code>GEM_ERP_PR_Communication_Representative</code>
        </td>
        <td>Zeitpunkt des Aufrufs der Operation am E-Rezept-Fachdienst</td>
      </tr>
      <tr>
        <td>MedicationDispense</td>
        <td><code>de.gematik.erezept-workflow.r4</code></td>
        <td>
          <code>Gem_erxMedicationDispense</code>
          <code>GEM_ERP_PR_MedicationDispense</code>
        </td>
        <td><code>MedicationDispense.whenHandedOver</code></td>
      </tr>
      <tr>
        <td>PKV Patientenrechnung</td>
        <td><code>de.gematik.erezept-patientenrechnung.r4</code></td>
        <td>
          <code>GEM_ERPCHRG_PR_ChargeItem</code>
          <code>GEM_ERPCHRG_PR_Consent</code>
        </td>
        <td>Zeitpunkt des Aufrufs der Operation am E-Rezept-Fachdienst</td>
      </tr>
      <tr>
        <td>PKV Abgabedatensatz</td>
        <td><code>de.abda.eRezeptAbgabedatenPKV</code></td>
        <td><code>DAV_PKV_PR_ERP_Abgabeinformationen</code></td>
        <td><code>MedicationDispense.whenHandedOver</code></td>
      </tr>
    </tbody>
  </table>

		 <div><figcaption><strong>Tabelle: </strong>title</figcaption></div>
</requirement>

<!-- A_27658 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-206" title="E-Rezept-Fachdienst - FHIR-Ressource validieren - Prüfung Datumsangabe ohne Zeitzoneninformation" version="0">
	<meta lockversion="false"/>
	<actor name="eRp_FD">
    	<testProcedure id="Herstellererklärung"/>
  	</actor>
	Der E-Rezept-Fachdienst MUSS sicherstellen, dass alle Datums- und Zeitangaben ohne explizite Zeitzoneninformation als deutsche Zeit (CET/CEST) entsprechend der historischen oder aktuellen Regelung interpretiert werden.
</requirement>

<!-- A_27659 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-341" title="FHIR-Ressourcen - Datumsangabe ohne Zeitzoneninformation" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Die Produkttypen der Anwendung E-Rezept und Clientsysteme des E-Rezept-Fachdienstes MÜSSEN sicherstellen, dass bei der Erstellung von Datensätzen Datums- und Zeitangaben ohne Zeitzoneninformation, die entsprechend dem Datum gültige deutsche Zeitzone (CET/CEST) angewendet wird.
</requirement>

<!-- A_27698 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-207" title="E-Rezept-Fachdienst - FHIR-Ressource validieren - Eindeutige Angabe meta.profile" version="0">
	<meta lockversion="false"/>
	<actor name="eRp_FD">
    	<testProcedure id="Produkttest"/>
  	</actor>
	Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource prüfen, dass maximal ein meta.profile-Eintrag vorhanden ist und bei Abweichung mit dem HTTP-Fehlercode 400 sowie einem entsprechenden OperationOutcome die Verarbeitung ablehnen.
</requirement>

<!-- A_27697 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-342" title="FHIR-Ressourcen – Eindeutige Angabe meta.profile" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Die Produkttypen der Anwendung E-Rezept und die Clientsysteme des E-Rezept-Fachdienstes MÜSSEN bei der Erstellung jeder FHIR-Ressource sicherstellen, dass im Element meta.profile genau ein Eintrag enthalten ist, wenn im Profil das Element meta.profile verpflichtend anzugeben ist; bei Abweichung ist die Ressource als fehlerhaft zu behandeln und darf nicht übermittelt werden.
</requirement>

### Prüfung von Referenzen in Bundles

<!-- A_26229-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-208" title="E-Rezept-Fachdienst - FHIR-Ressource validieren - Pruefung Konsistenz Ressource IDs" version="0">
	<meta lockversion="false"/>
	<actor name="eRp_FD">
    	<testProcedure id="Produkttest"/>
  	</actor>
	Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource vom Typ Bundle prüfen, ob die ID der Ressource (Bundle.entry.resource.id) und die ID ihrer fullUrl (Bundle.entry.fullurl) übereinstimmen und bei Auffälligkeiten mit dem HTTP-Fehlercode 400 abbrechen und die Fehlermeldung "Die ID einer Ressource und die ID der zugehörigen fullUrl stimmen nicht überein." in Form eines OperationOutcome ausliefern.
</requirement>

<!-- A_26233-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-209" title="E-Rezept-Fachdienst - FHIR-Ressource validieren - Prüfung Format fullUrl" version="0">
	<meta lockversion="false"/>
	<actor name="eRp_FD">
    	<testProcedure id="Produkttest"/>
  	</actor>
	Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource vom Typ Bundle prüfen, ob der Wert von fullUrls der entries (Bundle.entry.fullUrl) dem [Format http-Schema] oder [Format urn:uuid-Schema] entsprechen und bei Auffälligkeiten mit dem HTTP-Fehlercode 400 abbrechen und die Fehlermeldung "Format der fullUrl ist ungültig." in Form eines OperationOutcome ausliefern.
</requirement>

<!-- A_27648 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-210" title="E-Rezept-Fachdienst - FHIR-Ressource validieren - Prüfung Existenz von Ressource.id" version="0">
	<meta lockversion="false"/>
	<actor name="eRp_FD">
    	<testProcedure id="Produkttest"/>
  	</actor>
	Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource vom Typ Bundle prüfen, ob für jedes entry im Bundle die ID der Ressource (Bundle.entry.resource.id) vorhanden ist und bei Auffälligkeiten mit dem HTTP-Fehlercode 400 abbrechen und die Fehlermeldung "Die ID einer Ressource im Bundle ist nicht vorhanden." in Form eines OperationOutcome ausliefern.
</requirement>

<!-- A_27649 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-211" title="E-Rezept-Fachdienst - FHIR-Ressource validieren - Prüfung Auflösbarkeit von Referenzen" version="0">
	<meta lockversion="false"/>
	<actor name="eRp_FD">
    	<testProcedure id="Produkttest"/>
  	</actor>
	Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource prüfen, ob angegebene Referenzen nach [FHIR Spezifikation Auflösen von Referenzen in Bundles] ermittelt werden können und bei Auffälligkeiten mit dem HTTP-Fehlercode 400 abbrechen und die Fehlermeldung "Referenz einer Ressource konnte nicht aufgelöst werden." in Form eines OperationOutcome ausliefern.
</requirement>

<!-- A_26229-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-344" title="E-Rezept-Fachdienst - FHIR-Ressource validieren - Prüfung Konsistenz Ressource IDs" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource vom Typ Bundle prüfen, ob die ID der Ressource (Bundle.entry.resource.id) und die ID ihrer fullUrl (Bundle.entry.fullurl) übereinstimmen und bei Auffälligkeiten mit dem HTTP-Fehlercode 400 abbrechen und die Fehlermeldung "Die ID einer Ressource und die ID der zugehörigen fullUrl stimmen nicht überein." in Form eines OperationOutcome ausliefern.
</requirement>

<!-- A_26237-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-345" title="FHIR-Ressourcen - Ressource-ID in fullUrl" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
     Die Produkttypen der Anwendung E-Rezept und Clientsysteme des E-Rezept-Fachdienstes MÜSSEN bei der Erstellung einer FHIR-Ressource die ID der fullURL (Bundle.entry.fullurl) der Ressource auf die ID der Ressource (Bundle.entry.resource.id) setzen, sofern das http(s)-Schema verwendet wird.
</requirement>

<!-- A_26238-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-346" title="FHIR-Ressourcen - Format fullUrl" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
     Die Produkttypen der Anwendung E-Rezept und Clientsysteme des E-Rezept-Fachdienstes MÜSSEN bei der Erstellung einer FHIR-Ressource sicherstellen, dass die fullURL (Bundle.entry.fullUrl) entweder im [Format http-Schema] oder im [Format urn:uuid-Schema] vorliegt.
</requirement>

<!-- A_22216-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-347" title="FHIR-Ressourcen Versionsangabe" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
     Die Produkttypen der Anwendung E-Rezept und Clientsystem des E-Rezept-Fachdienstes MÜSSEN alle generierten FHIR-Ressourcen mit der Versionsnummer gemäß [datatypes.html#canonical](https://www.hl7.org/fhir/datatypes.html#canonical) im Feld Ressource.meta.profile kennzeichnen, zu dessen aktuell gültiger Profilversion sie mutmaßlich validieren.
</requirement>

### Validierung von Extensions

<!-- A_22927-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-212" title="E-Rezept-Fachdienst - FHIR-Ressource validieren - Ausschluss unspezifizierter Extensions" version="0">
	<meta lockversion="false"/>
	<actor name="eRp_FD">
    	<testProcedure id="Produkttest"/>
  	</actor>
	Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource sicherstellen, dass keine Extensions vorhanden sind, die nicht an den in den FHIR-Profilen spezifizierten Stellen verwendet werden. Sollte eine solche Extension gefunden werden, gilt der Datensatz als ungültig. In diesem Fall ist eine Fehlermeldung mit dem HTTP-Status 400 auszugeben.
</requirement>

<!-- A_27672 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-343" title="FHIR Ressourcen - Ausschluss unspezifizierter Extensions" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Die Produkttypen der Anwendung E-Rezept und Clientsysteme des E-Rezept-Fachdienstes MÜSSEN sicherstellen, dass bei der Erstellung von Datensätzen Extensions nur an den Stellen verwendet werden, an denen sie im FHIR-Profil ausdrücklich definiert sind.
</requirement>
