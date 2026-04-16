
Der TI-Flow-Fachdienst realisiert Datensparsamkeit durch automatisches Löschen abgelaufener oder nicht mehr benötigter Ressourcen. Dieses Kapitel beschreibt die Loöchfristen und die zugehörigen Anforderungen.

<!-- A_19252-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-123" title="TI-Flow-Fachdienst - Löschfrist abgelaufener Rezepte" version="1">
	<meta lockversion="false"/>
	<actor name="TI-Flow_FD">
    	<testProcedure id="Produktgutachten"/>
  	</actor>
	Der TI-Flow-Fachdienst MUSS einen Task nach Ablauf der Löschfrist gemäß der folgenden Festlegung automatisch löschen und das Löschen in einem AuditEvent für den Versicherten nachvollziehbar protokollieren.
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
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-124" title="TI-Flow-Fachdienst - Löschinformation ePA Medication Service bereitstellen" version="0">
	<meta lockversion="false"/>
	<actor name="TI-Flow_FD">
    	<testProcedure id="Produkttest"/>
  	</actor>
	Der TI-Flow-Fachdienst MUSS beim Löschen eines Task nach Ablauf der Löschfrist, wenn Task.status = "ready" oder Task.status = "in-progress", die Daten für die Löschinformation des Verordnungsdatensatzes in den ePA Medication Service bereitstellen.
</requirement>

<!-- A_19254-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-125" title="TI-Flow-Fachdienst - Löschen referenzierter Bundles" version="0">
	<meta lockversion="false"/>
	<actor name="TI-Flow_FD">
    	<testProcedure id="Produkttest"/>
  	</actor>
	Der TI-Flow-Fachdienst MUSS bei jedem Löschen eines Tasks alle referenzierten Bundles (QES-Datensatz, Quittungs-Bundle, Dispensierinformationen) ebenfalls löschen.
</requirement>

<!-- A_19255 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-126" title="TI-Flow-Fachdienst - Löschfrist veraltete MedicationDispense" version="0">
	<meta lockversion="false"/>
	<actor name="TI-Flow_FD">
    	<testProcedure id="Produktgutachten"/>
  	</actor>
	Der TI-Flow-Fachdienst MUSS eine gespeicherte Ressource MedicationDispense nach 100 Tagen ab ihrem Erzeugungsdatum MedicationDispense.whenHandedOver automatisch löschen.
</requirement>

<!-- A_22109 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-127" title="TI-Flow-Fachdienst - Löschfrist ChargeItem" version="0">
	<meta lockversion="false"/>
	<actor name="TI-Flow_FD">
    	<testProcedure id="Produktgutachten"/>
  	</actor>
	Der TI-Flow-Fachdienst MUSS ein ChargeItem innerhalb eines Monats nach Ablauf von 10 Jahren nach dem Erstellen der Ressource automatisch löschen und das Löschen in einem AuditEvent für den Versicherten nachvollziehbar protokollieren.<br>
	Der TI-Flow-Fachdienst MUSS bei jedem Löschen eines ChargeItems alle referenzierten Bundles (E-Rezept-Bundle, Quittungs-Bundle, PKV-Abgabedatensatz) ebenfalls löschen, damit die Informationen rund um ein gelöschtes ChargeItem ebenfalls entfernt werden.
</requirement>

<!-- A_19253-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-128" title="TI-Flow-Fachdienst - Löschfrist veraltete Nachrichten" version="1">
	<meta lockversion="false"/>
	<actor name="TI-Flow_FD">
    	<testProcedure id="Produktgutachten"/>
  	</actor>
	Der TI-Flow-Fachdienst MUSS eine gespeicherte Ressource Communication
	automatisch löschen:
	<ul>
		<li>ohne eine Referenz auf einen Task in Communication.basedOn nach 100 Tagen ab ihrem Sendedatum Communication.sent,</li>
		<li>mit einer Referenz auf einen Task in Communication.basedOn gemäß der Löschfrist beim Löschen des Tasks,</li>
		<li>mit einer Referenz auf einen ChargeItem in Communication.basedOn nach 100 Tagen ab ihrem Sendedatum Communication.sent.</li>
	</ul>
</requirement>

<!-- A_19256-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-129" title="TI-Flow-Fachdienst - Löschfrist veraltete Protokolleinträge" version="0">
	<meta lockversion="false"/>
	<actor name="TI-Flow_FD">
    	<testProcedure id="Produktgutachten"/>
  	</actor>
	Der TI-Flow-Fachdienst MUSS eine gespeicherte Ressource AuditEvent nach 3 Jahren ab dem Erzeugungsdatum AuditEvent.recorded innerhalb von einem Monat löschen.
</requirement>