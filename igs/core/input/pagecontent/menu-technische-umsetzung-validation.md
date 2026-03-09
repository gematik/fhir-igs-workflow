Der E-Rezept-Fachdienst validiert beim Aufruf einer Operation von Clientsystemen übermittelte FHIR-Ressourcen.

<!-- A_27658 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-11" title="E-Rezept-Fachdienst - FHIR-Ressource validieren - Prüfung Datumsangabe ohne Zeitzoneninformation" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS sicherstellen, dass alle Datums- und Zeitangaben ohne explizite Zeitzoneninformation als deutsche Zeit (CET/CEST) entsprechend der historischen oder aktuellen Regelung interpretiert werden.
</requirement>

<!-- A_27698 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-12" title="E-Rezept-Fachdienst - FHIR-Ressource validieren - Eindeutige Angabe meta.profile" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressourcen prüfen, dass maximal ein meta.profile-Eintrag vorhanden ist und bei Abweichung mit dem HTTP-Fehlercode 400 sowie einem entsprechenden OperationOutcome die Verarbeitung abweisen.
</requirement>

### Prüfung von Referenzen in Bundles

<!-- A_26229-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-13" title="E-Rezept-Fachdienst - FHIR-Ressource validieren - Prüfung Konsistenz Ressource IDs" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource vom Typ Bundle prüfen, ob die ID der Ressource (Bundle.entry.resource.id) und die ID ihrer fullUrl (Bundle.entry.fullurl) übereinstimmen und bei Auffälligkeiten mit dem HTTP-Fehlercode 400 abbrechen und die Fehlermeldung "Die ID einer Ressource und die ID der zugehörigen fullUrl stimmen nicht überein." in Form eines OperationOutcome ausliefern.
</requirement>

<!-- A_26229-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-14" title="E-Rezept-Fachdienst - FHIR-Ressource validieren - Prüfung Konsistenz Ressource IDs" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource vom Typ Bundle prüfen, ob die ID der Ressource (Bundle.entry.resource.id) und die ID ihrer fullUrl (Bundle.entry.fullurl) übereinstimmen und bei Auffälligkeiten mit dem HTTP-Fehlercode 400 abbrechen und die Fehlermeldung "Die ID einer Ressource und die ID der zugehörigen fullUrl stimmen nicht überein." in Form eines OperationOutcome ausliefern.
</requirement>

<!-- A_27648 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-15" title="E-Rezept-Fachdienst - FHIR-Ressource validieren - Prüfung Existenz von Ressource.id" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource vom Typ Bundle prüfen, ob für jedes entry im Bundle die ID der Ressource (Bundle.entry.resource.id) vorhanden ist und bei Auffälligkeiten mit dem HTTP-Fehlercode 400 abbrechen und die Fehlermeldung "Die ID einer Ressource im Bundle ist nicht vorhanden." in Form eines OperationOutcome ausliefern.
</requirement>

<!-- A_27649 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-16" title="E-Rezept-Fachdienst - FHIR-Ressource validieren - Prüfung Auflösbarkeit von Referenzen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource prüfen, ob angegebene Referenzen nach [FHIR Spezifikation Auflösen von Referenzen in Bundles] ermittelt werden können und bei Auffälligkeiten mit dem HTTP-Fehlercode 400 abbrechen und die Fehlermeldung "Referenz einer Ressource konnte nicht aufgelöst werden." in Form eines OperationOutcome ausliefern.
</requirement>

### Validierung von Extensions

<!-- A_22927-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-17" title="E-Rezept-Fachdienst - FHIR-Ressource validieren - Ausschluss unspezifizierter Extensions" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource sicherstellen, dass keine Extensions vorhanden sind, die nicht an den in den FHIR-Profilen spezifizierten Stellen verwendet werden. Sollte eine solche Extension gefunden werden, gilt der Datensatz als ungültig. In diesem Fall ist eine Fehlermeldung mit dem HTTP-Status 400 und der Nachricht "Unintendierte Verwendung von Extensions an unspezifizierter Stelle" auszugeben.
</requirement>
