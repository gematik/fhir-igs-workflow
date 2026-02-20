# Client-Anforderungen $reject - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $reject (Task zurückweisen)**](op-reject.md)
* **Client-Anforderungen $reject**

## Client-Anforderungen $reject

# Client-Anforderungen: Operation $reject

Diese Seite beschreibt die Anforderungen an Clients zur Nutzung von `$reject`.

## Normative Client-Anforderungen (Auszug)

* A_19250: Das AVS MUSS `POST /Task/<id>/$reject` mit `Authorization`, `Task-ID` und `secret` aufrufen.
* A_19251: Nach erfolgreichem `$reject` MUSS das AVS E-Rezept-Daten, Token und `secret` lokal löschen.

## Hinweise zur Nutzung

* Rückweisen und direktes erneutes Abrufen (`$accept`) soll nicht als Übergabemechanismus verwendet werden.
* Diese Folge erzeugt zusätzliche Protokolleinträge und zukünftige Notifications für Versicherte, die fachlich oft nicht nachvollziehbar sind.

