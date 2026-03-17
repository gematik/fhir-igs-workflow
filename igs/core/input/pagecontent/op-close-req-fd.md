Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$close`.

Die Rollenprüfung der zugreifenden Institution erfolgt workflowtyp-spezifisch.

<!-- A_19231-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-53" title="E-Rezept-Fachdienst - Task schließen - Prüfung Secret" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$close das im URL-Parameter "?secret=..." übertragene Secret gegen das im referenzierten Task gespeicherte Secret Task.identifier:Secret als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret und auf Task.status = "in-progress" prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit der Zugriff auf diesen Datensatz nur durch den Berechtigten in Kenntnis des Secrets erfolgt.
</requirement>

<!-- A_19248-05 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-54" title="E-Rezept-Fachdienst - Task schließen - Schemaprüfung MedicationDispense" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels POST /Task/&lt;id&gt;/$close das im HTTP-Body des Requests enthaltene Parameters-Objekt gegen das Profil https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PAR_CloseOperation_Input prüfen, insbesondere bei der darin enthaltenen MedicationDispense:
    <ul>
        <li>die Korrektheit der Rezept-ID https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PrescriptionId als MedicationDispense.identifier,</li>
        <li>die KVNR des Versicherten im referenzierten Task (Task.for) gegen KVNR in MedicationDispense.subject:identifier und</li>
        <li>ob die Telematik-ID der Apotheke gemäß ACCESS_TOKEN mit dem Wert in MedicationDispense.performer.actor:identifier übereinstimmt</li>
    </ul>
    und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen.
</requirement>

<!-- A_27051 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-55" title="E-Rezept-Fachdienst - Task schließen - MedicationDispense speichern" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels POST /Task/&lt;id&gt;/$close die Referenz auf den aufgerufenen Task Task/&lt;id&gt; als MedicationDispense.supportingInformation übernehmen und die MedicationDispense, sowie die in MedicationDispense.medication referenzierte Medication, speichern.
</requirement>

<!-- A_26337 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-56" title="E-Rezept-Fachdienst - Task schließen - Zeitstempel MedicationDispense" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels POST /Task/&lt;id&gt;/$close den Zeitpunkt des Aufrufes in Task.extension:lastMedicationDispense im Format "YYYY-MM-DDThh:mm:ss+zz:zz" (FHIR-instant) anlegen und speichern, wenn ein MedicationDispense Objekt im Aufruf übergeben wird.
</requirement>

<!-- A_28411 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-57" title="E-Rezept-Fachdienst - Task schließen - Telematik-ID der abgebenden LEI speichern" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels POST /Task/&lt;id&gt;/$close für den referenzierten Task die Telematik-ID aus dem ACCESS_TOKEN in Task.owner speichern, damit sichergestellt werden kann, dass nachfolgende Zugriffe auf diesen Datensatz nur durch Berechtigte erfolgen können.
</requirement>

<!-- A_28129 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-58" title="E-Rezept-Fachdienst - Task schließen - Push Notification Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$close, wenn eine MedicationDispense Ressource übermittelt wird und die Operation erfolgreich abgeschlossen werden kann, den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.close" und den Versicherten mit der KVNR = Task.for initiieren.
</requirement>

<!-- A_19232 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-59" title="E-Rezept-Fachdienst - Task schließen - Status beenden" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS die zulässige Beendigung eines Tasks mittels /Task/&lt;id&gt;/$close-Operation im StatusTask.status = "completed" vollziehen, damit der Workflow für den Versicherten als beendet und die Verordnung somit als eingelöst dargestellt wird.
</requirement>

<!-- A_19233-06 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-60" title="E-Rezept-Fachdienst - Task schließen - Quittung erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/&lt;id&gt;/$close ein Quittungsbundle gemäß des FHIR-Profils https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle mit folgenden Informationen erstellen:
    <ul>
        <li>Telematik-ID der aufrufenden Apotheke als Beneficiary in die GEM_ERP_PR_Composition</li>
        <li>Zeitstempel des Statuswechsel des Tasks "in-progress" in event.period.start</li>
        <li>aktueller Zeitstempel in event.period.end</li>
        <li>Identifier PrescriptionID des Task als identifier des Quittungs-Bundle</li>
        <li>Device-Ressource mit Fachdienstinformationen als Autor der Signatur</li>
        <li>Base64Binary-Ressource mit Binary.data = &lt;base64-codierter Hashwert aus der QES Signatur des dem Task zugrunde liegenden Verordnungsdatensatzes&gt; und contentTpe = "application/octet-stream"</li>
    </ul>
    und dieses Quittungs-Bundle mit der Signaturidentität des Fachdienstes ID.FD.OSIG gemäß [RFC5652] mit Profil CAdES-BES ([CAdES]) im Enveloping signieren.
    In die Signatur wird die letzte OCSP-Antwort der regelmäßigen Statusprüfung des Signaturzertifikats C.FD.OSIG eingebettet.
    Das Signatur-Ergebnis wird als dss:Base64Signature-Objekt in Bundle.signature eingebettet und dieses Quittungs-Bundle mit Referenz in Task.output mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 3 gespeichert sowie als Response des http-Requests an den Aufrufer zurückgeben, damit die abgebende LEI einen Nachweis über den ordnungsgemäßen Abschluss des E-Rezept-Workflows als Quittung erhält.
</requirement>

<!-- A_22919 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-61" title="E-Rezept-Fachdienst - Task schließen - OCSP-Response nicht älter als 24h" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS, falls keine OCSP-Response für das Signaturzertifikat der Quittung vorliegt bzw. die letzte vorliegende OCSP-Response älter als 24h ist, die Operation mit dem Fehler 503 abbrechen.
</requirement>