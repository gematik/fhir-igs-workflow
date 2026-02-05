# Schnittstellen – Datenschutz und Sicherheit

Die Spezifikation definiert zusätzliche Sicherheitsanforderungen für den EU‑Zugriff
auf E‑Rezepte.

## TLS und Zertifikate

* TLS‑Verbindungen sind verpflichtend.
* Zertifikate sind auf Integrität, Authentizität und zeitliche Gültigkeit zu prüfen.
* Zulässige TLS‑Serverzertifikate müssen den Baseline Requirements entsprechen.

## IDP‑Dienst

* Clientsysteme müssen sich beim IDP‑Dienst registrieren und eine client_id nutzen.
* Das Discovery Document ist regelmäßig einzulesen und signaturgeprüft auszuwerten.

## Einwilligung und Zugriff

* Zugriff durch LE‑EU erfordert Einwilligung (EUDISPCONS) und gültigen Zugriffscode.
* Zugriffscode ist zeitlich befristet und wird nach Ablauf gelöscht.

## Token‑Handling

* ACCESS_TOKEN, ID_TOKEN und AUTHORIZATION_CODE sind sicher zu speichern und
  nach Ablauf zu löschen.
* PKCE (CODE_VERIFIER / CODE_CHALLENGE) ist gemäß RFC7636 umzusetzen.
* Token‑Antworten dürfen nur innerhalb der etablierten TLS‑Verbindung akzeptiert
  werden.