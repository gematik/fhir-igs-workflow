# Technische Umsetzung – Anwendungsfälle

Die Spezifikation ordnet die Use Cases konkreten HTTP‑Operationen zu.

## Zuordnung Use Cases zu Operationen

| Use Case (ID) | Operation | Schnittstelle |
| --- | --- | --- |
| AF_10084-01 | POST /Consent | FdV |
| AF_10085-01 | DELETE /Consent | FdV |
| AF_10086-01 | GET /Consent | FdV |
| AF_10395 | POST /$grant-eu-access-permission | FdV |
| AF_10405 | DELETE /$revoke-eu-access-permission | FdV |
| AF_10406 | GET /$read-eu-access-permission | FdV |
| AF_10408 | PATCH /Task/<id> | FdV |
| AF_10396 | POST /$get-eu-prescriptions (requesttype demographics) | NCPeH‑FD |
| AF_10397 | POST /$get-eu-prescriptions (requesttype e-prescriptions-list) | NCPeH‑FD |
| AF_10398 | POST /$get-eu-prescriptions (requesttype e-prescriptions-retrieval) | NCPeH‑FD |
| AF_10399 | POST /Task/<id>/$eu-close | NCPeH‑FD |

## E‑Rezept markieren

Für das Markieren von E‑Rezepten wird eine HTTP‑Operation PATCH beschrieben. Nur
markierte E‑Rezepte werden im EU‑Kontext ausgeliefert.