# Operation $create (Task erzeugen) - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* **Operation $create (Task erzeugen)**

## Operation $create (Task erzeugen)

Diese Operation basiert auf der gleichnamigen Operation in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/1.0.0/op-create.html).

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/$create` gesendet.

### Anforderungen an Schnittstelle

* [FD-Anforderungen zu `$create`](./op-create-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [PVS-Anforderungen zu `$create`](./op-create-req-pvs.md): Anforderungen an das PVS zur Nutzung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:

* [API-ERP: E-Rezept erstellen](https://github.com/gematik/api-erp/blob/master/docs/erp_bereitstellen.adoc#e-rezept-erstellen)

### Hinweise

* Task-IDs dürfen nicht auf Vorrat erzeugt bzw. bevorratet werden.
* `$create` ist nur für konkrete, unmittelbar folgende Verordnungsprozesse zu verwenden.
* Quelle: [api-erp: E-Rezept erstellen](https://github.com/gematik/api-erp/blob/master/docs/erp_bereitstellen.adoc#e-rezept-erstellen).

