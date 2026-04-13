# Zugriffsprotokollierung - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **Zugriffsprotokollierung**

## Zugriffsprotokollierung

### Zugriffsprotokoll für den Versicherten

Der TI-Flow-Fachdienst führt Zugriffsprotokolle für Versicherte, in denen alle Zugriffe auf die personenbezogenen und medizinischen Daten eines Versicherten für den Versicherten einsehbar sind. Diese Zugriffsprotokolle sind unabhängig vom Systemprotokoll und stehen ausschließlich dem Versicherten zur Wahrnehmung seiner Betroffenenrechte zur Einsicht zur Verfügung.

Der TI-Flow-Fachdienst MUSS einen Protokolleintrag mit den folgenden Werten befüllen:
* AuditEvent.text: Generierung eines HTML-<div>-Elements mit lesbarer Beschreibung in einfacher Sprache
* AuditEvent.type: Fester Wertrest gemäß [CodeSystem: Audit Event ID]
* AuditEvent.subtype: aus dem ValueSet [ValueSet http://hl7.org/fhir/ValueSet/auditevent-sub-type] gemäß [CodeSystem http://hl7.org/fhir/restful-interaction]: 
* create beim Hinzufügen/Speichern/Anlegen eines Datenobjekts mit Versichertenbezug (mit Ausnahme von AuditEvent- und Communication-Ressource)
* read beim lesenden Zugriff auf ein Datenobjekt mit Versichertenbezug
* update, wenn das Datenobjekt mit Versichertenbezug geändert/aktualisiert wird
* delete, wenn das Datenobjekt mit Versichertenbezug manuell oder automatisch gelöscht wird
 
* AuditEvent.action: analog AuditEvent.subType (C, R, U, D) gemäß [ValueSet http://hl7.org/fhir/ValueSet/audit-event-action]
* AuditEvent.recorded: aktuelle Systemzeit des TI-Flow-Fachdienstes
* AuditEvent.outcome: Ergebnis der aufgerufenen Operation gemäß [ValueSet http://hl7.org/fhir/ValueSet/audit-event-outcome] (0 = Erfolg, 4 = Fehler auf Clientseite, 8 = Serverfehler)
* AuditEvent.agent.type: Fester Werthumanuser bzw. bei Übermittlung an ePA oder NCPeH-FDdataprocessor aus [CodeSystem: Security Role Type (Experimental)]
* AuditEvent.agent.name:Lesbarer Name aus ID_TOKEN des Zugreifenden, der die zu protokollierende Aktion getriggert hat, z.B. "Praxis Dr. Müller, Bahnhofstr. 78" oder Versicherter z.B. "Max Mustermann" bzw. bei Übermittlung an ePA "TI-Flow-Fachdienst"
* AuditEvent.agent.who: KVNR bzw. Telematik-ID des zugreifenden Nutzers aus ID_TOKEN, der diesen Protokolleintrag ausgelöst hat
* AuditEvent.agent.requestor: Fester Wert false, da keine Protokolleinträge von außen erzeugt werden
* AuditEvent.soure.site: Fester Wert TI-Flow-Fachdienst
* AuditEvent.soure.observer: Device-Informationen des TI-Flow-Fachdienstes (status, serialnumber=gemäß Release)
* AuditEvent.entity.what: Referenz auf das durch den Abruf betroffene Datenobjekt Task, ChargeItem, MedicationDispense, Consent oder Objekt der Zugriffsberechtigung
* AuditEvent.entity.name: Eintrag der KVNR des betroffenen Versicherten aus dem Identifier des protokollierten Datenobjekts (String)
* AuditEvent.entity.description: Rezept-ID als Identifier, wird übernommen aus MedicationDispense, ChargeItem oder Task bzw. Consent.category.coding.code bei Anlegen oder Löschen eines Consent bzw. countryCode bei Anlegen oder Löschen einer Zugriffsberechtigung

Der TI-Flow-Fachdienst MUSS jeden Aufruf von Operationen gemäß "TAB_eRPFD_004 Versichertenprotokoll" protokollieren und die gelesene bzw. geschriebene Ressource im Protokolleintrag AuditEvent.entity.what als Referenz hinzufügen sowie die KVNR des betroffenen Versicherten in AuditEvent.entity.name speichern. Mit diesen Informationen kann der Versicherte die Zugriffe auf seine Daten nachvollziehen und bei einem unberechtigten Zugriff ggf. intervenieren.

* Operation: http GET /Task/<id>
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter hat das E-Rezept heruntergeladen
* Operation: http GET /Task/<id>?secret
  * Rolle des zugreifenden Nutzers: Apotheke/Kostenträger
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Apotheke/Kostenträger hat die E-Rezept-Quittung heruntergeladen
* Operation: http GET /Task
  * Rolle des zugreifenden Nutzers: Apotheke (PoPP)
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Die Apotheke hat die Liste der einlösbaren E-Rezepte abgerufen durch Autorisierung mittels <PoPP-Anwendungsfall>.
* Operation: http GET /Task
  * Rolle des zugreifenden Nutzers: Kostenträger
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Krankenkasse hat die Liste der einlösbaren Verordnungen (DiGA-Verordnungen) abgerufen.
* Operation: http POST /Task/<id>/$activate
  * Rolle des zugreifenden Nutzers: Arztpraxis/Zahnarztpraxis/Krankenhaus/Psychotherapeut
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Arztpraxis/Zahnarztpraxis/Krankenhaus/Psychotherapeut hat das E-Rezept bereitgestellt.
* Operation: http POST /Task/<id>/$accept
  * Rolle des zugreifenden Nutzers: Apotheke
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Apotheke hat das E-Rezept heruntergeladen
* Operation: http POST /Task/<id>/$accept
  * Rolle des zugreifenden Nutzers: Kostenträger
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Krankenkasse hat die Verordnung heruntergeladen
* Operation: http POST /Task/<id>/$reject
  * Rolle des zugreifenden Nutzers: Apotheke
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Apotheke hat das E-Rezept zurückgegeben.
* Operation: http POST /Task/<id>/$reject
  * Rolle des zugreifenden Nutzers: Kostenträger
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Krankenkasse hat die Verordnung zurückgegeben.
* Operation: http POST /Task/<id>/$dispense
  * Rolle des zugreifenden Nutzers: Apotheke
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Apotheke hat das E-Rezept beliefert.
* Operation: http POST /Task/<id>/$close
  * Rolle des zugreifenden Nutzers: Apotheke
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Apotheke hat das E-Rezept abgeschlossen.
* Operation: http POST /Task/<id>/$close
  * Rolle des zugreifenden Nutzers: Kostenträger
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Krankenkasse hat die Verordnung abgeschlossen.
* Operation: http POST /Task/<id>/$abort
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter hat das E-Rezept gelöscht.
* Operation: http POST /Task/<id>/$abort
  * Rolle des zugreifenden Nutzers: Arztpraxis/Zahnarztpraxis/Krankenhaus/Psychotherapeut
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Arztpraxis/Zahnarztpraxis/Krankenhaus/Psychotherapeut hat das E-Rezept gelöscht.
* Operation: http POST /Task/<id>/$abort
  * Rolle des zugreifenden Nutzers: Apotheke
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Apotheke hat das E-Rezept gelöscht.
* Operation: http POST /Task/<id>/$eu-close
  * Rolle des zugreifenden Nutzers: NCPeH-FD
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Der Parameters.parameter:requestData.part:practitionerRole Parameters.parameter:requestData.part:practitionerName hat in Parameters.parameter:requestData.part:healthcare-facility-type Parameters.parameter:requestData.part:pointOfCare in Land B (Klartext aus: Parameters.parameter:requestData.part:countryCode) Ihr E-Rezept eingelöst.
* Operation: http PATCH /Task/<id>
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter hat Markierung zu Einlösung im EU Ausland gespeichert
* Operation: http GET /MedicationDispense
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter hat Medikament-Informationen heruntergeladen.
* Operation: http DELETE /ChargeItem/<id>
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter hat Abrechnungsinformation gelöscht
* Operation: http GET /ChargeItem/<id>
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter hat Abrechnungsinformation gelesen
* Operation: http GET /ChargeItem/<id>
  * Rolle des zugreifenden Nutzers: Apotheke
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Apotheke hat Abrechnungsinformation gelesen
* Operation: http POST /ChargeItem
  * Rolle des zugreifenden Nutzers: Apotheke
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Apotheke hat Abrechnungsinformation bereitgestellt
* Operation: http PATCH /ChargeItem/<id>
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter hat Markierung zu Abrechnungsinformation gespeichert
* Operation: http PUT /ChargeItem/<id>
  * Rolle des zugreifenden Nutzers: Apotheke
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Apotheke hat Abrechnungsinformation geändert
* Operation: http POST /Consent
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter hat Einwilligung für "Beschreibung für Consent.category.coding.code" erteilt.
* Operation: http DELETE /Consent
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter hat Einwilligung für "Beschreibung für Consent.category.coding.code" widerrufen.
* Operation: http POST /$grant-eu-access-permission
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter hat eine Zugriffsberechtigung zum Einlösen von E-Rezepten für das Land "Land B" erteilt.
* Operation: http DELETE /$revoke-eu-access-permission
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter hat die Zugriffsberechtigung zum Einlösen von E-Rezepten für das Land "Land B" widerrufen.
* Operation: POST /$get-eu-prescriptionsParameters.parameter:requestData.part:requesttype = demographics
  * Rolle des zugreifenden Nutzers: NCPeH-FD
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Der Parameters.parameter:requestData.part:practitionerRole Parameters.parameter:requestData.part:practitionerName hat in Parameters.parameter:requestData.part:healthcare-facility-type Parameters.parameter:requestData.part:pointOfCare in Land B (Klartext aus: Parameters.parameter:requestData.part:countryCode) Ihre Patientendaten abgerufen.
* Operation: POST /$get-eu-prescriptionsParameters.parameter:requestData.part:requesttype = e-prescriptions-list
  * Rolle des zugreifenden Nutzers: NCPeH-FD
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Der Parameters.parameter:requestData.part:practitionerRole Parameters.parameter:requestData.part:practitionerName hat in Parameters.parameter:requestData.part:healthcare-facility-type Parameters.parameter:requestData.part:pointOfCare in Land B (Klartext aus: Parameters.parameter:requestData.part:countryCode) Ihre ausgwählten und einlösbaren E-Rezepte abgerufen.
* Operation: POST /$get-eu-prescriptionsParameters.parameter:requestData.part:requesttype = e-prescriptions-retrieval
  * Rolle des zugreifenden Nutzers: NCPeH-FD
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Der Parameters.parameter:requestData.part:practitionerRole Parameters.parameter:requestData.part:practitionerName hat in Parameters.parameter:requestData.part:healthcare-facility-type Parameters.parameter:requestData.part:pointOfCare in Land B (Klartext aus: Parameters.parameter:requestData.part:countryCode) Ihre einzulösenden E-Rezepte abgerufen.
* Operation: http POST /pushers/set
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): * Falls kind=null:Versicherter hat das Gerät "device_display_name" für Push-Nachrichten deregistriert.
* Falls kind=http:Versicherter hat das Gerät "device_display_name" für Push-Nachrichten registriert.


