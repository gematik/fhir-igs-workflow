# Operation $abort (Task abbrechen) - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* **Operation $abort (Task abbrechen)**

## Operation $abort (Task abbrechen)

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$abort` gesendet.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu `$abort`](./op-abort-fd-requirements.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [PVS-Anforderungen zu `$abort`](./op-abort-req-pvs.md): Anforderungen an ein Praxisverwaltungssystem zur Nutzung der Schnittstelle.
* [AVS-Anforderungen zu `$abort`](./op-abort-req-avs.md): Anforderungen an ein Praxisverwaltungssystem zur Nutzung der Schnittstelle.
* [FdV-Anforderungen zu `$abort`](./op-abort-req-avs.md): Anforderungen an ein E-Rezept-FdV zur Nutzung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:

* [API-ERP: E-Rezept löschen verordnend](https://github.com/gematik/api-erp/blob/master/docs/erp_bereitstellen.adoc#ein-e-rezept-l%C3%B6schen)
* [API-ERP: E-Rezept löschen abgebend](https://github.com/gematik/api-erp/blob/master/docs/erp_abrufen.adoc#e-rezept-l%C3%B6schen)
* [API-ERP: E-Rezept löschen Versicherter](https://github.com/gematik/api-erp/blob/master/docs/erp_versicherte.adoc#ein-e-rezept-l%C3%B6schen)

### Hinweis

* Nach erfolgreichem `$abort` sind lokale Einlöseinformationen (`secret`, Token-Bezug) im Client zu bereinigen.
* Fehlercodes und OperationOutcome-Hinweise sollen dem Nutzer mit klarem Bezug zum Task-Status angezeigt werden.

