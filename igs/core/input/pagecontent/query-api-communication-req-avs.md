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

<!-- A_23876 -->
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