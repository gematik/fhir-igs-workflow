# Client-Anforderungen $abort - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $abort (Task abbrechen)**](op-abort.md)
* **Client-Anforderungen $abort**

## Client-Anforderungen $abort

# Client-Anforderungen: Operation $abort

Diese Seite beschreibt die Anforderungen an Clients zur Nutzung von `$abort`.

## Normative Client-Anforderungen (Auszug)

* A_19244: Das AVS MUSS `POST /Task/<id>/$abort` mit `Authorization`, `Task-ID` und `secret` ausfuehren.
* A_19245: Nach erfolgreichem `$abort` MUSS das AVS Token- und Secret-bezogene lokale Daten loeschen.

## Hinweise zur Nutzung

* Vor dem Loeschen ist eine explizite Nutzerbestaetigung im Client vorzusehen.
* Fehlerantworten (`403`, `410`) sind nutzerverstaendlich anzuzeigen, da sie den Status des Workflows erklaeren.

