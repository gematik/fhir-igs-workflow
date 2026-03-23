# Operation API: E-Rezepte zur Einlösung im EU-Ausland abrufen - TIFlow - Grenzüberschreitender Datenaustausch v0.9.0

TIFlow - Grenzüberschreitender Datenaustausch

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* **Operation API: E-Rezepte zur Einlösung im EU-Ausland abrufen**

## Operation API: E-Rezepte zur Einlösung im EU-Ausland abrufen

Der abgebenden Apotheke im europäischen Ausland werden Ressourcen des MedicationRequest sowie die darin verknüpften Ressourcen mit Informationen über im europäischen Ausland einlösbare Verordnungen bereitgestellt. Der Zugriff auf diese Ressourcen erfolgt ausschließlich lesend durch den deutschen NCPeH-FD, der die Informationen entsprechend aufbereitet und weiterleitet.

### Nachricht

Die Nachricht wird als HTTP `POST` an `/$get-eu-prescriptions` gesendet.

### Anforderungen an Schnittstelle

* [Server Anforderungen zu `$get-eu-prescriptions`](./op-get-eu-prescriptions-req-fd.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [NCPeH Anforderungen zu `$get-eu-prescriptions`](./op-get-eu-prescriptions-req-ncpeha.md): Anforderungen an den NCPeH-FD zur Nutzung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:

* [API-ERP: Abfragen von E-Rezepten des E-Rezept-Fachdienst](https://github.com/gematik/api-erp/blob/master/docs/erp_eprescription.adoc#abfragen-von-e-rezepten-des-e-rezept-fachdienst)

