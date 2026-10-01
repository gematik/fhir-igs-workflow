Die Rolle "Fachdienst", die in [gemF_PushNotification] beschrieben wird, wird durch ZETA Guard übernommen. Der TI-Flow-Fachdienst verwendet die Schnittstelle von ZETA Guard als "Resource Server", wie in [OpenAPI_NotificationService] beschrieben, um den Nachrichteninhalt an die FdVs zu senden. ZETA Guard prüft, ob für den Versicherten aktive Pusher Registrierungen vorhanden sind, und führt den Prozess nur dann weiter aus, wenn eine Registrierung existiert und der entsprechende Channel aktiv ist. 

Darüber hinaus stellt ZETA Guard einen weiteren Endpunkt zur Verfügung, über den der TI-Flow-Fachdienst prüfen kann, welche Channels für den Versicherten aktiv sind und ob eine Registrierung vorhanden ist. Dieser Endpunkt kann zur Optimierung des Prozesses verwendet werden.

### Implementierung für die FdVs
Die Funktionalität zu Push Notification für FdVs ist anwendungsübergreifend in [gemF_PushNotification] beschrieben.

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A493" title="TI-Flow-FdV: Push Notifications - ZETA Client" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FdV" description="TI-Flow-Frontend des Versicherten">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
     Das TI-Flow-FdV MUSS, wenn es den Anwendungsfall "Push Notifications" umsetzt, für die Registrierung und Verwaltung der FdV-Instanzen sowie der Channels die Funktionalität des ZETA Clients verwenden.
</requirement>

### Push Notification senden

Der TI-Flow-Fachdienst erstellt ein NotificationRequest-Objekt wie in [OpenAPI_NotificationService] beschrieben. Der Nachrichteninhalt, auf den in diesem Kapitel verwiesen wird, ist der Inhalt des Payloads. Der Nachrichteninhalt wird in den modulspezifischen IGs beschrieben und festgelegt.

<!-- TI-Flow-26-2 PKV-FD-09 -->
Die Übermittlung von Notification-Objekten an den Notification Service wird über einen asynchronen Prozess realisiert. Dies hat die Konsequenz, dass es bei der Übermittlung der Daten an den Notification Service zu Verzögerungen kommen kann. Dadurch kann sich auch die Zustellung und somit der Empfang der Push Notifications beim Versicherten verzögern.

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A494" title="TI-Flow-Fachdienst - Push Notification senden - Aufruf Notification Service" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Auftreten eines Triggers für Push Notifications den Nachrichteninhalt erstellen und den Notification Service unter Verwendung der [OpenAPI_NotificationService] aufrufen.
</requirement>

<!-- A_28135-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A227" title="TI-Flow-Fachdienst - Push Notification senden - Referenz auf Protokolleintrag" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Erstellen einer Push Notifcation das Reference-Feld des äußeren NotificationRequest-Objekts (notificationRequest.reference) in Abhängigkeit von der ChannelId wie folgt befüllen:
     <table>
     <tr>
        <th>ChannelId</th>
        <th>Identifier.Feld</th>
     </tr>
     <tr>
        <td>tiflow.communication.new</td>
        <td>Identifier des zugehörigen Communication (Communication.id)</td>
     </tr>
     <tr>
        <td>ungleich tiflow.communication.new</td>
        <td>Identifier des zugehörigen Protokolleintrags (AuditEvent.id)</td>
     </tr>
     </table>
</requirement>

### Push Notification Datenstruktur

<!-- A_28124 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A228" title="TI-Flow-Fachdienst - Push Notifications - Datenstruktur Nachrichteninhalte" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="TI-Flow_FdV" description="TI-Flow-Frontend des Versicherten">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Der TI-Flow-Fachdienst und das TI-Flow-FdV MÜSSEN für den Anwendungsfall "Push Notifications" Nachrichteninhalte mit der folgenden Datenstruktur im JSON Format unterstützen:

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
<td>ChannelId</td>
<td>ja</td>
<td>Der Trigger, der die Push Notification initiiert hat.</td>
<td>bis zu 30 Stellen, UTF-8</td>
<td>tiflow.communication.new</td>
</tr>
<tr>
<td>Identifier</td>
<td>ja</td>
<td>Ein Identifier, der als Kontext zur Nachricht dient.</td>
<td>bis zu 50 Stellen, UTF-8</td>
<td>160.000.000.000.123.76</td>
</tr>
<tr>
<td>IdentifierType</td>
<td>ja</td>
<td>Der Art Identifier, der mitgeschickt wird.</td>
<td>bis zu 20 Stellen, UTF-8</td>
<td>TaskId</td>
</tr>
<tr>
<td>Product</td>
<td>ja</td>
<td>Der Name des verordneten bzw. abgegebenen Produkts (Medikament oder DiGA).</td>
<td>bis zu 100 Stellen, UTF-8</td>
<td>Sumatriptan-1a Pharma 100 mg Tabletten</td>
</tr>
<tr>
<td>ActorName</td>
<td>ja</td>
<td>Der Name des Akteurs. Das kann zum Beispiel der Name der Apotheke oder des Kostenträgers sein.</td>
<td>bis zu 100 Stellen, UTF-8</td>
<td>Meine Apotheke</td>
</tr>
<tr>
<td>Message</td>
<td>nein</td>
<td>Die Nachricht, die an den Versicherten verschickt wird.<br>Nachrichten mit mehr als 240 Zeichen müssen nach 237 Zeichen abgeschnitten und mit drei Punkten (...) ergänzt werden.</td>
<td>bis zu 240 Stellen, UTF-8</td>
<td>Wir möchten Sie informieren, dass Ihre bestellten Medikamente zur Abholung bereitstehen.</td>
</tr>
</tbody>
</table>

<div><figcaption><strong>Tabelle: </strong>TAB_eRp_DM_004 Push Notification Datenstruktur Nachrichteninhalte</figcaption></div>
</requirement>