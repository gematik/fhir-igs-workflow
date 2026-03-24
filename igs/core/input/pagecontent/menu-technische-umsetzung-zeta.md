Zero Trust (ZETA) die Funktionalität ist anwendungsübergreifend in [gemSpec_ZETA] beschrieben.


### ZETA Guard Policy Engine - Zugriffsregeln

Dieses Dokument dient als Grundlage für die Abstimmung über eine technische Zugriffsrichtlinie. Ziel ist es, in verständlicher Sprache zu erläutern, welche Prüfungen durchgeführt werden, bevor ein Zugriff auf den E-Rezept Fachdienst gewährt wird.

#### Grundprinzip der Richtlinie

Die hier beschriebene Richtlinie funktioniert nach einem einfachen Prinzip: Ein Zugriff wird nur dann erlaubt, wenn **alle** definierten Bedingungen erfüllt sind. Scheitert auch nur eine einzige Prüfung, wird der Zugriff verweigert und die Gründe für die Ablehnung werden protokolliert.

#### Die Prüfungen im Detail

Im Folgenden werden die Prüfungen beschrieben, die ein anfragendes System erfolgreich durchlaufen muss.

#### Prüfung des Berufs oder der Einrichtungsart

Diese Regel stellt sicher, dass nur bestimmte Berufsgruppen oder Arten von Einrichtungen auf das System zugreifen dürfen. Technisch wird dies über eine sogenannte OID (Object Identifier) geprüft, eine eindeutige Kennung für jeden Beruf oder jede Einrichtung.

**Was wird geprüft?**
Es wird die Berufs- bzw. Einrichtungs-OID des anfragenden Nutzers bzw. der anfragenden Institution mit einer Liste von erlaubten Kennungen abgeglichen.

**Wer darf zugreifen?**
Folgende Berufe und Einrichtungsarten sind zugelassen:

#### Akteure & OIDs

| Akteur | OID(s) | Kurzname |
|---|---|---|
| Versicherter | `1.2.276.0.76.4.49` | `VERS` |
| Betriebsstätte Arzt | `1.2.276.0.76.4.50` | `VERO` |
| Zahnarztpraxis | `1.2.276.0.76.4.51` | `VERO` |
| Betriebsstätte Psychotherapeut | `1.2.276.0.76.4.52` | `VERO` |
| Krankenhaus | `1.2.276.0.76.4.53` | `VERO` |
| Öffentliche Apotheke | `1.2.276.0.76.4.54` | `APO` |
| Krankenhausapotheke | `1.2.276.0.76.4.55` | `APO` |
| Institution Vorsorge/Reha | `1.2.276.0.76.4.56` | `VERO` |
| Kostenträger | `1.2.276.0.76.4.59` | `KT` |
| NCPeH-FD / EU | `1.2.276.0.76.4.292` | `NCPEH` |

#### Prüfung der Client-Anwendung

Diese Regel verifiziert, dass die verwendete Software (der "Client") und deren Version für den Zugriff bei der gematik registriert sind. Jede Software, die auf das System zugreifen möchte, identifiziert sich mit einer Produktkennung und einer Versionsnummer.

**Disclaimer: Diese Regel ist vorerst deaktiviert**

**Was wird geprüft?**
Es wird geprüft, ob die Kombination aus Produkt und Version in einer Liste der erlaubten Software-Versionen enthalten ist.

**Beispiel:**

* Produkt A ist in den Versionen 1.2 und 1.3 erlaubt.
* Produkt B ist nur in Version 2.5 erlaubt.

Eine Anfrage von Produkt A in Version 1.2 wäre erfolgreich, eine Anfrage in Version 1.1 würde jedoch scheitern.

#### Prüfung der angeforderten Berechtigungen (Scopes)

Diese Regel stellt sicher, dass die anfragende Anwendung nur die Berechtigungen anfordert, die ihr auch gewährt werden dürfen. Anwendungen können bestimmte "Scopes" anfordern, die ihnen Lese- oder Schreibzugriff auf bestimmte Datenbereiche gewähren.

**Was wird geprüft?**
Es wird die Liste der von der Anwendung angeforderten Berechtigungen mit der Liste der maximal erlaubten Berechtigungen abgeglichen. Die Anfrage ist nur dann erfolgreich, wenn **alle** angeforderten Berechtigungen in der Liste der erlaubten Berechtigungen enthalten sind.

**Beispiel:**

* Erlaubte Berechtigungen sind: `task:read`
* Anwendung fordert an: `task:read` -> **Erfolg**
* Anwendung fordert an: `/erezept` -> **Fehler** (da `/erezept` nicht erlaubt ist)

#### Akteure und Ressourcen des E-Rezepts
Die Menge an möglichen Zugriffen bildet sich über die Use Cases des E-Rezepts. Jeder Use Case soll über die Zeta Policy steuerbar sein.
Die Scopes leiten sich daraus ab. 

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
    {% include zeta-oid-to-use-case.svg %}
    </div>
    <figcaption><strong>Abbildung: </strong>Allowed Profession OID's to Use Cases</figcaption>
</figure>

#### Scope Definition

Die Verbindungen von Akteuren und Use Cases erzeugen die folgende Scope Definition. Sie ist unter Referenzen aufgeführt.

#### Prüfung der Ziel-Ressource (Audience)

Diese Regel kontrolliert, auf welche Zielsysteme oder Datenbereiche ("Audiences") zugegriffen werden darf. Dies ist eine zusätzliche Sicherheitsebene, um sicherzustellen, dass ein Zugriffstoken nur für den vorgesehenen Zweck verwendet wird.

**Disclaimer: Diese Regel ist für Test-Umgebungen deaktiviert**

**Was wird geprüft?**
Es wird abgeglichen, ob die von der Anwendung angefragten Ziel-Ressourcen in der Liste der erlaubten Ressourcen enthalten sind. Ähnlich wie bei den Berechtigungen müssen **alle** angefragten "Audiences" erlaubt sein.

**Beispiel:**

* Erlaubte Ziel-Ressourcen: `/VAU`
* Anwendung fordert Zugriff auf: `/VAU` -> **Erfolg**
* Anwendung fordert Zugriff auf: `unknown-url` -> **Fehler** (da `unknown-url` nicht erlaubt ist)


#### Gültigkeitsdauer der Zugriffstoken (TTL)

Wenn alle Prüfungen erfolgreich sind, erhält die Anwendung zeitlich begrenzte "Token" für den Zugriff. Die Gültigkeitsdauer (Time-To-Live, TTL) ist aus Sicherheitsgründen bewusst kurz gewählt.

Es gibt zwei Arten von Token:

* **Access Token:** Dies ist der eigentliche "Schlüssel" für den direkten Zugriff auf Daten. Er hat eine sehr kurze Lebensdauer.
  * **Gültigkeit:** 300 Sekunden (5 Minuten)
* **Refresh Token:** Wenn das Access Token abgelaufen ist, kann die Anwendung dieses zweite Token verwenden, um ein neues Access Token zu erhalten, ohne dass sich der Benutzer erneut anmelden muss. Es hat eine deutlich längere Lebensdauer.
  * **Gültigkeit:** 43200 Sekunden (12 Stunden)

#### Ergebnis der Prüfung

* **Erfolgsfall:** Wenn **alle vier Prüfungen** erfolgreich sind, wird der Zugriff gestattet. Die Anwendung erhält ein zeitlich begrenztes Zugriffstoken.
* **Fehlerfall:** Wenn **mindestens eine Prüfung scheitert**, wird der Zugriff verweigert. Die genauen Gründe für die Ablehnung (z.B. "User profession is not allowed", "One or more requested scopes are not allowed") werden zurückgemeldet.

#### Anforderungen zur Nutzung der ZETA Funktionalität

[Nutzung ZETA-Client durch Clientsystme](./zeta-client.html)

#### Referenzen

### Vollständige Policy-Definition

```yaml

policies:

  # ── Task-Workflow ─────────────────────────────────────────────────────────────

  - name: task_create
    description: "POST /Task/$create – Rezept anlegen"
    scopes:
      - "task:create"
    allowed_professions:
      - "1.2.276.0.76.4.50"   # oid_praxis_arzt
      - "1.2.276.0.76.4.51"   # oid_zahnarztpraxis
      - "1.2.276.0.76.4.52"   # oid_praxis_psychotherapeut
      - "1.2.276.0.76.4.53"   # oid_krankenhaus
      - "1.2.276.0.76.4.56"   # oid_institution-vorsorge-reha

  - name: task_activate
    description: "POST /Task/<id>/$activate – Rezept aktivieren"
    scopes:
      - "task:activate"
    allowed_professions:
      - "1.2.276.0.76.4.50"   # oid_praxis_arzt
      - "1.2.276.0.76.4.51"   # oid_zahnarztpraxis
      - "1.2.276.0.76.4.52"   # oid_praxis_psychotherapeut
      - "1.2.276.0.76.4.53"   # oid_krankenhaus
      - "1.2.276.0.76.4.56"   # oid_institution-vorsorge-reha

  - name: task_get_list
    description: "GET /Task – Rezeptliste abrufen"
    scopes:
      - "task:read"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter
      - "1.2.276.0.76.4.54"   # oid_oeffentliche_apotheke
      - "1.2.276.0.76.4.55"   # oid_krankenhausapotheke

  - name: task_get_single
    description: "GET /Task/<id> – Einzelrezept abrufen"
    scopes:
      - "task:read:single"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter
      - "1.2.276.0.76.4.54"   # oid_oeffentliche_apotheke
      - "1.2.276.0.76.4.55"   # oid_krankenhausapotheke
      - "1.2.276.0.76.4.59"   # oid_kostentraeger

  - name: task_accept
    description: "POST /Task/<id>/$accept – Rezept annehmen"
    scopes:
      - "task:accept"
    allowed_professions:
      - "1.2.276.0.76.4.54"   # oid_oeffentliche_apotheke
      - "1.2.276.0.76.4.55"   # oid_krankenhausapotheke
      - "1.2.276.0.76.4.59"   # oid_kostentraeger

  - name: task_reject
    description: "POST /Task/<id>/$reject – Rezept zurückweisen"
    scopes:
      - "task:reject"
    allowed_professions:
      - "1.2.276.0.76.4.54"   # oid_oeffentliche_apotheke
      - "1.2.276.0.76.4.55"   # oid_krankenhausapotheke
      - "1.2.276.0.76.4.59"   # oid_kostentraeger

  - name: task_dispense
    description: "POST /Task/<id>/$dispense – Dispensierinfo bereitstellen"
    scopes:
      - "task:dispense"
    allowed_professions:
      - "1.2.276.0.76.4.54"   # oid_oeffentliche_apotheke
      - "1.2.276.0.76.4.55"   # oid_krankenhausapotheke

  - name: task_close
    description: "POST /Task/<id>/$close – Rezept abschließen"
    scopes:
      - "task:close"
    allowed_professions:
      - "1.2.276.0.76.4.54"   # oid_oeffentliche_apotheke
      - "1.2.276.0.76.4.55"   # oid_krankenhausapotheke
      - "1.2.276.0.76.4.59"   # oid_kostentraeger

  - name: task_abort
    description: "POST /Task/<id>/$abort – Rezept löschen"
    scopes:
      - "task:abort"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter
      - "1.2.276.0.76.4.50"   # oid_praxis_arzt
      - "1.2.276.0.76.4.51"   # oid_zahnarztpraxis
      - "1.2.276.0.76.4.52"   # oid_praxis_psychotherapeut
      - "1.2.276.0.76.4.53"   # oid_krankenhaus
      - "1.2.276.0.76.4.54"   # oid_oeffentliche_apotheke
      - "1.2.276.0.76.4.55"   # oid_krankenhausapotheke
      - "1.2.276.0.76.4.56"   # oid_institution-vorsorge-reha

  - name: task_patch
    description: "PATCH /Task/<id> – EU-Markierung setzen"
    scopes:
      - "task:patch"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter

  - name: task_eu_close
    description: "POST /Task/<id>/$eu-close – EU-Rezept abschließen"
    scopes:
      - "task:eu-close"
    allowed_professions:
      - "1.2.276.0.76.4.292"  # oid_ncpeh

  # ── MedicationDispense ────────────────────────────────────────────────────────

  - name: medicationdispense_read
    description: "GET /MedicationDispense – Abgabeinfo abrufen"
    scopes:
      - "medicationdispense:read"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter

  # ── ChargeItem (PKV) ──────────────────────────────────────────────────────────

  - name: chargeitem_list
    description: "GET /ChargeItem – Abrechnungsliste abrufen"
    scopes:
      - "chargeitem:read"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter

  - name: chargeitem_get
    description: "GET /ChargeItem/<id> – Abrechnungsdetail abrufen"
    scopes:
      - "chargeitem:read:single"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter
      - "1.2.276.0.76.4.54"   # oid_oeffentliche_apotheke
      - "1.2.276.0.76.4.55"   # oid_krankenhausapotheke

  - name: chargeitem_post
    description: "POST /ChargeItem – Abrechnung bereitstellen"
    scopes:
      - "chargeitem:write"
    allowed_professions:
      - "1.2.276.0.76.4.54"   # oid_oeffentliche_apotheke
      - "1.2.276.0.76.4.55"   # oid_krankenhausapotheke

  - name: chargeitem_put
    description: "PUT /ChargeItem/<id> – Abrechnung aktualisieren"
    scopes:
      - "chargeitem:update"
    allowed_professions:
      - "1.2.276.0.76.4.54"   # oid_oeffentliche_apotheke
      - "1.2.276.0.76.4.55"   # oid_krankenhausapotheke

  - name: chargeitem_patch
    description: "PATCH /ChargeItem/<id> – Markierung setzen"
    scopes:
      - "chargeitem:patch"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter

  - name: chargeitem_delete
    description: "DELETE /ChargeItem/<id> – Abrechnung löschen"
    scopes:
      - "chargeitem:delete"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter

  # ── Consent (Einwilligung) ────────────────────────────────────────────────────

  - name: consent_read
    description: "GET /Consent – Einwilligung lesen"
    scopes:
      - "consent:read"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter

  - name: consent_write
    description: "POST /Consent – Einwilligung erteilen"
    scopes:
      - "consent:write"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter

  - name: consent_delete
    description: "DELETE /Consent – Einwilligung widerrufen"
    scopes:
      - "consent:delete"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter

  # ── Communication (Nachrichten) ───────────────────────────────────────────────

  - name: communication_read
    description: "GET /Communication – Nachrichten abrufen"
    scopes:
      - "communication:read"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter
      - "1.2.276.0.76.4.54"   # oid_oeffentliche_apotheke
      - "1.2.276.0.76.4.55"   # oid_krankenhausapotheke

  - name: communication_read_diga
    description: "GET /Communication – Nachrichten abrufen die DiGA-Aktivierungscode enthalten"
    scopes:
      - "communication:read:freischaltcode"
    allowed_professions:
      - "1.2.276.0.76.4.59"   # oid_kostentraeger

  - name: communication_write
    description: "POST /Communication – Nachricht senden"
    scopes:
      - "communication:write"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter
      - "1.2.276.0.76.4.54"   # oid_oeffentliche_apotheke
      - "1.2.276.0.76.4.55"   # oid_krankenhausapotheke

  - name: communication_delete
    description: "DELETE /Communication/<id> – Nachricht löschen"
    scopes:
      - "communication:delete"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter
      - "1.2.276.0.76.4.54"   # oid_oeffentliche_apotheke
      - "1.2.276.0.76.4.55"   # oid_krankenhausapotheke

  # ── AuditEvent (Protokoll) ────────────────────────────────────────────────────

  - name: auditevent_read
    description: "GET /AuditEvent – Zugriffsprotokoll abrufen"
    scopes:
      - "auditevent:read"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter

  # ── EU-Zugriffsberechtigung ───────────────────────────────────────────────────

  - name: eu_access_grant
    description: "POST /$grant-eu-access-permission – EU-Berechtigung erteilen"
    scopes:
      - "eu:access:grant"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter

  - name: eu_access_revoke
    description: "DELETE /$revoke-eu-access-permission – EU-Berechtigung löschen"
    scopes:
      - "eu:access:revoke"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter

  - name: eu_access_read
    description: "GET /$read-eu-access-permission – EU-Berechtigung lesen"
    scopes:
      - "eu:access:read"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter

  - name: eu_get_prescriptions
    description: "POST /$get-eu-prescriptions – EU-Verordnungen abrufen"
    scopes:
      - "eu:prescriptions:get"
    allowed_professions:
      - "1.2.276.0.76.4.292"  # oid_ncpeh

  # ── Subscription & Push Notification ─────────────────────────────────────────

  - name: subscription_write
    description: "POST /Subscription – Benachrichtigung registrieren"
    scopes:
      - "subscription:write"
    allowed_professions:
      - "1.2.276.0.76.4.54"   # oid_oeffentliche_apotheke
      - "1.2.276.0.76.4.55"   # oid_krankenhausapotheke
      - "1.2.276.0.76.4.59"   # oid_kostentraeger

  - name: pushers_read
    description: "GET /pushers – Registrierungen abrufen"
    scopes:
      - "pushers:read"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter

  - name: pushers_write
    description: "POST /pushers/set – App registrieren"
    scopes:
      - "pushers:write"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter

  - name: channels_read
    description: "GET /channels – Kanäle lesen"
    scopes:
      - "channels:read"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter

  - name: channels_write
    description: "POST /channels – Kanäle konfigurieren"
    scopes:
      - "channels:write"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter
```

---

### Vollständige Scope-Liste (token-config)

```json
{
  "access_token_ttl": 300,
  "refresh_token_ttl": 43200,
  "allowed_scopes": [
    "task:create",
    "task:activate",
    "task:read",
    "task:read:single",
    "task:accept",
    "task:reject",
    "task:dispense",
    "task:close",
    "task:abort",
    "task:patch",
    "task:eu-close",
    "medicationdispense:read",
    "chargeitem:read",
    "chargeitem:read:single",
    "chargeitem:write",
    "chargeitem:update",
    "chargeitem:patch",
    "chargeitem:delete",
    "consent:read",
    "consent:write",
    "consent:delete",
    "communication:read",
    "communication:read:freischaltcode",
    "communication:write",
    "communication:delete",
    "auditevent:read",
    "eu:access:grant",
    "eu:access:revoke",
    "eu:access:read",
    "eu:prescriptions:get",
    "subscription:write",
    "pushers:read",
    "pushers:write",
    "channels:read",
    "channels:write"
  ]
}
```

---

### Berechtigungsmatrix

| Use Case | Endpoint | Scope | VERS | VERO | APO | KT | NCPEH |
|---|---|---|:---:|:---:|:---:|:---:|:---:|
| Rezept anlegen | `POST /Task/$create` | `task:create` | | ✔ | | | |
| Rezept aktivieren | `POST /Task/<id>/$activate` | `task:activate` | | ✔ | | | |
| Rezeptliste abrufen | `GET /Task` | `task:read` | ✔ | | ✔ | | |
| Einzelrezept abrufen | `GET /Task/<id>` | `task:read:single` | ✔ | | ✔ | ✔ | |
| Rezept annehmen | `POST /Task/<id>/$accept` | `task:accept` | | | ✔ | ✔ | |
| Rezept zurückweisen | `POST /Task/<id>/$reject` | `task:reject` | | | ✔ | ✔ | |
| Dispensierinfo bereitstellen | `POST /Task/<id>/$dispense` | `task:dispense` | | | ✔ | | |
| Rezept abschließen | `POST /Task/<id>/$close` | `task:close` | | | ✔ | ✔ | |
| Rezept löschen | `POST /Task/<id>/$abort` | `task:abort` | ✔ | ✔ | ✔ | | |
| EU-Markierung setzen | `PATCH /Task/<id>` | `task:patch` | ✔ | | | | |
| EU-Rezept abschließen | `POST /Task/<id>/$eu-close` | `task:eu-close` | | | | | ✔ |
| Abgabeinfo abrufen | `GET /MedicationDispense` | `medicationdispense:read` | ✔ | | | | |
| Abrechnungsliste abrufen | `GET /ChargeItem` | `chargeitem:read` | ✔ | | | | |
| Abrechnungsdetail abrufen | `GET /ChargeItem/<id>` | `chargeitem:read:single` | ✔ | | ✔ | | |
| Abrechnung bereitstellen | `POST /ChargeItem` | `chargeitem:write` | | | ✔ | | |
| Abrechnung aktualisieren | `PUT /ChargeItem/<id>` | `chargeitem:update` | | | ✔ | | |
| Markierung setzen | `PATCH /ChargeItem/<id>` | `chargeitem:patch` | ✔ | | | | |
| Abrechnung löschen | `DELETE /ChargeItem/<id>` | `chargeitem:delete` | ✔ | | | | |
| Einwilligung lesen | `GET /Consent` | `consent:read` | ✔ | | | | |
| Einwilligung erteilen | `POST /Consent` | `consent:write` | ✔ | | | | |
| Einwilligung widerrufen | `DELETE /Consent` | `consent:delete` | ✔ | | | | |
| Nachrichten abrufen | `GET /Communication` | `communication:read` | ✔ | | ✔ | | |
| DiGA-Aktivierungscode abrufen | `GET /Communication` | `communication:read:freischaltcode` | | | | ✔ | |
| Nachricht senden | `POST /Communication` | `communication:write` | ✔ | | ✔ | | |
| Nachricht löschen | `DELETE /Communication/<id>` | `communication:delete` | ✔ | | ✔ | | |
| Zugriffsprotokoll abrufen | `GET /AuditEvent` | `auditevent:read` | ✔ | | | | |
| EU-Berechtigung erteilen | `POST /$grant-eu-access-permission` | `eu:access:grant` | ✔ | | | | |
| EU-Berechtigung löschen | `DELETE /$revoke-eu-access-permission` | `eu:access:revoke` | ✔ | | | | |
| EU-Berechtigung lesen | `GET /$read-eu-access-permission` | `eu:access:read` | ✔ | | | | |
| EU-Verordnungen abrufen | `POST /$get-eu-prescriptions` | `eu:prescriptions:get` | | | | | ✔ |
| Benachrichtigung registrieren | `POST /Subscription` | `subscription:write` | | | ✔ | ✔ | |
| Registrierungen abrufen | `GET /pushers` | `pushers:read` | ✔ | | | | |
| App registrieren | `POST /pushers/set` | `pushers:write` | ✔ | | | | |
| Kanäle lesen | `GET /channels` | `channels:read` | ✔ | | | | |
| Kanäle konfigurieren | `POST /channels` | `channels:write` | ✔ | | | | |

> **Legende:** VERS = oid_versicherter · VERO = Verordnende LEI (Arzt, Zahnarzt, Psychotherapeut, Krankenhaus, Vorsorge/Reha) · APO = Abgebende LEI (öffentl. Apotheke, Krankenhausapotheke) · KT = oid_kostentraeger · NCPEH = oid_ncpeh

