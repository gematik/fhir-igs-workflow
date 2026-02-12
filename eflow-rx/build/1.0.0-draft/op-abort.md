# Operation $abort (Task abbrechen) - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* **Operation $abort (Task abbrechen)**

## Operation $abort (Task abbrechen)

### Task abbrechen ($abort)

Die FHIR-Operation `$abort` bricht den Workflow eines E-Rezepts ab und löscht alle Daten, die mit der referenzierten Aufgabe zusammenhängen.

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$abort` gesendet.

Hinweis: Der Zugriff erfolgt je nach Akteur über URL-Parameter:

* Patient/(Z)PVS: `?ac=...`
* Apotheke: `?secret=...`

#### FHIR Operation API

```
todo
```

### Geschäftslogik

Beispielhafte Beschreibung (wird in einem nächsten Schritt fachlich/technisch vervollständigt).

<?xml version=”1.0” encoding=”us-ascii” standalone=”no”?>

### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.md) festgehalten.

