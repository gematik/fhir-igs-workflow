

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$abort` gesendet.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu `$abort`](./op-abort-fd-requirements.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [PVS-Anforderungen zu `$abort`](./op-abort-req-pvs.html): Anforderungen an ein Praxisverwaltungssystem zur Nutzung der Schnittstelle.
- [AVS-Anforderungen zu `$abort`](./op-abort-req-avs.html): Anforderungen an ein Praxisverwaltungssystem zur Nutzung der Schnittstelle.
- [FdV-Anforderungen zu `$abort`](./op-abort-req-avs.html): Anforderungen an ein E-Rezept-FdV zur Nutzung der Schnittstelle.

### API Beschreibung

Die konkrete API, wie die Operation zu nutzen ist, ist dem jeweiligen Modul IG zu entnehmen.


### Hinweise

- Nach erfolgreichem `$abort` sind lokale Einlöseinformationen (`secret`, Token-Bezug) im Client zu bereinigen.
- Im Ergebnis der `$abort`-Operation wird der referenzierte Task gelöscht. Dementsprechend werden keine Daten an den aufrufenden Client zurückgegeben.
