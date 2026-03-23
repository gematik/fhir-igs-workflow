Diese Seite beschreibt Anforderungen an das Datenmodell für den payload der `Communication`-Ressource.

#### E-Rezept einer Apotheke zuweisen

<!-- A_23876-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-69" title="E-Rezept-FdV: Nachrichtenaustausch - E-Rezept einer Apotheke zuweisen - Datenstruktur Nachricht" version="0">
    <meta lockversion="true"/>
    <actor name="eRp_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der TI-Flow-Fachdienst, das E-Rezept-FdV und das PS der abgebenden LEI MÜSSEN für den Anwendungsfall "E-Rezept einer Apotheke zuweisen" Nachrichten mit der Datenstruktur gemäß der Tabelle in der contentString-Eigenschaft des GEM_ERP_PR_Communication_DispReq-Profils unterstützen. 
     
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
<div><figcaption><strong>Tabelle: </strong>TAB_eRpDM_002 E-Rezept einer Apotheke zuweisen</figcaption></div>
</requirement>

Ein JSON-Schema zur Validierung ist unter [Comm_DispReq_JSON_Schema] zu finden.
<!-- ToDo: Link auflösen -->

<table>
  <tr>
    <th>Nachrichtentyp (communicationType)</th>
    <th>Beschreibung</th>
  </tr>
  <tr>
    <td>order</td>
    <td>Zuweisen eines E-Rezepts</td>
  </tr>
  <tr>
    <td>text</td>
    <td>Antwort auf eine Nachricht der Apotheke</td>
  </tr>
</table>


#### Nachricht durch Abgebenden übermitteln

<!-- A_23877-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-70" title="PS abgebende LEI: Nachrichtenaustausch - Nachricht durch Abgebenden übermitteln - Datenstruktur Nachricht" version="0">
    <meta lockversion="true"/>
    <actor name="eRp_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Der TI-Flow-Fachdienst, das E-Rezept-FdV und das PS der abgebenden LEI MÜSSEN für den Anwendungsfall "Nachricht durch Abgebenden übermitteln" Nachrichten mit der folgenden Datenstruktur in der contentString-Eigenschaft des GEM_ERP_PR_Communication_Reply unterstützen.
     
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
  
<div><figcaption><strong>Tabelle: </strong>TAB_eRpDM_003 Nachricht als Apotheke an einen Versicherten schicken</figcaption></div>
     
</requirement>

<table>
  <tr>
    <th>Nachrichtentyp (communicationType)</th>
    <th>Beschreibung</th>
  </tr>
  <tr>
    <td>text</td>
    <td>Übermittlung einer Freitext-Nachricht</td>
  </tr>
  <tr>
    <td>link</td>
    <td>Übermittlung einer URL zum Vorgang</td>
  </tr>
  <tr>
    <td>reservationStatus</td>
    <td>Übermittlung des Reservierungsstatus</td>
  </tr>
  <tr>
    <td>pickupCodeHR</td>
    <td>Übermittlung eines menschenlesbares Abholcodes</td>
  </tr>
  <tr>
    <td>pickupCodeDMC</td>
    <td>Übermittlung eines maschinenlesbaren Abholcodes</td>
  </tr>
  <tr>
    <td>deliveryStatus</td>
    <td>Übermittlung des Lieferstatus</td>
  </tr>
  <tr>
    <td>paymentInfo</td>
    <td>Übermittlung eines Hinweises zum zu zahlenden Betrags</td>
  </tr>
</table>