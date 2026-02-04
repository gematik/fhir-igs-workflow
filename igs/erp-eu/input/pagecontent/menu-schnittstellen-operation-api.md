# Schnittstellen – Operation API

Die folgenden Operationen werden für den EU‑Zugriff beschrieben:

| Operation | Zweck |
| --- | --- |
| POST /$get-eu-prescriptions | Abruf von Demographie, Listen und einzelnen E‑Rezepten |
| POST /Task/<id>/$eu-close | Abschluss eines E‑Rezepts im EU‑Ausland |
| POST /$grant-eu-access-permission | Zugriffsberechtigung erteilen |
| GET /$read-eu-access-permission | Zugriffsberechtigung abrufen |
| DELETE /$revoke-eu-access-permission | Zugriffsberechtigung widerrufen |
| PATCH (Task) | E‑Rezept markieren |

Die konkreten Parameter und Profile sind in der Spezifikation referenziert.