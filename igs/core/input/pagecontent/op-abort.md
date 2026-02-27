

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$abort` gesendet.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zu `$abort`](./op-abort-fd-requirements.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [E-Rezept-FdV Anforderungen zu `$abort`](./op-abort-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.
- [AVS Anforderungen zu `$abort`](./op-abort-req-avs.html): Anforderungen an das AVS zur Nutzung der Schnittstelle.
- [PVS Anforderungen zu `$abort`](./op-abort-req-pvs.html): Anforderungen an das PVS zur Nutzung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:
- [API-ERP: E-Rezept löschen verordnend](https://github.com/gematik/api-erp/blob/master/docs/erp_bereitstellen.adoc#ein-e-rezept-l%C3%B6schen)
- [API-ERP: E-Rezept löschen abgebend](https://github.com/gematik/api-erp/blob/master/docs/erp_abrufen.adoc#e-rezept-l%C3%B6schen)
- [API-ERP: E-Rezept löschen Versicherter](https://github.com/gematik/api-erp/blob/master/docs/erp_versicherte.adoc#ein-e-rezept-l%C3%B6schen)


### Hinweis

- Nach erfolgreichem `$abort` sind lokale Einlöseinformationen (`secret`, Token-Bezug) im Client zu bereinigen.
- Fehlercodes und OperationOutcome-Hinweise sollen dem Nutzer mit klarem Bezug zum Task-Status angezeigt werden.

### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.html) festgehalten.
