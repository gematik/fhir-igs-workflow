# Client-Anforderungen: Operation `$create`

Diese Seite beschreibt die Anforderungen an Clients zur Nutzung von `$create`.

## Normative Client-Anforderungen (Auszug)

- A_19275: Das Primaersystem MUSS ein E-Rezept-Bundle fuer die nachfolgende Signierung erstellen.
- A_19276: Das Primaersystem MUSS fuer ein neues E-Rezept eine E-Rezept-ID ueber die Fachdienst-Schnittstelle abrufen.
- A_19281-03: Das Primaersystem MUSS den QES-signierten Datensatz fuer das anschliessende Einstellen vorbereiten.

## Hinweise zur Nutzung

- Ein `Task` fuer `$create` soll nur bedarfsbezogen fuer eine konkrete Verordnung erzeugt werden.
- Aus der API-Produktdokumentation: Task-IDs duerfen nicht auf Vorrat erzeugt bzw. bevorratet werden.
- Der Client muss AccessCode und PrescriptionID sicher speichern, weil beide fuer `$activate` benoetigt werden.

Quelle fuer Produkthinweise: [api-erp](https://github.com/gematik/api-erp/blob/master/docs/erp_bereitstellen.adoc#e-rezept-erstellen)
