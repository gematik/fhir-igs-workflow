# Fachlichkeit – Überblick

## Zielsetzung

Die Feature‑Spezifikation unterstützt Hersteller bei der Bewertung und Umsetzung
des zusätzlichen Funktionsumfangs für den EU‑Zugriff auf E‑Rezepte. Sie beschreibt
die Nutzersicht, das technische Konzept und die technischen Details.

## Zielgruppe

* Hersteller und Anbieter des Produkttyps E‑Rezept‑Fachdienst
* Hersteller von Clientsystemen für den Zugriff auf den E‑Rezept‑Fachdienst

## Abgrenzungen

Nicht Bestandteil der Spezifikation sind:

* TI‑Anbindung an die eHDSI,
* Mapping zwischen deutschem Verordnungsdatenmodell und EU‑Datenmodell,
* Abrechnung im europäischen Ausland.

## Methodik

User Stories werden in Alltagssprache formuliert und können eine abweichende
Terminologie verwenden (z. B. Patient = Versicherter). Anforderungen werden
normativ mit eindeutigen IDs und RFC‑2119‑Schlüsselwörtern beschrieben.

## Fachliches Konzept

### Einlösbare Rezepte

Das Feature erweitert den Workflow, damit Versicherte E‑Rezepte für die Einlösung
im europäischen Ausland bereitstellen können.

Einlösbar sind nur E‑Rezepte mit Workflow 160 oder 200, PZN‑Verordnung und gültigem
Gültigkeitszeitraum im Status "offen". Betäubungsmittel, Rezepturen sowie
nicht-industriell hergestellte Arzneimittel sind ausgeschlossen.

### Autorisierung

* Autorisierung des LE‑EU für den Zugriff auf die Anwendung E‑Rezept.
* Autorisierung des LE‑EU für den Zugriff auf Daten eines Versicherten.

Die Autorisierung durch den Versicherten erfolgt über einen länderspezifischen
Zugriffscode. Der Zugriffscode ist 6‑stellig, alphanumerisch und wird im E‑Rezept‑
FdV erzeugt, registriert und zeitlich befristet angezeigt.