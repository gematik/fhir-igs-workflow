# Client-Anforderungen $create - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $create (Task erzeugen)**](op-create.md)
* **Client-Anforderungen $create**

## Client-Anforderungen $create

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an das PVS für die Nutzung der Operation `$create`.

Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden erstellen" eine Bundle-FHIR-Ressource gemäß Profilierung https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle Rezept-ID aus der Task-Ressource als Identifier erstellen.
Dieses Bundle wird in diesem Dokument als E-Rezept-Bundle bezeichnet. Ein E-Rezept-Bundle enthält genau eine Verordnungszeile.

Das PS der verordnenden LEI darf FHIR-Extensions nicht im Verordnungsdatensatz verwenden, die nicht explizit gemäß KBV-Profilversion “kbv.ita.erp” bzw. “kbv.itv.evdga” beschrieben sind.

Das PS der verordnenden LEI MUSS sicherstellen, dass das Datum authoredOn des Verordnungsdatensatzes dem Datum in QES.Erstellung im Signaturobjekt entspricht.
Es gelten weitere modulspezifische Anforderungen für den Verordnungsdatensatz.

Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden erstellen" für das E-Rezept die HTTP-Operation POST /Task/$create mit
* ACCESS_TOKEN im Authorization-Header
* Rezept-Typ im FlowType als Parameter der FHIR-Operation $create für Task 
ausführen.
Für weitere Informationen siehe Operation “E-Rezept erstellen” aus der API-Schnittstelle [E-Rezept API Dokumentation].

Der Value-Katalog für FlowType ist in [gemSpec_DM_eRp] beschrieben.

Der Response des Fachdienstes liefert

* die Rezept-ID (Task.Identifier mit “https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PrescriptionId”), mit der das E-Rezept-Bundle vervollständigt wird,
* die Task-ID (Task.id), mit dem der Task bei Aufrufen des E-Rezept-Fachdienstes referenziert wird,
* und den AccessCode (Task.Identifier mit “https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_AccessCode”), welcher für den Zugriff auf das E-Rezept im Fachdienst berechtigt

Hinweis: Die Task-ID entspricht der Rezept-ID.

