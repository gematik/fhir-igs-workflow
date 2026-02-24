# Client-Anforderungen $create - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $create (Task erzeugen)**](op-create.md)
* **Client-Anforderungen $create**

## Client-Anforderungen $create

Diese Seite enthält die normativen Anforderungen an den Client des E-Rezept-Fachdienst für die Operation `$create`. Es gelten weiterhin die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/1.0.0/op-create-client-requirements.html).

Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden erstellen" eine Bundle-FHIR-Ressource gemäß Profilierung https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle Rezept-ID aus der Task-Ressource als Identifier erstellen.

