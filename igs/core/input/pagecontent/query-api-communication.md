
### Nachricht

Die Interaktion mit Nachrichten als FHIR-Ressource _Communication_ wird über die folgenden HTTP-Methoden ermöglicht:

|HTTP-Methode|Ergebnis der Anfrage|
|---|---|
|GET|Nachrichten abrufen|
|POST|Nachricht einstellen|
|DELETE|Nachricht löschen|

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu Communications](./query-api-communication-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zu Communications](./query-api-communication-req-fdv.html): Anforderungen an ein E-Rezept-FdV zur Nutzung der Schnittstelle.
- [AVS-Anforderungen zu Communications](./query-api-communication-req-avs.html): Anforderungen an ein Apothekenverwaltungssystem zur Nutzung der Schnittstelle.
- [KTR-Anforderungen zu Communications](./query-api-communication-req-ktr.html): Anforderungen an ein Clientsystem des Kostenträgers zur Nutzung der Schnittstelle.


### Resource API

Anfragen an die <i>Communication</i>-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden. Dabei können spezifische Suchparameter genutzt werden, um die Anfragen zu verfeinern. Zum Beispiel:

- Für den Versicherten noch nicht vom E-Rezept-Fachdienst abgerufene Communications: `?recipient=<kvnr>&received=NULL`

#### API Beschreibung

- [API-ERP: Communications](https://github.com/gematik/api-erp/blob/master/docs/erp_communication.adoc)

#### Hinweis

- Bei Bereitstellung von Communications werden angehangene JSONs in content.payload ebenfalls validiert.


<!-- A_23877 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-353" title="E-Rezept-Fachdienst: Nachrichtenaustausch - Nachricht durch Abgebenden übermitteln - Datenstruktur Nachricht" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS für den Anwendungsfall "Nachricht durch Abgebenden übermitteln" Nachrichten mit der folgenden Datenstruktur in der contentString-Eigenschaft des GEM_ERP_PR_Communication_Reply unterstützen.
     
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
