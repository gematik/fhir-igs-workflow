# Generelle Prinzipien - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **Generelle Prinzipien**

## Generelle Prinzipien

In diesem Abschnitt werden allgemeingültige Funktionsmerkmale des TI-Flow-Fachdienst und seinen Schnittstellen beschrieben.

### RESTful API

Der TI-Flow-Fachdienst MUSS seine Schnittstellen für alle Zugriffe auf alle Datenobjekte und alle Ressourcen in einer RESTful API gemäß der FHIR-Spezifikation in http://hl7.org/fhir/http.html der Version v4.0.1 R4 umsetzen.

Der TI-Flow-Fachdienst MUSS in seinen Schnittstellen für die Zugriffe durch Leistungserbringer und Leistungserbringerinstitutionen standardmäßig den MimeType application/fhir+xml akzeptieren und in Responses verwenden.

Der TI-Flow-Fachdienst MUSS in seinen Schnittstellen für die Zugriffe durch Versicherte standardmäßig den MimeType application/fhir+json akzeptieren und in Responses verwenden.

Der TI-Flow-Fachdienst MUSS in seinen Schnittstellen einen von der Standardfestlegung abweichenden MimeType umsetzen, wenn der jeweilige Client eine entsprechende Anforderung in der Aufrufschnittstelle über den URL-Parameter _format=fhir+xml bzw. _format=fhir+json gemäß http://hl7.org/fhir/http.html#general oder mittels des Accept-Attributs im HTTP-Request-Header als application/fhir+xml bzw. application/fhir+json anfordert, damit Clientsysteme ein für sie leichter verarbeitbares Format in der Antwort erhalten können.

Der TI-Flow-Fachdienst MUSS an seinen Schnittstellen eine http-GET-Operation auf den Endpunkt /metadata erlauben, in welcher er ein CapabilityStatement gemäß https://www.hl7.org/fhir/capabilitystatement.html veröffentlicht, welches die vom TI-Flow-Fachdienst verarbeiteten Ressourcen mit den zugehörigen http-Operationen der angebotenen REST-Schnittstelle auflistet:
* Task – GET-, POST-Operation, FHIR-Operations für die Workflow-Steuerung und Einsicht durch den Versicherten 
* MedicationDispense – GET-Operation für das Einsehen der Medikamentinformationen durch den Versicherten 
* Communication – GET-, POST, DELETE-Operation für das Senden, Empfangen und Löschen von Nachrichten 
* AuditEvent – GET-Operation für die Einsicht in Protokolleinträge durch den Versicherten 
* Device – GET-Operation mit statischen Informationen zur serverseitigen Signatur damit der Client eine Information über die FHIR-Kompatibilität zum Fachdienst erhält.

### E-Rezept ID

Die E-Rezept-ID wird durch den TI-Flow-Fachdienst beim Anlegen eines Tasks für den Workflow des E-Rezepts erstellt.

Der TI-Flow-Fachdienst MUSS E-Rezept-IDs erzeugen und verwalten, welche der Syntax "aaa.bbb.bbb.bbb.bbb.cc" und der folgenden Semantik genügen

| | | |
| :--- | :--- | :--- |
| aaa | E-Rezept-Typ | alphanummerisch, mit der Belegung gemäß "flowType" in[https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType](https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType) |
| bbb.bbb.bbb.bbb | fortlaufende Rezeptnummer | nummerisch, 12-stellig |
| cc | Prüfnummer Verfahren gemäß [ISO 7064] | nummerisch |
damit Tippfehler in der manuellen Erfassung erkannt werden können und die E-Rezept-ID über 11 Jahre eine eineindeutige Zuordnung zwischen allen Datenobjekten im E-Rezept-Workflow erlaubt.

Alle Produkttypen, die eine E-Rezept-ID aus externen Systemen einlesen oder von Benutzern entgegen nehmen, MÜSSEN die E-Rezept-ID gegen ihre Prüfziffer nach dem Modulo-97-Verfahren gemäß [ISO 7064] prüfen und bei Ungültigkeit die Weiterverarbeitung verhindern, damit Benutzerfehleingaben vor der Verarbeitung erkannt werden.
### Verarbeitung von Datensätzen

Es gelten folgende Anforderungen und Vorgaben zur Verarbeitung und Interpretation von Zeichen- und Datensätzen im TI-Flow-Fachdienst.

Für die Kommunikation und die Interoperabilität müssen bezüglich Datensätzen einheitliche Vorgaben gelten. Laut FHIR Spezifikation wird für XML und JSON Datensätze das Character Encoding “UTF-8” vorgegeben. Byte Order Marks (BOM) werden nicht angeben.

Der TI-Flow-Fachdienst MUSS beim Verarbeiten von PKCS#7 Enveloping-Daten die Anforderungen zur Verarbeitung von Datensätzen im TI-Flow-Fachdienst anwenden.

Der E‑Rezept‑Fachdienst MUSS eingehende Datensätze strikt als UTF‑8 ohne Byte Order Mark (BOM) decodieren und bei fehlgeschlagener Decodierung oder beim Vorhandensein eines BOM die Verarbeitung mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_BOM_DETECTED
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen.

Clientsysteme des TI-Flow-Fachdienstes MÜSSEN für die Kommunikation mit dem TI-Flow-Fachdienst ausschließlich das Character Encoding UTF-8 verwenden.

Clientsysteme des TI-Flow-Fachdienstes DÜRFEN für die Kommunikation mit dem TI-Flow-Fachdienst in Datensätzen ein Byte Order Mark (BOM) NICHT angeben.
### Verarbeitung von FHIR Ressourcen

#### Verarbeitung von Datumsangaben

In der Verarbeitung der FHIR-Ressourcen ist es wichtig, dass Datums- und Zeitangaben konsistent und eindeutig interpretiert werden.

Aufgrund der Profilierung einiger Datenfelder kommt es vor, dass keine Zeitzoneninformation im Datum enthalten ist. Diese Zeitangaben sollen gemäß der zum jeweiligen Datum gültigen deutschen Zeit (CET/CEST) interpretiert werden. Diese Regelung stellt sicher, dass alle beteiligten Systeme einheitlich und korrekt mit Datums- und Zeitangaben umgehen, unabhängig davon, ob die Angaben in der Vergangenheit oder Gegenwart liegen.

Clientsysteme des TI-Flow-Fachdienstes MÜSSEN bei der Verarbeitung von FHIR-Ressourcen der Anwendung E-Rezept sicherstellen, dass Datumsangaben ohne explizite Zeitzoneninformationen gemäß der zum jeweiligen Datum gültigen deutschen Zeit (CET/CEST) verarbeitet werden.

