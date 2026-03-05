Die Funktionalität zu Push Notification für FdVs ist anwendungsübergreifend in [gemF_PushNotification] beschrieben.

Der E-Rezept-Fachdienst übernimmt die Rolle „Fachdienst“. Er verwaltet FdV-Instanzen, die sich bei ihm für den Empfang von Push Notifications registriert haben, erstellt Push Notifications für vom Nutzer abonnierte Ereignisse und übermittelt diese an das zuständige Push Gateway. Der E-Rezept-Fachdienst bietet Schnittstellen für das E-Rezept-FdV zur Registrierung, Deregistrierung und Konfiguration von Kanälen an.

### Push Notification senden

Der E-Rezept-Fachdienst erstellt ein Notification-Objekt für verschlüsselte Notifications wie in [OpenAPI_PushGateway] beschrieben. Der Nachrichteninhalt, auf den in diesem Kapitel verwiesen wird, ist der Inhalt des Ciphertexts.

<!-- A_28115 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-530" title="E-Rezept-Fachdienst - Push Notification senden - Nachrichteninhalt erzeugen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS den Nachrichteninhalt einer Push Notification gemäß TAB_eRPFD_028 erzeugen.

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

<p>
<strong>Definition [medicationName]:</strong><br>
Falls medication dem Profil "KBV_PR_ERP_Medication_Ingredient" entspricht:<br>
`Medication.ingredient.item.itemCodeableConcept.text`<br><br>
Ansonsten:<br>
`Medication.code.text`
</p>

<div><figcaption><strong>Tabelle: </strong>Nachrichteninhalt Push Notification</figcaption></div>

</requirement>

Die Datenstruktur des Nachrichteninhalts ist in [gemSpec_DM_eRp]#TAB_eRpDM_004 beschrieben.

<!-- A_28116 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-531" title="E-Rezept-Fachdienst - Push Notification senden - verpflichtende Verschlüsselung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS den Nachrichteninhalt einer Push Notification verschlüsseln.
</requirement>

Die Vorgaben für die Verschlüsselung sind in `A_27161-* - Fachdienst - Push Notification senden - Nachricht verschlüsseln` beschrieben.

<!-- A_28135 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-532" title="E-Rezept-Fachdienst - Push Notification senden - Referenz auf Protokolleintrag" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Erstellen einer Push Notification die Identifier des zugehörigen Protokolleintrags (AuditEvent.id) des Triggers im Identifier-Feld des äußeren Notification-Objekts (notification.identifier) angeben.
</requirement>
