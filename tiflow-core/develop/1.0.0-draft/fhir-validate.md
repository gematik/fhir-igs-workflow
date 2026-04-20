# FHIR-Ressource validieren - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **FHIR-Ressource validieren**

## FHIR-Ressource validieren

Der TI-Flow-Fachdienst validiert bei Operationen von Clientsystemen übermittelte FHIR-Ressourcen. Die folgenden Anforderungen beschreiben Mindestprüfungen.

Der TI-Flow-Fachdienst MUSS bei der Prüfung der zeitlichen Gültigkeit einer FHIR Ressource den Wert aus dem Element gemäß folgender Tabelle zugrunde legen.

| | | | |
| :--- | :--- | :--- | :--- |
| KBV Verordnungsdatensatz | `kbv.ita.erp` | `KBV_PR_ERP_Prescription` | `MedicationRequest.authoredOn` |
| KBV Verordnungsdatensatz DiGA | `kbv.itv.evdga` | `KBV_PR_EVDGA_HealthAppRequest` | `DeviceRequest.authoredOn` |
| Communication | `de.gematik.erezept-workflow.r4` | `GEM_ERP_PR_Communication_DispReq``GEM_ERP_PR_Communication_Reply``GEM_ERP_PR_Communication_DiGA` | Zeitpunkt des Aufrufs der Operation am TI-Flow-Fachdienst |
| MedicationDispense | `de.gematik.erezept-workflow.r4` | `Gem_erxMedicationDispense``GEM_ERP_PR_MedicationDispense` | `MedicationDispense.whenHandedOver` |
| PKV Patientenrechnung | `de.gematik.erezept-patientenrechnung.r4` | `GEM_ERPCHRG_PR_ChargeItem``GEM_ERPCHRG_PR_Consent` | Zeitpunkt des Aufrufs der Operation am TI-Flow-Fachdienst |
| PKV Patientenrechnung Communication | `de.gematik.erezept-patientenrechnung.r4` | `GEM_ERPCHRG_PR_Communication_ChargChangeReq``GEM_ERPCHRG_PR_Communication_ChargChangeReply` | Zeitpunkt des Aufrufs der Operation am TI-Flow-Fachdienst |
| PKV Abgabedatensatz | `de.abda.eRezeptAbgabedatenPKV` | `DAV_PKV_PR_ERP_Abgabeinformationen` | `MedicationDispense.whenHandedOver` |

**Tabelle: **TAB_ERP_FD_PruefungGueltigkeit_FHIR_Ressource Werte bei Prüfung der zeitlichen Gültigkeit einer FHIR Ressource

Der TI-Flow-Fachdienst MUSS sicherstellen, dass alle Datums- und Zeitangaben ohne explizite Zeitzoneninformation als deutsche Zeit (CET/CEST) entsprechend der historischen oder aktuellen Regelung interpretiert werden.

Der TI-Flow-Fachdienst und Clientsysteme des TI-Flow-Fachdienstes MÜSSEN sicherstellen, dass bei der Erstellung von Datensätzen Datums- und Zeitangaben ohne Zeitzoneninformation, die entsprechend dem Datum gültige deutsche Zeitzone (CET/CEST) angewendet wird.

Der TI-Flow-Fachdienst MUSS bei der Validierung einer FHIR-Ressource prüfen, dass maximal ein meta.profile-Eintrag vorhanden ist und bei Abweichung die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_META_PROFILE_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen.

Der TI-Flow-Fachdienst und die Clientsysteme des TI-Flow-Fachdienstes MÜSSEN bei der Erstellung jeder FHIR-Ressource sicherstellen, dass im Element meta.profile genau ein Eintrag enthalten ist, wenn im Profil das Element meta.profile verpflichtend anzugeben ist; bei Abweichung ist die Ressource als fehlerhaft zu behandeln und darf nicht übermittelt werden.
### Prüfung von Referenzen in Bundles

Der TI-Flow-Fachdienst MUSS bei der Validierung einer FHIR-Ressource vom Typ Bundle prüfen, ob die ID der Ressource (Bundle.entry.resource.id) und die ID ihrer fullUrl (Bundle.entry.fullurl) übereinstimmen und bei Auffälligkeiten die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: MSG_RESOURCE_ID_MISMATCH
* HTTP-Code: Details Text
  * 400 - Bad Request: Die ID einer Ressource und die ID der zugehörigen fullUrl stimmen nicht überein.

abbrechen.

Der TI-Flow-Fachdienst MUSS bei der Validierung einer FHIR-Ressource vom Typ Bundle prüfen, ob der Wert von fullUrls der entries (Bundle.entry.fullUrl) dem [Format http-Schema] oder [Format urn:uuid-Schema] entsprechen und bei Auffälligkeiten die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_RESOURCE_FULLURL_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: Format der fullUrl ist ungültig.

abbrechen.

Der TI-Flow-Fachdienst MUSS bei der Validierung einer FHIR-Ressource vom Typ Bundle prüfen, ob für jedes entry im Bundle die ID der Ressource (Bundle.entry.resource.id) vorhanden ist und bei Auffälligkeiten die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: MSG_RESOURCE_ID_MISSING
* HTTP-Code: Details Text
  * 400 - Bad Request: Die ID einer Ressource im Bundle ist nicht vorhanden.

abbrechen.

Der TI-Flow-Fachdienst MUSS bei der Validierung einer FHIR-Ressource prüfen, ob angegebene Referenzen nach [FHIR Spezifikation Auflösen von Referenzen in Bundles] ermittelt werden können und bei Auffälligkeiten die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: MSG_RESOURCE_ID_FAIL
* HTTP-Code: Details Text
  * 400 - Bad Request: Referenz einer Ressource konnte nicht aufgelöst werden.

abbrechen.

Der TI-Flow-Fachdienst und Clientsysteme des TI-Flow-Fachdienstes MÜSSEN bei der Erstellung einer FHIR-Ressource die ID der fullURL (Bundle.entry.fullurl) der Ressource auf die ID der Ressource (Bundle.entry.resource.id) setzen, sofern das http(s)-Schema verwendet wird.

Der TI-Flow-Fachdienst und Clientsysteme des TI-Flow-Fachdienstes MÜSSEN bei der Erstellung einer FHIR-Ressource sicherstellen, dass die fullURL (Bundle.entry.fullUrl) entweder im [Format http-Schema] oder im [Format urn:uuid-Schema] vorliegt.

Der TI-Flow-Fachdienst und Clientsystem des TI-Flow-Fachdienstes MÜSSEN alle generierten FHIR-Ressourcen mit der Versionsnummer gemäß [datatypes.html#canonical](https://www.hl7.org/fhir/datatypes.html#canonical) im Feld Ressource.meta.profile kennzeichnen, zu dessen aktuell gültiger Profilversion sie mutmaßlich validieren.
### Validierung von Extensions

Der TI-Flow-Fachdienst MUSS bei der Validierung einer FHIR-Ressource sicherstellen, dass keine Extension vorhanden ist, die an einer nicht im FHIR-Profil spezifizierten Stelle verwendet wird. Sollte eine solche Extension gefunden werden, gilt der Datensatz als ungültig. In diesem Fall ist die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: SVC_VALIDATION_FAILED
* HTTP-Code: Details Text
  * 400 - Bad Request: FHIR Profile Validation Failed

abzubrechen.

Der TI-Flow-Fachdienst und Clientsysteme des TI-Flow-Fachdienstes MÜSSEN sicherstellen, dass bei der Erstellung von Datensätzen Extensions nur an den Stellen verwendet werden, an denen sie im FHIR-Profil ausdrücklich definiert sind.

