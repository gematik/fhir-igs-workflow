# FHIR-Ressource validieren - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **FHIR-Ressource validieren**

## FHIR-Ressource validieren

Der E-Rezept-Fachdienst validiert bei Operationen von Clientsystemen übermittelte FHIR-Ressourcen. Die folgenden Anforderungen beschreiben Mindestprüfungen.

Der E-Rezept-Fachdienst MUSS sicherstellen, dass alle Datums- und Zeitangaben ohne explizite Zeitzoneninformation als deutsche Zeit (CET/CEST) entsprechend der historischen oder aktuellen Regelung interpretiert werden.

Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource prüfen, dass maximal ein meta.profile-Eintrag vorhanden ist und bei Abweichung mit dem HTTP-Fehlercode 400 sowie einem entsprechenden OperationOutcome die Verarbeitung ablehnen.
### Prüfung von Referenzen in Bundles

Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource vom Typ Bundle prüfen, ob die ID der Ressource (Bundle.entry.resource.id) und die ID ihrer fullUrl (Bundle.entry.fullurl) übereinstimmen und bei Auffälligkeiten mit dem HTTP-Fehlercode 400 abbrechen und die Fehlermeldung "Die ID einer Ressource und die ID der zugehörigen fullUrl stimmen nicht überein." in Form eines OperationOutcome ausliefern.

Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource vom Typ Bundle prüfen, ob der Wert von fullUrls der entries (Bundle.entry.fullUrl) dem [Format http-Schema] oder [Format urn:uuid-Schema] entsprechen und bei Auffälligkeiten mit dem HTTP-Fehlercode 400 abbrechen und die Fehlermeldung "Format der fullUrl ist ungültig." in Form eines OperationOutcome ausliefern.

Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource vom Typ Bundle prüfen, ob für jedes entry im Bundle die ID der Ressource (Bundle.entry.resource.id) vorhanden ist und bei Auffälligkeiten mit dem HTTP-Fehlercode 400 abbrechen und die Fehlermeldung "Die ID einer Ressource im Bundle ist nicht vorhanden." in Form eines OperationOutcome ausliefern.

Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource prüfen, ob angegebene Referenzen nach [FHIR Spezifikation Auflösen von Referenzen in Bundles] ermittelt werden können und bei Auffälligkeiten mit dem HTTP-Fehlercode 400 abbrechen und die Fehlermeldung "Referenz einer Ressource konnte nicht aufgelöst werden." in Form eines OperationOutcome ausliefern.
### Validierung von Extensions

Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource sicherstellen, dass keine Extensions vorhanden sind, die nicht an den in den FHIR-Profilen spezifizierten Stellen verwendet werden. Sollte eine solche Extension gefunden werden, gilt der Datensatz als ungültig. In diesem Fall ist eine Fehlermeldung mit dem HTTP-Status 400 auszugeben.

