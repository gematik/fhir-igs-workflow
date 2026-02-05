# Zugriffsprotokollierung

Dieses Kapitel beschreibt die Protokollierung technischer Vorgaenge sowie die
Zugriffsprotokolle fuer Versicherte. Es unterscheidet zwischen Systemprotokoll
und Versichertenprotokoll (AuditEvent).

## Systemprotokoll

<requirement conformance="SHALL" key="IG-WF-CORE-2" title="E-Rezept-Fachdienst - Systemprotokoll fuer Betriebszustand (A_19282)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS ein Systemprotokoll ueber durchgefuehrte Operationen
	und deren Erfolg bzw. Misserfolg fuehren, um dem Anbieter des Dienstes jederzeit
	eine Uebersicht ueber den aktuellen Betriebszustand zu ermoeglichen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-3" title="E-Rezept-Fachdienst - Systemprotokoll ohne personenbezogene und medizinische Daten (A_19283)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS in jedem zu taetigenden Systemprotokolleintrag alle
	personenbezogenen, personenbeziehbaren und medizinischen Informationen vor der
	Speicherung entfernen, damit vom administrativen Personal keine personenbezogenen
	Daten der Versicherten oder Leistungserbringer eingesehen werden koennen.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-4" title="E-Rezept-Fachdienst - Verfuegbarkeit interner Logdaten (A_19678)" version="0">
	<meta lockversion="false"/>
	Der Betreiber des E-Rezept-Fachdienstes MUSS im Rahmen von Testmassnahmen dem
	Testbetriebsverantwortlichen auf Anforderung die Log-Dateien des Systemprotokolls
	uebermitteln.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-5" title="E-Rezept-Fachdienst - Systemprotokoll zum Ergebnis einer aufgerufenen Operation (A_20001)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS ein Systemprotokoll ueber durchgefuehrte Operationen
	und deren Erfolg bzw. Misserfolg fuehren.
</requirement>

## Versichertenprotokoll (AuditEvent)

Das Versichertenprotokoll ist vom Systemprotokoll getrennt und dient ausschliesslich
der Einsicht durch Versicherte.

<requirement conformance="SHALL" key="IG-WF-CORE-6" title="E-Rezept-Fachdienst - Versichertenprotokoll zu Operationen (A_19284-12)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS jeden Aufruf der folgenden Operationen protokollieren:

	| Operation | Rolle des zugreifenden Nutzers | Beschreibung (Vorschlag fuer lesbaren Protokolleintrag) |
	| --- | --- | --- |
	| http GET /Task/<id> | Versicherter, Vertreter | Patient/Versicherter/Vertreter hat das E-Rezept heruntergeladen |
	| http GET /Task/<id> | Apotheker | Apotheke hat die E-Rezept-Quittung heruntergeladen |
	| http GET /Task | Apotheker | im Erfolgsfall bei passendem AcceptPN3VSDMxx=false: Apotheke hat mit Ihrer eGK die Liste der offenen E-Rezepte abgerufen.<br>im Erfolgsfall bei PN3 und passendem AcceptPN3VSDMxx=true: Apotheke hat mit Ihrer eGK die Liste der offenen E-Rezepte abgerufen. (Offline-Check wurde akzeptiert)<br>im Fehlerfall PN3 und passendem AcceptPN3VSDMxx=false: Apotheke konnte aufgrund eines Fehlerfalls nicht die Liste der offenen E-Rezepte mit Ihrer eGK abrufen. (Offline-Check wurde nicht akzeptiert)<br>im sonstigen Fehlerfall: Apotheke konnte aufgrund eines Fehlerfalls nicht die Liste der offenen E-Rezepte mit Ihrer eGK abrufen. |
	| http GET /Task | Kostentraeger | Krankenkasse hat die Liste der offenen E-Rezepte (DiGA-Verordnungen) abgerufen. |
	| http POST /Task $activate | Arzt-/Zahnarztpraxis/Krankenhaus/Psychotherapeut | Arzt-/Zahnarztpraxis/Krankenhaus/Psychotherapeut hat das E-Rezept bereitgestellt |
	| http POST /Task $accept | Apotheke | Apotheke hat das E-Rezept heruntergeladen |
	| http POST /Task $accept | Kostentraeger | Krankenkasse hat das E-Rezept heruntergeladen |
	| http POST /Task $reject | Apotheke | Apotheke hat das E-Rezept zurueckgegeben |
	| http POST /Task $reject | Kostentraeger | Krankenkasse hat das E-Rezept zurueckgegeben |
	| http POST /Task $dispense | Apotheke | Apotheke hat das E-Rezept beliefert |
	| http POST /Task $close | Apotheke | Apotheke hat das E-Rezept abgeschlossen |
	| http POST /Task $close | Kostentraeger | Krankenkasse hat das E-Rezept abgeschlossen |
	| http POST /Task $eu-close | NCPeH-FD | Der Parameters.parameter:requestData.part:practitionerRole / practitionerName hat in Parameters.parameter:requestData.part:healthcare-facility-type / pointOfCare in Land B (Klartext aus Parameters.parameter:requestData.part:countryCode) Ihr E-Rezept eingeloest. |
	| http POST /Task $abort | Versicherter, Vertreter | Patient/Versicherter/Vertreter hat das E-Rezept geloescht |
	| http POST /Task $abort | Arzt-/Zahnarztpraxis/Krankenhaus/Psychotherapeut | Arzt-/Zahnarztpraxis/Krankenhaus/Psychotherapeut hat das E-Rezept geloescht |
	| http POST /Task $abort | Apotheke | Apotheke hat das E-Rezept geloescht |
	| http PATCH /Task/<id> | Versicherter | Versicherter hat Markierung zu Einloesung im EU-Ausland gespeichert |
	| GET /MedicationDispense?<parameter>=... | Versicherter, Vertreter | Patient/Versicherter hat Medikament-Informationen heruntergeladen |
	| http DELETE /ChargeItem/<id> | Versicherter | Versicherter hat Abrechnungsinformation geloescht |
	| http GET /ChargeItem/<id> | Versicherter | Versicherter hat Abrechnungsinformation gelesen |
	| http GET /ChargeItem/<id> | Apotheke | Apotheke hat Abrechnungsinformation gelesen |
	| http POST /ChargeItem | Apotheke | Apotheke hat Abrechnungsinformation bereitgestellt |
	| http PATCH /ChargeItem/<id> | Versicherter | Versicherter hat Markierung zu Abrechnungsinformation gespeichert |
	| http PUT /ChargeItem/<id> | Apotheke | Apotheke hat PKV-Abgabedatensatz gespeichert |
	| http POST /Consent | Versicherter | Versicherter hat Einwilligung fuer "Beschreibung fuer Consent.category.coding.code" erteilt. |
	| http DELETE /Consent | Versicherter | Versicherter hat Einwilligung fuer "Beschreibung fuer Consent.category.coding.code" widerrufen. |
	| http POST /$grant-eu-access-permission | Versicherter | Sie haben eine Zugriffsberechtigung zum Einloesen von E-Rezepten fuer das Land "Land B" erteilt. |
	| http DELETE /$revoke-eu-access-permission | Versicherter | Sie haben die Zugriffsberechtigung zum Einloesen von E-Rezepten fuer das Land "Land B" geloescht. |
	| POST /$get-eu-prescriptions (requesttype=demographics) | NCPeH-FD | Der Parameters.parameter:requestData.part:practitionerRole / practitionerName hat in Parameters.parameter:requestData.part:healthcare-facility-type / pointOfCare in Land B (Klartext aus Parameters.parameter:requestData.part:countryCode) Ihre Patientendaten abgerufen. |
	| POST /$get-eu-prescriptions (requesttype=e-prescriptions-list) | NCPeH-FD | Der Parameters.parameter:requestData.part:practitionerRole / practitionerName hat in Parameters.parameter:requestData.part:healthcare-facility-type / pointOfCare in Land B (Klartext aus Parameters.parameter:requestData.part:countryCode) Ihre offenen E-Rezepte abgerufen. |
	| POST /$get-eu-prescriptions (requesttype=e-prescriptions-retrieval) | NCPeH-FD | Der Parameters.parameter:requestData.part:practitionerRole / practitionerName hat in Parameters.parameter:requestData.part:healthcare-facility-type / pointOfCare in Land B (Klartext aus Parameters.parameter:requestData.part:countryCode) Ihre einzuloesenden E-Rezepte abgerufen. |
	| POST /pushers/set (kind=null) | Versicherter | Versicherter hat das Geraet "device_display_name" fuer Push-Nachrichten deregistriert. |
	| POST /pushers/set (kind=http) | Versicherter | Versicherter hat das Geraet "device_display_name" fuer Push-Nachrichten registriert. |
	| Automatisches Loeschen: Task | E-Rezept-Fachdienst | Veraltete E-Rezepte vom Fachdienst automatisch geloescht |
	| Automatisches Loeschen: MedicationDispense | E-Rezept-Fachdienst | Veraltete Medikament-Informationen vom Fachdienst automatisch geloescht |
	| Automatisches Loeschen: Communication | E-Rezept-Fachdienst | Veraltete Nachrichten vom Fachdienst automatisch geloescht |
	| Automatisches Loeschen: ChargeItem | E-Rezept-Fachdienst | Veraltete Abrechnungsinformation vom E-Rezept-Fachdienst automatisch geloescht |

	Der E-Rezept-Fachdienst MUSS die gelesene bzw. geschriebene Ressource im
	Protokolleintrag als Referenz in AuditEvent.entity.what hinzufuegen sowie die KVNR
	des betroffenen Versicherten in AuditEvent.entity.name speichern.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-7" title="E-Rezept-Fachdienst - Protokolleintrag Versichertenprotokoll leicht verstaendlich (A_19302)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS in jedem zu taetigenden Eintrag des Protokolls fuer
	Versicherte einen lesbaren Text in einfacher Sprache (deutsch und englisch)
	erzeugen, der mindestens den Namen des Zugreifenden, die ausloesende Operation
	und das Ergebnis der Operation umfasst.
</requirement>

<requirement conformance="SHALL" key="IG-WF-CORE-8" title="E-Rezept-Fachdienst - Protokollierung ohne organizationName (A_22217)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS, wenn im ACCESS_TOKEN die Angabe zur
	"organizationName" mit NULL gefuellt ist, in der Protokollierung als agentname
	"unbekannt" verwenden.
</requirement>

## Zugriffsprotokollierung fuer ePA Medication Service

Uebermittlungsversuche, die erneut versucht werden, werden nicht protokolliert. Das
Ergebnis "final nicht uebermittelbar" bedeutet, dass die Uebermittlung auch nach den
definierten Wiederholversuchen nicht erfolgreich war.

<requirement conformance="SHALL" key="IG-WF-CORE-9" title="E-Rezept-Fachdienst - ePA Medication Service - Versichertenprotokoll (A_25962)" version="0">
	<meta lockversion="false"/>
	Der E-Rezept-Fachdienst MUSS einen Aufruf der folgenden Endpunkte, fuer jedes
	betroffene E-Rezept abhaengig vom Ergebnis des Operationsaufrufs, im
	Zugriffsprotokoll des Versicherten protokollieren:

	| Endpunkt | Ergebnis | Beschreibung (Vorschlag fuer lesbaren Protokolleintrag) |
	| --- | --- | --- |
	| /epa/medication/api/{version}/fhir/$provide-prescription-erp | erfolgreich | Die Verordnung wurde in die Patientenakte uebertragen. |
	| /epa/medication/api/{version}/fhir/$provide-prescription-erp | final nicht uebermittelbar | Die Verordnung konnte nicht in die Patientenakte uebertragen werden. |
	| /epa/medication/api/{version}/fhir/$provide-dispensation-erp | erfolgreich | Die Medikamentenabgabe wurde in die Patientenakte uebertragen. |
	| /epa/medication/api/{version}/fhir/$provide-dispensation-erp | final nicht uebermittelbar | Die Medikamentenabgabe konnte nicht in die Patientenakte uebertragen werden. |
	| /epa/medication/api/{version}/fhir/$cancel-prescription-erp | erfolgreich | Die Loeschinformation zum E-Rezept wurde in die Patientenakte uebermittelt. |
	| /epa/medication/api/{version}/fhir/$cancel-prescription-erp | final nicht uebermittelbar | Die Loeschinformation zum E-Rezept konnte nicht in die Patientenakte uebermittelt werden. |
	| /epa/medication/api/{version}/fhir/$cancel-dispensation-erp | erfolgreich | Die Loeschinformation fuer die Medikamentenabgabe wurde in die Patientenakte uebertragen. |
	| /epa/medication/api/{version}/fhir/$cancel-dispensation-erp | final nicht uebermittelbar | Die Loeschinformation fuer die Medikamentenabgabe konnte nicht in die Patientenakte uebertragen werden. |
</requirement>