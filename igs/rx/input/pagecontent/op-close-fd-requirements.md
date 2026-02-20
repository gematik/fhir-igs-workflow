# FD-Anforderungen: Operation `$close`

Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$close`.

<requirement conformance="SHALL" key="IG-TIFlow-RX-143" title="E-Rezept-Fachdienst - Task schließen - Rollenprüfung (A_19230-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks für ein E-Rezept mittels HTTP-POST/$close-Operation auf den in der URL referenzierten /Task/&lt;id&gt; sicherstellen, dass ausschließlich abgebende Institutionen in der Rolle oid_oeffentliche_apotheke, oid_krankenhausapotheke, oid_kostentraeger die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit der E-Rezept-Workflow nicht durch einen Unberechtigten abgeschlossen werden kann.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-144" title="E-Rezept-Fachdienst - Task schließen - Prüfung Secret (A_19231-02)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$close das im URL-Parameter "?secret=..." übertragene Secret gegen das im referenzierten Task gespeicherte Secret Task.identifier:Secret als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret und auf Task.status = in-progress prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit der Zugriff auf diesen Datensatz nur durch den Berechtigten in Kenntnis des Secrets erfolgt.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-145" title="E-Rezept-Fachdienst - Task schließen - Flowtype 160/166/169/200/209 - Profilprüfung MedicationDispense (A_26002-02)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks für ein E-Rezept mittels HTTP-POST/$close-Operation auf den in der URL referenzierten /Task/&lt;id&gt; mit Flowtype 160, 166, 169, 200 oder 209 sicherstellen, dass das in GEM_ERP_PR_PAR_CloseOperation_Input enthaltene MedicationDispense-Objekt dem Profil GEM_ERP_PR_MedicationDispense entspricht. Andernfalls ist die Operation mit einem Fehler abzubrechen, und im OperationOutcome muss der Text "Unzulässige Abgabeinformationen: Für diesen Workflow sind nur Abgabeinformationen für Arzneimittel zulässig." zurückgegeben werden.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-146" title="E-Rezept-Fachdienst - Task schließen - Flowtype 162 - Profilprüfung MedicationDispense (A_26003-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks für ein E-Rezept mittels HTTP-POST/$close-Operation auf den in der URL referenzierten /Task/&lt;id&gt; mit Flowtype 162 sicherstellen, dass das in GEM_ERP_PR_PAR_CloseOperation_Input enthaltene MedicationDispense-Objekt dem Profil GEM_ERP_PR_MedicationDispense_DiGA entspricht. Andernfalls ist die Operation mit einem Fehler abzubrechen, und im OperationOutcome muss der Text "Unzulässige Abgabeinformationen: Für diesen Workflow sind nur Abgabeinformationen für digitale Gesundheitsanwendungen zulässig." zurückgegeben werden.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-147" title="E-Rezept-Fachdienst - Task schließen - Aufruf ohne MedicationDispense (A_24287-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels POST /Task/&lt;id&gt;/$close erlauben, dass der Aufruf ohne Übergabe einer MedicationDispense im Request Body stattfindet. Der E-Rezept-Fachdienst MUSS in dem Fall sicherstellen, dass eine MedicationDispense für diesen Task existiert. Der E-Rezept-Fachdienst MUSS, falls keine MedicationDispense zum dazugehoerigen Task existiert, mit dem Fehler 403 abbrechen. Im Fehlerfall ist die Meldung "Abschluss des Workflows konnte nicht durchgeführt werden. Dispensierinformationen wurden nicht bereitgestellt." im OperationOutcome zu übermitteln.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-148" title="E-Rezept-Fachdienst - Task schließen - Schemaprüfung MedicationDispense (A_19248-05)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels POST /Task/&lt;id&gt;/$close das im HTTP-Body des Requests enthaltene Parameters-Objekt gegen das Profil https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PAR_CloseOperation_Input prüfen, insbesondere bei der darin enthaltenen MedicationDispense: die Korrektheit der Rezept-ID https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PrescriptionId als MedicationDispense.identifier, die KVNR des Versicherten im referenzierten Task (Task.for) gegen KVNR in MedicationDispense.subject:identifier und ob die Telematik-ID der Apotheke gemäß ACCESS_TOKEN mit dem Wert in MedicationDispense.performer.actor:identifier übereinstimmt, und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-149" title="E-Rezept-Fachdienst - Task schließen - Überschreiben vorheriger MedicationDispenses (A_26481)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/&lt;id&gt;/$close sicherstellen, dass alle vorhandenen MedicationDispenses und ihre referenzierten Medications gelöscht werden, wenn der Client im Aufruf eine neue MedicationDispense übermittelt, sodass nach Abschluss der Operation nur die neu übermittelten MedicationDispenses gespeichert sind.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-150" title="E-Rezept-Fachdienst - Task schließen - MedicationDispense speichern (A_27051)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels POST /Task/&lt;id&gt;/$close die Referenz auf den aufgerufenen Task /Task/&lt;id&gt; als MedicationDispense.supportingInformation übernehmen und die MedicationDispense, sowie die in MedicationDispense.medication referenzierte Medication, speichern.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-151" title="E-Rezept-Fachdienst - Task schließen - Speicherung mehrerer MedicationDispenses (A_22069-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/&lt;id&gt;/$close auch die Übergabe mehrerer MedicationDispense-Objekte in einem validen Standard-FHIR-Bundle im HTTP-Body des Requests ermöglichen.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-152" title="E-Rezept-Fachdienst - Task schließen - Zeitstempel MedicationDispense (A_26337)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels POST /Task/&lt;id&gt;/$close den Zeitpunkt des Aufrufes in Task.extension:lastMedicationDispense im Format "YYYY-MM-DDThh:mm:ss+zz:zz" (FHIR-instant) anlegen und speichern, wenn ein MedicationDispense Objekt im Aufruf übergeben wird.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-153" title="E-Rezept-Fachdienst - Task schließen - Daten ePA Medication Service bereitstellen (Dispensierinformationen) (A_25928-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/&lt;id&gt;/$close, wenn die Operation erfolgreich abgeschlossen werden kann, die Daten der Dispensierinformationen mit Status = "completed" für die Übermittlung in den ePA Medication Service bereitstellen.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-154" title="E-Rezept-Fachdienst - Task schließen - T-Rezept Daten an BfArM Webdienst bereitstellen (A_27814)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/&lt;id&gt;/$close mit Flowtype 166, wenn die Operation erfolgreich abgeschlossen werden kann, die Daten des digitalen Durchschlags E-T-Rezept dem BfArM Webdienst bereitstellen.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-155" title="E-Rezept-Fachdienst - Task schließen - Push Notification Versicherter (A_28129)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$close, wenn eine MedicationDispense Ressource übermittelt wird und die Operation erfolgreich abgeschlossen werden kann, den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.close" und den Versicherten mit der KVNR = Task.for initiieren.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-156" title="E-Rezept-Fachdienst - Status beenden (A_19232)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS die zulässige Beendigung eines Tasks mittels /Task/&lt;id&gt;/$close-Operation im Status Task.status = completed vollziehen, damit der Workflow für den Versicherten als beendet und das E-Rezept somit als eingelöst dargestellt wird.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-157" title="E-Rezept-Fachdienst - Task schließen - Quittung erstellen (A_19233-05)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/&lt;id&gt;/$close ein Quittungsbundle gemäß des FHIR-Profils https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle mit folgenden Informationen erstellen: Telematik-ID der aufrufenden Apotheke als Beneficiary in die erxComposition, Zeitstempel des Statuswechsel des Tasks "in-progress" in event.period.start, aktueller Zeitstempel in event.period.end, Identifier PrescriptionID des Task als identifier des Quittungs-Bundle, Device-Ressource mit Fachdienstinformationen als Autor der Signatur, Base64Binary-Ressource mit Binary.data = &lt;base64-codierter Hashwert aus der QES-Signatur des dem Task zugrunde liegenden Verordnungsdatensatzes&gt; und contentType = "application/octet-stream". Dieses Quittungs-Bundle MUSS mit der Signaturidentität des Fachdienstes ID.FD.OSIG gemäß RFC5652 mit Profil CAdES-BES im Enveloping signiert werden. In die Signatur wird die letzte OCSP-Antwort der regelmäßigen Statusprüfung des Signaturzertifikats C.FD.OSIG eingebettet. Das Signatur-Ergebnis wird als dss:Base64Signature-Objekt in Bundle.signature eingebettet und dieses Quittungs-Bundle mit Referenz in Task.output mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 3 gespeichert sowie als Response des HTTP-Requests an den Aufrufer zurückgegeben, damit der Apotheker einen Nachweis über den ordnungsgemäßen Abschluss des E-Rezept-Workflows als Quittung erhält.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-158" title="E-Rezept-Fachdienst - Task schließen - OCSP-Response nicht aelter als 24 h (A_22919)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS, falls keine OCSP-Response für das Signaturzertifikat der Quittung vorliegt bzw. die letzte vorliegende OCSP-Response aelter als 24 h ist, die Operation mit dem Fehler 503 abbrechen.
</requirement>

