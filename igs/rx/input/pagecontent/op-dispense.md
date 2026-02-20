
### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$dispense` gesendet.

### Anforderungen an Schnittstelle

- [Ergänzende Server-Anforderungen zu `$dispense`](./op-dispense-fd-requirements.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [Ergänzende Client-Anforderungen zu `$dispense`](./op-dispense-client-requirements.html): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:
- [API-ERP: E-Rezept Abgabe zeitnah dokumentieren](https://github.com/gematik/api-erp/blob/master/docs/erp_abrufen.adoc#e-rezept-abgabe-vollziehen)

### Hinweis

- Wiederholte Aufrufe von `$dispense` überschreiben die bisher gespeicherten Dispensierinformationen.
- Deshalb muss immer die vollständige, aktuelle MedicationDispense übermittelt werden.

### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.html) festgehalten.
