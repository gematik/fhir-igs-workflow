
### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$close` gesendet.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu `$close`](./op-close-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [AVS-Anforderungen zu `$close`](./op-close-req-avs.html): Anforderungen an das AVS zur Nutzung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:
- [API-ERP: E-Rezept-Abgabe vollziehen](https://github.com/gematik/api-erp/blob/master/docs/erp_abrufen.adoc#e-rezept-abgabe-vollziehen)

### Hinweis

- `$close` beendet den Workflow verbindlich; danach ist keine weitere inhaltliche Änderung der Dispensierdaten möglich.
- Falls ohne MedicationDispense aufgerufen wird, muss bereits eine gültige `$dispense`-Information gespeichert sein.
- Bei Stapelverarbeitung sind Lastverteilungsregeln einzuhalten.
- Die maximale Dateigröße für die Kommunikation am E-Rezept-Fachdienst beträgt derzeit 1MB. Dies meint den kompletten Request, daher muss der innere VAU-Request etwas kleiner als 1MB sein. Für Verordnungen, die mehrere Abgaben erfordern ist darauf zu achten, dass für mehrere Abgaben einer Charge nur eine MedicationDispense erstellt wird.

### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.html) festgehalten.

