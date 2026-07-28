<!-- TI-Flow-26_2 KBV_23, KBV_30 -->
Dieser IG beschreibt die Löschfristen für PKV-Abgabedaten (ChargeItem und zugehörige Ressourcen). Diese sind spezifisch für das PKV-Abrechnungsmodul definiert, da unterschiedliche Fachdienste unterschiedliche Anforderungen bezüglich Löschfristen, Aufbewahrungsfristen und Ablaufregeln besitzen.

### Löschfristen für PKV-Abgabedaten

Der TI-Flow-Fachdienst realisiert Datensparsamkeit durch automatisches Löschen abgelaufener oder nicht mehr benötigter PKV-Abrechnungsressourcen. Dieses Kapitel beschreibt die Löschfristen und die zugehörigen Anforderungen für das PKV-Abrechnungsmodul.

<!-- A_22109 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-A100" title="E-Rezept Charging: Löschfrist ChargeItem" version="0">
	<meta lockversion="false"/>
	<actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    	<testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
  	</actor>
	Der TI-Flow-Fachdienst MUSS ein ChargeItem innerhalb eines Monats nach Ablauf von 10 Jahren nach dem Erstellen der Ressource automatisch löschen und das Löschen in einem AuditEvent für den Versicherten nachvollziehbar protokollieren.
</requirement>

<!-- A_22109 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-A101" title="E-Rezept Charging: Löschen referenzierter Bundles bei ChargeItem-Löschung" version="0">
	<meta lockversion="false"/>
	<actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    	<testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
  	</actor>
	Der TI-Flow-Fachdienst MUSS bei jedem Löschen eines ChargeItems alle referenzierten Bundles (E-Rezept-Bundle, Quittungs-Bundle, PKV-Abgabedatensatz) ebenfalls löschen, damit die Informationen rund um ein gelöschtes ChargeItem ebenfalls entfernt werden.
</requirement>
