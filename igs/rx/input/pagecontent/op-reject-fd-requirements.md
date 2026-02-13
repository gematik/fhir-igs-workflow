# FD-Anforderungen: Operation `$reject`

Diese Seite enthaelt die normativen Anforderungen an den E-Rezept-Fachdienst fuer die Operation `$reject`.

<requirement conformance="SHALL" key="IG-ERP-RX-501" title="E-Rezept-Fachdienst - Task zurueckweisen - Rollenpruefung (A_19170-02)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zurueckweisen eines Tasks fuer ein E-Rezept mittels HTTP-POST/$reject-Operation auf den in der URL referenzierten /Task/&lt;id&gt; sicherstellen, dass ausschliesslich abgebende Institutionen in der Rolle oid_oeffentliche_apotheke, oid_krankenhausapotheke, oid_kostentraeger die Operation am Fachdienst aufrufen duerfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit das E-Rezept nicht durch einen Unberechtigten zurueckgewiesen werden kann.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-RX-502" title="E-Rezept-Fachdienst - Task zurueckweisen - Pruefung Secret (A_19171-03)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/&lt;id&gt;/$reject das im URL-Parameter "?secret=..." uebertragene Secret gegen das im referenzierten Task gespeicherte Secret Task.identifier:Secret als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret und auf Task.status = in-progress pruefen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit der Zugriff auf diesen Datensatz nur durch den Berechtigten in Kenntnis des Secrets erfolgt.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-RX-503" title="E-Rezept-Fachdienst - Task zurueckweisen - Loeschmarkierungen Medikationsliste bereitstellen (Dispensierinformationen) (A_25926)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zurueckweisen eines Tasks mittels HTTP-POST-Operation ueber /Task/&lt;id&gt;/$reject, wenn bereits Dispensierinformationen im E-Rezept-Fachdienst zum Task gespeichert wurden, die Daten fuer die Loeschinformation dieser Dispensierinformationen fuer die Uebermittlung in den ePA Medication Service bereitstellen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-RX-504" title="E-Rezept-Fachdienst - Task zurueckweisen - Secret loeschen und Status setzen (A_19172-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zurueckweisen eines Tasks mittels HTTP-POST-Operation ueber /Task/&lt;id&gt;/$reject die externe ID in Task.identifier:Secret als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Secret loeschen und den Status des referenzierten Tasks auf Task.status = ready setzen, damit nachfolgende Zugriffe auf diesen Datensatz durch Berechtigte in Kenntnis des AccessCodes erfolgen koennen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-RX-505" title="E-Rezept-Fachdienst - Task zurueckweisen - Telematik-ID der abgebenden LEI loeschen (A_24175)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zurueckweisen eines Tasks mittels HTTP-POST-Operation ueber /Task/&lt;id&gt;/$reject die zum referenzierten Task in Task.owner gespeicherte Telematik-ID der abgebenden LEI loeschen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-RX-506" title="E-Rezept-Fachdienst - Task zurueckweisen - Dispensierinformationen loeschen (A_24286-02)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zurueckweisen eines Tasks fuer ein E-Rezept mittels POST /Task/&lt;id&gt;/$reject die Dispensierinformationen, falls welche vorhanden sind, loeschen: Medication, die aus der MedicationDispense referenziert wird; MedicationDispense zum dazugehoerigen Task; Task.extension:lastMedicationDispense.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-RX-507" title="E-Rezept-Fachdienst - Task zurueckweisen - Push Notification Versicherter (A_28128)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/&lt;id&gt;/$reject bei erfolgreichem Abschluss der Operation den Push Notification Prozess fuer den Trigger mit der ChannelId "erp.task.reject" und den Versicherten mit der KVNR = Task.for initiieren.
</requirement>

