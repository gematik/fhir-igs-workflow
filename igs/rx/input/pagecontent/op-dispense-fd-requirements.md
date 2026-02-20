# FD-Anforderungen: Operation `$dispense`

Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$dispense`.

<requirement conformance="SHALL" key="IG-TIFlow-RX-127" title="E-Rezept-Fachdienst - Dispensierinformationen bereitstellen - Rollenprüfung Abgebender stellt Dispensierinformationen bereit (A_24279)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/&lt;id&gt;/$dispense auf den in der URL referenzierten /Task/&lt;id&gt; sicherstellen, dass ausschließlich abgebende Leistungserbringer in der Rolle oid_oeffentliche_apotheke, oid_krankenhausapotheke die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit Dispensierinformationen nicht durch einen Unberechtigten eingestellt werden kann.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-128" title="E-Rezept-Fachdienst - Dispensierinformationen bereitstellen - Prüfung Secret (A_24280)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/&lt;id&gt;/$dispense das im URL-Parameter "?secret=..." übertragene Secret gegen das im referenzierten Task gespeicherte Secret Task.identifier:Secret als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit der Zugriff auf diesen Datensatz nur durch den Berechtigten in Kenntnis des Secrets erfolgt.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-129" title="E-Rezept-Fachdienst - Dispensierinformationen bereitstellen - Prüfung Status (A_24298)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/&lt;id&gt;/$dispense auf Task.status = in-progress prüfen und bei Ungleichheit mit dem HTTP-Fehlercode 403 abbrechen.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-130" title="E-Rezept-Fachdienst - Dispensierinformationen bereitstellen - Schemaprüfung MedicationDispense (A_24281-02)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/&lt;id&gt;/$dispense das im HTTP-Body des Requests enthaltene Parameters-Objekt gegen das Profil https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PAR_DispenseOperation_Input prüfen, insbesondere bei der darin enthaltenen MedicationDispense: die Korrektheit der Rezept-ID https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PrescriptionId als MedicationDispense.identifier, die KVNR des Versicherten im referenzierten Task (Task.for) gegen KVNR in MedicationDispense.subject:identifier und ob die Telematik-ID der Apotheke gemäß ACCESS_TOKEN mit dem Wert in MedicationDispense.performer.actor:identifier übereinstimmt, und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-131" title="E-Rezept-Fachdienst - Dispensierinformationen bereitstellen - Überschreiben vorheriger MedicationDispenses (A_26482)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/&lt;id&gt;/$dispense sicherstellen, dass alle vorhandenen MedicationDispenses und ihre referenzierten Medications gelöscht werden, wenn bereits bestehende MedicationDispense(s) zum E-Rezept vorhanden sind, sodass nach Abschluss der Operation nur die neu übermittelten MedicationDispenses gespeichert sind.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-132" title="E-Rezept-Fachdienst - Dispensierinformationen bereitstellen - MedicationDispense speichern (A_27052)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/&lt;id&gt;/$dispense die Referenz auf den aufgerufenen Task /Task/&lt;id&gt; als MedicationDispense.supportingInformation übernehmen und die MedicationDispense, sowie die in MedicationDispense.medication referenzierte Medication, speichern.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-133" title="E-Rezept-Fachdienst - Dispensierinformationen bereitstellen - Speicherung mehrerer MedicationDispenses (A_24283-02)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/&lt;id&gt;/$dispense auch die Übergabe mehrerer MedicationDispense-Objekte in einem validen Standard-FHIR-Bundle im HTTP-Body des Requests ermöglichen.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-134" title="E-Rezept-Fachdienst - Dispensierinformationen bereitstellen - Daten Medikationsliste bereitstellen (Dispensierinformationen) (A_25933)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/&lt;id&gt;/$dispense, wenn die übermittelten Dispensierinformationen sich von den ggf. bereits zuvor zum Task gespeicherten Dispensierinformationen unterscheiden und die Operation erfolgreich abgeschlossen werden kann, die Daten der Dispensierinformationen mit Status = "in Progress" für die Übermittlung in den ePA Medication Service bereitstellen.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-135" title="E-Rezept-Fachdienst - Dispensierinformationen bereitstellen - Zeitstempel MedicationDispense (A_24285-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/&lt;id&gt;/$dispense den Zeitpunkt des Aufrufes in Task.extension:lastMedicationDispense im Format "YYYY-MM-DDThh:mm:ss+zz:zz" (FHIR-instant) anlegen und speichern.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-136" title="E-Rezept-Fachdienst - Dispensierinformationen bereitstellen - Push Notification Versicherter (A_28130)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$dispense bei erfolgreichem Abschluss der Operation den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.dispense" und den Versicherten mit der KVNR = Task.for initiieren.
</requirement>

<requirement conformance="SHALL NOT" key="IG-TIFlow-RX-137" title="E-Rezept-Fachdienst - Dispensierinformationen bereitstellen - Keine Statusaenderung (A_24284)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst DARF bei der Bereitstellung von Dispensierinformationen mittels POST /Task/&lt;id&gt;/$dispense den Status des Task bei Aufrufen der POST /Task/&lt;id&gt;/$dispense Operation NICHT verändern.
</requirement>

