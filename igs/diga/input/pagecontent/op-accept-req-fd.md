Diese Seite enthält die normativen Anforderungen an den Fachdienst für die Operation `$accept`.

### Anforderungen aus der Core Spezifikation

{% include core-op-accept-req-fd.md %}

### Modulspezifische Anforderungen


<!-- A_25993 -->
<requirement conformance="SHALL" key="IG-TIFlow-DiGA-17" title="E-Rezept-Fachdienst - Task akzeptieren - Flowtype 162 - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Abrufen eines Tasks für eine Verordnung mit Flowtype 162 mittels HTTP-POST/$accept-Operation auf den in der URL referenzierten/Task/&#60;id&#62; die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Institutionen in der Rolle
  <ul>
    <li>oid_kostentraeger</li>
  </ul>
  die Operation am Fachdienst aufrufen, damit die Verordnung nicht durch einen Unberechtigten abgerufen werden kann.
</requirement>