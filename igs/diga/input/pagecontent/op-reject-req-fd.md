Diese Seite enthält die normativen Anforderungen an den Fachdienst für die Operation `$reject`.

### Anforderungen aus der Core Spezifikation

{% include core.op-reject-req-fd.md %}

### Modulspezifische Anforderungen

<!-- A_19170-02 -->
<requirement conformance="SHALL" key="IG-TIFlow-DiGA-23" title="E-Rezept-Fachdienst - Task zurückweisen - Flowtype 162 - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Zurückweisen eines Tasks mit Flowtype 162 HTTP-POST-Operation über /Task/&lt;id&gt;/$reject die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Institutionen in der Rolle
  <ul>
    <li>oid_kostentraeger</li>
  </ul>
  die Operation am Fachdienst aufrufen, damit die Verordnung nicht durch einen Unberechtigten zurückgewiesen werden kann.
</requirement>