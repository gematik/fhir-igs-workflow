# Zulässige europäische Länder - E-Rezept Workflow EU v1.0.1

E-Rezept Workflow EU

Version 1.0.1 - release 

* [**Table of Contents**](toc.md)
* [**Technische Umsetzung - Systemüberblick**](menu-technische-umsetzung-systemueberblick.md)
* **Zulässige europäische Länder**

## Zulässige europäische Länder

Um zu bestimmen, welche europäischen Länder das die Anwendung ePrescription/eDispensation Szenario Land A unterstützen, lädt der E-Rezept-Fachdienst die Liste dieser Länder aus dem FHIR-VZD. Die Liste kann für 96h gecacht werden.

Der Ablauf der Authentisierung und Suche ist in [gemSpec_VZD_FHIR_Directory]#AF_10403 Fachdienst sucht Einträge im FHIR-Directory beschrieben. Der Betreiber des E-Rezept-Fachdienst muss beim FHIR-VZD Anbieter für den Zugriff auf den FHIR-VZD nach [gemSpec_VZD_FHIR_Directory]#Nutzer und Rollen registrieren.

Der E-Rezept-Fachdienst MUSS die Liste aller zulässigen Länder aus dem Verzeichnisdienst ermitteln, indem an den Verzeichnisdienst folgende Abfrage gestellt wird: Abfrage der Ressource "HealthcareService", HealthcareServices, deren Speciality "57833-6" aus https://loinc.org enthalten, HealthcareServices, deren Organisation aktiv sind, HealthcareServices, deren Organisation den OrganizationProfessionOIDType "1.2.276.0.76.4.292" entspricht, Einbeziehen der Organisation in das Rückgabeergebnis.

Der E-Rezept-Fachdienst DARF NICHT Informationen zur Liste zulässiger Länder verwenden, welche länger als 96h lokal durch den E-Rezept-Fachdienst gecacht wurden.

