# Zugriffsprotokollierung mit AuditEvent - Implementation Guide TIFlow - Abrechnungsinformationen v2.0.0-ballot.2

Implementation Guide

TIFlow - Abrechnungsinformationen

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**Systemüberblick**](menu-technische-umsetzung-systemueberblick.md)
* **Zugriffsprotokollierung mit AuditEvent**

## Zugriffsprotokollierung mit AuditEvent

### Zugriffsprotokoll für den Versicherten

Der TI-Flow-Fachdienst führt Zugriffsprotokolle für Versicherte, in denen alle Zugriffe auf die personenbezogenen und medizinischen Daten eines Versicherten für den Versicherten einsehbar sind. Weitere Details sind in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/1.0.0/audit-service.html) zu finden, und unten sind die modulspezifischen Anforderungen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS jeden Aufruf von Operationen gemäß "TAB_Chrg_004 Versichertenprotokoll" protokollieren und die gelesene bzw. geschriebene Ressource im Protokolleintrag AuditEvent.entity.what als Referenz hinzufügen sowie die KVNR des betroffenen Versicherten in AuditEvent.entity.name speichern. Mit diesen Informationen kann der Versicherte die Zugriffe auf seine Daten nachvollziehen und bei einem unberechtigten Zugriff ggf. intervenieren.

* Operation: http DELETE /chrg/fhir/ChargeItem/<id>
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter hat Abrechnungsinformation gelöscht
* Operation: http GET /chrg/fhir/ChargeItem/<id>
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter hat Abrechnungsinformation gelesen
* Operation: http GET /chrg/fhir/ChargeItem/<id>
  * Rolle des zugreifenden Nutzers: Apotheke
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Apotheke hat Abrechnungsinformation gelesen
* Operation: http POST /chrg/fhir/ChargeItem
  * Rolle des zugreifenden Nutzers: Apotheke
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Apotheke hat Abrechnungsinformation bereitgestellt
* Operation: http PATCH /chrg/fhir/ChargeItem/<id>
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter hat Markierung zu Abrechnungsinformation gespeichert
* Operation: http PUT /chrg/fhir/ChargeItem/<id>
  * Rolle des zugreifenden Nutzers: Apotheke
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Apotheke hat Abrechnungsinformation geändert

**Tabelle: **TAB_Chrg_004 Versichertenprotokoll

