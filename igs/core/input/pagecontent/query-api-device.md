# Query API: Device

Diese Seite beschreibt die moduluebergreifende Device-Query-Schnittstelle.

### Nachricht

Die Device-Query wird ueber HTTP `GET` auf `/Device` aufgerufen.

### Anforderungen an Schnittstelle

- [Server Anforderungen zur Device-Query](./query-api-device-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [Client-Anforderungen zur Device-Query](./query-api-device-client-requirements.html): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

- [Erweiterter Health-Check](https://github.com/gematik/api-erp/blob/master/docs/erp_ps_probing.adoc#erweiterter-health-check)

### Hinweis

- Die Ressource `Device` dient der statischen Selbstauskunft des E-Rezept-Fachdienstes.
- Der Endpunkt wird zur Bereitstellung von Produkttypinformationen genutzt.
