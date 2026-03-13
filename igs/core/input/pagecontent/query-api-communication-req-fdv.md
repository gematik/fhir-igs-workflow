Diese Seite beschreibt Anforderungen ein E-Rezept-FdV zur Nutzung der `Communication`-Query-Endpunkte.

### Nachrichten abrufen


<!-- A_19205 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-46" title="Nachrichten abrufen - Nachrichten von Fachdienst herunterladen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Nachrichten von Apotheken anzeigen" zum Herunterladen von Nachrichten vom E-Rezept-Fachdienst die HTTP-Operation GET /Communication mit
    <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
        <li>optional: ?received=null für nur ungelesene Nachrichten</li>
        <li>optional: ?received=gtYYYY-MM-DD_sort=sent für Nachrichten jünger als Datum DD.MM.YYY</li>
    </ul>
    ausführen.
</requirement>

<!-- A_23877-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-354" title="E-Rezept-FdV: Nachrichtenaustausch - Nachricht durch Abgebenden übermitteln - Datenstruktur Nachricht" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das E-Rezept-FdV MUSS für den Anwendungsfall "Nachricht durch Abgebenden übermitteln" Nachrichten mit der folgenden Datenstruktur in der contentString-Eigenschaft des GEM_ERP_PR_Communication_Reply unterstützen.
     <table>
  <thead>
    <tr>
      <th>Attribut</th>
      <th>verpflichtend</th>
      <th>Beschreibung</th>
      <th>zulässige Werte</th>
      <th>Beispiel</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>version</td>
      <td>ja</td>
      <td>Gibt die Version des JSON an. Aktuell immer 3. Kann im weiteren Lebenszyklus verändert werden.</td>
      <td>nummerisch, bis zu 6 Stellen</td>
      <td>3</td>
    </tr>
    <tr>
      <td>communicationType</td>
      <td>ja</td>
      <td>Beschreibt die Art der Nachricht.</td>
      <td>text, link, reservationStatus, pickupCodeHR, pickupCodeDMC, deliveryStatus, paymentInfo</td>
      <td>reservationStatus</td>
    </tr>
    <tr>
      <td>text</td>
      <td>Falls communicationType = text oder link: ja<br>Falls communicationType = pickupCodeHR, pickupCodeDMC, deliveryStatus oder paymentInfo: nein<br>Falls communicationType = reservationStatus: verboten</td>
      <td>Zusätzlicher Freitext der Apotheke an den Versicherten. Falls communicationType gleich "link" ist, beschreibt dies das URL-Ziel, sodass der Versicherte vor dem Aufruf über das Ziel des Absprungs informiert wird.</td>
      <td>800 Stellen, keine URL</td>
      <td>Wir möchten Sie informieren, dass Ihre bestellten Medikamente zur Abholung bereitstehen. Den Abholcode finden Sie anbei.</td>
    </tr>
    <tr>
      <td>url</td>
      <td>Falls communicationType = link: ja<br>Ansonsten: verboten</td>
      <td>Einbettung einer externen URL ausschließlich für das Einlösen von E-Rezepten in einer externen Bestellplattform.</td>
      <td>500 Stellen, URL gemäß RFC3986</td>
      <td>https://www.meine-apotheke.de/pickup/59b52340-7a6a-430d-99ea-45a8e5cd03f6</td>
    </tr>
    <tr>
      <td>transactionID</td>
      <td>ja</td>
      <td>Wiederholung aus der empfangenen Nachricht. Dient dazu, Nachrichten einer Transaktion zuordnen zu können.</td>
      <td>36 Stellen, UUID</td>
      <td>8196b610-9b77-47ab-936e-362cd92ef2aa</td>
    </tr>
    <tr>
      <td>readyForCollection</td>
      <td>Falls communicationType = reservationStatus: ja<br>Ansonsten: verboten</td>
      <td>Zeitpunkt der Verfügbarkeit</td>
      <td>immediately, sameDay, nextDay, nextDayAM, nextDayPM, unknown, notAvailable</td>
      <td>immediately</td>
    </tr>
    <tr>
      <td>deliveryStatus</td>
      <td>Falls communicationType = deliveryStatus: ja<br>Ansonsten: verboten</td>
      <td>Information zum Status der Lieferung (Bote, Versand)</td>
      <td>preparedWaiting, inTransport, delivered, incident</td>
      <td>inTransport</td>
    </tr>
    <tr>
      <td>inTransportPosition</td>
      <td>Falls communicationType = deliveryStatus: nein<br>Ansonsten: verboten</td>
      <td>GMS Position des Transporters</td>
      <td>Lat, Long</td>
      <td><pre>{
  "long": 13.387595793605172,
  "lat": 52.522529939635795
}</pre></td>
    </tr>
    <tr>
      <td>inTransportETA</td>
      <td>Falls communicationType = deliveryStatus: nein<br>Ansonsten: verboten</td>
      <td>Erwartete Ankunft Zeitfenster von – bis</td>
      <td>TIMESTAMP-TIMESTAMP</td>
      <td><pre>{
  "from": 1735736400,
  "to": 1735741800
}</pre></td>
    </tr>
    <tr>
      <td>totalAmount</td>
      <td>Falls communicationType = paymentInfo: ja<br>Ansonsten: verboten</td>
      <td>Zu zahlender Betrag in Eurocent, rein nummerisch</td>
      <td>Nummerisch</td>
      <td>12550</td>
    </tr>
    <tr>
      <td>paymentMethods</td>
      <td>Falls communicationType = paymentInfo: nein<br>Ansonsten: verboten</td>
      <td>Verfügbare Zahlungsarten</td>
      <td>Array aus Objects: cash, bankaccount, creditcard, paypal (optional)</td>
      <td><pre>"paymentMethods": [
  { "method": "cash" },
  {
    "method": "bankaccount",
    "url": "https://my.payment.provider.de/pay/..."
  },
  {
    "method": "paypal",
    "url": "https://paypal.me/&lt;some_account&gt;"
  }
]</pre></td>
    </tr>
    <tr>
      <td>pickUpCodeHR</td>
      <td>Falls communicationType = pickupCodeHR und supplyOptionsType = onPremise: ja<br>Ansonsten: verboten</td>
      <td>Menschenlesbarer Abholcode</td>
      <td>1-8 Stellen</td>
      <td>12315615</td>
    </tr>
    <tr>
      <td>pickUpCodeDMC</td>
      <td>Falls communicationType = pickupCodeDMC und supplyOptionsType = onPremise: ja<br>Ansonsten: verboten</td>
      <td>Maschinenlesbarer Abholcode (Data-Matrix-Code gemäß ISO/IEC 16022:2006)</td>
      <td>8-2000 Stellen</td>
      <td>5346a991-c5c6-49c8-b87b-4cdd255bbde4</td>
    </tr>
  </tbody>
</table>
<div><figcaption><strong>Tabelle: </strong>Nachricht als Apotheke an einen Versicherten schicken</figcaption></div>
     
</requirement>


### Nachricht versenden

#### Zuweisen

<!-- A_26318 -->
<requirement conformance="SHALL" key="" title="Nachricht senden - E-Rezept zuweisen - Status prüfen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen" den aktuellen Status des E-Rezepts ermitteln, prüfen ob Task.status = ready ist und anderenfalls den Anwendungsfall abbrechen.
</requirement>

<!-- A_26319 -->
<requirement conformance="SHALL" key="" title="Nachricht senden - E-Rezept zuweisen - Ende Gültigkeit prüfen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen"  prüfen, ob das Ende der Einlösefrist (Task.ExpiryDate) zu einem früherem Zeitpunkt als das aktuelle Datum liegt und in diesem Fall den Anwendungsfall abbrechen.
</requirement>

Die für die Nachricht zu verwendende Communication-Ressource wird modul- und anwendungsfall-spezifisch festgelegt.

<!-- A_28543 -->
<requirement conformance="SHALL" key="" title="Nachricht senden - E-Rezept zuweisen - Zuweisen - TransactionID" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen" im Rahmen der Belieferung eines Arzneimittels für den payload_contentstring eine TransactionID erzeugen, um Nachrichten zu dem Vorgang zuordnen zu können.
</requirement>

<!-- A_28545 -->
<requirement conformance="SHALL" key="" title="Nachricht senden - E-Rezept zuweisen - Auf Nachricht antworten - TransactionID" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im  Anwendungsfall "E-Rezept einer Apotheke zuweisen" im Rahmen der Belieferung eines Arzneimittels, wenn der Nutzer auf eine empfangene Nachricht einer Apotheke antwortet, die TransactionID aus der empfangenen Nachricht der Apotheke unverändert im payload contentString der Textnachricht an die Apotheke zurückgeben.
</requirement>

<!-- A_19203 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-47" title="Nachricht senden - Nachricht auf Fachdienst einstellen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Nachricht senden" zum Übermitteln einer Nachricht über den E-Rezept-Fachdienst die HTTP-Operation POST /Communication mit
    <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
        <li>Communication Ressource in HTTP-Request-Body</li> 
    </ul>
    ausführen.
</requirement>

#### Vertreterkommunikation

Das E-Rezept-FdV MUSS im Anwendungsfall "Vertreterkommunikation" es dem Nutzer ermöglichen, die KVNR des Empfängers der Nachricht zu erfassen.

Das Erfassen der KVNR eines Vertreters kann über eine Texterkennung durch Abscannen dessen eGK, manuelle Eingabe, durch Übernahme aus einer lokalen Vertreterliste oder auch durch die Übernahme aus einer vorherigen Kommunikation erfolgen.

Die Textnachricht ist optional. Der Textnachricht muss der Präfix "&lt;Absendername&gt; schreibt: " vorangestellt werden.

<!-- A_20237-01 -->
<requirement conformance="SHALL" key="" title="Nachricht senden - Vertreterkommunikation - Nachricht erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Vertreterkommunikation" eine FHIR Ressource Communication des Profils https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Representative mit
    <ul>
        <li>KVNR des Vertreters in recipient</li>
        <li>optional: Textnachricht in payload contentString</li>
        <li>E-Rezept-Token in basedOn reference auf Task inkl. AccessCode als "/Task/&lt;id&gt;?ac=..."</li>
    </ul>
    erstellen.
</requirement>

<!-- A_20238-01 -->
<requirement conformance="SHALL" key="" title="Nachricht senden - Vertreterkommunikation - Nachricht auf E-Rezept-Fachdienst einstellen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Vertreterkommunikation" zur Übergabe des Tokens an den Vertreter die HTTP-Operation POST /Communication mit
    <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
        <li>Communication Ressource in HTTP-Request-Body</li>
    </ul>
    ausführen.
</requirement>

### Nachricht löschen

Das E-Rezept-FdV MUSS im Anwendungsfall "Nachricht löschen" es dem Nutzer ermöglichen, eine Nachricht zum Löschen auf dem E-Rezept-Fachdienst auszuwählen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Nachricht löschen" vom Nutzer eine Bestätigung einholen, dass die selektierte Nachricht gelöscht werden sollen und die Möglichkeit geben, das Löschen abzubrechen.

<!-- A_21526-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-48" title="E-Rezept-FdV: Nachricht löschen - Löschrequest" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Nachrichten löschen" für die zu löschende Nachricht die HTTP-Operation DELETE /Communication/&lt;id&gt; des E-Rezept-Fachdienstes mit
    <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
        <li>Communication-ID in URL &lt;id&gt;</li> 
    </ul>
    ausführen.
</requirement>
