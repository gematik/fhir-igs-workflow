# Anforderungen an den verordnende Primärsystem für die $create-Operation - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v0.9.0

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* [**Operation: $create**](op-create.md)
* **Anforderungen an den verordnende Primärsystem für die $create-Operation**

## Anforderungen an den verordnende Primärsystem für die $create-Operation

Diese Seite enthält die normativen Anforderungen an ein PVS für die Operation `$create`.

### Anforderungen aus der Core Spezifikation

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

Für die qualifizierte elektronische Signatur des Verordnungsbundels wird der Konnektor verwendet. Es wird eine CMS-Signatur (CAdES) erstellt. Die Operation für die QES muss durch den Leistungserbringer durchgeführt werden.

Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden erstellen" für das E-Rezept die Signaturoperation des Konnektors mit
* der Referenz RFC-5652 für CMS-Signatur (CAdES)
* Signaturtype für eine enveloping Signature
* dem base64-codierten E-Rezept-Bundle
* eingebetteter OCSP-Antwort (IncludeRevocationInfo = true)
* Angabe des Mimetypes "text/plain; charset=utf-8"
ausführen.
Für weitere Informationen siehe Operation “E-Rezept qualifiziert signieren” aus der API-Schnittstelle [E-Rezept API Dokumentation].

Das PS der verordnenden LEI MUSS muss die Erstellung der E-Rezepte mittels Einzelsignatur, Stapelsignatur und Komfortsignatur des Konnektors unterstützen.

Für die Nutzung der Komfortsignatur siehe [gemILF_PS].

Falls keine Komfortsignatur zur Verfügung steht oder die Komfortsignatur deaktiviert ist, soll das PS der verordnenden LEI die Stapelsignatur verwenden ist, falls mehrere E-Rezepte signiert werden sollen. 

### Modulspezifische Anforderungen

Zur Verordnung von DiGAs werden die DiGA-FHIR-Profile der KBV genutzt: https://simplifier.net/evdga.

Das PS der verordnenden LEI darf FHIR-Extensions nicht im Verordnungsdatensatz verwenden, die nicht explizit gemäß KBV-Profilversion “kbv.itv.evdga” beschrieben sind.

Das PS der verordnenden LEI DARF bei der Verordnung einer DiGA zu Lasten einer Berufsgenossenschaft oder Unfallkasse NICHT die elektronische Verordnung nutzen.
Das PS der verordnenden LEI DARF bei der Verordnung einer DiGA NICHT eine Mehrfachverordnung erstellen.

Das PS der verordnenden LEI MUSS im Anwendungsfall “E-Rezept durch Verordnenden erstellen” beim Verordnen einer DiGA die HTTP-Operation POST /Task/$create mit Parameter FlowType = 162 ausführen.

