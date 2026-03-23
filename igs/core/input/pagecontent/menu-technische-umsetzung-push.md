Die Funktionalität zu Push Notification für FdVs ist anwendungsübergreifend in [gemF_PushNotification] beschrieben.

Der TI-Flow-Fachdienst übernimmt die Rolle „Fachdienst“. Er verwaltet FdV-Instanzen, die sich bei ihm für den Empfang von Push Notifications registriert haben, erstellt Push Notifications für vom Nutzer abonnierte Ereignisse und übermittelt diese an das zuständige Push Gateway. Der TI-Flow-Fachdienst bietet Schnittstellen für das E-Rezept-FdV zur Registrierung, Deregistrierung und Konfiguration von Kanälen an.

### Push Notification senden

Der TI-Flow-Fachdienst erstellt ein Notification-Objekt für verschlüsselte Notifications wie in [OpenAPI_PushGateway] beschrieben. Der Nachrichteninhalt, auf den in diesem Kapitel verwiesen wird, ist der Inhalt des Ciphertexts.

<!-- A_28115 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-225" title="TI-Flow-Fachdienst - Push Notification senden - Nachrichteninhalt erzeugen" version="0">
    <meta lockversion="true"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS den Nachrichteninhalt einer Push Notification gemäß TAB_eRPFD_028 erzeugen.

<table>
<thead>
<tr>
<th>ChannelId</th>
<th>Identifier</th>
<th>IdentifierType</th>
<th>Product</th>
<th>ActorName</th>
<th>Message</th>
</tr>
</thead>
<tbody>

<tr>
<td>erp.task.activate</td>
<td>Task.identifier.PrescriptionID</td>
<td>TaskId</td>
<td>
Falls Task.flowType = "160","166","169","200","209": KBV_PR_ERP_Bundle.entry.[medicationName]<br>
Falls Task.flowType = "162": KBV_PR_EVDGA_Bundle.entry.DeviceRequest.codeCodeableConcept.text
</td>
<td>Lesbarer Name aus dem ACCESS_TOKEN des Ausführenden</td>
<td>POST /Task/&lt;id&gt;/$activate</td>
</tr>

<tr>
<td>erp.task.accept</td>
<td>Task.identifier.PrescriptionID</td>
<td>TaskId</td>
<td>
Falls Task.flowType = "160","166","169","200","209": KBV_PR_ERP_Bundle.entry.[medicationName]<br>
Falls Task.flowType = "162": KBV_PR_EVDGA_Bundle.entry.DeviceRequest.codeCodeableConcept.text
</td>
<td>Lesbarer Name aus dem ACCESS_TOKEN des Ausführenden</td>
<td>POST /Task/&lt;id&gt;/$accept</td>
</tr>

<tr>
<td>erp.task.reject</td>
<td>Task.identifier.PrescriptionID</td>
<td>TaskId</td>
<td>
Falls Task.flowType = "160","166","169","200","209": KBV_PR_ERP_Bundle.entry.[medicationName]<br>
Falls Task.flowType = "162": KBV_PR_EVDGA_Bundle.entry.DeviceRequest.codeCodeableConcept.text
</td>
<td>Lesbarer Name aus dem ACCESS_TOKEN des Ausführenden</td>
<td>POST /Task/&lt;id&gt;/$reject</td>
</tr>

<tr>
<td>erp.task.close</td>
<td>Task.identifier.PrescriptionID</td>
<td>TaskId</td>
<td>
Falls Task.flowType = "160","166","169","200","209": GEM_ERP_PR_PAR_CloseOperation_Input.parameter[rxDispensation].part[medication].[medicationName]<br>
Falls Task.flowType = "162": KBV_PR_EVDGA_Bundle.entry.DeviceRequest.codeCodeableConcept.text
</td>
<td>Lesbarer Name aus dem ACCESS_TOKEN des Ausführenden</td>
<td>POST /Task/&lt;id&gt;/$close</td>
</tr>

<tr>
<td>erp.task.dispense</td>
<td>Task.identifier.PrescriptionID</td>
<td>TaskId</td>
<td>
Falls Task.flowType = "160","166","169","200","209": GEM_ERP_PR_PAR_DispenseOperation_Input.parameter[rxDispensation].part[medication].[medicationName]<br>
Falls Task.flowType = "162": KBV_PR_EVDGA_Bundle.entry.DeviceRequest.codeCodeableConcept.text
</td>
<td>Lesbarer Name aus dem ACCESS_TOKEN des Ausführenden</td>
<td>POST /Task/&lt;id&gt;/$dispense</td>
</tr>

<tr>
<td>erp.task.abort</td>
<td>Task.identifier.PrescriptionID</td>
<td>TaskId</td>
<td>
Falls Task.flowType = "160","166","169","200","209": KBV_PR_ERP_Bundle.entry.[medicationName]<br>
Falls Task.flowType = "162": KBV_PR_EVDGA_Bundle.entry.DeviceRequest.codeCodeableConcept.text
</td>
<td>Lesbarer Name aus dem ACCESS_TOKEN des Ausführenden</td>
<td>POST /Task/&lt;id&gt;/$abort</td>
</tr>

<tr>
<td>erp.communication.new</td>
<td>Communication.basedOn.reference</td>
<td>TaskId</td>
<td>
Falls Communication.basedOn.reference.Task.flowType = "160","166","200": KBV_PR_ERP_Bundle.entry.[medicationName]<br>
Falls Communication.basedOn.reference.Task.flowType = "162": KBV_PR_EVDGA_Bundle.entry.DeviceRequest.codeCodeableConcept.text
</td>
<td>Lesbarer Name aus dem ACCESS_TOKEN des Ausführenden</td>
<td>
POST /Communication<br>
Falls Profil GEM_ERP_PR_Communication_Reply: Communication.payload.content.info_text<br>
Falls Profil GEM_ERP_PR_Communication_DiGA: Communication.payload.content
</td>
</tr>

<tr>
<td>erp.task.vertreter</td>
<td>Task.identifier.PrescriptionID</td>
<td>TaskId</td>
<td>
Falls Task.flowType = "160","166","200": KBV_PR_ERP_Bundle.entry.[medicationName]<br>
Falls Task.flowType = "162": KBV_PR_EVDGA_Bundle.entry.DeviceRequest.codeCodeableConcept.text
</td>
<td>Lesbarer Name aus dem ACCESS_TOKEN des Ausführenden</td>
<td>GET /Task/&lt;id&gt;</td>
</tr>

<tr>
<td>erp.chargeitem.create</td>
<td>ChargeItem.identifier.PrescriptionID</td>
<td>TaskId</td>
<td>ChargeItem.supportingInformation.KBV_PR_ERP_Bundle.entry.[medicationName]</td>
<td>Lesbarer Name aus dem ACCESS_TOKEN des Ausführenden</td>
<td>POST /ChargeItem</td>
</tr>

<tr>
<td>erp.chargeitem.update</td>
<td>ChargeItem.identifier.PrescriptionID</td>
<td>TaskId</td>
<td>ChargeItem.supportingInformation.KBV_PR_ERP_Bundle.entry.[medicationName]</td>
<td>Lesbarer Name aus dem ACCESS_TOKEN des Ausführenden</td>
<td>PUT /ChargeItem/&lt;id&gt;</td>
</tr>

<tr>
<td>erp.eu.prescription.get</td>
<td>Task.identifier.PrescriptionID</td>
<td>TaskId</td>
<td>KBV_PR_ERP_Bundle.entry.[medicationName]</td>
<td>GEM_ERPEU_PR_PAR_GET_Prescription_Input.parameter.part[practionerName].valueString</td>
<td>-</td>
</tr>

<tr>
<td>erp.eu.prescription.redeem</td>
<td>Task.identifier.PrescriptionID</td>
<td>TaskId</td>
<td>KBV_PR_ERP_Bundle.entry.[medicationName]</td>
<td>GEM_ERPEU_PR_PAR_GET_Prescription_Input.parameter.part[practionerName].valueString</td>
<td>-</td>
</tr>

<tr>
<td>erp.eu.prescription.close</td>
<td>Task.identifier.PrescriptionID</td>
<td>TaskId</td>
<td>GEM_ERPEU_PR_PAR_CloseOperation_Input.parameter[rxDispensation].[medication].[medicationName]</td>
<td>GEM_ERPEU_PR_PAR_CloseOperation_Input.parameter.part[practionerData].name.text</td>
<td>-</td>
</tr>

</tbody>
</table>
<div><figcaption><strong>Tabelle: </strong>TAB_eRPFD_028 Nachrichteninhalt Push Notification</figcaption></div>

<p>
<strong>Definition [medicationName]:</strong><br>
Falls medication dem Profil "KBV_PR_ERP_Medication_Ingredient" entspricht:<br>
`Medication.ingredient.item.itemCodeableConcept.text`<br>
Ansonsten:<br>
`Medication.code.text`
</p>



</requirement>

<!-- A_28116 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-226" title="TI-Flow-Fachdienst - Push Notification senden - verpflichtende Verschlüsselung" version="0">
    <meta lockversion="true"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS den Nachrichteninhalt einer Push Notification verschlüsseln.
</requirement>

Die Vorgaben für die Verschlüsselung sind in `A_27161-* - Fachdienst - Push Notification senden - Nachricht verschlüsseln` beschrieben.

<!-- A_28135 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-227" title="TI-Flow-Fachdienst - Push Notification senden - Referenz auf Protokolleintrag" version="0">
    <meta lockversion="true"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Erstellen einer Push Notification die Identifier des zugehörigen Protokolleintrags (AuditEvent.id) des Triggers im Identifier-Feld des äußeren Notification-Objekts (notification.identifier) angeben.
</requirement>

### Push Notification Datenstruktur

<!-- A_28124 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-228" title="E-Rezept - Push Notifications - Datenstruktur Nachrichteninhalte" version="0">
    <meta lockversion="true"/>
    <actor name="eRp_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Der TI-Flow-Fachdienst und das E-Rezept-FdV MÜSSEN für den Anwendungsfall "Push Notifications" Nachrichteninhalte mit der folgenden Datenstruktur im JSON Format unterstützen:

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
<td>erp.communication.new</td>
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
<td>Die Nachricht, die an den Versicherten verschickt wird.<br>Nachrichten mit mehr als 240 Zeichen müssen nach 237 Zeichen abgeschnitten und mit drei Punkten (…) ergänzt werden.</td>
<td>bis zu 240 Stellen, UTF-8</td>
<td>Wir möchten Sie informieren, dass Ihre bestellten Medikamente zur Abholung bereitstehen.</td>
</tr>
</tbody>
</table>

<div><figcaption><strong>Tabelle: </strong>TAB_eRp_DM_004 Push Notification Datenstruktur Nachrichteninhalte</figcaption></div>
</requirement>