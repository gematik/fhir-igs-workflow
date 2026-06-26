# Technische Umsetzung - Zero Trust Access (ZETA) - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - draft 

* [**Table of Contents**](toc.md)
* **Technische Umsetzung - Zero Trust Access (ZETA)**

## Technische Umsetzung - Zero Trust Access (ZETA)

Der TI-Flow-Fachdienst ist ein Dienst im Internet. Jeder Zugriff auf den Resource Server läuft über einen **ZETA Guard**, der aus zwei Komponenten besteht:

* **PDP (Policy Decision Point)** – der Authorization Server. Er stellt Access Tokens (AT) und Refresh Tokens (RT) aus. Er enthält die Policy Engine (OPA), die entscheidet, welche Scopes ein Client bekommen darf.
* **PEP (Policy Enforcement Point)** – der HTTP-Proxy vor dem Resource Server. Er prüft bei **jedem** eingehenden Request das AT auf Gültigkeit, Audience und Scope.

Für Entwickler sind zwei Protokollphasen klar zu unterscheiden:

1. **Token-Ausstellung (PDP)**– Client fragt beim Authorization Server ein AT an (`POST /token`)
1. **Ressourcenzugriff (PEP)**– Client nutzt das AT für einen API-Call; der HTTP-Proxy prüft es vor jeder Weiterleitung

-------

### Phase 1 – Token-Ausstellung (POST /token)

#### Voraussetzung: Client-Registrierung (DCR)

Bevor ein Client Tokens anfragen kann, muss er einmalig pro ZETA Guard-Instanz registriert werden. Die Registrierung liefert eine `client_id`.

```
POST /register
Content-Type: application/json

{
  "client_name": "MeinPVS",
  "grant_types": ["urn:ietf:params:oauth:grant-type:token-exchange"],
  "token_endpoint_auth_method": "private_key_jwt",
  "jwks": { ... }   // Client Instance Public Key
}

```

Die `client_id` wird anschließend in allen `client_assertion`-JWTs als `iss` und `sub` verwendet.

-------

#### Option A – Neues Token (Token Exchange mit SM(C)-B-Attestierung)

Wird für neue Sessions verwendet, wenn noch kein gültiges Refresh Token vorliegt. Typisch für stationäre Clients (PVS, Krankenhaussystem) mit SM(C)-B.

**Ablauf:**

1. ZETA Client holt eine Einmal-Nonce vom PDP:`GET /nonce`
1. ZETA Client berechnet den Attestierungsnachweis:

```
attestation_challenge = SHA-256( SHA-256(Client_Instance_Public_Key_JWK) ‖ nonce )

```


1. TPM erzeugt ein Quote über`attestation_challenge`, signiert mit dem TPM Attestation Key
1. ZETA Client erstellt den`subject_token`– ein JWT, das vom Konnektor mit der SM(C)-B signiert wird und die`professionOID`der Institution enthält
1. ZETA Client erstellt die`client_assertion`– ein JWT, signiert mit dem Client Instance Key, das die TPM-Attestierung enthält
1. ZETA Client erstellt einen DPoP-Proof-JWT (gebunden an den Token-Endpoint und die Nonce)

**Token Request:**

```
POST /token
Content-Type: application/x-www-form-urlencoded
DPoP: <dpop-proof-jwt>

grant_type=urn%3Aietf%3Aparams%3Aoauth%3Agrant-type%3Atoken-exchange
&subject_token=<smcb-signed-jwt>
&subject_token_type=urn%3Aietf%3Aparams%3Aoauth%3Atoken-type%3Ajwt
&client_assertion_type=urn%3Aietf%3Aparams%3Aoauth%3Aclient-assertion-type%3Ajwt-bearer
&client_assertion=<client-assertion-jwt>
&scope=tif-rx-task-prescribe%20tif-diga-task-prescribe

```

**`client_assertion`-JWT Payload (Pfad A – mit TPM-Attestierung):**

```
{
  "iss": "<client_id>",
  "sub": "<client_id>",
  "aud": "<token_endpoint_url>",
  "exp": 1234567890,
  "jti": "<unique-id>",
  "urn:gematik:params:oauth:client-attestation:tpm2": {
    "attestation_data": "<Base64(client_statement)>",
    "client_statement_format": "client-statement"
  }
}

```

-------

#### Option B – Token-Verlängerung (Refresh Token)

Sobald ein Refresh Token vorhanden ist, kann damit ohne erneute SM(C)-B-Interaktion ein neues AT geholt werden. Das RT ist 12 Stunden gültig – innerhalb dieses Zeitraums ist keine Neuattestation nötig.

```
POST /token
Content-Type: application/x-www-form-urlencoded
DPoP: <dpop-proof-jwt>

grant_type=refresh_token
&refresh_token=<refresh-token>
&client_assertion_type=urn%3Aietf%3Aparams%3Aoauth%3Aclient-assertion-type%3Ajwt-bearer
&client_assertion=<client-assertion-jwt-ohne-attestierung>
&scope=tif-rx-task-prescribe%20tif-diga-task-prescribe

```

> **Hinweis:** Der `scope`-Parameter im Refresh-Request darf nur Scopes enthalten, die bereits im ursprünglichen AT enthalten waren.

-------

#### Was der PDP prüft (Policy Engine)

Die Policy Engine prüft bei jedem `/token`-Request vier Bedingungen – alle müssen erfüllt sein:

| | | |
| :--- | :--- | :--- |
| **Berufsgruppe / Institution** | `professionOID`aus dem`subject_token` | Muss in den erlaubten`roles`des angefragten Scopes stehen |
| **Client-Zulassung** | `product_id`+`product_version`aus dem ZETA-Client | Muss in der gematik-Zulassungsliste registriert sein |
| **Scopes** | `scope`-Parameter im Request | Alle angefragten Scopes müssen für die`professionOID`erlaubt sein |
| **Audience** | `resource`-Parameter (oder aus Scope abgeleitet) | Muss zu einem erlaubten Resource Server des Scopes passen |

Schlägt eine Prüfung fehl, liefert der PDP einen Fehler mit konkretem Grund (z.B. `"User profession is not allowed"`, `"One or more requested scopes are not allowed"`).

-------

#### Empfehlung: Alle benötigten Scopes in einem Request anfragen

> **Ein PVS oder Krankenhaussystem sollte in Pfad A immer alle Scopes anfragen, die es für seinen Betrieb benötigt – in einem einzigen Token Request.**

Begründung:

* Das AT ist nur 5 Minuten gültig, das RT aber 12 Stunden. Innerhalb der Session werden ATs per Pfad B (Refresh) verlängert – ohne erneute SM(C)-B-Interaktion und ohne Attestierung.
* Wenn ein Client nachträglich einen weiteren Scope benötigt, der nicht im ursprünglichen AT enthalten ist, muss er eine **vollständige neue Session** (Pfad A mit TPM-Attestierung) starten.
* Mehrere separate Token Requests für verschiedene Scopes erzeugen unnötigen Traffic und erhöhen die Latenz.

**Typische Scope-Kombination für eine Arztpraxis (PVS):**

```
scope=tif-rx-task-prescribe tif-diga-task-prescribe

```

**Typische Scope-Kombination für eine Apotheke:**

```
scope=tif-rx-task-dispense tif-rx-communication tif-rx-chargeitem-provide tif-rx-subscription

```

**Typische Scope-Kombination für eine FdV (Versicherter):**

```
scope=tif-rx-task-manage tif-rx-communication tif-rx-chargeitem-manage tif-rx-consent-manage tif-rx-eu-access-manage tif-rx-audit tif-rx-notification tif-diga-task-manage tif-diga-communication tif-diga-audit

```

-------

#### Token-Gültigkeitsdauer (TTL)

| | |
| :--- | :--- |
| Access Token (AT) | 300 Sekunden (5 Minuten) |
| Refresh Token (RT) | 43.200 Sekunden (12 Stunden) |

-------

### Phase 2 – Ressourcenzugriff über den PEP

Der PEP ist ein HTTP-Proxy, der vor dem TI-Flow-Fachdienst Resource Server sitzt. Jeder API-Call muss ein gültiges AT tragen.

**Request-Format:**

```
GET /rx/Task
Authorization: DPoP <access-token>
DPoP: <dpop-proof-jwt>

```

#### Was der PEP prüft

Der PEP prüft bei jedem Request folgende Bedingungen (gemäß §A_25668 gemSpec_ZETA):

1. **AT-Signatur**– das AT muss vom bekannten Authorization Server signiert sein
1. **Ablaufzeit**–`exp`-Claim des AT muss in der Zukunft liegen
1. **Audience**– der`aud`-Claim im AT muss zur URL des aufgerufenen Resource Backends passen
1. **Scope**– der`scope`-Claim im AT muss die angefragte HTTP-Methode + Pfad-Kombination abdecken
1. **DPoP-Bindung**– der DPoP-Proof muss gültig sein und zum`cnf`-Claim im AT passen (Proof of Possession)

Alle fünf Prüfungen müssen bestanden werden. Schlägt eine fehl, wird der Request mit `401 Unauthorized` abgewiesen.

#### Step-up Authentication

Fehlt im AT ein benötigter Scope oder passt die Audience nicht zur aufgerufenen URL, signalisiert der PEP einen Step-up (§A_28525):

```
HTTP/1.1 401 Unauthorized
WWW-Authenticate: Bearer error="insufficient_scope",
                  scope="tif-rx-task-prescribe",
                  resource="<resource-url>"

```

Der Client muss daraufhin beim PDP ein neues AT mit dem fehlenden Scope anfragen. Falls der Scope noch nie im bisherigen AT enthalten war, ist Pfad A (neue Session mit Attestierung) erforderlich.

-------

### Scopes nach Akteur – Übersicht

| | | | |
| :--- | :--- | :--- | :--- |
| Betriebsstätte Arzt | `oid_praxis_arzt` | `1.2.276.0.76.4.50` | * `tif-rx-task-prescribe`
* `tif-diga-task-prescribe`
 |
| Zahnarztpraxis | `oid_zahnarztpraxis` | `1.2.276.0.76.4.51` | * `tif-rx-task-prescribe`
* `tif-diga-task-prescribe`
 |
| Betriebsstätte Psychotherapeut | `oid_praxis_psychotherapeut` | `1.2.276.0.76.4.52` | * `tif-rx-task-prescribe`
* `tif-diga-task-prescribe`
 |
| Krankenhaus | `oid_krankenhaus` | `1.2.276.0.76.4.53` | * `tif-rx-task-prescribe`
* `tif-diga-task-prescribe`
 |
| Institution Vorsorge / Reha | `oid_institution-vorsorge-reha` | `1.2.276.0.76.4.257` | * `tif-rx-task-prescribe`
* `tif-diga-task-prescribe`
 |
| Öffentliche Apotheke | `oid_oeffentliche_apotheke` | `1.2.276.0.76.4.54` | * `tif-rx-task-dispense`
* `tif-rx-communication`
* `tif-rx-chargeitem-provide`
* `tif-rx-subscription`
 |
| Krankenhausapotheke | `oid_krankenhausapotheke` | `1.2.276.0.76.4.55` | * `tif-rx-task-dispense`
* `tif-rx-communication`
* `tif-rx-chargeitem-provide`
* `tif-rx-subscription`
 |
| Kostenträger | `oid_kostentraeger` | `1.2.276.0.76.4.59` | * `tif-diga-task-dispense`
* `tif-diga-communication`
* `tif-diga-subscription`
 |
| Versicherter (FdV) | `oid_versicherter` | `1.2.276.0.76.4.49` | * `tif-rx-task-manage`
* `tif-rx-communication`
* `tif-rx-chargeitem-manage`
* `tif-rx-consent-manage`
* `tif-rx-eu-access-manage`
* `tif-rx-audit`
* `tif-rx-notification`
* `tif-diga-task-manage`
* `tif-diga-communication`
* `tif-diga-audit`
 |
| NCPeH-Fachdienst | `oid_ncpeh` | `1.2.276.0.76.4.292` | * `tif-rx-task-ePeDA`
 |
| Betriebsstätte gematik | `oid_bs_gematik` | `1.2.276.0.76.4.58` | * `tif-rx-task-probe`
* `tif-diga-task-probe`
 |

-------

### Referenzen

#### Vollständige Policy-Definition

```
policies:

  # ── Arzneimittel ─────────────────────────────────────────────────────────────

  "tif-rx-task-prescribe":
    description: "E-Rezept verordnen"
    roles:
      - { oid: "1.2.276.0.76.4.50", description: "oid_praxis_arzt" }
      - { oid: "1.2.276.0.76.4.51", description: "oid_zahnarztpraxis" }
      - { oid: "1.2.276.0.76.4.52", description: "oid_praxis_psychotherapeut" }
      - { oid: "1.2.276.0.76.4.53", description: "oid_krankenhaus" }
      - { oid: "1.2.276.0.76.4.56", description: "oid_institution-vorsorge-reha" }
    rules:
      - { method: POST, path: "rx/Task/$create" }
      - { method: POST, path: "rx/Task/{id}/$activate" }
      - { method: POST, path: "rx/Task/{id}/$abort" }

  "tif-rx-task-dispense":
    description: "E-Rezept einlösen"
    roles:
      - { oid: "1.2.276.0.76.4.54", description: "oid_oeffentliche_apotheke" }
      - { oid: "1.2.276.0.76.4.55", description: "oid_krankenhausapotheke" }
    rules:
      - { method: POST, path: "rx/Task/$accept" }
      - { method: POST, path: "rx/Task/{id}/$reject" }
      - { method: POST, path: "rx/Task/{id}/$close" }
      - { method: POST, path: "rx/Task/{id}/$dispense" }
      - { method: POST, path: "rx/Task/{id}/$abort" }
      - { method: GET,  path: "rx/Task/" }
      - { method: GET,  path: "rx/Task/{id}" }

  "tif-rx-task-manage":
    description: "E-Rezepte verwalten"
    roles:
      - { oid: "1.2.276.0.76.4.49", description: "oid_versicherter" }
    rules:
      - { method: GET,   path: "rx/Task/" }
      - { method: GET,   path: "rx/Task/{id}" }
      - { method: POST,  path: "rx/Task/{id}/$abort" }
      - { method: PATCH, path: "rx/Task/{id}" }
      - { method: GET,   path: "rx/medicationdispense/" }
      - { method: GET,   path: "rx/medicationdispense/{id}" }

  "tif-rx-task-ePeDA":
    description: "E-Rezepte in EU einlösen"
    roles:
      - { oid: "1.2.276.0.76.4.292", description: "oid_ncpeh" }
    rules:
      - { method: POST, path: "rx/$get-eu-prescriptions" }
      - { method: POST, path: "rx/Task/{id}/$eu-close" }

  "tif-rx-communication":
    description: "Nachrichten zu E-Rezepten zwischen Versichertem und Apotheke"
    roles:
      - { oid: "1.2.276.0.76.4.49", description: "oid_versicherter" }
      - { oid: "1.2.276.0.76.4.54", description: "oid_oeffentliche_apotheke" }
      - { oid: "1.2.276.0.76.4.55", description: "oid_krankenhausapotheke" }
    rules:
      - { method: POST,   path: "/rx/Communication" }
      - { method: GET,    path: "/rx/Communication" }
      - { method: GET,    path: "/rx/Communication/{id}" }
      - { method: DELETE, path: "/rx/Communication/{id}" }

  "tif-rx-chargeitem-manage":
    description: "Abrechnungsinformationen verwalten"
    roles:
      - { oid: "1.2.276.0.76.4.49", description: "oid_versicherter" }
    rules:
      - { method: GET,    path: "rx/ChargeItem/" }
      - { method: GET,    path: "rx/ChargeItem/{id}" }
      - { method: PATCH,  path: "rx/ChargeItem/{id}" }
      - { method: DELETE, path: "rx/ChargeItem/{id}" }

  "tif-rx-chargeitem-provide":
    description: "Abrechnungsinformationen bereitstellen"
    roles:
      - { oid: "1.2.276.0.76.4.54", description: "oid_oeffentliche_apotheke" }
      - { oid: "1.2.276.0.76.4.55", description: "oid_krankenhausapotheke" }
    rules:
      - { method: GET,  path: "rx/ChargeItem/{id}" }
      - { method: POST, path: "rx/ChargeItem" }
      - { method: PUT,  path: "rx/ChargeItem/{id}" }

  "tif-rx-consent-manage":
    description: "Einwilligung verwalten"
    roles:
      - { oid: "1.2.276.0.76.4.49", description: "oid_versicherter" }
    rules:
      - { method: GET,    path: "rx/Consent/" }
      - { method: POST,   path: "rx/Consent/" }
      - { method: DELETE, path: "rx/Consent/" }

  "tif-rx-eu-access-manage":
    description: "EU-Berechtigung verwalten"
    roles:
      - { oid: "1.2.276.0.76.4.49", description: "oid_versicherter" }
    rules:
      - { method: GET,    path: "rx/$read-eu-access-permission" }
      - { method: POST,   path: "rx/$grant-eu-access-permission" }
      - { method: DELETE, path: "rx/$revoke-eu-access-permission" }

  "tif-rx-audit":
    description: "Zugriffsprotokoll abrufen"
    roles:
      - { oid: "1.2.276.0.76.4.49", description: "oid_versicherter" }
    rules:
      - { method: GET, path: "rx/AuditEvent" }
      - { method: GET, path: "rx/AuditEvent/{id}" }

  "tif-rx-notification":
    description: "App Notification verwalten"
    roles:
      - { oid: "1.2.276.0.76.4.49", description: "oid_versicherter" }
    rules:
      - { method: GET,  path: "rx/pushers" }
      - { method: POST, path: "rx/pushers/set" }
      - { method: GET,  path: "rx/channels" }
      - { method: POST, path: "rx/channels/{pushkey}" }

  "tif-rx-subscription":
    description: "Benachrichtigungen registrieren"
    roles:
      - { oid: "1.2.276.0.76.4.54", description: "oid_oeffentliche_apotheke" }
      - { oid: "1.2.276.0.76.4.55", description: "oid_krankenhausapotheke" }
    rules:
      - { method: POST, path: "rx/Subscription" }

  "tif-rx-task-probe":
    description: "Probing E-Rezept"
    roles:
      - { oid: "1.2.276.0.76.4.58", description: "oid_bs_gematik" }
    rules:
      - { method: POST, path: "rx/Task/$create" }

  # ── DiGA Verordnung ────────────────────────────────────────────────────────

  "tif-diga-task-prescribe":
    description: "DiGA Verordnung verordnen"
    roles:
      - { oid: "1.2.276.0.76.4.50", description: "oid_praxis_arzt" }
      - { oid: "1.2.276.0.76.4.51", description: "oid_zahnarztpraxis" }
      - { oid: "1.2.276.0.76.4.52", description: "oid_praxis_psychotherapeut" }
      - { oid: "1.2.276.0.76.4.53", description: "oid_krankenhaus" }
      - { oid: "1.2.276.0.76.4.56", description: "oid_institution-vorsorge-reha" }
    rules:
      - { method: POST, path: "diga/Task/$create" }
      - { method: POST, path: "diga/Task/{id}/$activate" }
      - { method: POST, path: "diga/Task/{id}/$abort" }

  "tif-diga-task-dispense":
    description: "DiGA Verordnung einlösen"
    roles:
      - { oid: "1.2.276.0.76.4.59", description: "oid_kostentraeger" }
    rules:
      - { method: POST, path: "diga/Task/$accept" }
      - { method: POST, path: "diga/Task/{id}/$reject" }
      - { method: POST, path: "diga/Task/{id}/$close" }
      - { method: GET,  path: "diga/Task/{id}" }

  "tif-diga-task-manage":
    description: "DiGA Verordnungen verwalten"
    roles:
      - { oid: "1.2.276.0.76.4.49", description: "oid_versicherter" }
    rules:
      - { method: GET,  path: "diga/Task/" }
      - { method: GET,  path: "diga/Task/{id}" }
      - { method: POST, path: "diga/Task/{id}/$abort" }
      - { method: GET,  path: "diga/medicationdispense/" }
      - { method: GET,  path: "diga/medicationdispense/{id}" }

  "tif-diga-communication":
    description: "Nachrichten zu DiGA-Verordnungen zwischen Versichertem und Kostenträger"
    roles:
      - { oid: "1.2.276.0.76.4.49", description: "oid_versicherter" }
      - { oid: "1.2.276.0.76.4.59", description: "oid_kostentraeger" }
    rules:
      - { method: POST,   path: "/diga/Communication" }
      - { method: GET,    path: "/diga/Communication" }
      - { method: GET,    path: "/diga/Communication/{id}" }
      - { method: DELETE, path: "/diga/Communication/{id}" }

  "tif-diga-audit":
    description: "Zugriffsprotokoll abrufen"
    roles:
      - { oid: "1.2.276.0.76.4.49", description: "oid_versicherter" }
    rules:
      - { method: GET, path: "diga/AuditEvent" }
      - { method: GET, path: "diga/AuditEvent/{id}" }

  "tif-diga-subscription":
    description: "Benachrichtigungen registrieren"
    roles:
      - { oid: "1.2.276.0.76.4.59", description: "oid_kostentraeger" }
    rules:
      - { method: POST, path: "diga/Subscription" }

  "tif-diga-task-probe":
    description: "Probing DiGA"
    roles:
      - { oid: "1.2.276.0.76.4.58", description: "oid_bs_gematik" }
    rules:
      - { method: POST, path: "diga/Task/$create" }

```

#### Vollständige Scope-Liste (token-config)

```
{
  "access_token_ttl": 300,
  "refresh_token_ttl": 43200,
  "allowed_scopes": [
    "tif-rx-task-prescribe",
    "tif-rx-task-dispense",
    "tif-rx-task-manage",
    "tif-rx-task-ePeDA",
    "tif-rx-communication",
    "tif-rx-chargeitem-manage",
    "tif-rx-chargeitem-provide",
    "tif-rx-consent-manage",
    "tif-rx-eu-access-manage",
    "tif-rx-audit",
    "tif-rx-notification",
    "tif-rx-subscription",
    "tif-rx-task-probe",
    "tif-diga-task-prescribe",
    "tif-diga-task-dispense",
    "tif-diga-task-manage",
    "tif-diga-communication",
    "tif-diga-audit",
    "tif-diga-subscription",
    "tif-diga-task-probe"
  ]
}

```

#### Weiterführende Referenzen

* [gemSpec_ZETA] – Spezifikation des Zero Trust Access-Mechanismus
* [Nutzung ZETA-Client durch Clientsysteme](./zeta-client.md)

