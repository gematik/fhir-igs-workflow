# Query API: AuditEvent - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* **Query API: AuditEvent**

## Query API: AuditEvent

Diese Seite beschreibt die modulübergreifende AuditEvent-Query-Schnittstelle.

### Nachricht

Die AuditEvent-Query wird über HTTP `GET` auf `/AuditEvent` und `/AuditEvent/{id}` aufgerufen.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zur AuditEvent-Query](./query-api-auditevent-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zur AuditEvent-Query](./query-api-auditevent-req-fdv.md): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

### Hinweise

* Dieser Aufruf soll nicht regelmäßig im FdV ausgeführt werden, sondern nur, wenn der Versicherte Einsicht in das Protokoll nehmen möchte. Dies spart Ressourcen am TI-Flow-Fachdienst.
* Die Angabe “`total`” wird vom TI-Flow-Fachdienst aus Gründen der Performance nicht unterstützt. Die Anzahl der zurückgegebenen Einträge ist nach Möglichkeit immer 50.
* Die Sprache muss in jedem Aufruf mittels “Accept-Language” Heder übergeben werden, um die Protokolleinträge in der bevorzugten Sprache des Versicherten zurückzugeben.

