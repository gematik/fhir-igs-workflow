Diese Seite beschreibt Anforderungen an das AVS zur Nutzung der `Communication`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

{% include core.query-api-communication-req-avs.md %}

### Modulspezifische Anforderungen

#### Nachrichten abrufen

<!-- A_23876-01 -->
<requirement conformance="SHALL" title="PS abgebende LEI: Nachrichtenaustausch - E-Rezept einer Apotheke zuweisen - Datenstruktur Nachricht" version="0">
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
