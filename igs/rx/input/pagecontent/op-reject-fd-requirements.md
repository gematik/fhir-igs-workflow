# FD-Anforderungen: Operation `$reject`

Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$reject`.

<requirement conformance="SHALL" key="IG-TIFlow-RX-61" title="E-Rezept-Fachdienst - Task zurückweisen - Rollenprüfung (A_19170-02)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zurückweisen eines Tasks für ein E-Rezept mittels HTTP-POST/$reject-Operation auf den in der URL referenzierten /Task/&lt;id&gt; sicherstellen, dass ausschließlich abgebende Institutionen in der Rolle oid_oeffentliche_apotheke, oid_krankenhausapotheke, oid_kostentraeger die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit das E-Rezept nicht durch einen Unberechtigten zurückgewiesen werden kann.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-62" title="E-Rezept-Fachdienst - Task zurückweisen - Prüfung Secret (A_19171-03)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$reject das im URL-Parameter "?secret=..." übertragene Secret gegen das im referenzierten Task gespeicherte Secret Task.identifier:Secret als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret und auf Task.status = in-progress prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit der Zugriff auf diesen Datensatz nur durch den Berechtigten in Kenntnis des Secrets erfolgt.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-63" title="E-Rezept-Fachdienst - Task zurückweisen - Löschmarkierungen Medikationsliste bereitstellen (Dispensierinformationen) (A_25926)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zurückweisen eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$reject, wenn bereits Dispensierinformationen im E-Rezept-Fachdienst zum Task gespeichert wurden, die Daten für die Löschinformation dieser Dispensierinformationen für die Übermittlung in den ePA Medication Service bereitstellen.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-64" title="E-Rezept-Fachdienst - Task zurückweisen - Secret löschen und Status setzen (A_19172-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zurückweisen eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$reject die externe ID in Task.identifier:Secret als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Secret löschen und den Status des referenzierten Tasks auf Task.status = ready setzen, damit nachfolgende Zugriffe auf diesen Datensatz durch Berechtigte in Kenntnis des AccessCodes erfolgen koennen.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-65" title="E-Rezept-Fachdienst - Task zurückweisen - Telematik-ID der abgebenden LEI löschen (A_24175)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zurückweisen eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$reject die zum referenzierten Task in Task.owner gespeicherte Telematik-ID der abgebenden LEI löschen.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-66" title="E-Rezept-Fachdienst - Task zurückweisen - Dispensierinformationen löschen (A_24286-02)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zurückweisen eines Tasks für ein E-Rezept mittels POST /Task/&lt;id&gt;/$reject die Dispensierinformationen, falls welche vorhanden sind, löschen: Medication, die aus der MedicationDispense referenziert wird; MedicationDispense zum dazugehoerigen Task; Task.extension:lastMedicationDispense.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-67" title="E-Rezept-Fachdienst - Task zurückweisen - Push Notification Versicherter (A_28128)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$reject bei erfolgreichem Abschluss der Operation den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.reject" und den Versicherten mit der KVNR = Task.for initiieren.
</requirement>

