# Server Anforderungen: Zugriffsberechtigung erstellen - TIFlow - Grenzüberschreitender Datenaustausch v0.9.0

TIFlow - Grenzüberschreitender Datenaustausch

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation API: Zugriffsberechtigung erstellen**](op-grant-eu-access-permission.md)
* **Server Anforderungen: Zugriffsberechtigung erstellen**

## Server Anforderungen: Zugriffsberechtigung erstellen

### Anforderungen der Schnittstelle aus diesem Modul

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /$grant-eu-access-permission die Rolle professionOID des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am E-Rezept-Fachdienst aufrufen dürfen, damit eine Zugriffsberechtigte nicht durch Unberechtigte erteilt werden kann.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /$grant-eu-access-permission die KVNR des Versicherten im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ein Consent-Datensatz mit Consent.patient.identifier = KVNR und Consent.category.coding.code = EUDISPCONS existiert und bei fehlgeschlagener Prüfung die Operation mit dem HTTP-Fehlercode 403 und dem OperationOutcome "Das Erstellen einer Zugriffsberechtigung ist erst zulässig, wenn eine Einwilligung durch den Nutzer zum Einlösen von E-Rezepten im europäischen Ausland erteilt wurde." abbrechen, damit nur Versicherte eine Zugriffsberechtigung schreiben, die eine Einwilligung erteilt haben.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /$grant-eu-access-permission prüfen, dass der im Request übermittelte Ländercode (Parameters.parameter:countryCode) einem Land entspricht, welches die Anwendung ePrescription/eDispensation Szenario Land A unterstützt und bei fehlschlagender Prüfung die Operation mit dem HTTP-Fehlercode 409 und dem OperationOutcome "Für das angefragte Land ist Einlösen von E-Rezepten nicht möglich." abbrechen, damit der Versicherte nur für zulässige europäische Länder eine Zugriffsberechtigung erteilt.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /$grant-eu-access-permission prüfen, dass der im Request übermittelte Zugriffscode (Parameters.parameter:accessCode) das korrekte Format hat und bei fehlschlagender Prüfung die Operation mit dem HTTP-Fehlercode 400 und dem OperationOutcome "Der übermittelte Zugriffscode ist nicht zulässig." abbrechen.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /$grant-eu-access-permission prüfen, ob für die im Request übermittelte KVNR Zugriffsberechtigungen gespeichert sind und falls ja, diese löschen.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /$grant-eu-access-permission mit dem im Request übermittelten KVNR, Zugriffscode und Ländercode eine neue Zugriffsberechtigung speichern und den Wert valid_until auf aktuellen Zeitpunkt + 1h setzen.

Der E-Rezept-Fachdienst MUSS im Response zu einem Aufruf der HTTP-POST-Operation auf den Endpunkt /$grant-eu-access-permission eine Ressource des Profils [GEM_ERP_PR_PAR_EU_Access_Authorization_Response] mit den Daten des gespeicherten Datensatz zur Zugriffsberechtigung übermitteln.

Der E-Rezept-Fachdienst MUSS periodisch prüfen, dass keine zeitlich ungültigen Zugriffsberechtigungen gespeichert sind.

