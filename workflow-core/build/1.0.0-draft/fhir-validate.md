# FHIR-Ressource validieren - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **FHIR-Ressource validieren**

## FHIR-Ressource validieren

# FHIR-Ressource validieren

Der E-Rezept-Fachdienst validiert bei Operationen von Clientsystemen uebermittelte FHIR-Ressourcen. Die folgenden Anforderungen beschreiben Mindestpruefungen.

Der E-Rezept-Fachdienst MUSS sicherstellen, dass alle Datums- und Zeitangaben ohne explizite Zeitzoneninformation als deutsche Zeit (CET/CEST) entsprechend der historischen oder aktuellen Regelung interpretiert werden.

Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource pruefen, dass maximal ein meta.profile-Eintrag vorhanden ist und bei Abweichung mit dem HTTP-Fehlercode 400 sowie einem entsprechenden OperationOutcome die Verarbeitung ablehnen.
## 5.11.1 Pruefung von Referenzen in Bundles

Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource vom Typ Bundle pruefen, ob die ID der Ressource (Bundle.entry.resource.id) und die ID ihrer fullUrl (Bundle.entry.fullUrl) uebereinstimmen und bei Auffaelligkeiten mit dem HTTP-Fehlercode 400 abbrechen sowie die Fehlermeldung "Die ID einer Ressource und die ID der zugehoerigen fullUrl stimmen nicht ueberein." in Form eines OperationOutcome ausliefern.

Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource vom Typ Bundle pruefen, ob der Wert von fullUrls der entries (Bundle.entry.fullUrl) dem Format http-Schema oder dem Format urn:uuid-Schema entspricht und bei Auffaelligkeiten mit dem HTTP-Fehlercode 400 abbrechen sowie die Fehlermeldung "Format der fullUrl ist ungueltig." in Form eines OperationOutcome ausliefern.

Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource vom Typ Bundle pruefen, ob fuer jedes entry im Bundle die ID der Ressource (Bundle.entry.resource.id) vorhanden ist und bei Auffaelligkeiten mit dem HTTP-Fehlercode 400 abbrechen sowie die Fehlermeldung "Die ID einer Ressource im Bundle ist nicht vorhanden." in Form eines OperationOutcome ausliefern.

Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource pruefen, ob angegebene Referenzen nach der FHIR-Spezifikation zum Aufloesen von Referenzen in Bundles ermittelt werden koennen und bei Auffaelligkeiten mit dem HTTP-Fehlercode 400 abbrechen sowie die Fehlermeldung "Referenz einer Ressource konnte nicht aufgeloest werden." in Form eines OperationOutcome ausliefern.
## 5.11.2 Validierung von Extensions

Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource sicherstellen, dass keine Extensions vorhanden sind, die nicht an den in den FHIR-Profilen spezifizierten Stellen verwendet werden. Sollte eine solche Extension gefunden werden, gilt der Datensatz als ungueltig. In diesem Fall ist eine Fehlermeldung mit dem HTTP-Status 400 und der Nachricht "Unintendierte Verwendung von Extensions an unspezifizierter Stelle" auszugeben.

