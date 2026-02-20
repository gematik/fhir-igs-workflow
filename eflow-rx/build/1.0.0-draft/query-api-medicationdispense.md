# Query API: MedicationDispense - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* **Query API: MedicationDispense**

## Query API: MedicationDispense

Diese Seite basiert auf der gleichnamigen Schnittstelle in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/1.0.0query-api-medicationdispense.html) und beschreibt den Einstieg in die MedicationDispense-Query-Schnittstelle.

### Nachricht

Die Nachricht zum Abruf von Dipensierdaten wird als HTTP GET-Anfrage an den gesendet, um eine Liste der hinterlegten **MedicationDispense**-Instanzen abzurufen.

### Anforderungen an Schnittstelle

* [Ergänzende Client-Anforderungen zur MedicationDispense-Query](./query-api-medicationdispense-client-requirements.md): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### Resource API

Anfragen an die *MedicationDispense*-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden. Dabei können spezifische Suchparameter genutzt werden, um die Anfragen zu verfeinern. Zum Beispiel:

* Suche nach Medikamentenabgaben, die an einem bestimmten Tag erfolgten: `?whenHandedOver=2025-02-14`

#### API Beschreibung

* [API-ERP: Abgabeinformationen abrufen](https://github.com/gematik/api-erp/blob/master/docs/erp_versicherte.adoc#abgabeinformationen-abrufen)

#### Hinweise

* Im Anwendungsfall “Abgabeinformationen abrufen” wird die Suche per `identifier` auf die PrescriptionID genutzt.
* Die Rückgabe erfolgt als Bundle und kann ein oder mehrere `MedicationDispense`-Objekte enthalten.

### Instance API

Um spezifische Details zu einem einzelnen **MedicationDispense** mittels der RESTful API zu erhalten, wird die **MedicationDispense Instance API** verwendet, indem eine HTTP GET-Anfrage an den Endpunkt */MedicationDispense/[id]* gestellt wird.

#### API Beschreibung

* [API-ERP: Abgabeinformationen zu einem E-Rezept abrufen](https://github.com/gematik/api-erp/blob/master/docs/erp_versicherte.adoc#abgabeinformationen-zu-einem-e-rezept-abrufen)

#### Hinweise

* …Hinweise

### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.md) festgehalten.

