
<requirement conformance="SHALL" key="IG-TIFlow-DiGA-23" title="E-Rezept-Fachdienst - Task zurückweisen - Flowtype 162 - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  <Beschreibung>
    Der E-Rezept-Fachdienst MUSS beim Zurückweisen eines Tasks für eine Verordnung mit Flowtype 162 mittels HTTP-POST/$reject-Operation auf den in der URL referenzierten/Task/&#60;id&#62; die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Institutionen in der Rolle
    <ul>
      <li>oid_kostentraeger</li>
    </ul>
    die Operation am Fachdienst aufrufen, damit die Verordnung nicht durch einen Unberechtigten zurückgewiesen werden kann.
  </Beschreibung>
  <!-- A_19170-02 -->
</requirement>