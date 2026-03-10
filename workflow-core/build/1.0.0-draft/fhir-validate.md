# FHIR-Ressource validieren - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **FHIR-Ressource validieren**

## FHIR-Ressource validieren

Der E-Rezept-Fachdienst validiert bei Operationen von Clientsystemen übermittelte FHIR-Ressourcen. Die folgenden Anforderungen beschreiben Mindestprüfungen.

Der E-Rezept-Fachdienst MUSS bei der Prüfung der zeitlichen Gültigkeit einer FHIR Ressource den Wert aus dem Element gemäß folgender Tabelle zugrunde legen.

| | | | |
| :--- | :--- | :--- | :--- |
| KBV Verordnungsdatensatz | `kbv.ita.erp` | `KBV_PR_ERP_Prescription` | `MedicationRequest.authoredOn` |
| KBV Verordnungsdatensatz DiGA | `kbv.itv.evdga` | `KBV_PR_EVDGA_HealthAppRequest` | `DeviceRequest.authoredOn` |
| Communication | `de.gematik.erezept-workflow.r4` | `Gem_ErxCommunicationDispReq``Gem_ErxCommunicationInfoReq``Gem_ErxCommunicationReply``Gem_ErxCommunicationDispRepresentative``GEM_ERP_PR_Communication_DispReq``GEM_ERP_PR_Communication_InfoReq``GEM_ERP_PR_Communication_Reply``GEM_ERP_PR_Communication_Representative` | Zeitpunkt des Aufrufs der Operation am E-Rezept-Fachdienst |
| MedicationDispense | `de.gematik.erezept-workflow.r4` | `Gem_erxMedicationDispense``GEM_ERP_PR_MedicationDispense` | `MedicationDispense.whenHandedOver` |
| PKV Patientenrechnung | `de.gematik.erezept-patientenrechnung.r4` | `GEM_ERPCHRG_PR_ChargeItem``GEM_ERPCHRG_PR_Consent` | Zeitpunkt des Aufrufs der Operation am E-Rezept-Fachdienst |
| PKV Abgabedatensatz | `de.abda.eRezeptAbgabedatenPKV` | `DAV_PKV_PR_ERP_Abgabeinformationen` | `MedicationDispense.whenHandedOver` |

**Tabelle: **title

Der E-Rezept-Fachdienst MUSS sicherstellen, dass alle Datums- und Zeitangaben ohne explizite Zeitzoneninformation als deutsche Zeit (CET/CEST) entsprechend der historischen oder aktuellen Regelung interpretiert werden.

Die Produkttypen der Anwendung E-Rezept und Clientsysteme des E-Rezept-Fachdienstes MÜSSEN sicherstellen, dass bei der Erstellung von Datensätzen Datums- und Zeitangaben ohne Zeitzoneninformation, die entsprechend dem Datum gültige deutsche Zeitzone (CET/CEST) angewendet wird.

Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource prüfen, dass maximal ein meta.profile-Eintrag vorhanden ist und bei Abweichung mit dem HTTP-Fehlercode 400 sowie einem entsprechenden OperationOutcome die Verarbeitung ablehnen.

Die Produkttypen der Anwendung E-Rezept und die Clientsysteme des E-Rezept-Fachdienstes MÜSSEN bei der Erstellung jeder FHIR-Ressource sicherstellen, dass im Element meta.profile genau ein Eintrag enthalten ist, wenn im Profil das Element meta.profile verpflichtend anzugeben ist; bei Abweichung ist die Ressource als fehlerhaft zu behandeln und darf nicht übermittelt werden.
### Prüfung von Referenzen in Bundles

Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource vom Typ Bundle prüfen, ob die ID der Ressource (Bundle.entry.resource.id) und die ID ihrer fullUrl (Bundle.entry.fullurl) übereinstimmen und bei Auffälligkeiten mit dem HTTP-Fehlercode 400 abbrechen und die Fehlermeldung "Die ID einer Ressource und die ID der zugehörigen fullUrl stimmen nicht überein." in Form eines OperationOutcome ausliefern.

Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource vom Typ Bundle prüfen, ob der Wert von fullUrls der entries (Bundle.entry.fullUrl) dem [Format http-Schema] oder [Format urn:uuid-Schema] entsprechen und bei Auffälligkeiten mit dem HTTP-Fehlercode 400 abbrechen und die Fehlermeldung "Format der fullUrl ist ungültig." in Form eines OperationOutcome ausliefern.

Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource vom Typ Bundle prüfen, ob für jedes entry im Bundle die ID der Ressource (Bundle.entry.resource.id) vorhanden ist und bei Auffälligkeiten mit dem HTTP-Fehlercode 400 abbrechen und die Fehlermeldung "Die ID einer Ressource im Bundle ist nicht vorhanden." in Form eines OperationOutcome ausliefern.

Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource prüfen, ob angegebene Referenzen nach [FHIR Spezifikation Auflösen von Referenzen in Bundles] ermittelt werden können und bei Auffälligkeiten mit dem HTTP-Fehlercode 400 abbrechen und die Fehlermeldung "Referenz einer Ressource konnte nicht aufgelöst werden." in Form eines OperationOutcome ausliefern.

Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource vom Typ Bundle prüfen, ob die ID der Ressource (Bundle.entry.resource.id) und die ID ihrer fullUrl (Bundle.entry.fullurl) übereinstimmen und bei Auffälligkeiten mit dem HTTP-Fehlercode 400 abbrechen und die Fehlermeldung "Die ID einer Ressource und die ID der zugehörigen fullUrl stimmen nicht überein." in Form eines OperationOutcome ausliefern.

Die Produkttypen der Anwendung E-Rezept und Clientsysteme des E-Rezept-Fachdienstes MÜSSEN bei der Erstellung einer FHIR-Ressource die ID der fullURL (Bundle.entry.fullurl) der Ressource auf die ID der Ressource (Bundle.entry.resource.id) setzen, sofern das http(s)-Schema verwendet wird.

Die Produkttypen der Anwendung E-Rezept und Clientsysteme des E-Rezept-Fachdienstes MÜSSEN bei der Erstellung einer FHIR-Ressource sicherstellen, dass die fullURL (Bundle.entry.fullUrl) entweder im [Format http-Schema] oder im [Format urn:uuid-Schema] vorliegt.

Die Produkttypen der Anwendung E-Rezept und Clientsystem des E-Rezept-Fachdienstes MÜSSEN alle generierten FHIR-Ressourcen mit der Versionsnummer gemäß [datatypes.html#canonical](https://www.hl7.org/fhir/datatypes.html#canonical) im Feld Ressource.meta.profile kennzeichnen, zu dessen aktuell gültiger Profilversion sie mutmaßlich validieren.
### Validierung von Extensions

Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource sicherstellen, dass keine Extensions vorhanden sind, die nicht an den in den FHIR-Profilen spezifizierten Stellen verwendet werden. Sollte eine solche Extension gefunden werden, gilt der Datensatz als ungültig. In diesem Fall ist eine Fehlermeldung mit dem HTTP-Status 400 auszugeben.

Die Produkttypen der Anwendung E-Rezept und Clientsysteme des E-Rezept-Fachdienstes MÜSSEN sicherstellen, dass bei der Erstellung von Datensätzen Extensions nur an den Stellen verwendet werden, an denen sie im FHIR-Profil ausdrücklich definiert sind.

