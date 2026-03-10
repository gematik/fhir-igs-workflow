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
      <td>Gibt die Version des JSON an. Aktuell immer 1. Kann im weiteren Lebenszyklus verändert werden.</td>
      <td>nummerisch, bis zu 6 Stellen</td>
      <td>1</td>
    </tr>
    <tr>
      <td>supplyOptionsType</td>
      <td>ja</td>
      <td>Wird gemäß des Servicerequests gesetzt, den der Nutzer wählt. Die für den Nutzer zur Auswahl stehenden Services gibt die Apotheke vor, indem sie den servicespezifischen Zuweisungs-Endpunkt angibt, oder nicht.</td>
      <td>onPremise, shipment, delivery</td>
      <td>onPremise</td>
    </tr>
    <tr>
      <td>info_text</td>
      <td>nein</td>
      <td>Zusätzlicher Freitext des Versicherten an die Apotheke</td>
      <td>500 Stellen, UTF-8</td>
      <td>Wir möchten Sie informieren, dass Ihre bestellten Medikamente zur Abholung bereitstehen. Den Abholcode finden Sie anbei.</td>
    </tr>
    <tr>
      <td>url</td>
      <td>nein</td>
      <td>Einbettung einer externen URL ausschließlich für das Einlösen von E-Rezepten in einer externen Bestellplattform</td>
      <td>500 Stellen, URL gemäß RFC3986</td>
      <td>https://www.meine-apotheke.de/pickup/59b52340-7a6a-430d-99ea-45a8e5cd03f6</td>
    </tr>
    <tr>
      <td>pickUpCodeHR</td>
      <td>nein</td>
      <td>Menschenlesbarer Abholcode. Nur bei supplyOptionsType "onPremise". Wenn gesetzt, wird dem Nutzer der Inhalt des "pickUpCodeHR" optisch hervorgehoben angezeigt.</td>
      <td>8 Stellen, UTF-8</td>
      <td>12315615</td>
    </tr>
    <tr>
      <td>pickUpCodeDMC</td>
      <td>nein</td>
      <td>Maschinenlesbarer Abholcode (Data-Matrix-Code). Nur bei supplyOptionsType "onPremise". Wenn gesetzt, kann sich der Nutzer den Inhalt als Data-Matrix-Code anzeigen lassen. Der Inhalt wird gemäß ISO/IEC 16022:2006 von der App in einen DMC gewandelt. Fehlt die Interpretation, so wird der Code als Freitext angezeigt.</td>
      <td>128 Stellen, UTF-8</td>
      <td>5346a991-c5c6-49c8-b87b-4cdd255bbde4</td>
    </tr>
  </tbody>
</table>

<div><figcaption><strong>Tabelle: </strong>Nachricht als Apotheke an einen Versicherten schicken</figcaption></div>
     
</requirement>


### Nachricht versenden

Die für die Nachricht zu verwendende Communication-Ressource wird modul- und anwendungsfall-spezifisch festgelegt.

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

<!-- A_23876 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-355" title="E-Rezept-FdV: Nachrichtenaustausch - E-Rezept einer Apotheke zuweisen - Datenstruktur Nachricht" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das E-Rezept-FdV MUSS für den Anwendungsfall "E-Rezept einer Apotheke zuweisen" Nachrichten mit der Datenstruktur gemäß der Tabelle in der contentString-Eigenschaft des GEM_ERP_PR_Communication_DispReq-Profils unterstützen. 
     
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
      <td>Gibt die Version des JSON an. Aktuell immer 1. Kann im weiteren Lebenszyklus verändert werden.</td>
      <td>nummerisch, bis zu 6 Stellen</td>
      <td>1</td>
    </tr>
    <tr>
      <td>supplyOptionsType</td>
      <td>ja</td>
      <td>Wird gemäß des Servicerequests gesetzt, den der Nutzer wählt. Die für den Nutzer zur Auswahl stehenden Services gibt die Apotheke vor, indem sie den servicespezifischen Zuweisungs-Endpunkt angibt, oder nicht.</td>
      <td>onPremise, shipment, delivery</td>
      <td>onPremise</td>
    </tr>
    <tr>
      <td>name</td>
      <td>nein</td>
      <td>Name des Versicherten.</td>
      <td>100 Stellen, UTF-8</td>
      <td>Dr. Maximilian von Muster</td>
    </tr>
    <tr>
      <td>address</td>
      <td>nein</td>
      <td>String-Array der Zeilen einer Adresse. Sie ist im JSON in der korrekten Reihenfolge anzugeben und auch auszulesen. "onPremise": Adresse des Versicherten laut Rezept. "delivery"/"shipment": Adresse des Lieferungsempfängers – mindestens: Strasse+Hausnummer, PLZ+Ort werden gesetzt.</td>
      <td>Array von Strings je 500 Stellen UTF-8</td>
      <td><pre>"address": [
  "wohnhaft bei Emilia Fischer",
  "Bundesallee 312",
  "123. OG",
  "12345 Berlin"
]</pre></td>
    </tr>
    <tr>
      <td>hint</td>
      <td>nein</td>
      <td>Hinweis, den der Versicherte mit angeben kann.</td>
      <td>500 Stellen, UTF-8</td>
      <td>Bitte im Morsecode klingeln: -.-.</td>
    </tr>
    <tr>
      <td>phone</td>
      <td>nein</td>
      <td>Telefonnummer</td>
      <td>32 Stellen, UTF-8</td>
      <td>004916094858168</td>
    </tr>
  </tbody>
</table>
<div><figcaption><strong>Tabelle: </strong>E-Rezept einer Apotheke zuweisen</figcaption></div>
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
