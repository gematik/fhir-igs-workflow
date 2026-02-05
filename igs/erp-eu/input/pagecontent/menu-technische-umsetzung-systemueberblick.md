# Technische Umsetzung – Systemüberblick

## Einordnung in die Telematikinfrastruktur

Das Feature erweitert den E‑Rezept‑Workflow um Prozesse fuer die Einloesung im
EU‑Ausland. Der NCPeH‑FD (Deutschland) buendelt die Kommunikation mit
Leistungserbringern im Ausland (LE‑EU) und vermittelt zur eHDSI.

## Beteiligte Rollen und Komponenten

* Versicherter (verwaltet Einwilligung und Zugriffsberechtigung)
* E‑Rezept‑Fachdienst
* NCPeH‑FD (Deutschland)
* Leistungserbringer im europäischen Ausland (LE‑EU)
* E‑Rezept‑Frontend des Versicherten (FdV)

## Statusmodell des Workflows

Die Einloesung im EU‑Ausland nutzt den Status "offen" und wechselt bei Abruf der
ausgewaehlten E‑Rezepte in "in Abgabe (gesperrt)". Der Abschluss im EU‑Ausland
setzt den Status auf "quittiert". Ein Rueckgabeschritt an den Versicherten ist
in diesem Szenario nicht vorgesehen.