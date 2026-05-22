# Operation $reject (Task zurückweisen) - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* **Operation $reject (Task zurückweisen)**

## Operation $reject (Task zurückweisen)

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$reject` gesendet.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu `$reject`](./op-reject-req-fd.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [AVS-Anforderungen zu `$reject`](./op-reject-req-avs.md): Anforderungen an ein Apothekenverwaltungssystem zur Nutzung der Schnittstelle.
* [KTR-Anforderungen zu `$reject`](./op-reject-req-ktr.md): Anforderungen an ein Clientsystem des Kostenträgers zur Nutzung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:

* [API-ERP: E-Rezept zurückweisen](https://github.com/gematik/api-erp/blob/master/docs/erp_abrufen.adoc#e-rezept-zur%C3%BCckweisen)

### Hinweis

* `reject` und direktes erneutes `accept` sollen nicht als Übergabemechanismus zwischen Apotheken verwendet werden, da dies für Versicherte schwer nachvollziehbare Protokollierung/Notifications erzeugt.

