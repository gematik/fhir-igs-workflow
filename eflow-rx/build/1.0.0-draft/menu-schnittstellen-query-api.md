# Query API - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **Query API**

## Query API

Query API

Diese Seite bietet den Einstieg in die lesenden RX-Schnittstellen.

## Lesereihenfolge

1. Modulübergreifende Regeln aus eFlow Core
1. RX-spezifische Query-Regeln in den folgenden Seiten

## Ressourcen

* [Task](./query-api-task.md)
* [MedicationDispense](./query-api-medicationdispense.md)

Auch in der Query API werden FD- und Client-Anforderungen jeweils in eigene Unterseiten getrennt.

Die Task-Seite umfasst die Varianten `GET /Task`, `GET /Task/{id}`, `GET /Task/{id}?ac=...` und `GET /Task/{id}?secret=...`.

Modulübergreifende Query-Ressourcen sind im Core IG beschrieben:

* [AuditEvent (Core)](https://gemspec.gematik.de/ig/fhir/1.0.0query-api-auditevent.html)
* [Device (Core)](https://gemspec.gematik.de/ig/fhir/1.0.0query-api-device.html)

