# Technische Anwendungsfälle - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Systemüberblick**](menu-technische-umsetzung-systemueberblick.md)
* **Technische Anwendungsfälle**

## Technische Anwendungsfälle

Diese Seite beschreibt die technischen Anwendungsfälle des Szenarios „E‑Rezepte für PKV‑Versicherte“. Im Fokus steht, was im E‑Rezept‑Fachdienst und in den beteiligten Clients (FdV/AdV, Primärsysteme, AVS) passiert, wenn die fachlichen Anwendungsfälle ausgeführt werden.

 ###

* Beschreibung: Vorbedingungen
  * : 
* Beschreibung: Durchzuführende Aktionen
  * : 
* Beschreibung: Nachbedingungen
  * : 
* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * : 
* Beschreibung: Relevante(r) Sektor(en)
  * : 

**Tabelle:**Fachlicher Anwendungsfall
 ###

* Beschreibung: Vorbedingungen
  * : 
* Beschreibung: Durchzuführende Aktionen
  * : 
* Beschreibung: Nachbedingungen
  * : 
* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * : 
* Beschreibung: Relevante(r) Sektor(en)
  * : 

**Tabelle:**Fachlicher Anwendungsfall
 ###

* Beschreibung: Vorbedingungen
  * : 
* Beschreibung: Durchzuführende Aktionen
  * : 
* Beschreibung: Nachbedingungen
  * : 
* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * : 
* Beschreibung: Relevante(r) Sektor(en)
  * : 

**Tabelle:**Fachlicher Anwendungsfall
 ###

* Beschreibung: Vorbedingungen
  * : 
* Beschreibung: Durchzuführende Aktionen
  * : 
* Beschreibung: Nachbedingungen
  * : 
* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * : 
* Beschreibung: Relevante(r) Sektor(en)
  * : 

**Tabelle:**Fachlicher Anwendungsfall
 ###

* Beschreibung: Vorbedingungen
  * : 
* Beschreibung: Durchzuführende Aktionen
  * : 
* Beschreibung: Nachbedingungen
  * : 
* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * : 
* Beschreibung: Relevante(r) Sektor(en)
  * : 

**Tabelle:**Fachlicher Anwendungsfall
 ###

* Beschreibung: Vorbedingungen
  * : 
* Beschreibung: Durchzuführende Aktionen
  * : 
* Beschreibung: Nachbedingungen
  * : 
* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * : 
* Beschreibung: Relevante(r) Sektor(en)
  * : 

**Tabelle:**Fachlicher Anwendungsfall
 ###

* Beschreibung: Vorbedingungen
  * : 
* Beschreibung: Durchzuführende Aktionen
  * : 
* Beschreibung: Nachbedingungen
  * : 
* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * : 
* Beschreibung: Relevante(r) Sektor(en)
  * : 

**Tabelle:**Fachlicher Anwendungsfall

### Abrechnungsinformationen durch den Versicherten weitergeben

* Beschreibung: Vorbedingungen
  * Der Versicherte gibt die Abrechnungsinformation aus dem FdV/AdV heraus an eine Ziel-App weiter (z. B. PKV-App, Beihilfe) oder exportiert sie als PDF/A.: * Der Versicherte hat über das FdV (E-Rezept-FdV) die Abrechnungsinformation vom E-Rezept-Fachdienst abgerufen.

* Beschreibung: Durchzuführende Aktionen
  * Der Versicherte gibt die Abrechnungsinformation aus dem FdV/AdV heraus an eine Ziel-App weiter (z. B. PKV-App, Beihilfe) oder exportiert sie als PDF/A.: * Das FdV erstellt eine PDF/A-Datei mit der eingebetteten Abrechnungsinformation.
* Das FdV übergibt die PDF/A-Datei an die Ziel-App oder bietet sie zum Download an.

* Beschreibung: Nachbedingungen
  * Der Versicherte gibt die Abrechnungsinformation aus dem FdV/AdV heraus an eine Ziel-App weiter (z. B. PKV-App, Beihilfe) oder exportiert sie als PDF/A.: * Die Abrechnungsinformation ist in der Ziel-App übertragen.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Der Versicherte gibt die Abrechnungsinformation aus dem FdV/AdV heraus an eine Ziel-App weiter (z. B. PKV-App, Beihilfe) oder exportiert sie als PDF/A.: * [Abrechnungsinformation weitergeben](./menu-technische-umsetzung-chargeitem-req-fdv.md#abrechnungsinformationen-exportieren)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Versicherte gibt die Abrechnungsinformation aus dem FdV/AdV heraus an eine Ziel-App weiter (z. B. PKV-App, Beihilfe) oder exportiert sie als PDF/A.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall Abrechnungsinformationen durch den Versicherten weitergeben
**Sequenzdiagramm:**

**Abbildung: **Abrechnungsinformationen durch den Versicherten weitergeben

### Abrechnungsinformationen durch den Versicherten markieren

* Beschreibung: Vorbedingungen
  * Der Versicherte markiert die Abrechnungsinformation im FdV/AdV, um sie für bestimmte Aktionen zu kennzeichnen. Der E-Rezept-Fachdienst speichert die Markierung und stellt sie bei Abruf der Abrechnungsinformation bereit.: * Eine LEI hat den Anwendungsfall “Abrechnungsinformation durch Abgebenden bereitstellen” für das E-Rezept durchgeführt. Die Abrechnungsinformation ist auf dem E-Rezept-Fachdienst gespeichert.
* Der Versicherte hat sich über den Anwendungsfall “Abrufen der Abrechnungsinformation durch den Versicherten” die zu markierende Abrechnungsinformation herausgesucht.

* Beschreibung: Durchzuführende Aktionen
  * Der Versicherte markiert die Abrechnungsinformation im FdV/AdV, um sie für bestimmte Aktionen zu kennzeichnen. Der E-Rezept-Fachdienst speichert die Markierung und stellt sie bei Abruf der Abrechnungsinformation bereit.: * Ein Versicherter wählt im FdV (E-Rezept-FdV) die zu markierende Abrechnungsinformation sowie die zu Optionen für die Markierung aus.
* Der E-Rezept-Fachdienst speichert die Information.

* Beschreibung: Nachbedingungen
  * Der Versicherte markiert die Abrechnungsinformation im FdV/AdV, um sie für bestimmte Aktionen zu kennzeichnen. Der E-Rezept-Fachdienst speichert die Markierung und stellt sie bei Abruf der Abrechnungsinformation bereit.: * Die Information zur Markierung ist im E-Rezept-Fachdienst gespeichert. Der Datenzugriff ist im E-Rezept-Fachdienst protokolliert.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Der Versicherte markiert die Abrechnungsinformation im FdV/AdV, um sie für bestimmte Aktionen zu kennzeichnen. Der E-Rezept-Fachdienst speichert die Markierung und stellt sie bei Abruf der Abrechnungsinformation bereit.: * [Abrechnungsinformation markieren](./menu-technische-umsetzung-chargeitem-req-fdv.md#abrechnungsinformationen-markieren)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Versicherte markiert die Abrechnungsinformation im FdV/AdV, um sie für bestimmte Aktionen zu kennzeichnen. Der E-Rezept-Fachdienst speichert die Markierung und stellt sie bei Abruf der Abrechnungsinformation bereit.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall Abrechnungsinformationen durch den Versicherten markieren
**Sequenzdiagramm:**

**Abbildung: **Abrechnungsinformationen durch den Versicherten markieren

### Abrechnungsinformationen durch den Versicherten löschen

* Beschreibung: Vorbedingungen
  * Ein Versicherter wählt im FdV (E-Rezept-FdV, E-Rezept-AdV) die zu löschende Abrechnungsinformation aus und bestätigt das Löschen. Das FdV überträgt den Lösch-Request. Der E-Rezept-Fachdienst löscht die Abrechnungsinformation: * Eine LEI hat den Anwendungsfall “Abrechnungsinformation durch Abgebenden bereitstellen” für das E-Rezept durchgeführt.
* Der Versicherte hat sich über den Anwendungsfall “Abrufen der Abrechnungsinformation durch den Versicherten” die Abrechnungsinformation auf sein FdV heruntergeladen.

* Beschreibung: Durchzuführende Aktionen
  * Ein Versicherter wählt im FdV (E-Rezept-FdV, E-Rezept-AdV) die zu löschende Abrechnungsinformation aus und bestätigt das Löschen. Das FdV überträgt den Lösch-Request. Der E-Rezept-Fachdienst löscht die Abrechnungsinformation: * Ein Versicherter wählt im FdV (E-Rezept-FdV) die zu löschende Abrechnungsinformation sowie die zu Optionen für die Löschung aus.
* Der E-Rezept-Fachdienst löscht die Abrechnungsinformation.

* Beschreibung: Nachbedingungen
  * Ein Versicherter wählt im FdV (E-Rezept-FdV, E-Rezept-AdV) die zu löschende Abrechnungsinformation aus und bestätigt das Löschen. Das FdV überträgt den Lösch-Request. Der E-Rezept-Fachdienst löscht die Abrechnungsinformation: * Die Abrechnungsinformation sind auf dem E-Rezept-Fachdienst gelöscht. Das Löschen ist im E-Rezept-Fachdienst protokolliert.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Ein Versicherter wählt im FdV (E-Rezept-FdV, E-Rezept-AdV) die zu löschende Abrechnungsinformation aus und bestätigt das Löschen. Das FdV überträgt den Lösch-Request. Der E-Rezept-Fachdienst löscht die Abrechnungsinformation: * [Abrechnungsinformation löschen](./menu-technische-umsetzung-chargeitem-req-fdv.md#abrechnungsinformationen-löschen)

* Beschreibung: Relevante(r) Sektor(en)
  * Ein Versicherter wählt im FdV (E-Rezept-FdV, E-Rezept-AdV) die zu löschende Abrechnungsinformation aus und bestätigt das Löschen. Das FdV überträgt den Lösch-Request. Der E-Rezept-Fachdienst löscht die Abrechnungsinformation:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall Abrechnungsinformationen durch den Versicherten löschen
**Sequenzdiagramm:**

**Abbildung: **Abrechnungsinformationen durch den Versicherten löschen

## Berechtigen der Apotheke zum Ändern des PKV‑Abgabedatensatzes

Der Versicherte übermittelt der abgebenden LEI einen AccessCode, um die Apotheke zum Abruf und einmaligen Ändern zu berechtigen.

* Das FdV/AdV erzeugt einen Abrechnungsinformation‑Token.
* Der Versicherte übermittelt den Token per Nachricht (Communication) oder zeigt einen 2D‑Code.
* Das AVS nutzt den AccessCode für Abruf/Änderung der Abrechnungsinformation.

**Schnittstelle:** *[query-api-communication](./query-api-communication.md)*

**Sequenzdiagramm (Platzhalter):** 

