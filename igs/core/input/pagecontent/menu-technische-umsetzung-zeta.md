
### ZETA Guard Policy Engine - Zugriffsregeln für TI-Flow

Dieses Dokument dient als Grundlage für die Abstimmung über eine technische Zugriffsrichtlinie. Ziel ist es, in verständlicher Sprache zu erläutern, welche Prüfungen durchgeführt werden, bevor ein Zugriff auf den TI-Flow-Fachdienst gewährt wird.

#### Grundprinzip der Richtlinie

Die hier beschriebene Richtlinie funktioniert nach einem einfachen Prinzip: Ein Zugriff wird nur dann erlaubt, wenn alle definierten Bedingungen erfüllt sind. Scheitert auch nur eine einzige Prüfung, wird der Zugriff verweigert und die Gründe für die Ablehnung werden protokolliert.

#### Prüfungen

##### Prüfung des Berufs oder der Einrichtungsart

Diese Regel stellt sicher, dass nur bestimmte Berufsgruppen oder Arten von Einrichtungen auf das System zugreifen dürfen. Technisch wird dies über eine sogenannte OID (Object Identifier) geprüft, eine eindeutige Kennung für jeden Beruf oder jede Einrichtung.

Es wird die Berufs- bzw. Einrichtungs-OID des anfragenden Nutzers bzw. der anfragenden Institution mit einer Liste von erlaubten Kennungen abgeglichen.

Folgende Berufe und Einrichtungsarten sind zugelassen:

<table>
  <thead>
    <tr>
      <th>Akteur</th>
      <th>OID-Referenz</th>
      <th>OID</th>
    </tr>
  </thead>
      <td>E-Rezepte in EU einlösen</td>
    <tr>
      <td>Betriebsstätte Arzt</td>
      <td><code>oid_praxis_arzt</code></td>
      <td><code>1.2.276.0.76.4.50</code></td>
    </tr>
    <tr>
      <td>Zahnarztpraxis</td>
      <td><code>oid_zahnarztpraxis</code></td>
      <td><code>1.2.276.0.76.4.51</code></td>
    </tr>
    <tr>
      <td>Betriebsstätte Psychotherapeut</td>
      <td><code>oid_praxis_psychotherapeut</code></td>
      <td><code>1.2.276.0.76.4.52</code></td>
    </tr>
    <tr>
      <td>Krankenhaus</td>
      <td><code>oid_krankenhaus</code></td>
      <td><code>1.2.276.0.76.4.53</code></td>
    </tr>
    <tr>
      <td>Institution Vorsorge / Reha</td>
      <td><code>oid_institution-vorsorge-reha</code></td>
      <td><code>1.2.276.0.76.4.257</code></td>
    </tr>
    <tr>
      <td>Öffentliche Apotheke</td>
      <td><code>oid_oeffentliche_apotheke</code></td>
      <td><code>1.2.276.0.76.4.54</code></td>
    </tr>
    <tr>
      <td>Krankenhausapotheke</td>
      <td><code>oid_krankenhausapotheke</code></td>
      <td><code>1.2.276.0.76.4.55</code></td>
    </tr>
    <tr>
      <td>Kostenträger</td>
      <td><code>oid_kostentraeger</code></td>
      <td><code>1.2.276.0.76.4.59</code></td>
    </tr>
    <tr>
      <td>Versicherter (FdV)</td>
      <td><code>oid_versicherter</code></td>
      <td><code>1.2.276.0.76.4.49</code></td>
    </tr>
    <tr>
      <td>NCPeH-Fachdienst</td>
      <td><code>oid_ncpeh</code></td>
      <td><code>1.2.276.0.76.4.292</code></td>
    </tr>
    <tr>
      <td>Betriebsstätte gematik</td>
      <td><code>oid_bs_gematik</code></td>
      <td><code>1.2.276.0.76.4.58</code></td>
    </tr>
  </tbody>
</table>

##### Prüfung der Client-Anwendung

Diese Regel verifiziert, dass die verwendete Software (das "Clientsystem") und deren Version für den Zugriff bei der gematik registriert sind. Jede Software, die auf das System zugreifen möchte, identifiziert sich mit einer Produktkennung und einer Versionsnummer.

Es wird geprüft, ob die Kombination aus Produkt und Version in einer Liste der erlaubten Software-Versionen enthalten ist.

##### Prüfung der angeforderten Berechtigungen (Scopes)

Diese Regel stellt sicher, dass die anfragende Anwendung nur die Berechtigungen anfordert, die ihr auch gewährt werden dürfen. Anwendungen können bestimmte "Scopes" anfordern, die ihnen Lese- oder Schreibzugriff auf bestimmte Datenbereiche gewähren.

Es wird die Liste der von der Anwendung angeforderten Berechtigungen mit der Liste der maximal erlaubten Berechtigungen abgeglichen. Die Anfrage ist nur dann erfolgreich, wenn alle angeforderten Berechtigungen in der Liste der erlaubten Berechtigungen enthalten sind.

<table>
  <thead>
    <tr>
      <th>Scope</th>
      <th>Beschreibung</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>tif-rx-task-prescribe</code></td>
      <td>E-Rezept verordnen</td>
    </tr>
    <tr>
      <td><code>tif-rx-task-dispense</code></td>
      <td>E-Rezept einlösen</td>
    </tr>
    <tr>
      <td><code>tif-rx-task-manage</code></td>
      <td>E-Rezepte verwalten</td>
    </tr>
    <tr>
      <td><code>tif-rx-task-ePeDA</code></td>
      <td>E-Rezept in EU einlösen</td>
    </tr>
    <tr>
      <td><code>tif-rx-communication</code></td>
      <td>Nachrichten zu E-Rezepten</td>
    </tr>
    <tr>
      <td><code>tif-rx-chargeitem-manage</code></td>
      <td>Abrechnungsinformationen verwalten</td>
    </tr>
    <tr>
      <td><code>tif-rx-chargeitem-provide</code></td>
      <td>Abrechnungsinformationen bereitstellen</td>
    </tr>
    <tr>
      <td><code>tif-rx-consent-manage</code></td>
      <td>Einwilligung verwalten</td>
    </tr>
    <tr>
      <td><code>tif-rx-eu-access-manage</code></td>
      <td>EU-Berechtigung verwalten</td>
    </tr>
    <tr>
      <td><code>tif-global</code></td>
      <td>Globale Schnittstellen nutzen</td>
    </tr>
    <tr>
      <td><code>tif-global-subscription</code></td>
      <td>Benachrichtigungen registrieren</td>
    </tr>
    <tr>
      <td><code>tif-rx-metadata</code></td>
      <td>Server Capabilities für E-Rezept abrufen</td>
    </tr>
    <tr>
      <td><code>tif-rx-task-probe</code></td>
      <td>Probing E-Rezept</td>
    </tr>
    <tr>
      <td><code>tif-diga-task-prescribe</code></td>
      <td>DiGA Verordnung verordnen</td>
    </tr>
    <tr>
      <td><code>tif-diga-task-dispense</code></td>
      <td>DiGA Verordnung einlösen</td>
    </tr>
    <tr>
      <td><code>tif-diga-task-manage</code></td>
      <td>DiGA Verordnungen verwalten</td>
    </tr>
    <tr>
      <td><code>tif-diga-communication</code></td>
      <td>Nachrichten zu DiGA-Verordnungen</td>
    </tr>
    <tr>
      <td><code>tif-diga-metadata</code></td>
      <td>Server Capabilities für DiGA abrufen</td>
    </tr>
    <tr>
      <td><code>tif-diga-task-probe</code></td>
      <td>Probing DiGA</td>
    </tr>
    <tr>
      <td><code>tif-audit</code></td>
      <td>Zugriffsprotokoll abrufen</td>
    </tr>
    <tr>
      <td><code>tif-notification</code></td>
      <td>App Push Notification verwalten</td>
    </tr>
  </tbody>
</table>



##### Token-Gültigkeitsdauer (TTL)

Wenn alle Prüfungen erfolgreich sind, erhält das Clientsystem zeitlich begrenzte "Token" für den Zugriff. Die Gültigkeitsdauer (Time-To-Live, TTL) ist aus Sicherheitsgründen bewusst kurz gewählt.

Access Token: Dies ist der eigentliche "Schlüssel" für den direkten Zugriff auf Daten. Er hat eine sehr kurze Lebensdauer.
Refresh Token: Wenn das Access Token abgelaufen ist, kann die Anwendung dieses zweite Token verwenden, um ein neues Access Token zu erhalten, ohne dass sich der Benutzer erneut anmelden muss. Es hat eine deutlich längere Lebensdauer.

| Token | TTL |
|---|---|
| Access Token | 300 Sekunden (5 Minuten) |
| Refresh Token | 43.200 Sekunden (12 Stunden) |



### Geltungsbereich der Scopes

Die Scopes `tif-global`, `tif-global-subscription`, `tif-rx-metadata` und
`tif-diga-metadata` sowie die fachlichen Scopes für E-Rezept, DiGA,
Zugriffsprotokoll und Push-Benachrichtigungen sind in dieser Seite vollständig
aufgeführt. `Device` und `Subscription` sind globale Schnittstellen; die
Metadata-Endpunkte sind den jeweiligen Modulen zugeordnet.

#### Policy-Definition

```yaml
policies:

  # ── Global ─────────────────────────────────────────────────────────────

  "tif-global":
    description: "Globale Schnittstellen"
    roles:
      - { oid: "1.2.276.0.76.4.50", description: "oid_praxis_arzt" }
      - { oid: "1.2.276.0.76.4.51", description: "oid_zahnarztpraxis" }
      - { oid: "1.2.276.0.76.4.52", description: "oid_praxis_psychotherapeut" }
      - { oid: "1.2.276.0.76.4.53", description: "oid_krankenhaus" }
      - { oid: "1.2.276.0.76.4.257", description: "oid_institution-vorsorge-reha" }
      - { oid: "1.2.276.0.76.4.54", description: "oid_oeffentliche_apotheke" }
      - { oid: "1.2.276.0.76.4.55", description: "oid_krankenhausapotheke" }
      - { oid: "1.2.276.0.76.4.49", description: "oid_versicherter" }
      - { oid: "1.2.276.0.76.4.292", description: "oid_ncpeh" }
      - { oid: "1.2.276.0.76.4.58", description: "oid_bs_gematik" }
      - { oid: "1.2.276.0.76.4.59", description: "oid_kostentraeger" }
    rules:
      - { method: GET, path: "Device" }


  "tif-global-subscription":
    description: "Benachrichtigungen registrieren"
    roles:
      - { oid: "1.2.276.0.76.4.54", description: "oid_oeffentliche_apotheke" }
      - { oid: "1.2.276.0.76.4.55", description: "oid_krankenhausapotheke" }
      - { oid: "1.2.276.0.76.4.59", description: "oid_kostentraeger" }
    rules:
      - { method: POST, path: "Subscription" }

  # ── Arzneimittel ─────────────────────────────────────────────────────────────

  "tif-rx-metadata":
    description: "Server Capabilities abrufen"
    roles:
      - { oid: "1.2.276.0.76.4.50", description: "oid_praxis_arzt" }
      - { oid: "1.2.276.0.76.4.51", description: "oid_zahnarztpraxis" }
      - { oid: "1.2.276.0.76.4.52", description: "oid_praxis_psychotherapeut" }
      - { oid: "1.2.276.0.76.4.53", description: "oid_krankenhaus" }
      - { oid: "1.2.276.0.76.4.257", description: "oid_institution-vorsorge-reha" }
      - { oid: "1.2.276.0.76.4.54", description: "oid_oeffentliche_apotheke" }
      - { oid: "1.2.276.0.76.4.55", description: "oid_krankenhausapotheke" }
      - { oid: "1.2.276.0.76.4.49", description: "oid_versicherter" }
      - { oid: "1.2.276.0.76.4.292", description: "oid_ncpeh" }
    rules:
      - { method: GET, path: "rx/metadata" }

  "tif-rx-task-prescribe":
    description: "E-Rezept verordnen"
    roles:
      - { oid: "1.2.276.0.76.4.50", description: "oid_praxis_arzt" }
      - { oid: "1.2.276.0.76.4.51", description: "oid_zahnarztpraxis" }
      - { oid: "1.2.276.0.76.4.52", description: "oid_praxis_psychotherapeut" }
      - { oid: "1.2.276.0.76.4.53", description: "oid_krankenhaus" }
      - { oid: "1.2.276.0.76.4.257", description: "oid_institution-vorsorge-reha" }
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
      - { method: GET,   path: "rx/MedicationDispense/" }
      - { method: GET,   path: "rx/MedicationDispense/{id}" }

  "tif-rx-task-ePeDA":
    description: "E-Rezepte in EU einlösen"
    roles:
      - { oid: "1.2.276.0.76.4.292", description: "oid_ncpeh" }
    rules:
      - { method: POST, path: "rx/$get-eu-prescriptions" }
      - { method: POST, path: "rx/Task/{id}/$eu-close" }

  "tif-rx-communication":
    description: "Nachrichten zu E-Rezepten"
    roles:
      - { oid: "1.2.276.0.76.4.49", description: "oid_versicherter" }
      - { oid: "1.2.276.0.76.4.54", description: "oid_oeffentliche_apotheke" }
      - { oid: "1.2.276.0.76.4.55", description: "oid_krankenhausapotheke" }
    rules:
      - { method: POST,   path: "rx/Communication" }
      - { method: GET,    path: "rx/Communication" }
      - { method: GET,    path: "rx/Communication/{id}" }
      - { method: DELETE, path: "rx/Communication/{id}" }

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

  "tif-rx-task-probe":
    description: "Probing E-Rezept"
    roles:
      - { oid: "1.2.276.0.76.4.58", description: "oid_bs_gematik" }
    rules:
      - { method: POST, path: "rx/Task/$create" }

  # ── DiGA Verordnung ────────────────────────────────────────────────────────

  "tif-diga-metadata":
    description: "Server Capabilities abrufen"
    roles:
      - { oid: "1.2.276.0.76.4.50", description: "oid_praxis_arzt" }
      - { oid: "1.2.276.0.76.4.51", description: "oid_zahnarztpraxis" }
      - { oid: "1.2.276.0.76.4.52", description: "oid_praxis_psychotherapeut" }
      - { oid: "1.2.276.0.76.4.53", description: "oid_krankenhaus" }
      - { oid: "1.2.276.0.76.4.257", description: "oid_institution-vorsorge-reha" }
      - { oid: "1.2.276.0.76.4.59", description: "oid_kostentraeger" }
      - { oid: "1.2.276.0.76.4.49", description: "oid_versicherter" }
      - { oid: "1.2.276.0.76.4.58", description: "oid_bs_gematik" }
    rules:
      - { method: GET, path: "diga/metadata" }

  "tif-diga-task-prescribe":
    description: "DiGA Verordnung verordnen"
    roles:
      - { oid: "1.2.276.0.76.4.50", description: "oid_praxis_arzt" }
      - { oid: "1.2.276.0.76.4.51", description: "oid_zahnarztpraxis" }
      - { oid: "1.2.276.0.76.4.52", description: "oid_praxis_psychotherapeut" }
      - { oid: "1.2.276.0.76.4.53", description: "oid_krankenhaus" }
      - { oid: "1.2.276.0.76.4.257", description: "oid_institution-vorsorge-reha" }
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
      - { method: GET,  path: "diga/MedicationDispense/" }
      - { method: GET,  path: "diga/MedicationDispense/{id}" }

  "tif-diga-communication":
    description: "Nachrichten zu DiGA-Verordnungen"
    roles:
      - { oid: "1.2.276.0.76.4.49", description: "oid_versicherter" }
      - { oid: "1.2.276.0.76.4.59", description: "oid_kostentraeger" }
    rules:
      - { method: POST,   path: "diga/Communication" }
      - { method: GET,    path: "diga/Communication" }
      - { method: GET,    path: "diga/Communication/{id}" }
      - { method: DELETE, path: "diga/Communication/{id}" }

  "tif-diga-task-probe":
    description: "Probing DiGA"
    roles:
      - { oid: "1.2.276.0.76.4.58", description: "oid_bs_gematik" }
    rules:
      - { method: POST, path: "diga/Task/$create" }

  # ── Zugriffsprotokoll ────────────────────────────────────────────────────────

  "tif-audit":
    description: "Zugriffsprotokoll abrufen"
    roles:
      - { oid: "1.2.276.0.76.4.49", description: "oid_versicherter" }
    rules:
      - { method: GET, path: "AuditEvent" }
      - { method: GET, path: "AuditEvent/{id}" }

  # ── Push-Notification ────────────────────────────────────────────────────────

  "tif-notification":
    description: "App Notification verwalten"
    roles:
      - { oid: "1.2.276.0.76.4.49", description: "oid_versicherter" }
    rules:
      - { method: GET,  path: "pushers" }
      - { method: POST, path: "pushers/set" }
      - { method: GET,  path: "channels" }
      - { method: POST, path: "channels/{pushkey}" }

```

#### Scope-Liste (token-config)

```json
{
  "access_token_ttl": 300,
  "refresh_token_ttl": 43200,
  "allowed_scopes": [
    "tif-global",
    "tif-global-subscription",
    "tif-rx-metadata",
    "tif-rx-task-prescribe",
    "tif-rx-task-dispense",
    "tif-rx-task-manage",
    "tif-rx-task-ePeDA",
    "tif-rx-communication",
    "tif-rx-chargeitem-manage",
    "tif-rx-chargeitem-provide",
    "tif-rx-consent-manage",
    "tif-rx-eu-access-manage",
    "tif-rx-task-probe",
    "tif-diga-metadata",
    "tif-diga-task-prescribe",
    "tif-diga-task-dispense",
    "tif-diga-task-manage",
    "tif-diga-communication",
    "tif-diga-task-probe",
    "tif-audit",
    "tif-notification"
  ]
}
```

#### Weiterführende Referenzen

- [gemSpec_ZETA] – Spezifikation des Zero Trust Access-Mechanismus
- [Nutzung ZETA-Client durch Clientsysteme](./zeta-client.html)
