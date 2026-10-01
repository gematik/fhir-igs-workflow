Der TI-Flow-Fachdienst ermöglicht den Versand von Push Notifications für verschiedene Anwendungsfälle. Die Details sind in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/{{ site.data.constants.tiflow_core_version }}/menu-technische-umsetzung-push.html) zu finden, und unten sind die modulspezifischen Anforderungen.

<!-- E-Rezept_26_2 C_12832 -->
<!-- A_28115-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A324" title="TI-Flow-Fachdienst - Push Notification senden - Nachrichteninhalt erzeugen - E-Rezept" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS den Nachrichteninhalt einer Push Notification gemäß der Tabelle erzeugen.

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
<td>tiflow.task.activate</td>
<td>Task.identifier.PrescriptionID</td>
<td>TaskId</td>
<td>
KBV_PR_ERP_Bundle.entry.[medicationName]
</td>
<td>zeta-user-info.commonName aus Nutzerinformationen das Aufrufs</td>
<td>-</td>
</tr>

<tr>
<td>tiflow.task.accept</td>
<td>Task.identifier.PrescriptionID</td>
<td>TaskId</td>
<td>
KBV_PR_ERP_Bundle.entry.[medicationName]
</td>
<td>zeta-user-info.commonName aus Nutzerinformationen das Aufrufs</td>
<td>-</td>
</tr>

<tr>
<td>tiflow.task.reject</td>
<td>Task.identifier.PrescriptionID</td>
<td>TaskId</td>
<td>
KBV_PR_ERP_Bundle.entry.[medicationName]
</td>
<td>zeta-user-info.commonName aus Nutzerinformationen das Aufrufs</td>
<td>-</td>
</tr>

<tr>
<td>tiflow.task.dispense</td>
<td>Task.identifier.PrescriptionID</td>
<td>TaskId</td>
<td>
GEM_ERP_PR_PAR_DispenseOperation_Input.parameter[rxDispensation].part[medication].[medicationName]
</td>
<td>zeta-user-info.commonName aus Nutzerinformationen das Aufrufs</td>
<td>-</td>
</tr>

<tr>
<td>tiflow.task.abort</td>
<td>Task.identifier.PrescriptionID</td>
<td>TaskId</td>
<td>
KBV_PR_ERP_Bundle.entry.[medicationName]
</td>
<td>zeta-user-info.commonName aus Nutzerinformationen das Aufrufs</td>
<td>-</td>
</tr>

<tr>
<td>tiflow.communication.new</td>
<td>Communication.basedOn.reference</td>
<td>TaskId</td>
<td>
KBV_PR_ERP_Bundle.entry.[medicationName]
</td>
<td>zeta-user-info.commonName aus Nutzerinformationen das Aufrufs</td>
<td>
Communication.payload.content.info_text
</td>
</tr>

<tr>
<td>tiflow.eu.prescription.get</td>
<td>Task.identifier.PrescriptionID</td>
<td>TaskId</td>
<td>KBV_PR_ERP_Bundle.entry.[medicationName]</td>
<td>GEM_ERPEU_PR_PAR_GET_Prescription_Input.parameter.part[practionerName].valueString</td>
<td>-</td>
</tr>

<tr>
<td>tiflow.eu.prescription.redeem</td>
<td>Task.identifier.PrescriptionID</td>
<td>TaskId</td>
<td>KBV_PR_ERP_Bundle.entry.[medicationName]</td>
<td>GEM_ERPEU_PR_PAR_GET_Prescription_Input.parameter.part[practionerName].valueString</td>
<td>-</td>
</tr>

<tr>
<td>tiflow.eu.prescription.close</td>
<td>Task.identifier.PrescriptionID</td>
<td>TaskId</td>
<td>GEM_ERPEU_PR_PAR_CloseOperation_Input.parameter[rxDispensation].[medication].[medicationName]</td>
<td>GEM_ERPEU_PR_PAR_CloseOperation_Input.parameter.part[practionerData].name.text</td>
<td>-</td>
</tr>

</tbody>
</table>

<p>
Damit die Tabelle etwas übersichtlicher gestaltet ist, werden einige Abkürzungen verwendet. Diese werden hier beschrieben:
<table>
<thead>
<tr>
<th>Abkürzung</th>
<th>Definition</th>
</tr>
</thead>

<tbody>
<tr>
<td>[medicationName]</td>
<td>Falls medication dem Profil "KBV_PR_ERP_Medication_Ingredient" entspricht:<br>
`Medication.ingredient.item.itemCodeableConcept.text`<br>
Ansonsten:<br>
`Medication.code.text`</td>
</tr>
</tbody>
</table>
</p>
</requirement>