Diese Seite beschreibt Anforderungen an Clients zur Nutzung der `Communication`-Query-Endpunkte.


### Nachrichten abrufen

<!-- A_21556 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-107" title="PS abgebende LEI: Nachrichten abrufen - Häufigkeit" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS im Anwendungsfall "Nachrichten von Versicherten empfangen" zwischen den Aufrufen der Operation GET /Communication mindestens 5 Minuten warten. Der Zeitraum zwischen den Aufrufen muss um eine zufällige Zeitspanne zwischen 0 und 10.000 Millisekunden verlängert werden, um eine Gleichverteilung der Anfragen am E-Rezept-Fachdienst über alle Apotheken zu erreichen.
</requirement>

<!-- A_19329-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-108" title="PS abgebende LEI: Nachrichten abrufen - Abfrage" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS im Anwendungsfall "Nachrichten von Versicherten empfangen" die HTTP-Operation GET /Communication mit
  <ul>
    <li>ACCESS_TOKEN im Authorization-Header</li>
    <li>optional: ?received=null für nur ungelesene Nachrichten</li>
    <li>optional: ?received=gtYYYY-MM-DD für Nachrichten nach Datum DD.MM.YYYY</li>
  </ul>
  ausführen.
</requirement>

Falls eine oder mehrere E-Rezept-Nachrichten für die abgebende LEI auf dem E-Rezept-Fachdienst bereitstehen, übermittelt der E-Rezept-Fachdienst ein Bundle von Communication Ressourcen. 

<!-- A_23876-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-356" title="PS abgebende LEI: Nachrichtenaustausch - E-Rezept einer Apotheke zuweisen - Datenstruktur Nachricht" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS der abgebenden LEI MUSS für den Anwendungsfall "E-Rezept einer Apotheke zuweisen" Nachrichten mit der Datenstruktur gemäß der Tabelle in der contentString-Eigenschaft des GEM_ERP_PR_Communication_DispReq-Profils unterstützen. 
     
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
      <td>order, text</td>
      <td>order</td>
    </tr>
    <tr>
      <td>supplyOptionsType</td>
      <td>Falls communicationType = order: ja<br>Falls communicationType = text: verboten</td>
      <td>Wird gemäß des Servicerequests gesetzt, den der Nutzer wählt. Die für den Nutzer verfügbaren Services sind für die jeweilige Apotheke im FHIR-VZD hinterlegt.</td>
      <td>onPremise, shipment, delivery</td>
      <td>onPremise</td>
    </tr>
    <tr>
      <td>firstname</td>
      <td>Falls communicationType = order und supplyOptionsType = delivery oder shipment: ja<br>Ansonsten: nein</td>
      <td>Vorname des Versicherten bzw. Lieferungsempfänger</td>
      <td>45 Stellen</td>
      <td>Maximilian</td>
    </tr>
    <tr>
      <td>lastname</td>
      <td>Falls communicationType = order und supplyOptionsType = delivery oder shipment: ja<br>Ansonsten: nein</td>
      <td>Name des Versicherten bzw. Lieferungsempfänger.</td>
      <td>45 Stellen</td>
      <td>Dr. von Muster</td>
    </tr>
    <tr>
      <td>address</td>
      <td>Falls communicationType = order und supplyOptionsType = delivery oder shipment: ja<br>Ansonsten: nein</td>
      <td>Strasse und Hausnummer des Versicherten bzw. Lieferungsempfänger</td>
      <td>3-100 Stellen</td>
      <td>Bundesallee 312</td>
    </tr>
    <tr>
      <td>postcode</td>
      <td>Falls communicationType = order und supplyOptionsType = delivery oder shipment: ja<br>Ansonsten: nein</td>
      <td>PLZ des Versicherten bzw. Lieferungsempfänger</td>
      <td>3-10 Stellen</td>
      <td>12345</td>
    </tr>
    <tr>
      <td>city</td>
      <td>Falls communicationType = order und supplyOptionsType = delivery oder shipment: ja<br>Ansonsten: nein</td>
      <td>Ort des Versicherten bzw. Lieferungsempfänger</td>
      <td>2-100 Stellen</td>
      <td>Berlin</td>
    </tr>
    <tr>
      <td>country</td>
      <td>Falls communicationType = order und supplyOptionsType = delivery oder shipment: ja<br>Ansonsten: nein</td>
      <td>Land des Versicherten bzw. Lieferungsempfänger</td>
      <td>ISO 3166-1 Alpha-2 Code</td>
      <td>DE</td>
    </tr>
    <tr>
      <td>hint</td>
      <td>Falls communicationType = text: verboten<br>Ansonsten: nein</td>
      <td>Lieferanweisung, die der Nutzer mit angeben kann.</td>
      <td>0-100 Stellen</td>
      <td>Bitte im Morsecode klingeln: -.-.</td>
    </tr>
    <tr>
      <td>text</td>
      <td>Falls communicationType = text: ja<br>Ansonsten: nein</td>
      <td>Zusätzliche Anmerkungen des Nutzers zur Bestellung.</td>
      <td>0-800 Stellen, keine URL</td>
      <td></td>
    </tr>
    <tr>
      <td>phone</td>
      <td>Falls communicationType = order: ja<br>Ansonsten: nein</td>
      <td>Telefonnummer. E-164 Format, jedoch anstelle des „+" mit „00" / rein nummerisch.</td>
      <td>32 Stellen</td>
      <td>004916094858168</td>
    </tr>
    <tr>
      <td>email</td>
      <td>nein</td>
      <td>E-Mail-Adresse des Nutzers. Format mit @ und Punkt.</td>
      <td>0-70 Stellen, RFC-5322-konforme E-Mail-Adresse</td>
      <td>max@musterfrau.de</td>
    </tr>
    <tr>
      <td>transactionID</td>
      <td>ja</td>
      <td>Dient dazu, Nachrichten einer Transaktion zuordnen zu können.</td>
      <td>36 Stellen, UUID</td>
      <td>8196b610-9b77-47ab-936e-362cd92ef2aa</td>
    </tr>
  </tbody>
</table>
<div><figcaption><strong>Tabelle: </strong>E-Rezept einer Apotheke zuweisen</figcaption></div>
</requiremen>

### Nachricht versenden

Die für die Nachricht zu verwendende Communication-Ressource wird modul- und anwendungsfall-spezifisch festgelegt.

<!-- A_19334 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-109" title="PS abgebende LEI: Nachricht versenden - Nachricht auf Fachdienst einstellen" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS im Anwendungsfall "Nachricht an Versicherten versenden" die HTTP-Operation POST /Communication mit
  <ul>
    <li>ACCESS_TOKEN im Authorization-Header</li>
    <li>Communication Ressource im HTTP-Request-Body</li>
  </ul>
  ausführen.
</requirement>

<!-- A_23877-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-357" title="PS abgebende LEI: Nachrichtenaustausch - Nachricht durch Abgebenden übermitteln - Datenstruktur Nachricht" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das PS abgebende LEI MUSS für den Anwendungsfall "Nachricht durch Abgebenden übermitteln" Nachrichten mit der folgenden Datenstruktur in der contentString-Eigenschaft des GEM_ERP_PR_Communication_Reply unterstützen.
     
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

### Nachricht löschen

Mit diesem Anwendungsfall kann die abgebende LEI von ihr versendete Nachrichten an einen Versicherten auf dem Fachdienst löschen.

Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, eine Nachricht zum
Löschen auf dem Fachdienst auszuwählen.

Das PS der abgebenden LEI MUSS vom Nutzer eine Bestätigung einholen, dass die
ausgewählte Nachricht gelöscht werden soll, und die Möglichkeit geben, das
Löschen abzubrechen.

<!-- A_21489 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-110" title="PS abgebende LEI: Nachricht löschen - Löschrequest" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS im Anwendungsfall "Nachricht durch Abgebenden löschen" für die zu löschende Nachricht die HTTP-Operation DELETE /Communication/&lt;id&gt; mit
  <ul>
    <li>ACCESS_TOKEN im Authorization-Header</li>
    <li>Communication-ID in URL &lt;id&gt; </li>
  </ul>
  ausführen.
</requirement>

Der Fachdienst prüft anhand der Telematik-ID im ACCESS_TOKEN, ob die LEI der Absender der zu löschenden Nachricht ist.

Das PS der abgebenden LEI KANN im Anwendungsfall "Nachricht durch Abgebenden
löschen" dem Nutzer ermöglichen, die Nachricht auch lokal im PS zu löschen.

Hinweis: Nachrichten an Versicherte sind immer an den Workflow des referenzierten E-Rezeptes gebunden. Wenn ein E-Rezept-Workflow, bspw. durch den Versicherten oder aufgrund von durch den Fachdienst durchgesetzte Löschfristen, auf dem Fachdienst gelöscht wird, dann werden auch alle zugehörigen Nachrichten gelöscht.