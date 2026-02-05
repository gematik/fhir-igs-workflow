# FHIR-Ressource validieren

Der E-Rezept-Fachdienst validiert bei Operationen von Clientsystemen uebermittelte
FHIR-Ressourcen. Die folgenden Anforderungen beschreiben Mindestpruefungen.

<requirement conformance="SHALL" key="IG-WF-CORE-76" title="E-Rezept-Fachdienst - FHIR-Ressource validieren - Pruefung Datumsangabe ohne Zeitzoneninformation (A_27658)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS sicherstellen, dass alle Datums- und Zeitangaben ohne
	explizite Zeitzoneninformation als deutsche Zeit (CET/CEST) entsprechend der
	historischen oder aktuellen Regelung interpretiert werden.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-77" title="E-Rezept-Fachdienst - FHIR-Ressource validieren - Eindeutige Angabe meta.profile (A_27698)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource pruefen,
	dass maximal ein meta.profile-Eintrag vorhanden ist und bei Abweichung mit dem
	HTTP-Fehlercode 400 sowie einem entsprechenden OperationOutcome die Verarbeitung
	ablehnen.
</requirement>

## 5.11.1 Pruefung von Referenzen in Bundles

<requirement conformance="SHALL" key="IG-WF-CORE-78" title="E-Rezept-Fachdienst - FHIR-Ressource validieren - Pruefung Konsistenz Ressource IDs (A_26229-01)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource vom Typ
	Bundle pruefen, ob die ID der Ressource (Bundle.entry.resource.id) und die ID ihrer
	fullUrl (Bundle.entry.fullUrl) uebereinstimmen und bei Auffaelligkeiten mit dem
	HTTP-Fehlercode 400 abbrechen sowie die Fehlermeldung "Die ID einer Ressource und
	die ID der zugehoerigen fullUrl stimmen nicht ueberein." in Form eines
	OperationOutcome ausliefern.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-79" title="E-Rezept-Fachdienst - FHIR-Ressource validieren - Pruefung Format fullUrl (A_26233-01)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource vom Typ
	Bundle pruefen, ob der Wert von fullUrls der entries (Bundle.entry.fullUrl) dem
	Format http-Schema oder dem Format urn:uuid-Schema entspricht und bei
	Auffaelligkeiten mit dem HTTP-Fehlercode 400 abbrechen sowie die Fehlermeldung
	"Format der fullUrl ist ungueltig." in Form eines OperationOutcome ausliefern.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-80" title="E-Rezept-Fachdienst - FHIR-Ressource validieren - Pruefung Existenz von Ressource.id (A_27648)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource vom Typ
	Bundle pruefen, ob fuer jedes entry im Bundle die ID der Ressource
	(Bundle.entry.resource.id) vorhanden ist und bei Auffaelligkeiten mit dem
	HTTP-Fehlercode 400 abbrechen sowie die Fehlermeldung
	"Die ID einer Ressource im Bundle ist nicht vorhanden." in Form eines
	OperationOutcome ausliefern.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-81" title="E-Rezept-Fachdienst - FHIR-Ressource validieren - Pruefung Aufloesbarkeit von Referenzen (A_27649)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource pruefen, ob
	angegebene Referenzen nach der FHIR-Spezifikation zum Aufloesen von Referenzen in
	Bundles ermittelt werden koennen und bei Auffaelligkeiten mit dem HTTP-Fehlercode
	400 abbrechen sowie die Fehlermeldung "Referenz einer Ressource konnte nicht
	aufgeloest werden." in Form eines OperationOutcome ausliefern.
</requirement>

## 5.11.2 Validierung von Extensions

<requirement conformance="SHALL" key="IG-WF-CORE-82" title="E-Rezept-Fachdienst - FHIR-Ressource validieren - Ausschluss unspezifizierter Extensions (A_22927-02)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource
	sicherstellen, dass keine Extensions vorhanden sind, die nicht an den in den
	FHIR-Profilen spezifizierten Stellen verwendet werden. Sollte eine solche
	Extension gefunden werden, gilt der Datensatz als ungueltig. In diesem Fall ist
	eine Fehlermeldung mit dem HTTP-Status 400 und der Nachricht
	"Unintendierte Verwendung von Extensions an unspezifizierter Stelle" auszugeben.
</requirement>