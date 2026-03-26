# Query API: Device - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* **Query API: Device**

## Query API: Device

Diese Seite beschreibt die modulübergreifende Device-Query-Schnittstelle.

### Nachricht

Die Device-Query wird über HTTP `GET` auf `/Device` aufgerufen.

### Anforderungen an Schnittstelle

* [Server Anforderungen zur Device-Query](./query-api-device-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [Client-Anforderungen zur Device-Query](./query-api-device-client-requirements.md): Anforderungen an den Client des TI-Flow-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

### Hinweise

* Die Ressource `Device` dient der statischen Selbstauskunft des TI-Flow-Fachdienstes.
* Der Endpunkt wird zur Bereitstellung von Produkttypinformationen genutzt.

