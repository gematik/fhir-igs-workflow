# Loeschfristen

Der E-Rezept-Fachdienst realisiert Datensparsamkeit durch automatisches Loeschen
abgelaufener oder nicht mehr benoetigter Ressourcen. Dieses Kapitel beschreibt die
Loeschfristen und die zugehoerigen Anforderungen.

<requirement conformance="SHALL" key="IG-WF-CORE-10" title="E-Rezept-Fachdienst - Loeschfrist abgelaufener Rezepte (A_19252-03)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS einen Task nach Ablauf der Loeschfrist gemaess der
	folgenden Festlegung automatisch loeschen und das Loeschen in einem AuditEvent
	fuer den Versicherten nachvollziehbar protokollieren.

	| Task.status nach Statuswechsel | Loeschfrist |
	| --- | --- |
	| draft | 10 Tage nach Statuswechsel |
	| ready | 10 Tage nach Datum in Task.expiryDate |
	| in-progress | 100 Tage nach Statuswechsel |
	| completed | 100 Tage nach Statuswechsel |
	| cancelled | 10 Tage nach Statuswechsel |
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-11" title="E-Rezept-Fachdienst - Loeschinformation ePA Medication Service bereitstellen (A_26264)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS beim Loeschen eines Task nach Ablauf der Loeschfrist,
	wenn Task.status = ready oder Task.status = in-progress, die Daten fuer die
	Loeschinformation des Verordnungsdatensatzes in den ePA Medication Service
	bereitstellen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-12" title="E-Rezept-Fachdienst - Loeschen referenzierter Bundles (A_19254-01)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS bei jedem Loeschen eines Tasks alle referenzierten
	Bundles (QES-Datensatz, Quittungs-Bundle, Dispensierinformationen) ebenfalls
	loeschen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-13" title="E-Rezept-Fachdienst - Loeschfrist veraltete MedicationDispense (A_19255)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS eine gespeicherte Ressource MedicationDispense nach
	100 Tagen ab ihrem Erzeugungsdatum MedicationDispense.whenHandedOver automatisch
	loeschen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-14" title="E-Rezept-Fachdienst - Loeschfrist ChargeItem (A_22109)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS ein ChargeItem innerhalb eines Monats nach Ablauf
	von 10 Jahren nach dem Erstellen der Ressource automatisch loeschen und das
	Loeschen in einem AuditEvent fuer den Versicherten nachvollziehbar protokollieren.
	Der E-Rezept-Fachdienst MUSS bei jedem Loeschen eines ChargeItems alle
	referenzierten Bundles (E-Rezept-Bundle, Quittungs-Bundle, PKV-Abgabedatensatz)
	ebenfalls loeschen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-15" title="E-Rezept-Fachdienst - Loeschfrist veraltete Nachrichten (A_19253-01)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS eine gespeicherte Ressource Communication
	automatisch loeschen:
	- ohne eine Referenz auf einen Task in Communication.basedOn nach 100 Tagen ab
	  ihrem Sendedatum Communication.sent,
	- mit einer Referenz auf einen Task in Communication.basedOn gemaess der
	  Loeschfrist beim Loeschen des Tasks,
	- mit einer Referenz auf einen ChargeItem in Communication.basedOn nach 100 Tagen
	  ab ihrem Sendedatum Communication.sent.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-16" title="E-Rezept-Fachdienst - Loeschfrist veraltete Protokolleintraege (A_19256-01)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS eine gespeicherte Ressource AuditEvent nach 3 Jahren
	ab dem Erzeugungsdatum AuditEvent.recorded innerhalb von einem Monat loeschen.
</requirement>