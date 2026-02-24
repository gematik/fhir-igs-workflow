# Zugriffsprotokollierung - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **Zugriffsprotokollierung**

## Zugriffsprotokollierung

### Systemprotokoll

Der E-Rezept-Fachdienst soll Protokolldateien schreiben, die eine Analyse technischer Vorgänge erlauben. Diese Protokolldateien sind dafür vorgesehen, aufgetretene Fehler zu identifizieren und die Performance zu analysieren. Für diese Zwecke führt der E-Rezept-Fachdienst ein Systemprotokoll, mit dem der Anbieter des Dienstes jederzeit den Betriebszustand des Systems kontrollieren kann.

Der E-Rezept-Fachdienst MUSS ein Systemprotokoll über durchgeführte Operationen und deren Erfolg/Misserfolg führen, um dem Anbieter des Dienstes jederzeit eine Übersicht über den aktuellen Betriebszustand zu ermöglichen.

Der E-Rezept-Fachdienst MUSS in jedem zu tätigenden Systemprotokolleintrag alle personenbezogenen, personenbeziehbaren und medizinischen Informationen vor der Speicherung entfernen, damit vom administrativen Personal keine personenbezogenen Daten der Versicherten oder Leistungserbringer eingesehen werden können.

Der Betreiber des E-Rezept-Fachdienstes MUSS im Rahmen von Testmaßnahmen dem Testbetriebsverantwortlichen auf Anforderung die Log-Dateien des Systemprotokolls übermitteln.

Der E-Rezept-Fachdienst MUSS ein Systemprotokoll über durchgeführte Operationen und deren Erfolg/Misserfolg führen.
### Zugriffsprotokoll für den Versicherten

Der E-Rezept-Fachdienst führt Zugriffsprotokolle für Versicherte, in denen alle Zugriffe auf die personenbezogenen und medizinischen Daten eines Versicherten für den Versicherten einsehbar sind. Diese Zugriffsprotokolle sind unabhängig vom Systemprotokoll und stehen ausschließlich dem Versicherten zur Wahrnehmung seiner Betroffenenrechte zur Einsicht zur Verfügung.

Der E-Rezept-Fachdienst MUSS jeden Aufruf von Operationen gemäß "TAB_eRPFD_004 Versichertenprotokoll" protokollieren und die gelesene bzw. geschriebene Ressource im Protokolleintrag AuditEvent.entity.what als Referenz hinzufügen sowie die KVNR des betroffenen Versicherten in AuditEvent.entity.name speichern. Mit diesen Informationen kann der Versicherte die Zugriffe auf seine Daten nachvollziehen und bei einem unberechtigten Zugriff ggf. intervenieren.

* Operation: http GET /Task/<id>
  * Rolle des zugreifenden Nutzers: Versicherter/Vertreter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter/Vertreter hat das E-Rezept heruntergeladen
* Operation: http GET /Task/<id>?secret
  * Rolle des zugreifenden Nutzers: Apotheke/Kostenträger
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Apotheke/Kostenträger hat die E-Rezept-Quittung heruntergeladen
* Operation: http GET /Task
  * Rolle des zugreifenden Nutzers: Apotheke
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): * im Erfolgsfall beim passenden AcceptPN3VSDMxx=false: Apotheke hat mit Ihrer eGK die Liste der offenen E-Rezepte abgerufen.
* im Erfolgsfall bei PN3 und passende AcceptPN3VSDMxx=true: Apotheke hat mit Ihrer eGK die Liste der offenen E-Rezepte abgerufen. (Offline-Check wurde akzeptiert)
* im Fehlerfall PN3 und passende AcceptPN3VSDMxx=false: Apotheke konnte aufgrund eines Fehlerfalls nicht die Liste der offenen E-Rezepte mit Ihrer eGK abgerufen. (Offline-Check wurde nicht akzeptiert)
* im sonstigen Fehlerfall: Apotheke konnte aufgrund eines Fehlerfalls nicht die Liste der offenen E-Rezepte mit Ihrer eGK abrufen.

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
  * Rolle des zugreifenden Nutzers: Versicherter/Vertreter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter/Vertreter hat das E-Rezept gelöscht.
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
  * Rolle des zugreifenden Nutzers: Versicherter/Vertreter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter/Vertreter hat Medikament-Informationen heruntergeladen.
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


