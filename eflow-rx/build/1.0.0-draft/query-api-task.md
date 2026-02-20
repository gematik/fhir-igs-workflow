# Query API: Task - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* **Query API: Task**

## Query API: Task

Diese Seite basiert auf der gleichnamigen Schnittstelle in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/1.0.0query-api-task.html) und beschreibt den Einstieg in die Task-Query-Schnittstelle.

### Nachricht

Die Nachricht zum Abruf von E-Rezepten wird als HTTP GET-Anfrage an den E-Rezept-Fachdienst gesendet, um eine Liste der hinterlegten **Task**-Instanzen abzurufen.

### Anforderungen an Schnittstelle

* [Ergänzende Server-Anforderungen zur Task-Query](./query-api-task-client-requirements.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [Ergänzende Client-Anforderungen zur Task-Query](./query-api-task-server-requirements.md): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### Resource API

Anfragen an die *Task*-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden.

#### API Beschreibung

* [API-ERP: Alle E-Rezepte ansehen](https://github.com/gematik/api-erp/blob/master/docs/erp_versicherte.adoc#alle-e-rezepte-ansehen)
* [API-ERP: E-Rezept erneut abrufen abgebend](https://github.com/gematik/api-erp/blob/master/docs/erp_abrufen.adoc#e-rezept-erneut-abrufen)

#### Hinweis

* Mit dem AccessCode `GEM_ERP_NS_AccessCode` wird der Zugriff für Vertreter und Apotheker gesteuert, in dem der Versicherte diesen AccessCode z.B. als QR-Code weitergibt
* Der Prozesstyp referenziert die Workflow-Definition, in diesem Fall den Prozess für apothekenpflichtige Arzneimittel mit `"url":"https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"`
* Mit der Angabe `"display":"Öffentliche Apotheke"` kann dem Versicherten ein Hinweis angezeigt werden, wo er das E-Rezept einlösen kann (bspw. Apotheke oder Sanitätshaus).
* Wenn ein Task sich im Status “in-progress” befindet und das Feld Task.extension:lastMedicationDispense befüllt ist, stehen dem Task auch Abgabeinformationen zur Verfügung und beschreibt den Zeitpunkt, an dem der Versicherte sein Arzneimittel übergeben bekommen hat. Das E-Rezept-FdV kann dem Versicherten dann darstellen, dass das E-Rezept beliefert wurde bevor der Vorgang mit Aufruf der $close-Operation abgeschlossen wurde. Bis der Task nicht abgeschlossen ist, können die Abgabeinformationen gelöscht oder geändert werden. Dabei wird das Feld lastMedicationDispense aktualisiert. Wenn das AVS den Workflow mittels der $close-Operation abschließt, wird der Status auf “complete” gesetzt, und eine Änderung der Abgabeinformationen ist nicht mehr möglich.

### Instance API

Um spezifische Details zu einem einzelnen **Task** mittels der RESTful API zu erhalten, wird die **Task Instance API** verwendet, indem eine HTTP GET-Anfrage an den Endpunkt */Task/[id]* gestellt wird.

#### API Beschreibung

* [API-ERP: Ein einzelnes E-Rezept abrufen und in der Apotheke einlösen](https://github.com/gematik/api-erp/blob/master/docs/erp_versicherte.adoc#ein-einzelnes-e-rezept-abrufen-und-in-der-apotheke-einl%C3%B6sen)

#### Hinweise

* Mit dem AccessCode in `GEM_ERP_NS_AccessCode` wird der Zugriff für Vertreter und Apotheker gesteuert, in dem der Versicherte diesen AccessCode z.B. als QR-Code weitergibt.
* Bei `"value":"X123456789"` ist die KVNR des Versicherten enthalten, nach welcher die Rezept-Tasks gefiltert wurden. Im Ergebnis wurde nur ein einzelnes E-Rezept gefunden.
* Der Prozesstyp in `GEM_ERP_EX_PrescriptionType` referenziert die Workflow-Definition, in diesem Fall den Prozess für apothekenpflichtige Arzneimittel.
* Mit der Angabe ` “display”:”Öffentliche Apotheke”` kann dem Versicherten ein Hinweis angezeigt werden, wo er das E-Rezept einlösen kann (bspw. Apotheke oder Sanitätshaus).
* Bei der Rückgabe der Verordnung an den Versicherten wird eine vom E-Rezept-Fachdienst erstellte Signatur des E-Rezept-Bundles übertragen. Diese muss vom E-Rezept-FdV nicht validiert werden.

### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.md) festgehalten.

