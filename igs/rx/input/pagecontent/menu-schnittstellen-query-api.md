Query API

Diese Seite bietet den Einstieg in die lesenden RX-Schnittstellen.

## Lesereihenfolge

1. Modulübergreifende Regeln aus eFlow Core
2. RX-spezifische Query-Regeln in den folgenden Seiten

## Ressourcen

- [Task](./query-api-task.html)
- [MedicationDispense](./query-api-medicationdispense.html)

Auch in der Query API werden FD- und Client-Anforderungen jeweils in eigene Unterseiten getrennt.

Die Task-Seite umfasst die Varianten `GET /Task`, `GET /Task/{id}`, `GET /Task/{id}?ac=...` und `GET /Task/{id}?secret=...`.

Modulübergreifende Query-Ressourcen sind im Core IG beschrieben:

- [AuditEvent (Core)](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}query-api-auditevent.html)
- [Device (Core)](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}query-api-device.html)
