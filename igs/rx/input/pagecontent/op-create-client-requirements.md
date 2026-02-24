# Client-Anforderungen: Operation `$create`

Diese Seite beschreibt die Anforderungen an Clients zur Nutzung von `$create`.

## Normative Client-Anforderungen (Auszug)

- A_19275: Das Primärsystem MUSS ein E-Rezept-Bundle für die nachfolgende Signierung erstellen.
- A_19276: Das Primärsystem MUSS für ein neues E-Rezept eine E-Rezept-ID über die Fachdienst-Schnittstelle abrufen.
- A_19281-03: Das Primärsystem MUSS den QES-signierten Datensatz für das anschließende Einstellen vorbereiten.

## Hinweise zur Nutzung

- Ein `Task` für `$create` soll nur bedarfsbezogen für eine konkrete Verordnung erzeugt werden.
- Aus der API-Produktdokumentation: Task-IDs dürfen nicht auf Vorrat erzeugt bzw. bevorratet werden.
- Der Client muss AccessCode und PrescriptionID sicher speichern, weil beide für `$activate` benoetigt werden.

Quelle für Produkthinweise: [api-erp](https://github.com/gematik/api-erp/blob/master/docs/erp_bereitstellen.adoc#e-rezept-erstellen)
