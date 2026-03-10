Diese Seite enthält die normativen Anforderungen an den Fachdienst für die Operation `$abort`.

### Anforderungen aus der Core Spezifikation

{% include core.op-abort-req-fd.md %}

### Modulspezifische Anforderungen

<!-- A_19026-01 -->
<requirement conformance="SHALL" key="IG-TIFlow-DiGA-17" title="E-Rezept-Fachdienst - E-Rezept löschen - Flowtype 162 - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Löschen eines Tasks für eine Verordnung mit Flowtype 162 mittels HTTP-POST/$abort-Operation auf den in der URL referenzierten/Task/&#60;id&#62; die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Institutionen in der Rolle
  <ul>
    <li>oid_versicherter</li>
    <li>oid_praxis_arzt</li>
    <li>oid_zahnarztpraxis</li>
    <li>oid_krankenhaus</li>
    <li>oid_praxis_psychotherapeut</li>
    <li>oid_institution-vorsorge-reha</li>
  </ul>
  die Operation am Fachdienst aufrufen, damit die Verordnung nicht durch einen Unberechtigten gelöscht werden kann.
</requirement>