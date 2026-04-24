
### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$reject` gesendet.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu `$reject`](./op-reject-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [AVS-Anforderungen zu `$reject`](./op-reject-req-avs.html): Anforderungen an ein Apothekenverwaltungssystem zur Nutzung der Schnittstelle.
- [KTR-Anforderungen zu `$reject`](./op-reject-req-ktr.html): Anforderungen an ein Clientsystem des Kostenträgers zur Nutzung der Schnittstelle.

### API Beschreibung

Die konkrete API, wie die Operation zu nutzen ist, ist dem jeweiligen Modul IG zu entnehmen.

### Hinweise

- `reject` und direktes erneutes `accept` sollen nicht als Übergabemechanismus zwischen Apotheken verwendet werden, da dies für Versicherte schwer nachvollziehbare Protokollierung/Notifications erzeugt.
- Im Ergebnis der `$reject`-Operation wird der referenzierte Task auf den aktiven Status ready zurückgesetzt und das `secret` gelöscht. Dementsprechend werden keine Daten an den aufrufenden Client zurückgegeben.
