# Operation $accept (Task akzeptieren) - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* **Operation $accept (Task akzeptieren)**

## Operation $accept (Task akzeptieren)

Diese Operation basiert auf der gleichnamigen Operation in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/1.0.0/op-accept.html).

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$accept` gesendet.

### Anforderungen an Schnittstelle

* [FD-Anforderungen zu `$accept`](./op-accept-req-fd.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [AVS-Anforderungen zu `$accept`](./op-accept-req-avs.md): Anforderungen an das AVS zur Nutzung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:

* [API-ERP: E-Rezept abrufen](https://github.com/gematik/api-erp/blob/master/docs/erp_abrufen.adoc#e-rezept-abrufen)

### Hinweis

* Die Rückgabe kann bei Mehrfachverordnung mit `403` scheitern, wenn die Einlösefrist noch nicht begonnen hat.
* AccessCode und insbesondere `secret` sind als hochsensible Daten zu behandeln.

