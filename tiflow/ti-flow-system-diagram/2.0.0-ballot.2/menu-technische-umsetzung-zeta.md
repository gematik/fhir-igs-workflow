# Zero Trust Access (ZETA) - TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* **Zero Trust Access (ZETA)**

## Zero Trust Access (ZETA)

Der TI-Flow-Fachdienst ist ein Dienst im Internet. Der Schutz vor unberechtigtem Zugriff wird nach dem Zero Trust-Paradigma durch einen Policy Enforcement Point und einen Policy Decision Point durchgesetzt. Diese Zero Trust Access (ZETA) Funktionalität für Dienste der der TI wird anwendungsübergreifend in [gemSpec_ZETA] beschrieben.

### ZETA Guard Policy Engine - Zugriffsregeln

Dieses Dokument dient als Grundlage für die Abstimmung über eine technische Zugriffsrichtlinie. Ziel ist es, in verständlicher Sprache zu erläutern, welche Prüfungen durchgeführt werden, bevor ein Zugriff auf den TI-Flow-Fachdienst gewährt wird.

#### Grundprinzip der Richtlinie

Die hier beschriebene Richtlinie funktioniert nach einem einfachen Prinzip: Ein Zugriff wird nur dann erlaubt, wenn **alle** definierten Bedingungen erfüllt sind. Scheitert eine Prüfung, wird der Zugriff verweigert und die Gründe für die Ablehnung werden protokolliert.

#### Prüfungen im Detail

Im Folgenden werden die Prüfungen beschrieben, die ein anfragendes System erfolgreich durchlaufen muss.

##### Prüfung der Einrichtungsart oder der Berufsgruppe

Diese Regel stellt sicher, dass nur bestimmte Berufsgruppen oder Arten von Einrichtungen auf das System zugreifen dürfen. Technisch wird dies über eine sogenannte OID (Object Identifier) geprüft, eine eindeutige Kennung für jeden Beruf oder jede Einrichtung.

**Was wird geprüft?** Es wird die Berufsgruppen- bzw. Einrichtungs-OID des anfragenden Nutzers bzw. der anfragenden Institution mit einer Liste von erlaubten Kennungen abgeglichen.

**Wer darf zugreifen?** Folgende Berufe und Einrichtungsarten sind zugelassen:

##### Akteure & OIDs

| | |
| :--- | :--- |
| Versicherter | `1.2.276.0.76.4.49` |
| Betriebsstätte Arzt | `1.2.276.0.76.4.50` |
| Zahnarztpraxis | `1.2.276.0.76.4.51` |
| Betriebsstätte Psychotherapeut | `1.2.276.0.76.4.52` |
| Krankenhaus | `1.2.276.0.76.4.53` |
| Öffentliche Apotheke | `1.2.276.0.76.4.54` |
| Krankenhausapotheke | `1.2.276.0.76.4.55` |
| Institution Vorsorge/Reha | `1.2.276.0.76.4.56` |
| Kostenträger | `1.2.276.0.76.4.59` |
| NCPeH-Fachdienst | `1.2.276.0.76.4.292` |

##### Prüfung der Client-Anwendung

Diese Regel verifiziert, dass das anfragende Clientsystem in der genutzten Version für den Zugriff bei der gematik registriert sind. Jede Software, die auf das System zugreifen möchte, identifiziert sich mit einer Produktkennung (product_id) und einer Versionsnummer (product_version).

**Was wird geprüft?** Es wird geprüft, ob die Kombination aus Produkt und Version in einer Liste der erlaubten Software-Versionen enthalten ist.

**Beispiel:**

* Produkt A ist in den Versionen 1.2 und 1.3 erlaubt.
* Produkt B ist in Version 2.5 erlaubt.

Eine Anfrage von Produkt A in Version 1.2 wäre erfolgreich, eine Anfrage von Produkt A in Version 1.1 würde jedoch scheitern.

##### Prüfung der angeforderten Berechtigungen (Scopes)

Diese Regel stellt sicher, dass die anfragende Anwendung nur die Berechtigungen anfordert, die ihr auch gewährt werden dürfen. Anwendungen können bestimmte “Scopes” anfordern, die ihnen Lese- oder Schreibzugriff auf bestimmte Datenbereiche gewähren.

**Was wird geprüft?** Es wird die Liste der von der Anwendung angeforderten Berechtigungen mit der Liste der maximal erlaubten Berechtigungen abgeglichen. Die Anfrage ist nur dann erfolgreich, wenn **alle** angeforderten Berechtigungen in der Liste der erlaubten Berechtigungen enthalten sind.

**Beispiel:**

* Erlaubte Berechtigungen sind: `task.read`
* Client-Anwendung fordert an: `task.read` -> **Erfolg**
* Client-Anwendung fordert an: `/erezept` -> **Fehler** (da `/erezept` nicht erlaubt ist)

#### Scope Definition

Die Verbindungen von Akteuren und Use Cases erzeugen die folgende Scope Definition. Sie ist unter Referenzen aufgeführt.

##### Prüfung der Ziel-Ressource (Audience)

Diese Regel kontrolliert, auf welche Zielsysteme oder Datenbereiche (“Audiences”) zugegriffen werden darf. Dies ist eine zusätzliche Sicherheitsebene, um sicherzustellen, dass ein Zugriffstoken nur für den vorgesehenen Zweck verwendet wird.

**Was wird geprüft?** Es wird abgeglichen, ob die von der Anwendung angefragten Ziel-Ressourcen in der Liste der erlaubten Ressourcen enthalten sind. Ähnlich wie bei den Berechtigungen müssen **alle** angefragten “Audiences” erlaubt sein.

**Beispiel:**

* Erlaubte Ziel-Ressourcen: `rx/Task`
* Anwendung fordert Zugriff auf: `rx/Task` -> **Erfolg**
* Anwendung fordert Zugriff auf: `/eRezept` -> **Fehler** (da `eRezept` unbekannt und somit nicht erlaubt ist)

#### Gültigkeitsdauer der Zugriffstoken (TTL)

Wenn alle Prüfungen erfolgreich sind, erhält die Anwendung zeitlich begrenzte “Token” für den Zugriff. Die Gültigkeitsdauer (Time-To-Live, TTL) ist aus Sicherheitsgründen bewusst kurz gewählt.

Es gibt zwei Arten von Token:

* **Access Token:** Dies ist der eigentliche “Schlüssel” für den direkten Zugriff auf Daten. Er hat eine kurze Lebensdauer. 
* **Gültigkeit:** 300 Sekunden (5 Minuten)
 
* **Refresh Token:** Wenn das Access Token abgelaufen ist, kann die Anwendung dieses zweite Token verwenden, um ein neues Access Token zu erhalten, ohne dass sich der Benutzer erneut anmelden muss. Es hat eine deutlich längere Lebensdauer. 
* **Gültigkeit:** 43200 Sekunden (12 Stunden)
 

#### Ergebnis der Prüfung

* **Erfolgsfall:** Wenn **alle vier Prüfungen** erfolgreich sind, wird der Zugriff gestattet. Die Anwendung erhält ein zeitlich begrenztes Zugriffstoken.
* **Fehlerfall:** Wenn **mindestens eine Prüfung scheitert**, wird der Zugriff verweigert. Die genauen Gründe für die Ablehnung (z.B. “User profession is not allowed”, “One or more requested scopes are not allowed”) werden zurückgemeldet.

#### Anforderungen zur Nutzung der ZETA Funktionalität

[Nutzung ZETA-Client durch Clientsystme](./zeta-client.md)

#### Referenzen

##### Vollständige Policy-Definition

```

policies:

  # ── Arzneimittel ─────────────────────────────────────────────────────────────

  "tif-rx-task-prescribe": {
      "description": "E-Rezept verordnen",
      "roles": [
        { "oid": "1.2.276.0.76.4.50", "description": "oid_praxis_arzt" },
        { "oid": "1.2.276.0.76.4.51", "description": "oid_zahnarztpraxis" },
        { "oid": "1.2.276.0.76.4.52", "description": "oid_praxis_psychotherapeut" },
        { "oid": "1.2.276.0.76.4.53", "description": "oid_krankenhaus" },
        { "oid": "1.2.276.0.76.4.56", "description": "oid_institution-vorsorge-reha" }
      ],
      "rules": [
        { "method": "POST", "path": "rx/Task/$create" },
        { "method": "POST", "path": "rx/Task/{id}/$activate" },
        { "method": "POST", "path": "rx/Task/{id}/$abort" }
      ]
    }

  "tif-rx-task-dispense": {
      "description": "E-Rezept einlösen",
      "roles": [
        { "oid": "1.2.276.0.76.4.54", "description": "oid_oeffentliche_apotheke" },
        { "oid": "1.2.276.0.76.4.55", "description": "oid_krankenhausapotheke" }
      ],
      "rules": [
        { "method": "POST", "path": "rx/Task/$accept" },
        { "method": "POST", "path": "rx/Task/{id}/$reject" },
        { "method": "POST", "path": "rx/Task/{id}/$close" },
        { "method": "POST", "path": "rx/Task/{id}/$abort" },
        { "method": "GET", "path": "rx/Task/" },
        { "method": "GET", "path": "rx/Task/{id}" }
      ]
    }

  "tif-rx-task-manage": {
        "description": "E-Rezepte verwalten",
        "roles": [
          { "oid": "1.2.276.0.76.4.49", "description": "oid_versicherter" }
        ],
        "rules": [
          { "method": "GET", "path": "rx/Task/" },
          { "method": "GET", "path": "rx/Task/{id}" },
          { "method": "POST", "path": "rx/Task/{id}/$abort" },
          { "method": "PATCH", "path": "rx/Task/{id}" },
          { "method": "GET", "path": "rx/medicationdispense/" },
          { "method": "GET", "path": "rx/medicationdispense/{id}" }
        ]
      }

  "tif-rx-task-ePeDA": {
        "description": "E-Rezepte in EU einlösen",
        "roles": [
          { "oid": "1.2.276.0.76.4.292", "description": "oid_ncpeh" }
        ],
        "rules": [
          { "method": "POST", "path": "rx/$get-eu-prescriptions" },
          { "method": "POST", "path": "rx/Task/{id}/$eu-close" }
        ]
      }

  "tif-rx-communication": {
        "description": "Nachrichten zu E-Rezepten zwischen Versichertem und Apotheke",
        "roles": [
          { "oid": "1.2.276.0.76.4.49", "description": "oid_versicherter" },
          { "oid": "1.2.276.0.76.4.54", "description": "oid_oeffentliche_apotheke" },
          { "oid": "1.2.276.0.76.4.55", "description": "oid_krankenhausapotheke" }
        ],
        "rules": [
          { "method": "POST",   "path": "/rx/Communication" },
          { "method": "GET",    "path": "/rx/Communication" },
          { "method": "GET",    "path": "/rx/Communication/{id}" },
          { "method": "DELETE", "path": "/rx/Communication/{id}" }
        ]
      }

  "tif-rx-chargeitem-manage": {
        "description": "Abrechnungsinformationen verwalten",
        "roles": [
          { "oid": "1.2.276.0.76.4.49", "description": "oid_versicherter" }
        ],
        "rules": [
          { "method": "GET", "path": "rx/ChargeItem/" },
          { "method": "GET", "path": "rx/ChargeItem/{id}" },
          { "method": "PATCH", "path": "rx/ChargeItem/{id}" },
          { "method": "DELETE", "path": "rx/ChargeItem/{id}" }
        ]
      }

  "tif-rx-chargeitem_provide": {
        "description": "Abrechnungsinformationen bereitstellen",
        "roles": [
          { "oid": "1.2.276.0.76.4.54", "description": "oid_oeffentliche_apotheke" },
          { "oid": "1.2.276.0.76.4.55", "description": "oid_krankenhausapotheke" }
        ],
        "rules": [
          { "method": "GET", "path": "rx/ChargeItem/{id}" },
          { "method": "POST", "path": "rx/ChargeItem" },
          { "method": "PUT", "path": "rx/ChargeItem/{id}" }
        ]
      }

  "tif-rx-consent-manage": {
        "description": "Einwilligung verwalten",
        "roles": [
          { "oid": "1.2.276.0.76.4.49", "description": "oid_versicherter" }
        ],
        "rules": [
          { "method": "GET", "path": "rx/Consent/" },
          { "method": "POST", "path": "rx/Consent/" },
          { "method": "DELETE", "path": "rx/Consent/" }
        ]
      }

  "tif-rx-eu-access-manage": {
        "description": "EU-Berechtigung verwalten",
        "roles": [
          { "oid": "1.2.276.0.76.4.49", "description": "oid_versicherter" }
        ],
        "rules": [
          { "method": "GET", "path": "rx/$read-eu-access-permission" },
          { "method": "POST", "path": "rx/$grant-eu-access-permission" },
          { "method": "DELETE", "path": "rx/$revoke-eu-access-permission" }
        ]
      }

  "tif-rx-audit": {
        "description": "Zugriffsprotokoll abrufen",
        "roles": [
          { "oid": "1.2.276.0.76.4.49", "description": "oid_versicherter" }
        ],
        "rules": [
          { "method": "GET", "path": "rx/AuditEvent" },
          { "method": "GET", "path": "rx/AuditEvent/{id}" }
        ]
      }

  "tif-rx-notification": {
        "description": "App Notification verwalten",
        "roles": [
          { "oid": "1.2.276.0.76.4.49", "description": "oid_versicherter" }
        ],
        "rules": [
          { "method": "GET", "path": "rx/pushers" },
          { "method": "POST", "path": "rx/pushers/set" },
          { "method": "GET", "path": "rx/channels" },
          { "method": "POST", "path": "rx/channels/{pushkey}" }
        ]
      }

  "tif-rx-subscription": {
        "description": "Benachrichtigungen registrieren",
        "roles": [
          { "oid": "1.2.276.0.76.4.54", "description": "oid_oeffentliche_apotheke" },
          { "oid": "1.2.276.0.76.4.55", "description": "oid_krankenhausapotheke" }
        ],
        "rules": [
          { "method": "POST", "path": "rx/Subscription" }
        ]
      }

  # ── DiGA Verordnung ────────────────────────────────────────────────────────

  "tif-diga-task-prescribe": {
        "description": "DiGA Verordnung verordnen",
        "roles": [
          { "oid": "1.2.276.0.76.4.50", "description": "oid_praxis_arzt" },
          { "oid": "1.2.276.0.76.4.51", "description": "oid_zahnarztpraxis" },
          { "oid": "1.2.276.0.76.4.52", "description": "oid_praxis_psychotherapeut" },
          { "oid": "1.2.276.0.76.4.53", "description": "oid_krankenhaus" },
          { "oid": "1.2.276.0.76.4.56", "description": "oid_institution-vorsorge-reha" }
        ],
        "rules": [
          { "method": "POST", "path": "diga/Task/$create" },
          { "method": "POST", "path": "diga/Task/{id}/$activate" },
          { "method": "POST", "path": "diga/Task/{id}/$abort" }
        ]
      }

  "tif-diga-task-dispense": {
        "description": "DiGA Verordnung einlösen",
        "roles": [
          { "oid": "1.2.276.0.76.4.59", "description": "oid_kostentraeger" }
        ],
        "rules": [
          { "method": "POST", "path": "diga/Task/$accept" },
          { "method": "POST", "path": "diga/Task/{id}/$reject" },
          { "method": "POST", "path": "diga/Task/{id}/$close" },
          { "method": "GET", "path": "diga/Task/{id}" }
        ]
      }

  "tif-diga-task-manage": {
        "description": "DiGA Verordnungen verwalten",
        "roles": [
          { "oid": "1.2.276.0.76.4.49", "description": "oid_versicherter" }
        ],
        "rules": [
          { "method": "GET", "path": "diga/Task/" },
          { "method": "GET", "path": "diga/Task/{id}" },
          { "method": "POST", "path": "diga/Task/{id}/$abort" },
          { "method": "GET", "path": "diga/medicationdispense/" },
          { "method": "GET", "path": "diga/medicationdispense/{id}" }
        ]
      }

  "tif-diga-communication": {
        "description": "Nachrichten zu DiGA-Verordnungen zwischen Versichertem und Kostenträger",
        "roles": [
          { "oid": "1.2.276.0.76.4.49", "description": "oid_versicherter" },
          { "oid": "1.2.276.0.76.4.59", "description": "oid_kostentraeger" }
        ],
        "rules": [
          { "method": "POST",   "path": "/diga/Communication" },
          { "method": "GET",    "path": "/diga/Communication" },
          { "method": "GET",    "path": "/diga/Communication/{id}" },
          { "method": "DELETE", "path": "/diga/Communication/{id}" }
        ]
      }

  "tif-diga-audit": {
        "description": "Zugriffsprotokoll abrufen",
        "roles": [
          { "oid": "1.2.276.0.76.4.49", "description": "oid_versicherter" }
        ],
        "rules": [
          { "method": "GET", "path": "diga/AuditEvent" },
          { "method": "GET", "path": "diga/AuditEvent/{id}" }
        ]
      }

  "tif-diga-subscription": {
        "description": "Benachrichtigungen registrieren",
        "roles": [
          { "oid": "1.2.276.0.76.4.59", "description": "oid_kostentraeger" }
        ],
        "rules": [
          { "method": "POST", "path": "diga/Subscription" }
        ]
      }


```

-------

### Vollständige Scope-Liste (token-config)

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
    "tif-diga-task-prescribe",
    "tif-diga-task-dispense",
    "tif-diga-task-manage",
    "tif-diga-communication",
    "tif-diga-audit",
    "tif-diga-subscription"
  ]
}

```

-------

