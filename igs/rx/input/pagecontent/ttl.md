<!-- TI-Flow-26_2 KBV_23, KBV_30 -->
Dieser IG beschreibt die Löschfristen für E-Rezept-Verordnungen und zugehörige Ressourcen. Diese sind spezifisch für das E-Rezept-Modul definiert, da unterschiedliche Fachdienste unterschiedliche Anforderungen bezüglich Löschfristen, Aufbewahrungsfristen und Ablaufregeln besitzen.

### Löschfristen für E-Rezepte

Der TI-Flow-Fachdienst realisiert Datensparsamkeit durch automatisches Löschen abgelaufener oder nicht mehr benötigter E-Rezept-Ressourcen. Dieses Kapitel beschreibt die Löschfristen und die zugehörigen Anforderungen für das E-Rezept-Modul.

<!-- A_19252-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A288" title="E-Rezept: Löschfrist abgelaufener Rezepte" version="0">
	<meta lockversion="false"/>
	<actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    	<testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
  	</actor>
	Der TI-Flow-Fachdienst MUSS einen Task mit Flowtype 160, 166, 169, 200 oder 209 nach Ablauf der Löschfrist gemäß der folgenden Festlegung automatisch löschen und das Löschen in einem AuditEvent für den Versicherten nachvollziehbar protokollieren.
	<table>
		<tr> 
		<th>Task.status nach Statuswechsel</th>
		<th>Löschfrist</th>
		</tr>
		<tr> 
		<td>draft</td>
		<td>10 Tage nach Statuswechsel</td>
		</tr>
		<tr> 
		<td>ready</td>
		<td>10 Tage nach Datum in Task.expiryDate</td>
		</tr>
		<tr> 
		<td>in-progress</td>
		<td>100 Tage nach Statuswechsel</td>
		</tr>
		<tr> 
		<td>completed</td>
		<td>100 Tage nach Statuswechsel</td>
		</tr>
		<tr> 
		<td>cancelled</td>
		<td>10 Tage nach Statuswechsel</td>
		</tr>
	</table>
</requirement>

<!-- A_26264 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A289" title="E-Rezept: Löschinformation ePA Medication Service bereitstellen" version="0">
	<meta lockversion="false"/>
	<actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    	<testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  	</actor>
	Der TI-Flow-Fachdienst MUSS beim Löschen eines Task mit Flowtype 160, 166, 169, 200 oder 209 nach Ablauf der Löschfrist, wenn Task.status = "ready" oder Task.status = "in-progress", die Daten für die Löschinformation des Verordnungsdatensatzes in den ePA Medication Service bereitstellen.
</requirement>

<!-- A_19254-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A290" title="E-Rezept: Löschen referenzierter Bundles" version="0">
	<meta lockversion="false"/>
	<actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    	<testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  	</actor>
	Der TI-Flow-Fachdienst MUSS bei jedem Löschen eines Tasks mit Flowtype 160, 166, 169, 200 oder 209 alle referenzierten Bundles (QES-Datensatz, Quittungs-Bundle, Dispensierinformationen) ebenfalls löschen.
</requirement>

<!-- A_19255 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A291" title="E-Rezept: Löschfrist veraltete MedicationDispense" version="0">
	<meta lockversion="false"/>
	<actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    	<testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
  	</actor>
	Der TI-Flow-Fachdienst MUSS eine gespeicherte Ressource MedicationDispense nach 100 Tagen ab ihrem Erzeugungsdatum MedicationDispense.whenHandedOver automatisch löschen.
</requirement>

<!-- A_19253-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A293" title="E-Rezept: Löschfrist veraltete Nachrichten" version="0">
	<meta lockversion="false"/>
	<actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    	<testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
  	</actor>
	Der TI-Flow-Fachdienst MUSS eine gespeicherte Ressource Communication
	automatisch löschen:
	<ul>
		<li>ohne eine Referenz auf einen Task in Communication.basedOn nach 100 Tagen ab ihrem Sendedatum Communication.sent,</li>
		<li>mit einer Referenz auf einen Task mit Flowtype 160, 166, 169, 200 oder 209 in Communication.basedOn gemäß der Löschfrist beim Löschen des Tasks,</li>
		<li>mit einer Referenz auf einen ChargeItem in Communication.basedOn nach 100 Tagen ab ihrem Sendedatum Communication.sent.</li>
	</ul>
</requirement>
