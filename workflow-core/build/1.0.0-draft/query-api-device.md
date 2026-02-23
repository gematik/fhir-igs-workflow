# Query API: Device - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* **Query API: Device**

## Query API: Device

# Query API: Device

Diese Seite beschreibt die moduluebergreifende Device-Query-Schnittstelle.

### Nachricht

Die Device-Query wird ueber HTTP `GET` auf `/Device` aufgerufen.

### Anforderungen an Schnittstelle

* [FD-Anforderungen zur Device-Query](./query-api-device-fd-requirements.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [Client-Anforderungen zur Device-Query](./query-api-device-client-requirements.md): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

#### GET /Device

```
server
```

### Hinweis

* Die Ressource `Device` dient der statischen Selbstauskunft des E-Rezept-Fachdienstes.
* Der Endpunkt wird zur Bereitstellung von Produkttypinformationen genutzt.

