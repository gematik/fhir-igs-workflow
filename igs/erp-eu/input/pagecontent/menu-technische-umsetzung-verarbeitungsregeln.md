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

<requirement conformance="SHALL" key="IG-WF-EU-2" title="E-Rezept-Fachdienst - Blocklisting zu häufig verwendeter ACCESS_TOKEN (A_19992-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS ein während einer konfigurierbaren Dauer vielfach
  vorgelegtes ACCESS_TOKEN für den Rest der angegebenen Gültigkeitsdauer auf einer
  Blocklist führen und eingehende HTTP-Requests mit HTTP-Status 429 ablehnen.
  ACCESS_TOKEN des NCPeH-FD (professionOID = oid_ncpeh) sind auszunehmen.
</requirement>

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
* s (Sonstige, aktuell nicht verwendet)

<requirement conformance="MAY" key="IG-WF-EU-3" title="E-Rezept-Fachdienst - Routing-Informationen X-erp-user (A_21572-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst KANN am Eingangspunkt eine Routingentscheidung zu einem
  nutzergruppenspezifischen Verarbeitungskontext anhand des Headers "X-erp-user"
  im äußeren HTTP-Request treffen.
</requirement>

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

  ## Zugriffsberechtigung und Zugriffscode

  - Zugriffscode ist 6-stellig, alphanumerisch und eine Stunde gültig.
  - Ein neuer Zugriffscode überschreibt einen bestehenden.
  - Ohne Einwilligung (Consent EUDISPCONS) darf kein Zugriffscode registriert werden.

  ## Zugriff über $get-eu-prescriptions

  <requirement conformance="SHALL" key="IG-WF-EU-4" title="E-Rezept-Fachdienst - eu-prescription abfragen - Rollenprüfung (A_27059)" version="0">
    <meta lockversion="false"/>
    Der E-Rezept-Fachdienst MUSS sicherstellen, dass nur Nutzer in der Rolle
    oid_ncpeh den Endpunkt /$get-eu-prescriptions aufrufen dürfen.
  </requirement>

  <requirement conformance="SHALL" key="IG-WF-EU-5" title="E-Rezept-Fachdienst - eu-prescription abfragen - Schemaprüfung (A_27060)" version="0">
    <meta lockversion="false"/>
    Der E-Rezept-Fachdienst MUSS das Parameter-Objekt des Requests gegen das Profil
    GEM_ERP_PR_PAR_EU_GET_Prescription_EU_Input prüfen und bei Fehler HTTP 400
    liefern.
  </requirement>

  <requirement conformance="SHALL" key="IG-WF-EU-6" title="E-Rezept-Fachdienst - eu-prescription abfragen - Prüfung Einwilligung (A_27061)" version="0">
    <meta lockversion="false"/>
    Der E-Rezept-Fachdienst MUSS sicherstellen, dass für die KVNR eine Einwilligung
    (Consent.category.coding.code = EUDISPCONS) vorliegt, andernfalls HTTP 403.
  </requirement>

  <requirement conformance="SHALL" key="IG-WF-EU-7" title="E-Rezept-Fachdienst - eu-prescription abfragen - Prüfung Zugriffsberechtigung (A_27062)" version="0">
    <meta lockversion="false"/>
    Der E-Rezept-Fachdienst MUSS prüfen, ob das Tripel aus KVNR, AccessCode und
    CountryCode eine gültige Zugriffsberechtigung besitzt; andernfalls HTTP 403.
  </requirement>

## Zulässige europäische Länder

Die Spezifikation enthält eine Liste zulässiger europäischer Länder für die
Einlösung im Ausland.