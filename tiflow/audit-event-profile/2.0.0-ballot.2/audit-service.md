# Zugriffsprotokollierung - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - draft 

* [**Table of Contents**](toc.md)
* **Zugriffsprotokollierung**

## Zugriffsprotokollierung

### Zugriffsprotokoll für den Versicherten

Der TI-Flow-Fachdienst führt Zugriffsprotokolle für Versicherte, in denen alle Zugriffe auf die personenbezogenen und medizinischen Daten eines Versicherten für den Versicherten einsehbar sind. Diese Zugriffsprotokolle sind unabhängig vom Systemprotokoll und stehen ausschließlich dem Versicherten zur Wahrnehmung seiner Betroffenenrechte zur Einsicht zur Verfügung.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS einen Protokolleintrag mit den folgenden Werten befüllen:
* AuditEvent.type: Fester Wert rest gemäß [CodeSystem: Audit Event ID]
* AuditEvent.subtype: aus dem ValueSet [ValueSet http://hl7.org/fhir/ValueSet/auditevent-sub-type] gemäß [CodeSystem http://hl7.org/fhir/restful-interaction]: 
* create beim Hinzufügen/Speichern/Anlegen eines Datenobjekts mit Versichertenbezug (mit Ausnahme von AuditEvent- und Communication-Ressource)
* read beim lesenden Zugriff auf ein Datenobjekt mit Versichertenbezug
* update, wenn das Datenobjekt mit Versichertenbezug geändert/aktualisiert wird
* delete, wenn das Datenobjekt mit Versichertenbezug manuell oder automatisch gelöscht wird
 
* AuditEvent.action: analog AuditEvent.subType (C, R, U, D) gemäß [ValueSet http://hl7.org/fhir/ValueSet/audit-event-action]
* AuditEvent.recorded: aktuelle Systemzeit des TI-Flow-Fachdienstes
* AuditEvent.outcome: Ergebnis der aufgerufenen Operation gemäß [ValueSet http://hl7.org/fhir/ValueSet/audit-event-outcome] (0 = Erfolg, 4 = Fehler auf Clientseite, 8 = Serverfehler)
* AuditEvent.agent: Slicing in die Einträge user, client und internal mit jeweils gesetztem AuditEvent.agent.type.coding.system und AuditEvent.agent.type.coding.code
* AuditEvent.agent[user].type: Fester Wert humanuser aus [CodeSystem: Security Role Type]
* AuditEvent.agent[user].who.identifier: aus zeta-user-info.identifier befüllt (IdentifierTelematikId oder IdentifierKvid10)
* AuditEvent.agent[client].type: den festen Code 110150 (Application) aus $dcm und entsprecht dem ValueSet TIFLOWAuditEventAgentTypeVS
* AuditEvent.agent[client].who.identifier: aus zeta-user-info.identifier befüllt (IdentifierTelematikId) 
* AuditEvent.agent[internal].type: Fester Wert dataprocessor aus [CodeSystem: Security Role Type]
* AuditEvent.agent[internal].name: Fester Wert "TI-Flow-Fachdienst"
* AuditEvent.source.site: Fester Wert TI-Flow-Fachdienst
* AuditEvent.source.observer: Device-Informationen des TI-Flow-Fachdienstes (status, serialnumber=gemäß Release)
* AuditEvent.entity: mindestens ein Eintrag, Slicing in patient (1..1), task (0..1) und service (0..1)
* AuditEvent.entity[patient].type: Fester Wert Patient gemäß [CodeSystem http://terminology.hl7.org/CodeSystem/audit-entity-type]
* AuditEvent.entity[patient].what.identifier: als IdentifierKvid10 (KVNR) befüllt
* AuditEvent.entity[task].type: Fester Wert Task gemäß [CodeSystem http://terminology.hl7.org/CodeSystem/audit-entity-type]
* AuditEvent.entity[task].what.identifier: sofern vorhanden als EPrescriptionId
* AuditEvent.entity[service].type: Fester Wert Other (Code 4) gemäß [CodeSystem http://terminology.hl7.org/CodeSystem/audit-entity-type]
* AuditEvent.entity[service].name: sofern vorhanden Name des aufgerufenen FHIR Data Service

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS jeden Aufruf von Operationen gemäß "TAB_TIFlowFD_004 Versichertenprotokoll" protokollieren und die gelesene bzw. geschriebene Ressource im Protokolleintrag AuditEvent.entity.what als Referenz hinzufügen sowie die KVNR des betroffenen Versicherten in AuditEvent.entity.name speichern. Mit diesen Informationen kann der Versicherte die Zugriffe auf seine Daten nachvollziehen und bei einem unberechtigten Zugriff ggf. intervenieren.

* Operation: http POST /Consent
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter hat Einwilligung für "Beschreibung für Consent.category.coding.code" erteilt.
* Operation: http DELETE /Consent
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter hat Einwilligung für "Beschreibung für Consent.category.coding.code" widerrufen.
* Operation: http POST /pushers/set
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): * Falls kind=null:Versicherter hat das Gerät "device_display_name" für Push-Nachrichten deregistriert.
* Falls kind=http:Versicherter hat das Gerät "device_display_name" für Push-Nachrichten registriert.


**Tabelle: **TAB_TIFlowFD_004 Versichertenprotokoll

* Wert in proofMethod: ehc-practitioner-*
  * Wert für <PoPP-Anwendungsfall>: eGK in der Apotheke

**Tabelle: **TAB_TIFlowFD_004c Versichertenprotokoll PoPP Anwendungsfall

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim automatischen Löschen nach Erreichen einer Löschfrist gemäß "TAB_TIFlowFD_004a Versichertenprotokoll nach automatischen Löschen" protokollieren und die gelesene bzw. geschriebene Ressource im Protokolleintrag AuditEvent.entity.what als Referenz hinzufügen sowie die KVNR des betroffenen Versicherten in AuditEvent.entity.name speichern. Mit diesen Informationen kann der Versicherte die Zugriffe auf seine Daten nachvollziehen und bei einem unberechtigten Zugriff ggf. intervenieren.

* Ressource: Ressource Task
  * Akteur: TI-Flow-Fachdienst
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Veraltete E-Rezepte vom Fachdienst automatisch gelöscht.
* Ressource: Ressource MedicationDispense
  * Akteur: TI-Flow-Fachdienst
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Veraltete Medikament-Informationen vom Fachdienst automatisch gelöscht.
* Ressource: Ressource Communication
  * Akteur: TI-Flow-Fachdienst
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Veraltete Nachricht vom Fachdienst automatisch gelöscht.
* Ressource: Ressource ChargeItem
  * Akteur: TI-Flow-Fachdienst
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Veraltete Abrechnungsinformation vom Fachdienst automatisch gelöscht.

**Tabelle: **TAB_TIFlowFD_004a Versichertenprotokoll nach automatischen Löschen

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim automatischen Löschen nach Fehlerbehandlung gemäß "TAB_TIFlowFD_004b Versichertenprotokoll nach Löschen wegen Fehlerbehandlung" protokollieren und die gelesene bzw. geschriebene Ressource im Protokolleintrag AuditEvent.entity.what als Referenz hinzufügen sowie die KVNR des betroffenen Versicherten in AuditEvent.entity.name speichern. Mit diesen Informationen kann der Versicherte die Zugriffe auf seine Daten nachvollziehen und bei einem unberechtigten Zugriff ggf. intervenieren.

* Ressource: Ressource Pusher
  * Akteur: TI-Flow-Fachdienst
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Fachdienst hat das Gerät "device_display_name" für Push-Nachrichten deregistriert.

**Tabelle: **TAB_TIFlowFD_004b Versichertenprotokoll nach Löschen wegen Fehlerbehandlung

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS in jedem zu tätigenden Eintrag des Protokolls für Versicherte einen lesbaren Text in einfacher Sprache (deutsch und englisch) erzeugen, der mindestens den Namen des Zugreifenden, die auslösende Operation und das Ergebnis der Operation umfasst, damit Versicherte ohne technisches Vorwissen den Inhalt des Zugriffsprotokolls verstehen können.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS, wenn in den Nutzerinformationen zeta-user-info.commonName = NULL ist, in der Protokollierung als AuditEvent.agent.name "unbekannt" verwenden.

