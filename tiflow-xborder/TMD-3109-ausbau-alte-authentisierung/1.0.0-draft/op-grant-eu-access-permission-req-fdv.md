# FdV-Anforderungen: Zugriffsberechtigung erstellen - TIFlow - Grenzüberschreitender Datenaustausch v1.0.0-draft

TIFlow - Grenzüberschreitender Datenaustausch

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation API: Zugriffsberechtigung erstellen**](op-grant-eu-access-permission.md)
* **FdV-Anforderungen: Zugriffsberechtigung erstellen**

## FdV-Anforderungen: Zugriffsberechtigung erstellen

Diese Seite beschreibt Anforderungen für das E-Rezept-FdV zur Nutzung des `$grant-eu-access-permission`-Endpunktes.

Um zu bestimmen, welche europäischen Länder die Anwendung ePrescription/eDispensation Szenario Land A unterstützen, lädt der E-Rezept-FdV die Liste dieser Länder aus dem FHIR-VZD. Die Liste kann für 96h gecacht werden.

Das E-Rezept-FdV MUSS Anwendungsfall "Zugriffsberechtigung erteilen" die Liste aller zulässigen Länder aus dem Verzeichnisdienst ermitteln, indem an den Verzeichnisdienst folgende Abfrage gestellt wird:
* Abfrage der Ressource "HealthcareService"
* HealthcareServices, deren Speciality "57833-6" aus https://loinc.org enthalten
* HealthcareServices, deren Organisation aktiv sind
* HealthcareServices, deren Organisation den OrganizationProfessionOIDType "1.2.276.0.76.4.292" entspricht
* Einbeziehen der Organisation in das Rückgabeergebnis

Das E-Rezept-FdV DARF NICHT Informationen zur Liste zulässiger Länder verwenden, welche länger als 96h lokal durch das E-Rezept-FdV gecacht wurden.

Das E-Rezept-FdV MUSS im Anwendungsfall "Zugriffsberechtigung erteilen" es dem Nutzer ermöglichen, ein Land aus der Liste der zulässigen Länder auszuwählen, für das der Nutzer die Zugriffsberechtigung erteilen möchte.

Das E-Rezept-FdV MUSS im Anwendungsfall "Zugriffsberechtigung" einen eigens generierten Zugriffscode als Zufallswert erzeugen.
Das Format für den Zugriffscode ist in [gemSpec_DM_eRp#A_27097-*] beschrieben. Für jede weitere Erteilung einer Zugriffsberechtigung für ePrescription/Dispensation Szenario Land A muss ein neuer Zugriffscode erzeugt werden.

Das E-Rezept-FdV MUSS im Anwendungsfall "Zugriffsberechtigung erteilen" zum Speichern der Information am TI-Flow-Fachdienst die HTTP-Operation POST /$grant-eu-access-permission mit:
* ACCESS_TOKEN im Authorization-Header
* Organization.extension:ncpehCountryEx.valueCodeableConcept.coding.code des vom Nutzer ausgewählten Landes in Parameters.parameter:countryCode
* erzeugter Zugriffscode in Parameters.parameter:accessCode
ausführen.
Im Response übermittelt der TI-Flow-Fachdienst in Parameters.parameter:validUntil die Gültigkeitsdauer der Zugriffsberechtigung.

