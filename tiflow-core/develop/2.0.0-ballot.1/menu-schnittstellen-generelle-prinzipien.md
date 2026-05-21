# Generelle Prinzipien - TIFlow - Kernfunktionalitäten v2.0.0-ballot.1

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* **Generelle Prinzipien**

## Generelle Prinzipien

In diesem Abschnitt werden allgemeingültige Funktionsmerkmale des TI-Flow-Fachdienst und seinen Schnittstellen beschrieben.

### Implementierung der Eingansprüfungen für Operationen

Im Rahmen von Operationaufrufen von Clientsystemen führt der TI-Flow-Fachdienst verschiedene Prüfungen durch, bevor der Zugriff auf die Daten erfolgt.

funkt. Eignung: HerstellererklärungDer TI-Flow-Fachdienst MUSS die Prüfungen in der folgenden Reihenfolge durchführen:
1. Prüfung zur Autorisierung
1. Prüfung Pre-condition
1. falls Eingangsparameter mit FHIR-Artefakten: FHIR-Validität prüfen
1. falls Eingangsartefakt signiert: Signaturprüfung
1. Prüfung von Business-Rules

* Prüfung: Prüfung zur Autorisierung
  * Beispiele: Rollenprüfung, Prüfung accesscode/secret
* Prüfung: Prüfung Pre-condition
  * Beispiele: Status des Task
* Prüfung: FHIR-Validität prüfen
  * Beispiele: Prüfen des Datensatzes gegen das Profil "GEM_ERP_PR_MedicationDispense
* Prüfung: Signaturprüfung
  * Beispiele: QES Prüfung bei Einstellen einer Verordnung
* Prüfung: Prüfung von Business-Rules
  * Beispiele: MVO Parameter, PZN Format

**Tabelle: **Beispiele für Prüfungen am TI-Flow-Fachdienst

Die konkret durchzuführenden Prüfungen sind als Anforderung für jede Operation spezifiziert.

### RESTful API

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS seine Schnittstellen für alle Zugriffe auf alle Datenobjekte und alle Ressourcen in einer RESTful API gemäß der FHIR-Spezifikation in http://hl7.org/fhir/http.html der Version v4.0.1 R4 umsetzen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS in seinen Schnittstellen für die Zugriffe durch Leistungserbringer und Leistungserbringerinstitutionen standardmäßig den MimeType application/fhir+xml akzeptieren und in Responses verwenden.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS in seinen Schnittstellen für die Zugriffe durch Versicherte standardmäßig den MimeType application/fhir+json akzeptieren und in Responses verwenden.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS in seinen Schnittstellen einen von der Standardfestlegung abweichenden MimeType umsetzen, wenn der jeweilige Client eine entsprechende Anforderung in der Aufrufschnittstelle über den URL-Parameter _format=fhir+xml bzw. _format=fhir+json gemäß http://hl7.org/fhir/http.html#general oder mittels des Accept-Attributs im HTTP-Request-Header als application/fhir+xml bzw. application/fhir+json anfordert, damit Clientsysteme ein für sie leichter verarbeitbares Format in der Antwort erhalten können.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS an seinen Schnittstellen eine http-GET-Operation auf den Endpunkt /metadata erlauben, in welcher er ein Capability Statement gemäß https://www.hl7.org/fhir/capabilitystatement.html veröffentlicht, welches die vom TI-Flow-Fachdienst verarbeiteten Ressourcen mit den zugehörigen http-Operationen der angebotenen REST-Schnittstelle auflistet:
* Task - GET-, POST-Operation, FHIR-Operations für die Workflow-Steuerung und Einsicht durch den Versicherten 
* MedicationDispense - GET-Operation für das Einsehen der Medikamentinformationen durch den Versicherten 
* Communication - GET-, POST, DELETE-Operation für das Senden, Empfangen und Löschen von Nachrichten 
* AuditEvent - GET-Operation für die Einsicht in Protokolleinträge durch den Versicherten 
* Device - GET-Operation mit statischen Informationen zur serverseitigen Signatur damit der Client eine Information über die FHIR-Kompatibilität zum Fachdienst erhält.

### Verordnungs-ID

Die Verordnungs-ID wird durch den TI-Flow-Fachdienst beim Anlegen eines Tasks für den Workflow der Verordnung erstellt.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS Verordnungs-IDs erzeugen und verwalten, welche der Syntax "aaa.bbb.bbb.bbb.bbb.cc" und der folgenden Semantik genügen

| | | |
| :--- | :--- | :--- |
| aaa | Workflow-Typ | alphanummerisch, mit der Belegung gemäß "flowType" in[https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType](https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType) |
| bbb.bbb.bbb.bbb | fortlaufende Nummer | nummerisch, 12-stellig |
| cc | Prüfnummer Verfahren gemäß [ISO 7064] | nummerisch |
damit Tippfehler in der manuellen Erfassung erkannt werden können und die Verordnungs-ID über 11 Jahre eine eineindeutige Zuordnung zwischen allen Datenobjekten im Workflow erlaubt.

funkt. Eignung: Test Produkt/FAAlle Produkttypen, die eine Verordnungs-ID aus externen Systemen einlesen oder von Benutzern entgegen nehmen, MÜSSEN die Verordnungs-ID gegen ihre Prüfziffer nach dem Modulo-97-Verfahren gemäß [ISO 7064] prüfen und bei Ungültigkeit die Weiterverarbeitung verhindern, damit Benutzerfehleingaben vor der Verarbeitung erkannt werden.
### Verarbeitung von Datensätzen

Es gelten folgende Anforderungen und Vorgaben zur Verarbeitung und Interpretation von Zeichen- und Datensätzen im TI-Flow-Fachdienst.

Für die Kommunikation und die Interoperabilität müssen bezüglich Datensätzen einheitliche Vorgaben gelten. Laut FHIR Spezifikation wird für XML und JSON Datensätze das Character Encoding “UTF-8” vorgegeben. Byte Order Marks (BOM) werden nicht angeben.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Verarbeiten von PKCS#7 Enveloping-Daten die Anforderungen zur Verarbeitung von Datensätzen im TI-Flow-Fachdienst anwenden.

funkt. Eignung: Test Produkt/FADer TI‑Flow‑Fachdienst MUSS eingehende Datensätze strikt als UTF‑8 ohne Byte Order Mark (BOM) decodieren und bei fehlgeschlagener Decodierung oder beim Vorhandensein eines BOM die Verarbeitung mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_BOM_DETECTED
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen.

funkt. Eignung: Konformitätsbestätigung

funkt. Eignung: Konformitätsbestätigung

funkt. Eignung: Konformitätsbestätigung

funkt. Eignung: Test Produkt/FA

funkt. Eignung: Test Produkt/FAClientsysteme des TI-Flow-Fachdienstes MÜSSEN für die Kommunikation mit dem TI-Flow-Fachdienst ausschließlich das Character Encoding UTF-8 verwenden.

funkt. Eignung: Konformitätsbestätigung

funkt. Eignung: Konformitätsbestätigung

funkt. Eignung: Konformitätsbestätigung

funkt. Eignung: Test Produkt/FA

funkt. Eignung: Test Produkt/FAClientsysteme des TI-Flow-Fachdienstes DÜRFEN für die Kommunikation mit dem TI-Flow-Fachdienst in Datensätzen ein Byte Order Mark (BOM) NICHT angeben.
### Verarbeitung von FHIR Ressourcen

#### Verarbeitung von Datumsangaben

In der Verarbeitung der FHIR-Ressourcen ist es wichtig, dass Datums- und Zeitangaben konsistent und eindeutig interpretiert werden.

Aufgrund der Profilierung einiger Datenfelder kommt es vor, dass keine Zeitzoneninformation im Datum enthalten ist. Diese Zeitangaben sollen gemäß der zum jeweiligen Datum gültigen deutschen Zeit (CET/CEST) interpretiert werden. Diese Regelung stellt sicher, dass alle beteiligten Systeme einheitlich und korrekt mit Datums- und Zeitangaben umgehen, unabhängig davon, ob die Angaben in der Vergangenheit oder Gegenwart liegen.

funkt. Eignung: Herstellererklärung

funkt. Eignung: Herstellererklärung

funkt. Eignung: Herstellererklärung

funkt. Eignung: Herstellererklärung

funkt. Eignung: HerstellererklärungClientsysteme des TI-Flow-Fachdienstes MÜSSEN bei der Verarbeitung von FHIR-Ressourcen der Anwendung E-Rezept sicherstellen, dass Datumsangaben ohne explizite Zeitzoneninformationen gemäß der zum jeweiligen Datum gültigen deutschen Zeit (CET/CEST) verarbeitet werden.
### Identifikation des Nutzers

Im Rahmen des Verbindungsaufbaus eines Clientsystems mit dem TI-Flow-Fachdienst authentisiert sich der Nutzer. Der ZETA-Guard übermittelt die Informationen zum Nutzer in einem Http-Header im Request an den Resource Server (siehe [gemSpec_ZETA#A_25669-*]).

Folgende Informationen sind im Header enthalten. (siehe [zeta-user-info.yaml]) 

* Attribut: identifier
  * Beschreibung: Telematik-ID, KVNR or other unique identifier
  * optional: nein
* Attribut: professionOID
  * Beschreibung: Profession identifier (OID)
  * optional: nein
* Attribut: commonName
  * Beschreibung: Kurzname der Institution
  * optional: nein
* Attribut: organizationName
  * Beschreibung: Name der Organisation oder Institution
  * optional: ja

**Tabelle: **Attribute zeta-user-info

funkt. Eignung: HerstellererklärungDer TI-Flow-Fachdienst MUSS den Http-Header zeta-user-info auswerten, um die Informationen zum Nutzer für die weitere Verarbeitung zu ermitteln.
Die Information zum aufrufenden Nutzer/Institution wird bspw. bei der Prüfung von Autorisierungsregeln (Prüfung der professionOID) und bei der Zugriffsprotokollierung für den Versicherten verwendet.

