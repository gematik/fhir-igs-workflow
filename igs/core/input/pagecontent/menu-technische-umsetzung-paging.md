Für Endpunkte, die eine Menge an FHIR-Objekten abfragen gelten einheitliche Vorgaben dazu, wie die Elemente in einem FHIR-Bundle aufbereitet werden können.

Zu unterscheiden sind drei verschiedene Mechanismen: Sortierung, Filterung und Pagination. Die angefragten Funktionen sind jeweils auf einen Konkreten Endpunkt anzuwenden. Es ist möglich diese Funktionen miteinander zu kombinieren, sodass z.B. eine Anfrage sortiert und gefiltert wird.

<!-- A_24434 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-364" title="TI-Flow-Fachdienst - Handhabung der Rückgabe von mehreren FHIR-Objekten - Betroffene Endpunkte" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS das Konzept zur Handhabung der Rückgabe von mehreren FHIR-Objekten auf folgende Endpunkte anwenden: Tabelle #: TAB_eRPFD_021 Endpunkte des TI-Flow-Fachdienst, die das Konzept zur Handhabung der Rückgabe von mehreren FHIR-Objekten bereitstellen müssen 
     
     <table>
<thead>
<tr>
<th>Endpunkt</th>
<th>Client</th>
<th>Inhalt der Response</th>
</tr>
</thead>
<tbody>
<tr>
<td>GET /Task</td>
<td>Versicherte, Abgebende LEI</td>
<td>Liste von verfügbaren Tasks im TI-Flow-Fachdienst</td>
</tr>
<tr>
<td>GET /Communication</td>
<td>Versicherte, Abgebende LEI</td>
<td>Liste von verfügbaren Communications</td>
</tr>
<tr>
<td>GET /MedicationDispense</td>
<td>Versicherte</td>
<td>Liste von eingestellten MedicationDispenses von Verordnungen</td>
</tr>
<tr>
<td>GET /ChargeItem</td>
<td>Versicherte</td>
<td>Liste von Abrechnungsinformationen von Verordnungen</td>
</tr>
<tr>
<td>GET /AuditEvent</td>
<td>Versicherte</td>
<td>Liste von Protokolleinträgen des Versicherten</td>
</tr>
</tbody>
</table>

<div><figcaption><strong>Tabelle: </strong>Endpunkte des TI-Flow-Fachdienst, die das Konzept zur Handhabung der Rückgabe von mehreren FHIR-Objekten bereitstellen müssen</figcaption></div>
</requirement>

### Sortieren und Filtern von FHIR-Objekten

Clients erhalten die Möglichkeit die Rückgabe der Elemente im FHIR-Bundle zu sortieren und zu filtern. Mit einem URL-Parameter "_sort" kann eine Sortierung der Ressourcen angefragt werden. Die Angabe eines Filterkriteriums als URL-Parameter schränkt die Ergebnismenge auf die angegebenen Kriterien ein.

Für jeden dieser Ressourcen gelten dann Kriterien, nach denen sortiert und gefiltert werden kann.

<!-- A_24436-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-365" title="TI-Flow-Fachdienst - Handhabung der Rückgabe von mehreren FHIR-Objekten - Filter- und Sortierkriterien" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS für die Sortierung bei der Handhabung der Rückgabe von mehreren FHIR-Objekten den FHIR-Suchparameter "_sort" unterstützen und für die folgenden Ressourcen entsprechende Such- und Sortierkriterien bereitstellen:
     
<table>
<thead>
<tr>
<th>Endpunkt</th>
<th>Suchkriterien</th>
<th>Sortierbar</th>
<th>Auszuwertendes Feld</th>
<th>Datentyp</th>
</tr>
</thead>
<tbody>

<tr>
<td rowspan="5">GET /Task</td>
<td>authored-on</td>
<td>Ja (default)</td>
<td>Task.authoredOn</td>
<td>date</td>
</tr>
<tr>
<td>status</td>
<td>Nein</td>
<td>Task.status</td>
<td>token</td>
</tr>
<tr>
<td>expiry-date</td>
<td>Ja</td>
<td>Task.extension:expiryDate.valueDate</td>
<td>date</td>
</tr>
<tr>
<td>accept-date</td>
<td>Ja</td>
<td>Task.extension:acceptDate.valueDate</td>
<td>date</td>
</tr>
<tr>
<td>modified</td>
<td>Ja</td>
<td>Task.lastModified</td>
<td>date</td>
</tr>

<tr>
<td rowspan="2">GET /AuditEvent</td>
<td>date</td>
<td>Ja (default)</td>
<td>AuditEvent.recorded</td>
<td>date</td>
</tr>
<tr>
<td>entity</td>
<td>Nein</td>
<td>AuditEvent.entity.what.identifier.value</td>
<td>string</td>
</tr>

<tr>
<td rowspan="4">GET /Communication</td>
<td>sent</td>
<td>Ja (default)</td>
<td>Communication.sent</td>
<td>date</td>
</tr>
<tr>
<td>received</td>
<td>Ja</td>
<td>Communication.received</td>
<td>date</td>
</tr>
<tr>
<td>recipient</td>
<td>Nein</td>
<td>Communication.recipient.identifier.value</td>
<td>string</td>
</tr>
<tr>
<td>sender</td>
<td>Nein</td>
<td>Communication.sender.identifier.value</td>
<td>string</td>
</tr>

<tr>
<td rowspan="3">GET /MedicationDispense</td>
<td>whenhandedover</td>
<td>Ja (default)</td>
<td>MedicationDispense.whenHandedOver</td>
<td>date</td>
</tr>
<tr>
<td>whenprepared</td>
<td>Ja</td>
<td>MedicationDispense.whenPrepared</td>
<td>date</td>
</tr>
<tr>
<td>performer</td>
<td>Nein</td>
<td>MedicationDispense.performer.actor.identifier.value</td>
<td>string</td>
</tr>

<tr>
<td rowspan="2">GET /ChargeItem</td>
<td>entered-date</td>
<td>Ja (default)</td>
<td>ChargeItem.enteredDate</td>
<td>date</td>
</tr>
<tr>
<td>_lastUpdated</td>
<td></td>
<td>ChargeItem.meta.lastUpdated</td>
<td>date</td>
</tr>

</tbody>
</table>

<div><figcaption><strong>Tabelle: </strong>Filter- und Sortierkriterien der Endpunkte für die Handhabung der Rückgabe von mehreren FHIR-Objekten</figcaption></div>
</requirement>

Hinweis:  für die Handhabung mit den FHIR-Datentypen zu Suche und Sortierung siehe https://hl7.org/fhir/R4/search.html#Summary 

Hinweis: Standard Such- und Sortierparametern in FHIR ist ein "_" vorangestellt werden. Der Aufruf sieht dann bspw. so aus: GET `[base]/ChargeItem?_lastUpdated=le2023-10-01&_sort=-_lastUpdated`

Es können mehrere Sortierkriterien angegeben werden. Bei der Sortierung sortiert der TI-Flow-Fachdienst dann zuerst nach dem ersten, dann zweiten, usw. Kriterium.

<!-- A_24437 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-366" title="TI-Flow-Fachdienst - Handhabung der Rückgabe von mehreren FHIR-Objekten - Sortieren von Einträgen" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS bei der Handhabung der Rückgabe von mehreren FHIR-Objekten die Sortierung nach mehreren Kriterien ermöglichen, indem entsprechend der Reihenfolge der angegebenen Kriterien sortiert wird.
</requirement>

<!-- A_24438 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-367" title="TI-Flow-Fachdienst - Handhabung der Rückgabe von mehreren FHIR-Objekten - Sortieren von Einträgen" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS für die Sortierung bei der Handhabung der Rückgabe von mehreren FHIR-Objekten folgende Ressourcen nach folgenden Kriterien aufsteigend sortieren, wenn der Client keine Sortierung im Request angefragt hat: 
     
     <table>
<thead>
<tr>
<th>Endpunkt</th>
<th>Default Sortierparameter</th>
</tr>
</thead>
<tbody>
<tr>
<td>GET /Task</td>
<td>authored-on</td>
</tr>
<tr>
<td>GET /Communication</td>
<td>sent</td>
</tr>
<tr>
<td>GET /MedicationDispense</td>
<td>whenhandedover</td>
</tr>
<tr>
<td>GET /ChargeItem</td>
<td>entered-date</td>
</tr>
<tr>
<td>GET /AuditEvent</td>
<td>date</td>
</tr>
</tbody>
</table>

<div><figcaption><strong>Tabelle: </strong>Default Sortierparameter für die Handhabung der Rückgabe von mehreren FHIR-Objekten</figcaption></div>
</requirement>

Standardmäßig werden die Einträge aufsteigend sortiert. Wenn diese Reihenfolge umgekehrt werden soll, kann ein "-" vor das Sortierkriterium gestellt werden.

<!-- A_24440 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-368" title="TI-Flow-Fachdienst - Handhabung der Rückgabe von mehreren FHIR-Objekten - Sortierreihenfolge der Einträge" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS bei der Handhabung der Rückgabe von mehreren FHIR-Objekten die Sortierreihenfolge umkehren, wenn der Client das Präfix "-" am Sortierkriterium angibt.
</requirement>

Clients können am TI-Flow-Fachdienst Anfragen stellen, dessen Ergebnismenge nach bestimmten Kriterien reduziert (gefiltert) werden soll.

Für den Datentyp "date" sollen folgende Filterkriterien als URL-Parameter unterstützt werden:

<!-- A_25515 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-369" title="TI-Flow-Fachdienst - Handhabung der Rückgabe von mehreren FHIR-Objekten - Filteroperatoren für Datumsabfragen" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS bei der Handhabung der Rückgabe von mehreren FHIR-Objekten folgende Filteroperatoren für Suchkriterien anbieten, deren Datentyp "date" ist: 
     
<table>
<thead>
<tr>
<th>Operator</th>
<th>Übersetzung</th>
<th>Bedeutung</th>
</tr>
</thead>
<tbody>
<tr>
<td>eq</td>
<td>equals</td>
<td>ist gleich (=)</td>
</tr>
<tr>
<td>ne</td>
<td>not equals</td>
<td>ist nicht gleich (!=)</td>
</tr>
<tr>
<td>gt</td>
<td>greater than</td>
<td>größer als (&gt;)</td>
</tr>
<tr>
<td>lt</td>
<td>less than</td>
<td>kleiner als (&lt;)</td>
</tr>
<tr>
<td>ge</td>
<td>greater equals</td>
<td>größer gleich (&gt;=)</td>
</tr>
<tr>
<td>le</td>
<td>less equals</td>
<td>kleiner gleich (&lt;=)</td>
</tr>
</tbody>
</table>

<div><figcaption><strong>Tabelle: </strong>Filteroperatoren für Datumsabfragen</figcaption></div>
</requirement>

### Paginierung von FHIR-Objekten

Ziel der Paginierung ist es, eine Ausgabe von mehreren Instanzen in Seiten zu unterteilen, damit der Datenverkehr je Aufruf minimiert wird und der Client dem Nutzer schneller Informationen darstellen kann.

Der Client kann unter Angabe der Einträge je Seite und dem Index des Elements an dem die Anzeige zu beginnenden soll steuern, welche 'Seite' dem Client zu übermitteln ist.

Mit "_count" kann der Client angeben, wie viele Elemente maximal auf einer "Seite" der Antwort enthalten sein sollen. D.h. der TI-Flow-Fachdienst beschränkt die Ergebnismenge auf diese maximal angegebene Anzahl. 

Der URL-Parameter "__offset" gibt den nullbasierten Versatz des ersten zurückgegebenen Elements in der Sammlung an.

Der TI-Flow-Fachdienst gibt immer die Gesamtanzahl der Suchtreffer zurück. Diese Information wird im Feld "Bundle.total" des FHIR-Bundles angegeben.

Zusätzlich zur Rückgabe der Elemente bietet der TI-Flow-Fachdienst dem Client Link-Relations nach http://www.iana.org/assignments/link-relations/link-relations.xhtml#link-relations-1 an, damit der Client einfacher durch die Ergebnismenge navigieren kann.

Falls die Link Relations nicht zu plausiblen Ergebnissen führen (z.B. wenn es keine vorherige Seite gibt, kann keine "prev" Seite angegeben werden), dann darf diese Link Relation nicht übermittelt werden.

Neben Angaben zur Paginierung übermittelt der Client auch Angaben zur Filterung und Sortierung, diese müssen bei der Erzeugung der Link Relations erhalten bleiben.

<!-- A_24441-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-370" title="TI-Flow-Fachdienst - Handhabung der Rückgabe von mehreren FHIR-Objekten - URL-Parameter für Paginierung" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS bei der Handhabung der Rückgabe von mehreren FHIR-Objekten die Paginierung nach FHIR ermöglichen und folgende URL-Parameter unterstützen: 
     
<table>
<thead>
<tr>
<th>URL-Parameter</th>
<th>Bedeutung und Funktion</th>
</tr>
</thead>
<tbody>
<tr>
<td>_count</td>
<td>Anzahl der Elemente (Bundle.entry) im Bundle. Maximum ist 50.</td>
</tr>
<tr>
<td>__offset</td>
<td>Nullbasierter Index der Ergebnismenge ab welchem die Elemente angezeigt werden. Default ist 0.</td>
</tr>
</tbody>
</table>

<div><figcaption><strong>Tabelle: </strong>Paginierungsparameter für die Handhabung der Rückgabe von mehreren FHIR-Objekten</figcaption></div>
</requirement>

<!-- A_24442-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-371" title="TI-Flow-Fachdienst - Handhabung der Rückgabe von mehreren FHIR-Objekten - Link Relations für Paginierung" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS bei der Handhabung der Rückgabe von mehreren FHIR-Objekten folgende Link Relations unter Bundle.link generieren, sofern diese erzeugt werden können: 
     
<table>
<thead>
<tr>
<th>URL-Parameter</th>
<th>Bedeutung und Funktion</th>
</tr>
</thead>
<tbody>
<tr>
<td>_count</td>
<td>Anzahl der Elemente (Bundle.entry) im Bundle. Maximum ist 50.</td>
</tr>
<tr>
<td>__offset</td>
<td>Nullbasierter Index der Ergebnismenge ab welchem die Elemente angezeigt werden. Default ist 0.</td>
</tr>
</tbody>
</table>

<div><figcaption><strong>Tabelle: </strong>Link Relations für die Handhabung der Rückgabe von mehreren FHIR-Objekten</figcaption></div>
</requirement>

<!-- A_24443-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-372" title="TI-Flow-Fachdienst - Handhabung der Rückgabe von mehreren FHIR-Objekten - Paginierung" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS bei der Handhabung der Rückgabe von mehreren FHIR-Objekten die Paginierung nach FHIR für folgende Endpunkte mit den jeweiligen Parametern unterstützen 
     
<table>
<thead>
<tr>
<th>Endpunkt</th>
<th>Paginierung</th>
<th>Total-Count</th>
<th>Link-Relations</th>
</tr>
</thead>
<tbody>
<tr>
<td>GET /Task</td>
<td>Ja</td>
<td>Ja</td>
<td>self, next, prev, first, last</td>
</tr>
<tr>
<td>GET /Communication</td>
<td>Ja</td>
<td>Ja</td>
<td>self, next, prev, first, last</td>
</tr>
<tr>
<td>GET /MedicationDispense</td>
<td>Nein</td>
<td>immer "0"</td>
<td>-</td>
</tr>
<tr>
<td>GET /ChargeItem</td>
<td>Ja</td>
<td>Ja</td>
<td>self, next, prev, first, last</td>
</tr>
<tr>
<td>GET /AuditEvent</td>
<td>Ja</td>
<td>immer "0"</td>
<td>self, next, first</td>
</tr>
</tbody>
</table>

<div><figcaption><strong>Tabelle: </strong>Endpunkte mit Paginierung</figcaption></div>
</requirement>

<!-- A_24444 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-373" title="TI-Flow-Fachdienst - Handhabung der Rückgabe von mehreren FHIR-Objekten - Erhalten von URL-Parametern" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS bei der Handhabung der Rückgabe von mehreren FHIR-Objekten und Generierung von URLs der Link Relations die vom Client angegebenen Filter- und Sortierkriterien verwerten und erhalten.
</requirement>
