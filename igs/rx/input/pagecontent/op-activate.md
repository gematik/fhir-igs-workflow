Diese Operation basiert auf der gleichnamigen Operation in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}/op-activate.html).

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$activate` gesendet.

### Anforderungen an Schnittstelle

- [Ergänzende Server-Anforderungen zu `$activate`](./op-activate-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [Ergänzende Anforderungen für PVS zu `$activate`](./op-activate-req-pvs.html): Anforderungen an das PVS zur Nutzung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:
- [API-ERP: E-Rezept vervollständigen und Task aktivieren](https://github.com/gematik/api-erp/blob/master/docs/erp_bereitstellen.adoc#e-rezept-vervollst%C3%A4ndigen-und-task-aktivieren)


### Hinweis

- Bei ausbleibender Antwort soll der Client den Aufruf wiederholen.
- Wenn ein wiederholter Aufruf mit `403` und "Task not in status draft but in status ready" antwortet, war ein vorheriger Aufruf bereits erfolgreich.


