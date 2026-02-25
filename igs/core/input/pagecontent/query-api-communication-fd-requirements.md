Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für den Communication-Endpunkt.

<!-- A_19401 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Communication - unzulässige Operationen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS alle Zugriffe auf die Ressource Communication mittels der HTTP-Operationen PUT, PATCH und HEAD unterbinden, damit keine unzulässigen Operationen auf den Kommunikationsnachrichten ausgeführt werden können.
</requirement>

<!-- A_19446-02 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Communication - Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET, DELETE und POST-Operation auf den Endpunkt /Communication bzw. /Communication/&lt;id&gt; sicherstellen, dass ausschließlich Versicherte, Leistungserbingerinstitutionen und Kostenträger in der Rolle
    <ul>
        <li>oid_versicherter</li>
        <li>oid_oeffentliche_apotheke</li>
        <li>oid_krankenhausapotheke</li>
        <li>oid_kostentraeger</li>
    </ul>
    die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit der Nachrichtenaustausch nicht zwischen Unbefugten erfolgt.
</requirement>
<!-- ToDo: Fehlt hier die Angabe des Fehlercodes? Siehe auch entsprechende Afos in allen anderen SST. -->

### GET /Communication


<!-- A_19520-02 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Nachrichten abrufen - für Empfänger filtern" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Abrufen von Nachrichten über die http-Operation GET auf den Endpunkt /Communication bzw. beim Abruf einer einzelnen Nachricht über /Communication/&lt;id&gt; ausschließlich die Nachrichten an den Aufrufer zurückgeben, die im Attribut Communication.recipient oder Communication.sender mit dem entsprechenden Identifier https://gematik.de/fhir/sid/telematik-id für Apotheken bzw. http://fhir.de/sid/gkv/kvid-10 für Versicherte den gleichen Typ und den identischen Wert haben wie im Attribut "idNummer" des übergebenen ACCESS_TOKEN im HTTP-Header "Authorization" für Versicherten-ID bzw. Telematik-ID, damit keine Nachrichten an Dritte unrechtmäßig ausgelesen werden.
</requirement>

A_19521 -E-Rezept-Fachdienst - Nachrichten als abgerufen markieren
[<=]

<!-- A_19521 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Nachrichten abrufen - als abgerufen markieren" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Abrufen von Nachrichten über die http-Operation GET auf den Endpunkt /Communication bzw. beim Abruf einer einzelnen Nachricht über /Communication/&lt;id&gt; den Wert des Attributs Communication.received = &lt;aktuelle Systemzeit&gt setzen, wenn dieser Wert zum Zeitpunkt des Abrufs der Nachrichten NULL ist, damit Nutzer eine Filtermöglicheit auf "neue Nachrichten" haben.
</requirement>
