# Zugriffsprotokollierung mit AuditEvent - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**Systemüberblick**](menu-technische-umsetzung-systemueberblick.md)
* **Zugriffsprotokollierung mit AuditEvent**

## Zugriffsprotokollierung mit AuditEvent

### Zugriffsprotokoll für den Versicherten

Der TI-Flow-Fachdienst führt Zugriffsprotokolle für Versicherte, in denen alle Zugriffe auf die personenbezogenen und medizinischen Daten eines Versicherten für den Versicherten einsehbar sind. Weitere Details sind in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir//audit-service.html) zu finden, und unten sind die modulspezifischen Anforderungen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS jeden Aufruf von Operationen gemäß "TAB_DiGA_004 Versichertenprotokoll" protokollieren und die gelesene bzw. geschriebene Ressource im Protokolleintrag AuditEvent.entity.what als Referenz hinzufügen sowie die KVNR des betroffenen Versicherten in AuditEvent.entity.name speichern. Mit diesen Informationen kann der Versicherte die Zugriffe auf seine Daten nachvollziehen und bei einem unberechtigten Zugriff ggf. intervenieren.

* Operation: http GET /diga/fhir/Task/<id>
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter hat die Verordnung heruntergeladen
* Operation: http GET /diga/fhir/Task/<id>?secret
  * Rolle des zugreifenden Nutzers: Kostenträger
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Kostenträger hat die Verordnung-Quittung heruntergeladen
* Operation: http GET /diga/fhir/Task
  * Rolle des zugreifenden Nutzers: Kostenträger
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Krankenkasse hat die Liste der einlösbaren Verordnungen (DiGA-Verordnungen) abgerufen.
* Operation: http POST /diga/fhir/Task/<id>/$activate
  * Rolle des zugreifenden Nutzers: Arztpraxis/Zahnarztpraxis/Krankenhaus/Psychotherapeut
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Arztpraxis/Zahnarztpraxis/Krankenhaus/Psychotherapeut hat die Verordnung bereitgestellt.
* Operation: http POST /diga/fhir/Task/<id>/$accept
  * Rolle des zugreifenden Nutzers: Kostenträger
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Krankenkasse hat die Verordnung heruntergeladen
* Operation: http POST /diga/fhir/Task/<id>/$reject
  * Rolle des zugreifenden Nutzers: Kostenträger
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Krankenkasse hat die Verordnung zurückgegeben.
* Operation: http POST /diga/fhir/Task/<id>/$close
  * Rolle des zugreifenden Nutzers: Kostenträger
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Krankenkasse hat die Verordnung abgeschlossen.
* Operation: http POST /diga/fhir/Task/<id>/$abort
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter hat die Verordnung gelöscht.
* Operation: http POST /diga/fhir/Task/<id>/$abort
  * Rolle des zugreifenden Nutzers: Arztpraxis/Zahnarztpraxis/Krankenhaus/Psychotherapeut
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Arztpraxis/Zahnarztpraxis/Krankenhaus/Psychotherapeut hat die Verordnung gelöscht.

**Tabelle: **TAB_DiGA_004 Versichertenprotokoll

