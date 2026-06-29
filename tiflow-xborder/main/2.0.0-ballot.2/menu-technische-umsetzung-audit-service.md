# Zugriffsprotokollierung mit AuditEvent - Implementation Guide TIFlow - Grenzüberschreitender Datenaustausch v2.0.0-ballot.2

Implementation Guide

TIFlow - Grenzüberschreitender Datenaustausch

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**Technisches Konzept**](menu-technische-umsetzung-konzept.md)
* **Zugriffsprotokollierung mit AuditEvent**

## Zugriffsprotokollierung mit AuditEvent

### Zugriffsprotokoll für den Versicherten

Der TI-Flow-Fachdienst führt Zugriffsprotokolle für Versicherte, in denen alle Zugriffe auf die personenbezogenen und medizinischen Daten eines Versicherten für den Versicherten einsehbar sind. Weitere Details sind in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir//audit-service.html) zu finden, und unten sind die modulspezifischen Anforderungen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS jeden Aufruf von Operationen gemäß "TAB_EU_004 Versichertenprotokoll" protokollieren und die gelesene bzw. geschriebene Ressource im Protokolleintrag AuditEvent.entity.what als Referenz hinzufügen sowie die KVNR des betroffenen Versicherten in AuditEvent.entity.name speichern. Mit diesen Informationen kann der Versicherte die Zugriffe auf seine Daten nachvollziehen und bei einem unberechtigten Zugriff ggf. intervenieren.

* Operation: http POST /rx/fhir/Task/<id>/$eu-close
  * Rolle des zugreifenden Nutzers: NCPeH-FD
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Der Parameters.parameter:requestData.part:practitionerRole Parameters.parameter:requestData.part:practitionerName hat in Parameters.parameter:requestData.part:healthcare-facility-type Parameters.parameter:requestData.part:pointOfCare in Land B (Klartext aus: Parameters.parameter:requestData.part:countryCode) Ihr E-Rezept eingelöst.
* Operation: http PATCH /rx/fhir/Task/<id>
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter hat Markierung zu Einlösung im EU Ausland gespeichert
* Operation: http POST /rx/fhir/$grant-eu-access-permission
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter hat eine Zugriffsberechtigung zum Einlösen von E-Rezepten für das Land "Land B" erteilt.
* Operation: http DELETE /rx/fhir/$revoke-eu-access-permission
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter hat die Zugriffsberechtigung zum Einlösen von E-Rezepten für das Land "Land B" widerrufen.
* Operation: POST /rx/fhir/$get-eu-prescriptionsParameters.parameter:requestData.part:requesttype = demographics
  * Rolle des zugreifenden Nutzers: NCPeH-FD
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Der Parameters.parameter:requestData.part:practitionerRole Parameters.parameter:requestData.part:practitionerName hat in Parameters.parameter:requestData.part:healthcare-facility-type Parameters.parameter:requestData.part:pointOfCare in Land B (Klartext aus: Parameters.parameter:requestData.part:countryCode) Ihre Patientendaten abgerufen.
* Operation: POST /rx/fhir/$get-eu-prescriptionsParameters.parameter:requestData.part:requesttype = e-prescriptions-list
  * Rolle des zugreifenden Nutzers: NCPeH-FD
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Der Parameters.parameter:requestData.part:practitionerRole Parameters.parameter:requestData.part:practitionerName hat in Parameters.parameter:requestData.part:healthcare-facility-type Parameters.parameter:requestData.part:pointOfCare in Land B (Klartext aus: Parameters.parameter:requestData.part:countryCode) Ihre ausgwählten und einlösbaren E-Rezepte abgerufen.
* Operation: POST /rx/fhir/$get-eu-prescriptionsParameters.parameter:requestData.part:requesttype = e-prescriptions-retrieval
  * Rolle des zugreifenden Nutzers: NCPeH-FD
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Der Parameters.parameter:requestData.part:practitionerRole Parameters.parameter:requestData.part:practitionerName hat in Parameters.parameter:requestData.part:healthcare-facility-type Parameters.parameter:requestData.part:pointOfCare in Land B (Klartext aus: Parameters.parameter:requestData.part:countryCode) Ihre einzulösenden E-Rezepte abgerufen.

**Tabelle: **TAB_EU_004 Versichertenprotokoll

