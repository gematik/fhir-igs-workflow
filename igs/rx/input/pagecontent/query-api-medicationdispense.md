Diese Seite basiert auf der gleichnamigen Schnittstelle in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}/query-api-medicationdispense.html) und beschreibt den Einstieg in die MedicationDispense-Query-Schnittstelle.

### Nachricht

Die Nachricht zum Abruf von Dipensierdaten wird als HTTP GET-Anfrage an den  gesendet, um eine Liste der hinterlegten _MedicationDispense_-Instanzen abzurufen.

### Anforderungen an Schnittstelle

- [FD-Anforderungen zur MedicationDispense-Query](./query-api-medicationdispense-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen für MedicationDispense-Query](./query-api-medicationdispense-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.

### Resource API

Anfragen an die <i>MedicationDispense</i>-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden. Dabei können spezifische Suchparameter genutzt werden, um die Anfragen zu verfeinern. Zum Beispiel:

- Suche nach Medikamentenabgaben, die an einem bestimmten Tag erfolgten: ``?whenHandedOver=2025-02-14``

#### API Beschreibung

- [API-ERP: Abgabeinformationen abrufen](https://github.com/gematik/api-erp/blob/master/docs/erp_versicherte.adoc#abgabeinformationen-abrufen)


### Instance API

Um spezifische Details zu einem einzelnen _MedicationDispense_ mittels der RESTful API zu erhalten, wird die _MedicationDispense Instance API_ verwendet, indem eine HTTP GET-Anfrage an den Endpunkt <i>/MedicationDispense/[id]</i> gestellt wird.

#### API Beschreibung

- [API-ERP: Abgabeinformationen zu einem E-Rezept abrufen](https://github.com/gematik/api-erp/blob/master/docs/erp_versicherte.adoc#abgabeinformationen-zu-einem-e-rezept-abrufen)

#### Hinweise

- ...Hinweise

