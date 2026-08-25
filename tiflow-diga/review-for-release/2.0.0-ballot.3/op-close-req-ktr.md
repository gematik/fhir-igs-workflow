# Anforderungen an das Clientsystem des Kostenträger für die $close-Operation - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* [**Operation: $close**](op-close.md)
* **Anforderungen an das Clientsystem des Kostenträger für die $close-Operation**

## Anforderungen an das Clientsystem des Kostenträger für die $close-Operation

Diese Seite enthält die normativen Anforderungen an ein Clientsystem des Kostenträgers für die Operation `$close`.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-operation-api.html)

### Modulspezifische Anforderungen

funkt. Eignung: KonformitätsbestätigungDas Clientsystem des Kostenträgers MUSS im Anwendungsfall "Quittung abrufen" eine FHIR-Ressource mit dem Profil GEM_ERP_PR_MedicationDispense_DiGA erstellen.

