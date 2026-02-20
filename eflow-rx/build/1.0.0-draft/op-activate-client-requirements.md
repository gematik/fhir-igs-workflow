# Client-Anforderungen $activate - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $activate (Task aktivieren)**](op-activate.md)
* **Client-Anforderungen $activate**

## Client-Anforderungen $activate

# Client-Anforderungen: Operation $activate

Diese Seite beschreibt die Anforderungen an Clients zur Nutzung von `$activate`.

## Normative Client-Anforderungen (Auszug)

* A_19273-01: Das Primärsystem MUSS `POST /Task/<id>/$activate` mit `Authorization`, `Task-ID`, `AccessCode` und QES-signiertem Payload ausführen.
* A_19279: Das Primärsystem MUSS bei Ausdruckbedarf einen E-Rezept-Token erzeugen.
* A_19280: Das Primärsystem MUSS bei Ausdruckbedarf den Datamatrix-Code samt Zusatzinformationen ausgeben.

## Hinweise zur Nutzung

* Wenn beim ersten `$activate`-Aufruf keine Response eintrifft, soll der Client den Aufruf wiederholen.
* Liefert der zweite Aufruf `403` mit “Task not in status draft but in status ready”, war der erste Aufruf bereits erfolgreich.
* Der Client soll `OperationOutcome`-Hinweise nutzerverständlich ausgeben.

