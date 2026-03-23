
### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$dispense` gesendet.

### Anforderungen an Schnittstelle

- [FD-Anforderungen zu `$dispense`](./op-dispense-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [AVS-Anforderungen zu `$dispense`](./op-dispense-req-avs.html): Anforderungen an das AVS zur Nutzung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:
- [API-ERP: E-Rezept Abgabe zeitnah dokumentieren](https://github.com/gematik/api-erp/blob/master/docs/erp_abrufen.adoc#e-rezept-abgabe-vollziehen)

### Hinweis

- Wiederholte Aufrufe von `$dispense` überschreiben die bisher gespeicherten Dispensierinformationen.
- Deshalb muss immer die vollständige, aktuelle MedicationDispense übermittelt werden.


