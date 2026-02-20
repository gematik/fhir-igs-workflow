Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$accept`.

<requirement conformance="SHALL" key="IG-TIFlow-RX-334" title="E-Rezept-Fachdienst - Task akzeptieren - Flowtype 160/166/169/200/209 - Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Abrufen eines Tasks mit Flowtype 160, 166, 169, 200 oder 209 mittels HTTP-POST/$accept-Operation auf den in der URL referenzierten /Task/&lt;id&gt; sicherstellen, dass ausschließlich abgebende Institutionen in der Rolle oid_oeffentliche_apotheke oid_krankenhausapotheke die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte abgerufen werden können.
    </Beschreibung>
    <!-- A_19166-02 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-335" title="E-Rezept-Fachdienst - Task akzeptieren - Mehrfachverordnung - Beginn Einlösefrist prüfen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$accept die Operation mit dem Fehlercode 403 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet ist und und der Beginn der Einlösefrist (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) zu einem späteren Zeitpunkt als das aktuelle Datum liegt, da Teilverordnungen von Mehrfachverordnungen erst ab Beginn der Einlösefrist abgerufen werden dürfen. Im Falle dieses Fehlers ist im OperationOutcome des Response der Beginn der Einlösefrist wie folgt anzugeben: „Teilverordnung zur Mehrfachverordnung &lt;MVO Referenz&gt; ist ab &lt;Datum&gt; einlösbar.“, wobei &lt;MVO Referenz&gt; der Wert MedicationRequest.extension:Mehrfachverordnung.extension:ID.value[x]:valueIdentifier.value sowie &lt;Datum&gt; der Wert MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start im Format "dd.mm.yyyy" ist.
    </Beschreibung>
    <!-- A_22635-02 -->
</requirement>
