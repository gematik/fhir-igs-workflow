### Validierung von Dosierungsinformationen

Die Validierung von Dosierungsinformationen erfolgt als Teil der Payload- und Profilpruefung bei `$activate`.

Wesentliche Pruefpunkte:

- Konsistenz der verordneten Medikation mit dem jeweiligen Workflowtyp
- Profilkonforme Kodierung und Struktur innerhalb des KBV-Bundles
- Rueckmeldung von Fach- und Validierungsfehlern ueber `OperationOutcome`

Fuer die normativen Anforderungen ist die Seite [Operation API: E-Rezept aktivieren](./op-activate.html) massgeblich.
