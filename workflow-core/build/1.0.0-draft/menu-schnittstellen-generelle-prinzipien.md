# Generelle Prinzipien - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **Generelle Prinzipien**

## Generelle Prinzipien

In diesem Abschnitt werden allgemeingültige Funktionsmerkmale des E-Rezept-Fachdienst und seinen Schnittstellen beschrieben.

### RESTful API

Der E-Rezept-Fachdienst MUSS seine Schnittstellen für alle Zugriffe auf alle Datenobjekte und alle Ressourcen in einer RESTful API gemäß der FHIR-Spezifikation in http://hl7.org/fhir/http.html der Version v4.0.1 R4 umsetzen.

Der E-Rezept-Fachdienst MUSS in seinen Schnittstellen für die Zugriffe durch Leistungserbringer und Leistungserbringerinstitutionen standardmäßig den MimeType application/fhir+xml akzeptieren und in Responses verwenden.

Der E-Rezept-Fachdienst MUSS in seinen Schnittstellen für die Zugriffe durch Versicherte standardmäßig den MimeType application/fhir+json akzeptieren und in Responses verwenden.

Der E-Rezept-Fachdienst MUSS in seinen Schnittstellen einen von der Standardfestlegung abweichenden MimeType umsetzen, wenn der jeweilige Client eine entsprechende Anforderung in der Aufrufschnittstelle über den URL-Parameter _format=fhir+xml bzw. _format=fhir+json gemäß http://hl7.org/fhir/http.html#general oder mittels des Accept-Attributs im HTTP-Request-Header als application/fhir+xml bzw. application/fhir+json anfordert, damit Clientsysteme ein für sie leichter verarbeitbares Format in der Antwort erhalten können.

Der E-Rezept-Fachdienst MUSS an seinen Schnittstellen eine http-GET-Operation auf den Endpunkt /metadata erlauben, in welcher er ein CapabilityStatement gemäß https://www.hl7.org/fhir/capabilitystatement.html veröffentlicht, welches die vom E-Rezept-Fachdienst verarbeiteten Ressourcen mit den zugehörigen http-Operationen der angebotenen REST-Schnittstelle auflistet:
* Task – GET-, POST-Operation, FHIR-Operations für die Workflow-Steuerung und Einsicht durch den Versicherten 
* MedicationDispense – GET-Operation für das Einsehen der Medikamentinformationen durch den Versicherten 
* Communication – GET-, POST, DELETE-Operation für das Senden, Empfangen und Löschen von Nachrichten 
* AuditEvent – GET-Operation für die Einsicht in Protokolleinträge durch den Versicherten 
* Device – GET-Operation mit statischen Informationen zur serverseitigen Signatur damit der Client eine Information über die FHIR-Kompatibilität zum Fachdienst erhält.

### E-Rezept ID

Die E-Rezept-ID wird durch den E-Rezept-Fachdienst beim Anlegen eines Tasks für den Workflow des E-Rezepts erstellt.

Der E-Rezept-Fachdienst MUSS E-Rezept-IDs erzeugen und verwalten, welche der Syntax "aaa.bbb.bbb.bbb.bbb.cc" und der folgenden Semantik genügen

| | | |
| :--- | :--- | :--- |
| aaa | E-Rezept-Typ | alphanummerisch, mit der Belegung gemäß "flowType" in[https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType](https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType) |
| bbb.bbb.bbb.bbb | fortlaufende Rezeptnummer | nummerisch, 12-stellig |
| cc | Prüfnummer Verfahren gemäß [ISO 7064] | nummerisch |
damit Tippfehler in der manuellen Erfassung erkannt werden können und die E-Rezept-ID über 11 Jahre eine eineindeutige Zuordnung zwischen allen Datenobjekten im E-Rezept-Workflow erlaubt.

Alle Produkttypen, die eine E-Rezept-ID aus externen Systemen einlesen oder von Benutzern entgegen nehmen, MÜSSEN die E-Rezept-ID gegen ihre Prüfziffer nach dem Modulo-97-Verfahren gemäß [ISO 7064] prüfen und bei Ungültigkeit die Weiterverarbeitung verhindern, damit Benutzerfehleingaben vor der Verarbeitung erkannt werden.

