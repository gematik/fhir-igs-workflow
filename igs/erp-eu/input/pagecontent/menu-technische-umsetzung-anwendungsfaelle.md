# Technische Umsetzung – Anwendungsfälle

Die Spezifikation ordnet die Use Cases konkreten HTTP‑Operationen zu.

## Zuordnung Use Cases zu Operationen

| Use Case | Operation | Schnittstelle |
| --- | --- | --- |
| ERP.UC_3_16 | POST /$grant-eu-access-permission | FdV |
| ERP.UC_3_17 | DELETE /$revoke-eu-access-permission | FdV |
| ERP.UC_3_18 | GET /$read-eu-access-permission | FdV |
| ERP.UC_4_19 | POST /$get-eu-prescriptions (requesttype demographics) | NCPeH‑FD |
| ERP.UC_4_20 | POST /$get-eu-prescriptions (requesttype e-prescriptions-list) | NCPeH‑FD |
| ERP.UC_4_21 | POST /$get-eu-prescriptions (requesttype e-prescriptions-retrieval) | NCPeH‑FD |
| ERP.UC_4_22 | POST /Task/<id>/$eu-close | NCPeH‑FD |

## E‑Rezept markieren

Für das Markieren von E‑Rezepten wird eine HTTP‑Operation PATCH beschrieben.