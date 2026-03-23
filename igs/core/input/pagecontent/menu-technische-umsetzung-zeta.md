Zero Trust (ZETA) die Funktionalität ist anwendungsübergreifend in [gemSpec_ZETA] beschrieben.


### ZETA Guard Policy Engine - Zugriffsregeln

Dieses Dokument dient als Grundlage für die Abstimmung über eine technische Zugriffsrichtlinie. Ziel ist es, in verständlicher Sprache zu erläutern, welche Prüfungen durchgeführt werden, bevor ein Zugriff auf VSDM2 Systeme gewährt wird.

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

* **1.2.276.0.76.4.50:** Betriebsstätte Arzt
* **1.2.276.0.76.4.51:** Zahnarztpraxis
* **1.2.276.0.76.4.52:** Betriebsstätte Psychotherapeut
* **1.2.276.0.76.4.53:** Krankenhaus
* **1.2.276.0.76.4.54:** Öffentliche Apotheke
* **1.2.276.0.76.4.55:** Krankenhausapotheke
* **1.2.276.0.76.4.59:** Betriebsstätte Kostenträger
* **1.2.276.0.76.4.292:** NCPeH (LE-EU verwendet HCPI + Permission + Zugriffscode (6-stellig alphanumerisch) für Requests)

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

#### Definierte Scopes für das E-Rezept
Die Menge an möglichen Zugriffen bildet sich über die Use Cases des E-Rezepts. Jeder Use Case soll über die Zeta Policy steuerbar sein.
Die Scopes leiten sich daraus ab. 

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
    {% include zeta-oid-to-use-case.svg %}
    </div>
    <figcaption><strong>Abbildung: </strong>Allowed Profession OID's to Use Cases</figcaption>
</figure>

##### Use Case abgeleitete Scopes

```
policies:

  - name: task_create
    description: "POST /Task/$create – Rezept erstellen"
    scopes:
      - "task:create"
    allowed_professions:
      - "1.2.276.0.76.4.50"   # oid_praxis_arzt
      - "1.2.276.0.76.4.51"   # oid_zahnarztpraxis
      - "1.2.276.0.76.4.52"   # oid_praxis_psychotherapeut
      - "1.2.276.0.76.4.53"   # oid_krankenhaus

  - name: task_activate
    description: "POST /Task/<id>/$activate – Rezept aktivieren"
    scopes:
      - "task:activate"
    allowed_professions:
      - "1.2.276.0.76.4.50"   # oid_praxis_arzt
      - "1.2.276.0.76.4.51"   # oid_zahnarztpraxis
      - "1.2.276.0.76.4.52"   # oid_praxis_psychotherapeut
      - "1.2.276.0.76.4.53"   # oid_krankenhaus

  - name: task_get_list
    description: "GET /Task – Aufgaben abrufen"
    scopes:
      - "task:read"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter

  - name: task_get_single
    description: "GET /Task/<id> – Einzelaufgabe abrufen"
    scopes:
      - "task:read:single"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter
      - "1.2.276.0.76.4.50"   # oid_praxis_arzt
      - "1.2.276.0.76.4.51"   # oid_zahnarztpraxis
      - "1.2.276.0.76.4.52"   # oid_praxis_psychotherapeut
      - "1.2.276.0.76.4.53"   # oid_krankenhaus
      - "1.2.276.0.76.4.54"   # oid_oeffentliche_apotheke
      - "1.2.276.0.76.4.55"   # oid_krankenhausapotheke

  - name: task_accept
    description: "POST /Task/<id>/$accept – Rezept annehmen"
    scopes:
      - "task:accept"
    allowed_professions:
      - "1.2.276.0.76.4.54"   # oid_oeffentliche_apotheke
      - "1.2.276.0.76.4.55"   # oid_krankenhausapotheke

  - name: task_reject
    description: "POST /Task/<id>/$reject – Rezept ablehnen"
    scopes:
      - "task:reject"
    allowed_professions:
      - "1.2.276.0.76.4.54"   # oid_oeffentliche_apotheke
      - "1.2.276.0.76.4.55"   # oid_krankenhausapotheke

  - name: task_close
    description: "POST /Task/<id>/$close – Rezept einlösen"
    scopes:
      - "task:close"
    allowed_professions:
      - "1.2.276.0.76.4.54"   # oid_oeffentliche_apotheke
      - "1.2.276.0.76.4.55"   # oid_krankenhausapotheke

  - name: task_abort
    description: "POST /Task/<id>/$abort – Rezept abbrechen"
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

  - name: task_delete
    description: "DELETE /Task/<id> – Aufgabe löschen"
    scopes:
      - "task:delete"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter

  - name: medication_dispense_read
    description: "GET /MedicationDispense – Abgabedaten abrufen"
    scopes:
      - "medicationdispense:read"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter

  - name: communication_read
    description: "GET /Communication – Nachrichten abrufen"
    scopes:
      - "communication:read"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter
      - "1.2.276.0.76.4.54"   # oid_oeffentliche_apotheke
      - "1.2.276.0.76.4.55"   # oid_krankenhausapotheke

  - name: communication_read_freischaltcode
    description: "GET /Communication – Nachrichten abrufen die Freischaltcode enthalten"
    scopes:
      - "communication:read:freischaltcode"
    allowed_professions:
      - "1.2.276.0.76.4.59"   # oid_kostentraeger

  - name: communication_send
    description: "POST /Communication – Nachricht senden"
    scopes:
      - "communication:write"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter
      - "1.2.276.0.76.4.54"   # oid_oeffentliche_apotheke
      - "1.2.276.0.76.4.55"   # oid_krankenhausapotheke

  - name: auditevent_read
    description: "GET /AuditEvent – Protokoll abrufen"
    scopes:
      - "auditevent:read"
    allowed_professions:
      - "1.2.276.0.76.4.49"   # oid_versicherter

  - name: bundle_get_eu
    description: "GET /Bundle/<id> – EU-Zugriff"
    scopes:
      - "bundle:read:eu"
    allowed_professions:
      - "1.2.276.0.76.4.292"  # oid_ncpeh
 ```

#### Prüfung der Ziel-Ressource (Audience)

Diese Regel kontrolliert, auf welche Zielsysteme oder Datenbereiche ("Audiences") zugegriffen werden darf. Dies ist eine zusätzliche Sicherheitsebene, um sicherzustellen, dass ein Zugriffstoken nur für den vorgesehenen Zweck verwendet wird.

**Disclaimer: Diese Regel ist für Test-Umgebungen deaktiviert**

**Was wird geprüft?**
Es wird abgeglichen, ob die von der Anwendung angefragten Ziel-Ressourcen in der Liste der erlaubten Ressourcen enthalten sind. Ähnlich wie bei den Berechtigungen müssen **alle** angefragten "Audiences" erlaubt sein.

**Beispiel:**

* Erlaubte Ziel-Ressourcen: `/vau`
* Anwendung fordert Zugriff auf: `/vau` -> **Erfolg**
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
  
#### Referenzen

<!-- TODO: sind diese Referenzen noch nötig -->

### zeta-authz.rego

```yaml
package policies.zeta.authz

# Regel 1: Definiert 'decision' für den FEHLERFALL.
decision := response if {
	failures := reasons
	count(failures) > 0
	response := {
		"allow": false,
		"reasons": failures,
	}
}

# Regel 2: Definiert 'decision' für den ERFOLGSFALL.
decision := response if {
	count(reasons) == 0
	response := {
		"allow": true,
		"ttl": {
			"access_token": data.token.access_token_ttl,
			"refresh_token": data.token.refresh_token_ttl,
		},
	}
}

# Regel zum Sammeln von Fehlern
reasons[msg] if {
	not user_profession_is_allowed
	msg := "User profession is not allowed"
}

#reasons[msg] if {
#	not client_product_is_allowed
#	msg := "Client product or version is not allowed"
#}

reasons[msg] if {
	not scopes_are_allowed
	msg := "One or more requested scopes are not allowed"
}

#reasons[msg] if {
#	not audience_is_allowed
#	msg := "One or more requested audiences are not allowed"
#}

# --- HELPER-REGELN ---

user_profession_is_allowed if {
	# KORRIGIERTER PFAD
	some i
	input.user_info.professionOID == data.professions.allowed_professions[i]
}

#client_product_is_allowed if {
#	posture := input.client_assertion.posture
#
#	# KORRIGIERTER PFAD
#	allowed_versions := data.products.allowed_products[posture.product_id]
#	some i
#	posture.product_version == allowed_versions[i]
#}

scopes_are_allowed if {
	# KORRIGIERTER PFAD
	allowed_scope_set := {s | s := data.token.allowed_scopes[_]}
	requested_scope_set := {s | s := input.authorization_request.scopes[_]}
	count(requested_scope_set) > 0
	requested_scope_set - allowed_scope_set == set()
}

#audience_is_allowed if {
#	# KORRIGIERTER PFAD
#	allowed_audience_set := {s | s := data.audiences.allowed_audiences[_]}
#	requested_audience_set := {audience | audience := input.authorization_request.audience[_]}
#	count(requested_audience_set) > 0
#	requested_audience_set - allowed_audience_set == set()
#}
```

### audiences.json  

```json
{
  "allowed_audiences": [
    "https://example.com/testresource",
    "https://some-service.de/api/v1",
    "https://zeta-cd.spree.de/",
    "https://zeta-cd.westeurope.cloudapp.azure.com/",
    "https://zeta-dev.spree.de/",
    "https://zeta-dev.westeurope.cloudapp.azure.com/",
    "https://zeta-staging.spree.de/",
    "https://zeta-staging.westeurope.cloudapp.azure.com/",
    "https://zeta-achelos.spree.de/",
    "https://zeta-achelos.westeurope.cloudapp.azure.com/",
    "https://test-ik-nr.vsdm2.ti-dienste.de"
  ]
}
```

### products.json

```json
{
  "allowed_products": {
    "ZETA-Test-Client": [
      "0.0.1",
      "0.1.0",
      "1.0.0"
    ],
    "gematik-light-client-win-v1": [
      "0.0.1",
      "0.1.0",
      "1.0.0"
    ],
    "test_proxy": [
      "0.1.0"
    ],
    "testsuite": [
      "0.1.0"
    ],
    "demo_client": [
      "0.1.0"
    ]
  }
}
```

### professions.json

```json
{
  "allowed_professions": [
    "1.2.276.0.76.4.50",
    "1.2.276.0.76.4.51",
    "1.2.276.0.76.4.52",
    "1.2.276.0.76.4.53",
    "1.2.276.0.76.4.54",
    "1.2.276.0.76.4.55",
    "1.2.276.0.76.4.56",
    "1.2.276.0.76.4.57",
    "1.2.276.0.76.4.59"
  ]
}
```

### token-config.json

```json
{
  "access_token_ttl": 300,
  "refresh_token_ttl": 86400,
  "allowed_scopes": [
    "vsdservice"
  ]
}
```
