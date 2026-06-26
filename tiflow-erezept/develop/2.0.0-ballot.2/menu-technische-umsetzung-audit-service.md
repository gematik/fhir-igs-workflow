# Zugriffsprotokollierung mit AuditEvent - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**Technische Aspekte zur Arzneimittelverordnung**](menu-technisch.md)
* **Zugriffsprotokollierung mit AuditEvent**

## Zugriffsprotokollierung mit AuditEvent

### Zugriffsprotokoll für den Versicherten

Der TI-Flow-Fachdienst führt Zugriffsprotokolle für Versicherte, in denen alle Zugriffe auf die personenbezogenen und medizinischen Daten eines Versicherten für den Versicherten einsehbar sind. Weitere Details sind in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/1.0.0/audit-service.html) zu finden, und unten sind die modulspezifischen Anforderungen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS jeden Aufruf von Operationen gemäß "TAB_RX_004 Versichertenprotokoll" protokollieren und die gelesene bzw. geschriebene Ressource im Protokolleintrag AuditEvent.entity.what als Referenz hinzufügen sowie die KVNR des betroffenen Versicherten in AuditEvent.entity.name speichern. Mit diesen Informationen kann der Versicherte die Zugriffe auf seine Daten nachvollziehen und bei einem unberechtigten Zugriff ggf. intervenieren.

* Operation: http GET /rx/fhir/Task/<id>
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter hat das E-Rezept heruntergeladen
* Operation: http GET /rx/fhir/Task/<id>?secret
  * Rolle des zugreifenden Nutzers: Apotheke
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Apotheke hat die E-Rezept-Quittung heruntergeladen
* Operation: http GET /rx/fhir/Task
  * Rolle des zugreifenden Nutzers: Apotheke (PoPP)
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Die Apotheke hat die Liste der einlösbaren E-Rezepte abgerufen durch Autorisierung mittels <PoPP-Anwendungsfall>.
* Operation: http POST /rx/fhir/Task/<id>/$activate
  * Rolle des zugreifenden Nutzers: Arztpraxis/Zahnarztpraxis/Krankenhaus/Psychotherapeut
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Arztpraxis/Zahnarztpraxis/Krankenhaus/Psychotherapeut hat das E-Rezept bereitgestellt.
* Operation: http POST /rx/fhir/Task/<id>/$accept
  * Rolle des zugreifenden Nutzers: Apotheke
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Apotheke hat das E-Rezept heruntergeladen
* Operation: http POST /rx/fhir/Task/<id>/$reject
  * Rolle des zugreifenden Nutzers: Apotheke
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Apotheke hat das E-Rezept zurückgegeben.
* Operation: http POST /rx/fhir/Task/<id>/$dispense
  * Rolle des zugreifenden Nutzers: Apotheke
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Apotheke hat das E-Rezept beliefert.
* Operation: http POST /rx/fhir/Task/<id>/$close
  * Rolle des zugreifenden Nutzers: Apotheke
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Apotheke hat das E-Rezept abgeschlossen.
* Operation: http POST /rx/fhir/Task/<id>/$abort
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter hat das E-Rezept gelöscht.
* Operation: http POST /rx/fhir/Task/<id>/$abort
  * Rolle des zugreifenden Nutzers: Arztpraxis/Zahnarztpraxis/Krankenhaus/Psychotherapeut
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Arztpraxis/Zahnarztpraxis/Krankenhaus/Psychotherapeut hat das E-Rezept gelöscht.
* Operation: http POST /rx/fhir/Task/<id>/$abort
  * Rolle des zugreifenden Nutzers: Apotheke
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Apotheke hat das E-Rezept gelöscht.
* Operation: http GET /rx/fhir/MedicationDispense
  * Rolle des zugreifenden Nutzers: Versicherter
  * Beschreibung (ggf. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Versicherter hat Medikament-Informationen heruntergeladen.

**Tabelle: **TAB_RX_004 Versichertenprotokoll

#### Zugriffsprotokollierung für Übermittlung für ePA Medication Service

Der TI-Flow-Fachdienst protokolliert das erfolgreiche Übermitteln von Daten für jedes E-Rezept an den Medication Service im Zugriffsprotokoll des Versicherten. Für Übermittlungsversuche, welche nicht erfolgreich durchgeführt werden konnten und für die die Übermittlung erneut versucht wird, wird kein Eintrag im Zugriffsprotokoll angelegt.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS einen Aufruf der folgenden Endpunkte, für jeden betroffene E-Rezept abhängig von Ergebnis des Operationsaufrufes gemäß Tab_TIFlowFD_020 im Zugriffsprotokoll des Versicherten protokollieren:

* Endpunkt: /epa/medication/api/{version}/fhir/$provide-prescription-erp
  * Ergebnis der Operation: erfolgreich
  * Beschreibung (ggfs. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Die Verordnung wurde in die Patientenakte übertragen.
* Endpunkt: 
  * Ergebnis der Operation: final nicht übermittelbar
  * Beschreibung (ggfs. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Die Verordnung konnte nicht in die Patientenakte übertragen werden.
* Endpunkt: /epa/medication/api/{version}/fhir/$provide-dispensation-erp
  * Ergebnis der Operation: erfolgreich
  * Beschreibung (ggfs. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Die Medikamentenabgabe wurde in die Patientenakte übertragen.
* Endpunkt: 
  * Ergebnis der Operation: final nicht übermittelbar
  * Beschreibung (ggfs. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Die Medikamentenabgabe konnte nicht in die Patientenakte übertragen werden.
* Endpunkt: /epa/medication/api/{version}/fhir/$cancel-prescription-erp
  * Ergebnis der Operation: erfolgreich
  * Beschreibung (ggfs. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Die Löschinformation zum E-Rezept wurde in die Patientenakte übermittelt.
* Endpunkt: 
  * Ergebnis der Operation: final nicht übermittelbar
  * Beschreibung (ggfs. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Die Löschinformation zum E-Rezept konnte nicht in die Patientenakte übermittelt werden.
* Endpunkt: /epa/medication/api/{version}/fhir/$cancel-dispensation-erp
  * Ergebnis der Operation: erfolgreich
  * Beschreibung (ggfs. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Die Löschinformation für die Medikamentenabgabe wurde in die Patientenakte übertragen.
* Endpunkt: 
  * Ergebnis der Operation: final nicht übermittelbar
  * Beschreibung (ggfs. als Vorschlag für einen lesbaren Protokolleintrag in einfacher Sprache): Die Löschinformation für die Medikamentenabgabe konnte nicht in die Patientenakte übertragen werden.

**Tabelle: **Tab_TIFlowFD_020 Versichertenprotokoll für ePA Medication Service

Das Ergebnis "final nicht übermittelbar" bedeutet, dass die Übermittlung auch nach den definierten Wiederholversuchen nicht erfolgreich durchgeführt werden konnte.

Für Übermittlungsversuche, welche nicht erfolgreich durchgeführt werden konnten und für die die Übermittlung erneut versucht werden soll, wird kein Eintrag im Zugriffsprotokoll angelegt.

Wenn ein Versicherter dem Einstellen von Verordnungsdaten und Dispensierinformationen durch den TI-Flow-Fachdienst widersprochen hat, wird keine Übermittlung von Daten gestartet (siehe A_25951-*). In dem Fall wird kein Eintrag im Zugriffsprotokoll angelegt.

