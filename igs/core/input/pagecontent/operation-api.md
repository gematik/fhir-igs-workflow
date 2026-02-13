# Operation API (moduluebergreifend)

Dieses Kapitel beschreibt die moduluebergreifenden Basisanforderungen fuer FHIR-Operationen auf `Task`.

Die fachmodulspezifischen Erweiterungen sind in den jeweiligen Fach-IGs dokumentiert:

- E-Rezept RX
- DiGA
- weitere Fachmodule

## Shared Operations

- [$create](./op-create.html)
- [$activate](./op-activate.html)
- [$abort](./op-abort.html)

Hinweis: Ein Fachmodul MUSS in seiner jeweiligen Operationsseite klar angeben, welche Anforderungen aus dem Core geerbt werden und welche modulspezifischen Anforderungen zusaetzlich gelten.
