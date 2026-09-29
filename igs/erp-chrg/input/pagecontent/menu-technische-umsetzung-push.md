Der TI-Flow-Fachdienst ermöglicht den Versand von Push Notifications für verschiedene Anwendungsfälle. Die Details sind in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}/menu-technische-umsetzung-push.html) zu finden, und unten sind die modulspezifischen Anforderungen.

<!-- E-Rezept_26_2 C_12832 -->
<!-- A_28115-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-A104" title="TI-Flow-Fachdienst - Push Notification senden - Nachrichteninhalt erzeugen - Charge Items" version="0">
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
<td>tiflow.chargeitem.create</td>
<td>ChargeItem.identifier.PrescriptionID</td>
<td>TaskId</td>
<td>ChargeItem.supportingInformation.KBV_PR_ERP_Bundle.entry.[medicationName]</td>
<td>zeta-user-info.commonName aus Nutzerinformationen das Aufrufs</td>
<td>-</td>
</tr>

<tr>
<td>tiflow.chargeitem.update</td>
<td>ChargeItem.identifier.PrescriptionID</td>
<td>TaskId</td>
<td>ChargeItem.supportingInformation.KBV_PR_ERP_Bundle.entry.[medicationName]</td>
<td>zeta-user-info.commonName aus Nutzerinformationen das Aufrufs</td>
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