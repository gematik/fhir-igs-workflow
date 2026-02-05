# Schnittstellen – Generelle Prinzipien

Die Spezifikation erweitert die bestehenden REST‑Schnittstellen des
E‑Rezept‑Fachdienstes. Anforderungen werden normativ mit RFC‑2119‑Schlüsselwörtern
formuliert.

## HTTP‑Operationen

* GET, POST, PATCH und DELETE werden verwendet.
* Zusätzliche Operationen werden für EU‑spezifische Use Cases eingeführt.

## Relevante Ressourcen

* Task
* Consent
* Prescription
* access-permission

## Pflicht‑Header

* user-agent gemäß RFC7231
* X-erp-user
* X-erp-resource

## Zugriffscode

Der Zugriff eines LE‑EU auf die Daten eines Versicherten wird durch einen
6‑stelligen, alphanumerischen Zugriffscode autorisiert. Der Zugriffscode wird
im E‑Rezept‑FdV erzeugt, registriert und ist eine Stunde gültig.

## Transport

Die Kommunikation erfolgt ausschließlich über TLS und für ausgewählte Ressourcen
über den VAU‑Kanal.