# FD-Anforderungen: Abgabe von E-Rezepten im EU-Ausland - EU Zugriff E-Rezept v1.0.1

EU Zugriff E-Rezept

Version 1.0.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation API: Abgabe von E-Rezepten im EU-Ausland**](op-eu-close.md)
* **FD-Anforderungen: Abgabe von E-Rezepten im EU-Ausland**

## FD-Anforderungen: Abgabe von E-Rezepten im EU-Ausland

### Anforderungen der Schnittstelle aus diesem Modul

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /Task/<id>/$eu-close sicherstellen, dass ausschließlich Nutzer in der Rolle: oid_ncpeh, die Operation am Fachdienst aufrufen dürfen und die Rolle professionOID des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader Authorization feststellen, damit der E-Rezept-Workflow nicht durch einen Unberechtigten abgeschlossen werden kann.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /Task/<id>/$eu-close durch den NCPeH-FD das im http-Body des Requests enthaltene Parameter-Objekt gegen das Profil [GEM_ERP_PR_PAR_EU_CloseOperation_Input] prüfen und im Fehlerfall die Operation mit HTTP-Fehlercode 400 abbrechen.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /Task/<id>/$eu-close durch den NCPeH-FD sicherstellen, dass für die in Parameters.parameter:requestData.part:kvnr übermittelte KVNR ein Consent-Datensatz mit Consent.patient.identifier = KVNR und Consent.category.coding.code = EUDISPCONS existiert und bei fehlgeschlagener Prüfung die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit nur Dispensierinformationen für Versicherte übermittelt werden, die eine Einwilligung erteilt haben.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /Task/<id>/$eu-close durch den NCPeH-FD sicherstellen, dass zu dem in Parameters.parameter:requestData.part:kvnr, Parameters.parameter:requestData.part:accessCode und Parameters.parameter:requestData.part:countryCode übermittelte Tripple von KVNR, Zugriffs- und Ländercode eine zeitliche gültige Zugriffsberechtigung im E-Rezept-Fachdienst existiert und bei fehlgeschlagener Prüfung die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit nur Dispensierinformationen übermittelt werden, wenn eine gültige Zugriffsberechtigung vorliegt.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /Task/<id>/$eu-close durch den NCPeH-FD sicherstellen, dass Task.status = in-progress ist und bei Ungleichheit mit dem HTTP-Fehlercode 403 abbrechen.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /Task/<id>/$eu-close durch den NCPeH-FD sicherstellen, dass der Zeitpunkt des Aufrufes in Task.extension:lastMedicationDispense im Format "YYYY-MM-DDThh:mm:ss+zz:zz" (FHIR-instant) angelegt und gespeichert wird.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /Task/<id>/$eu-close durch den NCPeH-FD sicherstellen, dass die zulässige Beendigung eines übermittelten Tasks im Status Task.status = completed vollzogen wird, damit der Workflow für den Versicherten als beendet und das E-Rezept somit als eingelöst dargestellt wird.

