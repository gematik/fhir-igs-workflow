# Technische Umsetzung – Verarbeitungsregeln

## Änderungen im E‑Rezept‑Fachdienst

Die Spezifikation benennt Anpassungen u. a. in folgenden Bereichen:

* Verwaltung der Nutzersession
* Routing von Requests
* Fehlercodes
* Protokollierung
* HTTP‑Operationen GET, POST, PATCH und DELETE
* Ressource Consent
* Verordnungen und Zugriffsberechtigungen für Einlösen im EU‑Ausland

## Kommunikations‑ und Headerregeln

### HTTP‑Header user-agent

Das Clientsystem MUSS den HTTP‑Header user-agent gemäß RFC7231 mit
<Produktname>/<Produktversion> <Herstellername>/<client_id> befüllen.

### HTTP‑Header X-erp-user

Das Clientsystem MUSS den Header X-erp-user mit einem der Werte setzen:

* l (LE‑Rolle/PS)
* k (CS eines Kostenträgers)
* v (E‑Rezept‑FdV)
* n (NCPeH‑FD)

### HTTP‑Header X-erp-resource

| Operation | X-erp-resource |
| --- | --- |
| POST /Task/<id>/$eu-close | Task |
| POST /$get-eu-prescriptions | Prescription |
| GET /$read-eu-access-permission | access-permission |
| POST /$grant-eu-access-permission | access-permission |
| DELETE /$revoke-eu-access-permission | access-permission |

## Sichere Kommunikation

* Kommunikation mit TI‑Diensten erfolgt ausschließlich über TLS.
* Für Zugriffe auf Task, Communication, Consent, Prescription und
  access-permission ist der VAU‑Kanal zu nutzen.

## Zulässige europäische Länder

Die Spezifikation enthält eine Liste zulässiger europäischer Länder für die
Einlösung im Ausland.