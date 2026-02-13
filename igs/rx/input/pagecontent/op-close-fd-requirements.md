# FD-Anforderungen: Operation `$close`

Diese Seite enthaelt die normativen Anforderungen an den E-Rezept-Fachdienst fuer die Operation `$close`.

<requirement conformance="SHALL" key="IG-ERP-RX-601" title="E-Rezept-Fachdienst - Task schliessen - Rollenpruefung (A_19230-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks fuer ein E-Rezept mittels HTTP-POST/$close-Operation auf den in der URL referenzierten /Task/&lt;id&gt; sicherstellen, dass ausschliesslich abgebende Institutionen in der Rolle oid_oeffentliche_apotheke, oid_krankenhausapotheke, oid_kostentraeger die Operation am Fachdienst aufrufen duerfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit der E-Rezept-Workflow nicht durch einen Unberechtigten abgeschlossen werden kann.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-RX-602" title="E-Rezept-Fachdienst - Task schliessen - Pruefung Secret (A_19231-02)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels HTTP-POST-Operation ueber /Task/&lt;id&gt;/$close das im URL-Parameter "?secret=..." uebertragene Secret gegen das im referenzierten Task gespeicherte Secret Task.identifier:Secret als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret und auf Task.status = in-progress pruefen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit der Zugriff auf diesen Datensatz nur durch den Berechtigten in Kenntnis des Secrets erfolgt.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-RX-603" title="E-Rezept-Fachdienst - Task schliessen - Flowtype 160/166/169/200/209 - Profilpruefung MedicationDispense (A_26002-02)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks fuer ein E-Rezept mittels HTTP-POST/$close-Operation auf den in der URL referenzierten /Task/&lt;id&gt; mit Flowtype 160, 166, 169, 200 oder 209 sicherstellen, dass das in GEM_ERP_PR_PAR_CloseOperation_Input enthaltene MedicationDispense-Objekt dem Profil GEM_ERP_PR_MedicationDispense entspricht. Andernfalls ist die Operation mit einem Fehler abzubrechen, und im OperationOutcome muss der Text "Unzulaessige Abgabeinformationen: Fuer diesen Workflow sind nur Abgabeinformationen fuer Arzneimittel zulaessig." zurueckgegeben werden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-RX-604" title="E-Rezept-Fachdienst - Task schliessen - Flowtype 162 - Profilpruefung MedicationDispense (A_26003-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks fuer ein E-Rezept mittels HTTP-POST/$close-Operation auf den in der URL referenzierten /Task/&lt;id&gt; mit Flowtype 162 sicherstellen, dass das in GEM_ERP_PR_PAR_CloseOperation_Input enthaltene MedicationDispense-Objekt dem Profil GEM_ERP_PR_MedicationDispense_DiGA entspricht. Andernfalls ist die Operation mit einem Fehler abzubrechen, und im OperationOutcome muss der Text "Unzulaessige Abgabeinformationen: Fuer diesen Workflow sind nur Abgabeinformationen fuer digitale Gesundheitsanwendungen zulaessig." zurueckgegeben werden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-RX-605" title="E-Rezept-Fachdienst - Task schliessen - Aufruf ohne MedicationDispense (A_24287-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels POST /Task/&lt;id&gt;/$close erlauben, dass der Aufruf ohne Uebergabe einer MedicationDispense im Request Body stattfindet. Der E-Rezept-Fachdienst MUSS in dem Fall sicherstellen, dass eine MedicationDispense fuer diesen Task existiert. Der E-Rezept-Fachdienst MUSS, falls keine MedicationDispense zum dazugehoerigen Task existiert, mit dem Fehler 403 abbrechen. Im Fehlerfall ist die Meldung "Abschluss des Workflows konnte nicht durchgefuehrt werden. Dispensierinformationen wurden nicht bereitgestellt." im OperationOutcome zu uebermitteln.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-RX-606" title="E-Rezept-Fachdienst - Task schliessen - Schemapruefung MedicationDispense (A_19248-05)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels POST /Task/&lt;id&gt;/$close das im HTTP-Body des Requests enthaltene Parameters-Objekt gegen das Profil https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PAR_CloseOperation_Input pruefen, insbesondere bei der darin enthaltenen MedicationDispense: die Korrektheit der Rezept-ID https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PrescriptionId als MedicationDispense.identifier, die KVNR des Versicherten im referenzierten Task (Task.for) gegen KVNR in MedicationDispense.subject:identifier und ob die Telematik-ID der Apotheke gemaess ACCESS_TOKEN mit dem Wert in MedicationDispense.performer.actor:identifier uebereinstimmt, und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-RX-607" title="E-Rezept-Fachdienst - Task schliessen - Ueberschreiben vorheriger MedicationDispenses (A_26481)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/&lt;id&gt;/$close sicherstellen, dass alle vorhandenen MedicationDispenses und ihre referenzierten Medications geloescht werden, wenn der Client im Aufruf eine neue MedicationDispense uebermittelt, sodass nach Abschluss der Operation nur die neu uebermittelten MedicationDispenses gespeichert sind.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-RX-608" title="E-Rezept-Fachdienst - Task schliessen - MedicationDispense speichern (A_27051)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels POST /Task/&lt;id&gt;/$close die Referenz auf den aufgerufenen Task /Task/&lt;id&gt; als MedicationDispense.supportingInformation uebernehmen und die MedicationDispense, sowie die in MedicationDispense.medication referenzierte Medication, speichern.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-RX-609" title="E-Rezept-Fachdienst - Task schliessen - Speicherung mehrerer MedicationDispenses (A_22069-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/&lt;id&gt;/$close auch die Uebergabe mehrerer MedicationDispense-Objekte in einem validen Standard-FHIR-Bundle im HTTP-Body des Requests ermoeglichen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-RX-610" title="E-Rezept-Fachdienst - Task schliessen - Zeitstempel MedicationDispense (A_26337)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels POST /Task/&lt;id&gt;/$close den Zeitpunkt des Aufrufes in Task.extension:lastMedicationDispense im Format "YYYY-MM-DDThh:mm:ss+zz:zz" (FHIR-instant) anlegen und speichern, wenn ein MedicationDispense Objekt im Aufruf uebergeben wird.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-RX-611" title="E-Rezept-Fachdienst - Task schliessen - Daten ePA Medication Service bereitstellen (Dispensierinformationen) (A_25928-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/&lt;id&gt;/$close, wenn die Operation erfolgreich abgeschlossen werden kann, die Daten der Dispensierinformationen mit Status = "completed" fuer die Uebermittlung in den ePA Medication Service bereitstellen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-RX-612" title="E-Rezept-Fachdienst - Task schliessen - T-Rezept Daten an BfArM Webdienst bereitstellen (A_27814)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/&lt;id&gt;/$close mit Flowtype 166, wenn die Operation erfolgreich abgeschlossen werden kann, die Daten des digitalen Durchschlags E-T-Rezept dem BfArM Webdienst bereitstellen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-RX-613" title="E-Rezept-Fachdienst - Task schliessen - Push Notification Versicherter (A_28129)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels HTTP-POST-Operation ueber /Task/&lt;id&gt;/$close, wenn eine MedicationDispense Ressource uebermittelt wird und die Operation erfolgreich abgeschlossen werden kann, den Push Notification Prozess fuer den Trigger mit der ChannelId "erp.task.close" und den Versicherten mit der KVNR = Task.for initiieren.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-RX-614" title="E-Rezept-Fachdienst - Status beenden (A_19232)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS die zulaessige Beendigung eines Tasks mittels /Task/&lt;id&gt;/$close-Operation im Status Task.status = completed vollziehen, damit der Workflow fuer den Versicherten als beendet und das E-Rezept somit als eingeloest dargestellt wird.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-RX-615" title="E-Rezept-Fachdienst - Task schliessen - Quittung erstellen (A_19233-05)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/&lt;id&gt;/$close ein Quittungsbundle gemaess des FHIR-Profils https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle mit folgenden Informationen erstellen: Telematik-ID der aufrufenden Apotheke als Beneficiary in die erxComposition, Zeitstempel des Statuswechsel des Tasks "in-progress" in event.period.start, aktueller Zeitstempel in event.period.end, Identifier PrescriptionID des Task als identifier des Quittungs-Bundle, Device-Ressource mit Fachdienstinformationen als Autor der Signatur, Base64Binary-Ressource mit Binary.data = &lt;base64-codierter Hashwert aus der QES-Signatur des dem Task zugrunde liegenden Verordnungsdatensatzes&gt; und contentType = "application/octet-stream". Dieses Quittungs-Bundle MUSS mit der Signaturidentitaet des Fachdienstes ID.FD.OSIG gemaess RFC5652 mit Profil CAdES-BES im Enveloping signiert werden. In die Signatur wird die letzte OCSP-Antwort der regelmaessigen Statuspruefung des Signaturzertifikats C.FD.OSIG eingebettet. Das Signatur-Ergebnis wird als dss:Base64Signature-Objekt in Bundle.signature eingebettet und dieses Quittungs-Bundle mit Referenz in Task.output mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 3 gespeichert sowie als Response des HTTP-Requests an den Aufrufer zurueckgegeben, damit der Apotheker einen Nachweis ueber den ordnungsgemaessen Abschluss des E-Rezept-Workflows als Quittung erhaelt.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-RX-616" title="E-Rezept-Fachdienst - Task schliessen - OCSP-Response nicht aelter als 24 h (A_22919)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS, falls keine OCSP-Response fuer das Signaturzertifikat der Quittung vorliegt bzw. die letzte vorliegende OCSP-Response aelter als 24 h ist, die Operation mit dem Fehler 503 abbrechen.
</requirement>

