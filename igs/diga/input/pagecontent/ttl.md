Dieser IG beschreibt die Löschfristen für DiGA-Verordnungen und zugehörige Ressourcen. Diese sind spezifisch für das DiGA-Modul definiert, da unterschiedliche Fachdienste unterschiedliche Anforderungen bezüglich Löschfristen, Aufbewahrungsfristen und Ablaufregeln besitzen.

### Löschfristen für DiGA-Verordnungen
<!-- TI-Flow-26_2 KBV_23, KBV_30 -->

Der TI-Flow-Fachdienst realisiert Datensparsamkeit durch automatisches Löschen abgelaufener oder nicht mehr benötigter DiGA-Ressourcen. Dieses Kapitel beschreibt die Löschfristen und die zugehörigen Anforderungen für das DiGA-Modul.

<!-- A_19252-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-A129" title="DiGA: Löschfrist abgelaufener Verordnungen" version="0">
	<meta lockversion="false"/>
	<actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    	<testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
  	</actor>
	Der TI-Flow-Fachdienst MUSS einen Task mit Flowtype 162 nach Ablauf der Löschfrist gemäß der folgenden Festlegung automatisch löschen und das Löschen in einem AuditEvent für den Versicherten nachvollziehbar protokollieren.
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
		<td>30 Tage nach Statuswechsel</td>
		</tr>
		<tr> 
		<td>completed</td>
		<td>30 Tage nach Statuswechsel</td>
		</tr>
		<tr> 
		<td>cancelled</td>
		<td>10 Tage nach Statuswechsel</td>
		</tr>
	</table>
</requirement>

<!-- A_19254-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-A130" title="DiGA: Löschen referenzierter Bundles" version="0">
	<meta lockversion="false"/>
	<actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    	<testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  	</actor>
	Der TI-Flow-Fachdienst MUSS bei jedem Löschen eines Tasks mit Flowtype 162 alle referenzierten Bundles ebenfalls löschen.
</requirement>

<!-- A_19253-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-A131" title="DiGA: Löschfrist veraltete Nachrichten" version="0">
	<meta lockversion="false"/>
	<actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    	<testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
  	</actor>
	Der TI-Flow-Fachdienst MUSS eine gespeicherte Ressource Communication automatisch löschen:
	<ul>
		<li>ohne eine Referenz auf einen Task in Communication.basedOn nach 30 Tagen ab ihrem Sendedatum Communication.sent,</li>
		<li>mit einer Referenz auf einen Task mit Flowtype 162 in Communication.basedOn gemäß der Löschfrist beim Löschen des Tasks.</li>
	</ul>
</requirement>
