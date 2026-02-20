# Client-Anforderungen: Task-Query - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Task**](query-api-task.md)
* **Client-Anforderungen: Task-Query**

## Client-Anforderungen: Task-Query

# Client-Anforderungen: Query API Task

Diese Seite beschreibt Anforderungen an Clients zur Nutzung der Task-Query-Endpunkte.

## Normative Client-Anforderungen (Auszug)

* A_23449-02: Beim Apothekenabruf von Versichertenrezepten MUSS `GET /Task` mit `pnw`, `kvnr` und `hcv` korrekt aufgerufen werden.
* A_23152: Nicht belieferte, aber bereits reservierte E-Rezepte MUESSEN durch den Client wieder zurückgegeben werden.
* A_19292: Für den erneuten Quittungsabruf MUSS `GET /Task/<id>?secret=...` verwendet werden.

## Hinweise zur Nutzung

* `OperationOutcome` aus Query-Aufrufen ist im Client als konkrete Handlungsanweisung darzustellen.
* Zugriffsinformationen (`AccessCode`, `secret`) sind als hochsensible Daten zu behandeln und nicht zu protokollieren.

