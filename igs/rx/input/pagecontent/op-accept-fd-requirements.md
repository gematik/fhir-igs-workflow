# FD-Anforderungen: Operation `$accept`

Diese Seite enthaelt die normativen Anforderungen an den E-Rezept-Fachdienst fuer die Operation `$accept`.

<requirement conformance="SHALL" key="IG-TIFlow-RX-68" title="E-Rezept-Fachdienst - Task akzeptieren - Flowtype 160/166/169/200/209 - Rollenpruefung (A_19166-02)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Abrufen eines Tasks mit Flowtype 160, 166, 169, 200 oder 209 mittels HTTP-POST/$accept-Operation auf den in der URL referenzierten /Task/&lt;id&gt; sicherstellen, dass ausschliesslich abgebende Institutionen in der Rolle oid_oeffentliche_apotheke, oid_krankenhausapotheke die Operation am Fachdienst aufrufen duerfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte abgerufen werden koennen.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-69" title="E-Rezept-Fachdienst - Task akzeptieren - Flowtype 162 - Rollenpruefung (A_25993)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Abrufen eines Tasks mit Flowtype 162 fuer ein E-Rezept mittels HTTP-POST/$accept-Operation auf den in der URL referenzierten /Task/&lt;id&gt; sicherstellen, dass ausschliesslich abgebende Institutionen in der Rolle oid_kostentraeger die Operation am Fachdienst aufrufen duerfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte abgerufen werden koennen.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-70" title="E-Rezept-Fachdienst - Task akzeptieren - Pruefung AccessCode (A_19167-04)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/&lt;id&gt;/$accept den im HTTP-Header "X-AccessCode" oder URL-Parameter "?ac=..." uebertragenen AccessCode gegen den im referenzierten Task gespeicherten AccessCode Task.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode pruefen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-71" title="E-Rezept-Fachdienst - Task akzeptieren - Rezept bereits in Abgabe oder Bearbeitung (A_19168-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/&lt;id&gt;/$accept die Operation mit dem HTTP-Fehlercode 409 abbrechen, wenn der Status Task.status = "completed", Task.status = "in-progress" oder Task.status = "draft" ist, damit ein bereits in Abgabe befindliches oder beliefertes E-Rezept nicht durch eine zweite Apotheke bearbeitet werden kann. Im OperationOutcome werden weitere Informationen gegeben: "Task has invalid status completed", "Task has invalid status in-progress" bzw. "Task has invalid status draft". Der E-Rezept-Fachdienst MUSS in OperationOutcome zusaetzlich die Information "Task is processed by requesting institution" ergaenzen, wenn Task.status = in-progress und die zum referenzierten Task in Task.owner gespeicherte Telematik-ID der abgebenden LEI mit der Telematik-ID aus dem ACCESS_TOKEN uebereinstimmt.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-72" title="E-Rezept-Fachdienst - Task akzeptieren - Ende Einloesefrist pruefen (A_23539-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/&lt;id&gt;/$accept die Operation mit dem Fehlercode 403 abbrechen, wenn das Ende der Einloesefrist (Task.ExpiryDate) zu einem frueherem Zeitpunkt als das aktuelle Datum liegt, da Verordnungen nur bis Ende der Einloesefrist abgerufen werden duerfen. Im Falle dieses Fehlers ist im OperationOutcome des Response das Ende der Einloesefrist wie folgt anzugeben: "Verordnung bis &lt;Datum&gt; einloesbar.", wobei &lt;Datum&gt; der Wert Task.ExpiryDate im Format "dd.mm.yyyy" ist.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-73" title="E-Rezept-Fachdienst - Task akzeptieren - Mehrfachverordnung - Beginn Einloesefrist pruefen (A_22635-02)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/&lt;id&gt;/$accept die Operation mit dem Fehlercode 403 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet ist und der Beginn der Einloesefrist (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) zu einem spaeteren Zeitpunkt als das aktuelle Datum liegt, da Teilverordnungen von Mehrfachverordnungen erst ab Beginn der Einloesefrist abgerufen werden duerfen. Im Falle dieses Fehlers ist im OperationOutcome des Response der Beginn der Einloesefrist wie folgt anzugeben: "Teilverordnung zur Mehrfachverordnung &lt;MVO Referenz&gt; ist ab &lt;Datum&gt; einloesbar.", wobei &lt;MVO Referenz&gt; der Wert MedicationRequest.extension:Mehrfachverordnung.extension:ID.value[x]:valueIdentifier.value sowie &lt;Datum&gt; der Wert MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start im Format "dd.mm.yyyy" ist.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-74" title="E-Rezept-Fachdienst - Task akzeptieren - Generierung Secret, Statuswechsel in Abgabe und Rueckgabewert (A_19169-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/&lt;id&gt;/$accept den Status des Tasks auf Task.status = in-progress setzen, eine 256 Bit Zufallszahl mit einer Mindestentropie von 120 Bit erzeugen, hexadezimal kodieren ([0-9a-f]{64}) und diese im zu speichernden Task als externe ID in Task.identifier:Secret als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Secret hinzufuegen und den Task im Bundle mit dem in Task.input mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 1 referenzierten QES-Datensatz als Binary-Ressource https://www.hl7.org/fhir/binary.html an den Aufrufer zurueckgeben, damit das E-Rezept fuer die nachfolgende Bearbeitung durch den abrufenden Apotheker reserviert ist.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-75" title="E-Rezept-Fachdienst - Task akzeptieren - Coverage PKV - Einwilligung Abrechnungsinformation ermitteln (A_22110-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/&lt;id&gt;/$accept, wenn der Verordnungsdatensatz Coverage.type.coding.code = "PKV" enthaelt und fuer die KVNR des beguenstigten Versicherten (Task.for) eine Consent Ressource mit Consent.patient.identifier = KVNR und Consent.category.coding.code = "CHARGCONS" existiert, das Response Bundle um die Consent Ressource ergaenzen, um der abgebenden LEI die Information zu uebermitteln, dass der Versicherte eine Einwilligung zum Speichern der Abrechnungsinformationen auf dem E-Rezept-Fachdienst erteilt hat.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-76" title="E-Rezept-Fachdienst - Task akzeptieren - Telematik-ID der abgebenden LEI speichern (A_24174)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/&lt;id&gt;/$accept fuer den referenzierten Task die Telematik-ID aus dem ACCESS_TOKEN in Task.owner speichern, damit sichergestellt werden kann, dass nachfolgende Zugriffe auf diesen Datensatz nur durch Berechtigte erfolgen koennen.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-77" title="E-Rezept-Fachdienst - Task akzeptieren - Pruefung Datensatz zwischenzeitlich geloescht (A_19149-02)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/&lt;id&gt;/$accept die Operation mit dem HTTP-Fehlercode 410 abbrechen, wenn der referenzierte /Task/&lt;id&gt; existiert, jedoch kein AccessCode im Task.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode vorhanden ist oder der Status Task.status = cancelled ist, damit ein Apotheker den Versicherten ueber die zwischenzeitliche Loeschung des Datensatzes in Kenntnis setzen kann.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-78" title="E-Rezept-Fachdienst - Task akzeptieren - Push Notification Versicherter (A_28127)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/&lt;id&gt;/$accept bei erfolgreichem Abschluss der Operation den Push Notification Prozess fuer den Trigger mit der ChannelId "erp.task.accept" und den Versicherten mit der KVNR = Task.for initiieren.
</requirement>

