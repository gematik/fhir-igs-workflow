# Technische Anwendungsfälle - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Systemüberblick**](menu-technische-umsetzung-systemueberblick.md)
* **Technische Anwendungsfälle**

## Technische Anwendungsfälle

Diese Seite beschreibt die technischen Anwendungsfälle des Szenarios „E‑Rezepte für PKV‑Versicherte“. Im Fokus steht, was im E‑Rezept‑Fachdienst und in den beteiligten Clients (FdV/AdV, Primärsysteme, AVS) passiert, wenn die fachlichen Anwendungsfälle ausgeführt werden.

### Abrechnungsinformation durch Abgebenden bereitstellen

* Beschreibung: Vorbedingungen
  * Mit der Belieferung des E-Rezepts übermittelt die abgebende LEI den PKV-Abgabedatensatz an den E-Rezept-Fachdienst und stellt damit die Abrechnungsinformation digital bereit. Voraussetzung ist die Einwilligung des Versicherten zum Speichern der Abrechnungsinformationen.: * Ein Mitarbeiter der abgebenden LEI hat „Quittung abrufen“ durchgeführt.
* Task-ID und Secret zur Statusänderung „in Abgabe (gesperrt)“ sind bekannt.
* Das E-Rezept hat den Status „quittiert“.
* Einwilligung des Versicherten liegt vor.

* Beschreibung: Durchzuführende Aktionen
  * Mit der Belieferung des E-Rezepts übermittelt die abgebende LEI den PKV-Abgabedatensatz an den E-Rezept-Fachdienst und stellt damit die Abrechnungsinformation digital bereit. Voraussetzung ist die Einwilligung des Versicherten zum Speichern der Abrechnungsinformationen.: * PKV-Abgabedatensatz erstellen und signieren.
* ChargeItem mit PrescriptionID und Pflichtfeldern erzeugen.
* ChargeItem, Secret und Abgabedaten an den E-Rezept-Fachdienst senden.
* Fachdienst prüft Einwilligung, Signatur und FHIR-Validität; übernimmt Verordnungsdatensatz und Quittung.
* Fachdienst erzeugt AccessCode zum Ändern.

* Beschreibung: Nachbedingungen
  * Mit der Belieferung des E-Rezepts übermittelt die abgebende LEI den PKV-Abgabedatensatz an den E-Rezept-Fachdienst und stellt damit die Abrechnungsinformation digital bereit. Voraussetzung ist die Einwilligung des Versicherten zum Speichern der Abrechnungsinformationen.: * Abrechnungsinformation ist gespeichert und protokolliert.

* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * Mit der Belieferung des E-Rezepts übermittelt die abgebende LEI den PKV-Abgabedatensatz an den E-Rezept-Fachdienst und stellt damit die Abrechnungsinformation digital bereit. Voraussetzung ist die Einwilligung des Versicherten zum Speichern der Abrechnungsinformationen.: * [Abrechnungsinformation bereitstellen](./menu-technische-umsetzung-anwendungsfaelle.md#bereitstellen-abgebende-lei)

* Beschreibung: Relevante(r) Sektor(en)
  * Mit der Belieferung des E-Rezepts übermittelt die abgebende LEI den PKV-Abgabedatensatz an den E-Rezept-Fachdienst und stellt damit die Abrechnungsinformation digital bereit. Voraussetzung ist die Einwilligung des Versicherten zum Speichern der Abrechnungsinformationen.:  APOTHEKER 

**Tabelle:**Fachlicher Anwendungsfall Abrechnungsinformation durch Abgebenden bereitstellen
**Sequenzdiagramm:**

**Abbildung: **Abrechnungsinformation durch Abgebenden bereitstellen

### Abrechnungsinformation durch Abgebenden abrufen

* Beschreibung: Vorbedingungen
  * Die Apotheke ruft eine zuvor von ihr bereitgestellte Abrechnungsinformation ab, wenn sie die Daten im Primärsystem nicht mehr vorliegen hat und der AccessCode bekannt ist.: * Rezept-ID und AccessCode zum Ändern sind bekannt.

* Beschreibung: Durchzuführende Aktionen
  * Die Apotheke ruft eine zuvor von ihr bereitgestellte Abrechnungsinformation ab, wenn sie die Daten im Primärsystem nicht mehr vorliegen hat und der AccessCode bekannt ist.: * Aufruf des E-Rezept-Fachdienstes mit Rezept-ID und AccessCode.
* Fachdienst prüft AccessCode und Berechtigung.
* Fachdienst liefert Verordnungs- und PKV-Abgabedatensatz.

* Beschreibung: Nachbedingungen
  * Die Apotheke ruft eine zuvor von ihr bereitgestellte Abrechnungsinformation ab, wenn sie die Daten im Primärsystem nicht mehr vorliegen hat und der AccessCode bekannt ist.: * Datensätze liegen im Primärsystem vor; Zugriff ist protokolliert.

* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * Die Apotheke ruft eine zuvor von ihr bereitgestellte Abrechnungsinformation ab, wenn sie die Daten im Primärsystem nicht mehr vorliegen hat und der AccessCode bekannt ist.: * [Abrechnungsinformation abrufen](./menu-technische-umsetzung-anwendungsfaelle.md#abrufen-abgebende-lei)

* Beschreibung: Relevante(r) Sektor(en)
  * Die Apotheke ruft eine zuvor von ihr bereitgestellte Abrechnungsinformation ab, wenn sie die Daten im Primärsystem nicht mehr vorliegen hat und der AccessCode bekannt ist.:  APOTHEKER 

**Tabelle:**Fachlicher Anwendungsfall Abrechnungsinformation durch Abgebenden abrufen
**Sequenzdiagramm:**

**Abbildung: **Abrechnungsinformation durch Abgebenden abrufen

### PKV-Abgabedatensatz durch Abgebenden ändern

* Beschreibung: Vorbedingungen
  * Die abgebende LEI ändert auf Wunsch des Versicherten den PKV-Abgabedatensatz. Der zuvor gespeicherte Datensatz wird überschrieben.: * Abrechnungsinformation wurde zuvor bereitgestellt.
* Rezept-ID und AccessCode zum Ändern sind bekannt.

* Beschreibung: Durchzuführende Aktionen
  * Die abgebende LEI ändert auf Wunsch des Versicherten den PKV-Abgabedatensatz. Der zuvor gespeicherte Datensatz wird überschrieben.: * Neuer PKV-Abgabedatensatz wird erzeugt.
* Rezept-ID, AccessCode und Datensatz werden an den Fachdienst übermittelt.
* Fachdienst prüft AccessCode, Berechtigung, Signatur und FHIR-Validität.
* Datensatz wird überschrieben; neuer AccessCode wird erzeugt.

* Beschreibung: Nachbedingungen
  * Die abgebende LEI ändert auf Wunsch des Versicherten den PKV-Abgabedatensatz. Der zuvor gespeicherte Datensatz wird überschrieben.: * Änderung ist protokolliert; neuer AccessCode liegt vor.

* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * Die abgebende LEI ändert auf Wunsch des Versicherten den PKV-Abgabedatensatz. Der zuvor gespeicherte Datensatz wird überschrieben.: * [PKV-Abgabedatensatz ändern](./menu-technische-umsetzung-anwendungsfaelle.md#pkv-abgabedatensatz-aendern)

* Beschreibung: Relevante(r) Sektor(en)
  * Die abgebende LEI ändert auf Wunsch des Versicherten den PKV-Abgabedatensatz. Der zuvor gespeicherte Datensatz wird überschrieben.:  APOTHEKER 

**Tabelle:**Fachlicher Anwendungsfall PKV-Abgabedatensatz durch Abgebenden ändern
**Sequenzdiagramm:**

**Abbildung: **PKV-Abgabedatensatz durch Abgebenden ändern

### Einwilligung zum Speichern der Abrechnungsinformationen erteilen

* Beschreibung: Vorbedingungen
  * Der Versicherte erteilt die Einwilligung zur Speicherung von Abrechnungsinformationen im E-Rezept-Fachdienst. Die Einwilligung ist unbefristet.: * Der Nutzer ist als PKV-Versicherter identifiziert.

* Beschreibung: Durchzuführende Aktionen
  * Der Versicherte erteilt die Einwilligung zur Speicherung von Abrechnungsinformationen im E-Rezept-Fachdienst. Die Einwilligung ist unbefristet.: * Einwilligung im FdV erfassen.
* Consent-Ressource erstellen und an den Fachdienst übertragen.

* Beschreibung: Nachbedingungen
  * Der Versicherte erteilt die Einwilligung zur Speicherung von Abrechnungsinformationen im E-Rezept-Fachdienst. Die Einwilligung ist unbefristet.: * Einwilligung ist gespeichert und protokolliert.

* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * Der Versicherte erteilt die Einwilligung zur Speicherung von Abrechnungsinformationen im E-Rezept-Fachdienst. Die Einwilligung ist unbefristet.: * [Einwilligung erteilen](./menu-technische-umsetzung-anwendungsfaelle.md#einwilligung-erteilen)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Versicherte erteilt die Einwilligung zur Speicherung von Abrechnungsinformationen im E-Rezept-Fachdienst. Die Einwilligung ist unbefristet.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall Einwilligung zum Speichern der Abrechnungsinformationen erteilen
**Sequenzdiagramm:**

**Abbildung: **Einwilligung zum Speichern der Abrechnungsinformationen erteilen

### Einwilligung zum Speichern der Abrechnungsinformationen widerrufen

* Beschreibung: Vorbedingungen
  * Der Versicherte widerruft die Einwilligung. Dadurch werden alle Abrechnungsinformationen im E-Rezept-Fachdienst gelöscht.: * Einwilligung wurde zuvor erteilt und ist abrufbar.

* Beschreibung: Durchzuführende Aktionen
  * Der Versicherte widerruft die Einwilligung. Dadurch werden alle Abrechnungsinformationen im E-Rezept-Fachdienst gelöscht.: * Widerruf im FdV bestätigen.
* DELETE /Consent?category=CHARGCONS ausführen.

* Beschreibung: Nachbedingungen
  * Der Versicherte widerruft die Einwilligung. Dadurch werden alle Abrechnungsinformationen im E-Rezept-Fachdienst gelöscht.: * Einwilligung und Abrechnungsinformationen sind gelöscht; Vorgang ist protokolliert.

* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * Der Versicherte widerruft die Einwilligung. Dadurch werden alle Abrechnungsinformationen im E-Rezept-Fachdienst gelöscht.: * [Einwilligung widerrufen](./menu-technische-umsetzung-anwendungsfaelle.md#einwilligung-widerrufen)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Versicherte widerruft die Einwilligung. Dadurch werden alle Abrechnungsinformationen im E-Rezept-Fachdienst gelöscht.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall Einwilligung zum Speichern der Abrechnungsinformationen widerrufen
**Sequenzdiagramm:**

**Abbildung: **Einwilligung zum Speichern der Abrechnungsinformationen widerrufen

### Einwilligung zum Speichern der Abrechnungsinformationen einsehen

* Beschreibung: Vorbedingungen
  * Der Versicherte sieht ein, ob eine Einwilligung im E-Rezept-Fachdienst vorliegt.: * Keine.

* Beschreibung: Durchzuführende Aktionen
  * Der Versicherte sieht ein, ob eine Einwilligung im E-Rezept-Fachdienst vorliegt.: * GET /Consent ausführen.
* Consent-Ressource mit CHARGCONS auswerten.

* Beschreibung: Nachbedingungen
  * Der Versicherte sieht ein, ob eine Einwilligung im E-Rezept-Fachdienst vorliegt.: * Einwilligungsstatus liegt zur Anzeige im FdV vor.

* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * Der Versicherte sieht ein, ob eine Einwilligung im E-Rezept-Fachdienst vorliegt.: * [Einwilligung einsehen](./menu-technische-umsetzung-anwendungsfaelle.md#einwilligung-einsehen)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Versicherte sieht ein, ob eine Einwilligung im E-Rezept-Fachdienst vorliegt.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall Einwilligung zum Speichern der Abrechnungsinformationen einsehen
**Sequenzdiagramm:**

**Abbildung: **Einwilligung zum Speichern der Abrechnungsinformationen einsehen

### Abrechnungsinformationen durch den Versicherten abrufen

* Beschreibung: Vorbedingungen
  * Der Versicherte ruft die Abrechnungsinformationen aus dem E-Rezept-Fachdienst ab und kann sie anzeigen, exportieren oder weiterleiten.: * Einwilligung liegt vor.
* Abrechnungsinformationen wurden durch eine Apotheke bereitgestellt.

* Beschreibung: Durchzuführende Aktionen
  * Der Versicherte ruft die Abrechnungsinformationen aus dem E-Rezept-Fachdienst ab und kann sie anzeigen, exportieren oder weiterleiten.: * Liste per GET /ChargeItem abrufen.
* Detailabruf via GET /ChargeItem/ durchführen.
* Fachdienst signiert Datensätze beim Detailabruf.

* Beschreibung: Nachbedingungen
  * Der Versicherte ruft die Abrechnungsinformationen aus dem E-Rezept-Fachdienst ab und kann sie anzeigen, exportieren oder weiterleiten.: * Daten stehen im FdV zur Anzeige und zum Export bereit; Abruf ist protokolliert.

* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * Der Versicherte ruft die Abrechnungsinformationen aus dem E-Rezept-Fachdienst ab und kann sie anzeigen, exportieren oder weiterleiten.: * [Abrechnungsinformation abrufen](./menu-technische-umsetzung-anwendungsfaelle.md#abrechnungsinformation-abrufen-versicherter)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Versicherte ruft die Abrechnungsinformationen aus dem E-Rezept-Fachdienst ab und kann sie anzeigen, exportieren oder weiterleiten.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall Abrechnungsinformationen durch den Versicherten abrufen
**Sequenzdiagramm:**

**Abbildung: **Abrechnungsinformationen durch den Versicherten abrufen

### Abrechnungsinformationen durch den Versicherten weitergeben

* Beschreibung: Vorbedingungen
  * Der Versicherte gibt die Abrechnungsinformation aus dem FdV/AdV heraus an eine Ziel-App weiter (z. B. PKV-App, Beihilfe) oder exportiert sie als PDF/A.: * Der Versicherte hat über das FdV (E-Rezept-FdV) die Abrechnungsinformation vom E-Rezept-Fachdienst abgerufen.

* Beschreibung: Durchzuführende Aktionen
  * Der Versicherte gibt die Abrechnungsinformation aus dem FdV/AdV heraus an eine Ziel-App weiter (z. B. PKV-App, Beihilfe) oder exportiert sie als PDF/A.: * Das FdV erstellt eine PDF/A-Datei mit der eingebetteten Abrechnungsinformation.
* Das FdV übergibt die PDF/A-Datei an die Ziel-App oder bietet sie zum Download an.

* Beschreibung: Nachbedingungen
  * Der Versicherte gibt die Abrechnungsinformation aus dem FdV/AdV heraus an eine Ziel-App weiter (z. B. PKV-App, Beihilfe) oder exportiert sie als PDF/A.: * Die Abrechnungsinformation ist in der Ziel-App übertragen.

* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * Der Versicherte gibt die Abrechnungsinformation aus dem FdV/AdV heraus an eine Ziel-App weiter (z. B. PKV-App, Beihilfe) oder exportiert sie als PDF/A.: * [Abrechnungsinformation abrufen](./menu-technische-umsetzung-anwendungsfaelle.md#abrechnungsinformationen-weitergeben)

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

* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * Der Versicherte markiert die Abrechnungsinformation im FdV/AdV, um sie für bestimmte Aktionen zu kennzeichnen. Der E-Rezept-Fachdienst speichert die Markierung und stellt sie bei Abruf der Abrechnungsinformation bereit.: * [Abrechnungsinformation abrufen](./menu-technische-umsetzung-anwendungsfaelle.md#abrechnungsinformationen-markieren)

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

* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * Ein Versicherter wählt im FdV (E-Rezept-FdV, E-Rezept-AdV) die zu löschende Abrechnungsinformation aus und bestätigt das Löschen. Das FdV überträgt den Lösch-Request. Der E-Rezept-Fachdienst löscht die Abrechnungsinformation: * [Abrechnungsinformation löschen](./menu-technische-umsetzung-anwendungsfaelle.md#abrechnungsinformationen-loeschen)

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

