# Operation API: Abgabe von E-Rezepten im EU-Ausland - TIFlow - Grenzüberschreitender Datenaustausch v0.9.0

TIFlow - Grenzüberschreitender Datenaustausch

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* **Operation API: Abgabe von E-Rezepten im EU-Ausland**

## Operation API: Abgabe von E-Rezepten im EU-Ausland

Die FHIR-Operation $eu-close beendet den E-Rezept-Workflow des unter der  geführten Tasks und speichert die von der europäischen Apotheke übermittelten Dispensierinformationen für den Versicherten. Diese Operation steht ausschließlich dem NCPeH-FD zur Verfügung.

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/$eu-close` gesendet.

### Anforderungen an Schnittstelle

* [Server Anforderungen zu `$eu-close`](op-eu-close-req-fd.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [NCPeH Anforderungen zu `$eu-close`](./op-eu-close-req-ncpeha.md): Anforderungen an den NCPeH-FD zur Nutzung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:

* [API-ERP: Abgabeinformationen zu einem E-Rezept einstellen](https://github.com/gematik/api-erp/blob/master/docs/erp_eprescription.adoc#abgabeinformationen-zu-einem-e-rezept-einstellen)

