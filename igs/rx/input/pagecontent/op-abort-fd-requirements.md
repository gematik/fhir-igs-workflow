# FD-Anforderungen: Operation `$abort`

Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$abort`.

<requirement conformance="SHALL" key="IG-TIFlow-RX-124" title="E-Rezept-Fachdienst - E-Rezept löschen - Flowtype 169 / 209 - Versicherter - Statusprüfung (A_22102-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS das Löschen eines E-Rezepts mit dem Flowtype 169 oder 209 über den mittels der &lt;id&gt; adressierten /Task/&lt;id&gt;/$abort verhindern und die Operation mit dem HTTP-Fehlercode 403 abweisen, wenn der Status des adressierten Tasks ungleich "completed" ist und die Rolle des aufrufenden Nutzers oid_versicherter entspricht, damit kein Versicherter ein E-Rezept aus einem Workflow mit Workflowsteuerung durch Leistungserbringer (169, 209) löscht, das nicht bereits beliefert wurde.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-125" title="E-Rezept-Fachdienst - E-Rezept löschen - Löschinformation ePA Medication Service bereitstellen (Verordnungsdatensatz) - Leistungserbringerinstitution (A_25930)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Löschen eines E-Rezepts mittels POST /Task/{id}/$abort durch eine verordnende oder abgebende Leistungserbringerinstitution die Daten für die Löschinformation des Verordnungsdatensatzes in den ePA Medication Service bereitstellen.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-126" title="E-Rezept-Fachdienst - E-Rezept löschen - Löschinformation ePA Medication Service bereitstellen (Verordnungsdatensatz) - Versicherter (A_25931)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Löschen eines E-Rezepts mittels POST /Task/$abort durch einen Versicherten, wenn Task.status = ready, die Daten für die Löschinformation des Verordnungsdatensatzes für die Übermittlung in den ePA Medication Service bereitstellen.
</requirement>

