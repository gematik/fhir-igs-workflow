# Technische Umsetzung - Technische Anwendungsfälle - TIFlow - Grenzüberschreitender Datenaustausch v0.9.0

TIFlow - Grenzüberschreitender Datenaustausch

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Technisches Konzept**](menu-technische-umsetzung-konzept.md)
* **Technische Umsetzung - Technische Anwendungsfälle**

## Technische Umsetzung - Technische Anwendungsfälle

### Umzusetzende Anwendungsfälle von Clients

#### E-Rezept-FdV

Das E-Rezept-FdV MUSS für die Umsetzung der Bedienung von E-Rezepten im EU Kontext die Anwendungsfälle
* UC 3.13 - Einwilligung einsehen
* UC 3.14 - Einwilligung erteilen
* UC 3.15 - Einwilligung widerrufen
* UC 3.16 - Zugriffsberechtigung durch Versicherten erstellen
* UC 3.17 - Zugriffsberechtigung durch Versicherten löschen
* UC 3.18 - Zugriffsberechtigung durch Versicherten einsehen
* Zugriffsberechtigung anzeigen
* UC 3.19 - E-Rezept durch den Versicherten markieren
umsetzen.
### Use Cases zur Verwaltung der Einwilligung durch den Versicherten

### UC 3.13 - Einwilligungen durch Versicherten einsehen

* Beschreibung: Vorbedingungen
  * Ein Versicherter ermittelt, welche Einwilligungen auf dem E-Rezept-Fachdienst für seine KVNR hinterlegt sind..: * keine

* Beschreibung: Durchzuführende Aktionen
  * Ein Versicherter ermittelt, welche Einwilligungen auf dem E-Rezept-Fachdienst für seine KVNR hinterlegt sind..: * Das E-Rezept-FdV führt die Operation zur Abfrage der Einwilligungen aus.
* Der E-Rezept-Fachdienst gibt die Information an das E-Rezept-FdV.

* Beschreibung: Nachbedingungen
  * Ein Versicherter ermittelt, welche Einwilligungen auf dem E-Rezept-Fachdienst für seine KVNR hinterlegt sind..: * Die Information steht zur Anzeige im E-Rezept-FdV bereit.

* Beschreibung: Schnittstellen
  * Ein Versicherter ermittelt, welche Einwilligungen auf dem E-Rezept-Fachdienst für seine KVNR hinterlegt sind..: * [Query API: Einwilligungen durch Versicherten einsehen](./query-api-consent.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Ein Versicherter ermittelt, welche Einwilligungen auf dem E-Rezept-Fachdienst für seine KVNR hinterlegt sind..:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall UC 3.13 - Einwilligungen durch Versicherten einsehen
**Sequenzdiagramm:**

**Abbildung: **UC 3.13 - Einwilligungen durch Versicherten einsehen

### UC 3.14 - Einwilligung durch Versicherten erteilen

* Beschreibung: Vorbedingungen
  * Ein Versicherter erteilt die Einwilligung für die Nutzung einer Funktionalität der Anwendung.: * Ein Versicherter hat eine Datenverarbeitung ausgewählt, für die er eine Einwilligung erteilen möchte.

* Beschreibung: Durchzuführende Aktionen
  * Ein Versicherter erteilt die Einwilligung für die Nutzung einer Funktionalität der Anwendung.: * Ein Versicherter wählt im E-Rezept-FdV die Operation zum Erteilen der Einwilligung aus.
* Der E-Rezept-Fachdienst speichert die Einwilligung.

* Beschreibung: Nachbedingungen
  * Ein Versicherter erteilt die Einwilligung für die Nutzung einer Funktionalität der Anwendung.: * Die Einwilligung ist im E-Rezept-Fachdienst gespeichert.
* Das Erteilen der Einwilligung ist im E-Rezept-Fachdienst protokolliert.

* Beschreibung: Schnittstellen
  * Ein Versicherter erteilt die Einwilligung für die Nutzung einer Funktionalität der Anwendung.: * [Query API: Einwilligung durch Versicherten erteilen](./query-api-consent.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Ein Versicherter erteilt die Einwilligung für die Nutzung einer Funktionalität der Anwendung.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall UC 3.14 - Einwilligung durch Versicherten erteilen
**Sequenzdiagramm:**

**Abbildung: **UC 3.14 - Einwilligung durch Versicherten erteilen

### UC 3.15 - Einwilligung durch Versicherten widerrufen

* Beschreibung: Vorbedingungen
  * Ein Versicherter widerruft die Einwilligung für die Nutzung einer Funktionalität der Anwendung.: * Ein Versicherter hat eine Datenverarbeitung ausgewählt, für die er eine Einwilligung widerrufen möchte.
* Im E-Rezept-FdV liegt die Information vor, dass die Einwilligung für diese Datenverarbeitung erteilt wurde.

* Beschreibung: Durchzuführende Aktionen
  * Ein Versicherter widerruft die Einwilligung für die Nutzung einer Funktionalität der Anwendung.: * Ein Versicherter wählt über ein E-Rezept-FdV die Operation zum Widerrufen der Einwilligung auf.
* Der E-Rezept-Fachdienst prüft, ob zuvor die Einwilligung erteilt wurde und löscht diese.
* Der E-Rezept-Fachdienst löscht für die Einwilligung relevante Daten unwiederbringlich.

* Beschreibung: Nachbedingungen
  * Ein Versicherter widerruft die Einwilligung für die Nutzung einer Funktionalität der Anwendung.: * Das Widerrufen der Einwilligung ist im E-Rezept-Fachdienst protokolliert.

* Beschreibung: Schnittstellen
  * Ein Versicherter widerruft die Einwilligung für die Nutzung einer Funktionalität der Anwendung.: * [Query API: Einwilligung durch Versicherten widerrufen](./query-api-consent.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Ein Versicherter widerruft die Einwilligung für die Nutzung einer Funktionalität der Anwendung.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall UC 3.15 - Einwilligung durch Versicherten widerrufen
**Sequenzdiagramm:**

**Abbildung: **UC 3.15 - Einwilligung durch Versicherten widerrufen
### Use Cases zur Verwaltung der Zugriffsberechtigung durch den Versicherten

### UC 3.16 - Zugriffsberechtigung durch Versicherten erstellen

* Beschreibung: Vorbedingungen
  * Der Versicherte erstellt einen Zugriffscode am E-Rezept-Fachdienst, um die Abfrage von E-Rezepten im Ausland zu ermöglichen.: * Der Versicherte hat seine “Einwilligung zum Einlösen im EU-Ausland” erteilt.
* Im E-Rezept-FdV liegt die Information vor, welche europäischen Länder das Einlösen von in Deutschland verordneten E-Rezepten unterstützen.

* Beschreibung: Durchzuführende Aktionen
  * Der Versicherte erstellt einen Zugriffscode am E-Rezept-Fachdienst, um die Abfrage von E-Rezepten im Ausland zu ermöglichen.: * Der Nutzer wählt im E-Rezept-FdV das Land aus, in dem er seine E-Rezepte einlesen möchte und fordert einen Zugriffscode an.
* Das E-Rezept-FdV erstellt einen zufälligen Zugriffscode.
* Das E-Rezept-FdV übermittelt den Zugriffscode und die Länderinformation an den E-Rezept-Fachdienst.
* Der E-Rezept-Fachdienst prüft die Einwilligung, löscht einen ggf. bestehenden Zugriffscode, hinterlegt den übermittelten Zugriffscode und liefert die Gültigkeitsdauer des Zugriffscodes an das E-Rezept-FdV.
* Das E-Rezept-FdV zeigt den Zugriffscode und die Gültigkeitsdauer an.

* Beschreibung: Nachbedingungen
  * Der Versicherte erstellt einen Zugriffscode am E-Rezept-Fachdienst, um die Abfrage von E-Rezepten im Ausland zu ermöglichen.: * Der Zugriffscode ist im E-Rezept-Fachdienst hinterlegt und kann zur Autorisierung des Zugriffs eines LE-EU genutzt werden.

* Beschreibung: Schnittstellen
  * Der Versicherte erstellt einen Zugriffscode am E-Rezept-Fachdienst, um die Abfrage von E-Rezepten im Ausland zu ermöglichen.: * [Operation API: Zugriffsberechtigung](./op-grant-eu-access-permission.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Versicherte erstellt einen Zugriffscode am E-Rezept-Fachdienst, um die Abfrage von E-Rezepten im Ausland zu ermöglichen.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall UC 3.16 - Zugriffsberechtigung durch Versicherten erstellen
**Sequenzdiagramm:**

**Abbildung: **UC 3.16 - Zugriffsberechtigung durch Versicherten erstellen

### UC 3.17 - Zugriffsberechtigung durch Versicherten löschen

* Beschreibung: Vorbedingungen
  * Mit diesem Anwendungsfall kann der Versicherte eine zuvor erstellte Zugriffsberechtigung löschen.: * keine

* Beschreibung: Durchzuführende Aktionen
  * Mit diesem Anwendungsfall kann der Versicherte eine zuvor erstellte Zugriffsberechtigung löschen.: * Der Nutzer wählt im E-Rezept-FdV aus, dass er eine bestehende Zugriffsberechtigung löschen möchte.
* Das E-Rezept-FdV übermittelt den Löschwunsch an den E-Rezept-Fachdienst.
* Der E-Rezept-Fachdienst löscht eine ggf. bestehende Zugriffsberechtigung.
* Das E-Rezept-FdV löscht die Zugriffsberechtigung.

* Beschreibung: Nachbedingungen
  * Mit diesem Anwendungsfall kann der Versicherte eine zuvor erstellte Zugriffsberechtigung löschen.: * Es ist keine Zugriffsberechtigung für den Versicherten im E-Rezept-Fachdienst registriert.
* Die Zugriffsberechtigung wird im E-Rezept-FdV nicht mehr angezeigt.

* Beschreibung: Schnittstellen
  * Mit diesem Anwendungsfall kann der Versicherte eine zuvor erstellte Zugriffsberechtigung löschen.: * [Operation API: Zugriffsberechtigung](./op-revoke-eu-access-permission.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Mit diesem Anwendungsfall kann der Versicherte eine zuvor erstellte Zugriffsberechtigung löschen.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall UC 3.17 - Zugriffsberechtigung durch Versicherten löschen
**Sequenzdiagramm:**

**Abbildung: **UC 3.17 - Zugriffsberechtigung durch Versicherten löschen

### UC 3.18 - Zugriffsberechtigung durch Versicherten einsehen

* Beschreibung: Vorbedingungen
  * Mit diesem Anwendungsfall kann der Versicherte sich eine Zugriffsberechtigung im E-Rezept-FdV anzeigen lassen, wenn die Informationen zur Zugriffsberechtigung nicht lokal im E-Rezept-FdV gespeichert sind.: * keine

* Beschreibung: Durchzuführende Aktionen
  * Mit diesem Anwendungsfall kann der Versicherte sich eine Zugriffsberechtigung im E-Rezept-FdV anzeigen lassen, wenn die Informationen zur Zugriffsberechtigung nicht lokal im E-Rezept-FdV gespeichert sind.: * Das E-Rezept-FdV führt die Operation zur Abfrage der Zugriffsberechtigung aus.
* Der E-Rezept-Fachdienst gibt die Information an das E-Rezept-FdV.
* Das E-Rezept-FdV zeigt den Zugriffscode und die Gültigkeitsdauer an.

* Beschreibung: Nachbedingungen
  * Mit diesem Anwendungsfall kann der Versicherte sich eine Zugriffsberechtigung im E-Rezept-FdV anzeigen lassen, wenn die Informationen zur Zugriffsberechtigung nicht lokal im E-Rezept-FdV gespeichert sind.: * keine

* Beschreibung: Schnittstellen
  * Mit diesem Anwendungsfall kann der Versicherte sich eine Zugriffsberechtigung im E-Rezept-FdV anzeigen lassen, wenn die Informationen zur Zugriffsberechtigung nicht lokal im E-Rezept-FdV gespeichert sind.: * [Operation API: Zugriffsberechtigung](./op-read-eu-access-permission.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Mit diesem Anwendungsfall kann der Versicherte sich eine Zugriffsberechtigung im E-Rezept-FdV anzeigen lassen, wenn die Informationen zur Zugriffsberechtigung nicht lokal im E-Rezept-FdV gespeichert sind.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall UC 3.18 - Zugriffsberechtigung durch Versicherten einsehen
**Sequenzdiagramm:**

**Abbildung: **UC 3.18 - Zugriffsberechtigung durch Versicherten einsehen
### Zugriffsberechtigung anzeigen

Das E-Rezept-FdV MUSS im Anwendungsfall "Zugriffsberechtigung anzeigen" folgende Informationen auf dem Display anzeigen:
* Name des Landes,
* Gültigkeitsende,
* Zugriffscode,
* KVNR des Versicherten.

Für die Anzeige der Gültigkeitsdauer ist die Zeitzone zu beachten, in der der Nutzer sich befindet.

Das E-Rezept-FdV MUSS bei der Anzeige des Zugriffscodes die Lesbarkeit der Zeichen des Zugriffscodes sicherstellen.

Hinweis: Mit Lesbarkeit ist das Erkennen und Unterscheiden einzelner Buchstaben und Ziffern gemeint, d.h. die Unterscheidbarkeit von beispielsweise von 0 (Null) und O (Großbuchstabe O), sowie I (Großbuchstabe i) und l (Kleinbuchstabe L) und 1 (Ziffer Eins).

Das E-Rezept-FdV MUSS die Gültigkeitsdauer der Zugriffsberechtigung auf dem Display hervorheben, wenn die Gültigkeitsdauer 10 Minuten unterschreitet.

Das E-Rezept-FdV MUSS, wenn die Gültigkeit der Zugriffsberechtigung zeitlich abgelaufen ist, den Versicherten informieren.

Hinweis: Es reicht aus, dass die Information über den Ablauf der Zugriffsberechtigung nur angezeigt wird, während der Nutzer auf dem Gerät aktiv ist.

Der zeitliche Ablauf der Zugriffsberechtigung wird nicht durch den E-Rezept-Fachdienst signalisiert.

### Use Cases zur Verwaltung der E-Rezepte durch den Versicherten

### UC 3.19 - E-Rezept durch den Versicherten markieren

* Beschreibung: Vorbedingungen
  * Mit diesem Anwendungsfall kann der Versicherte ein E-Rezept für das Einlösen im EU-Ausland markieren. Bei der Abfrage eines LE-EU werden ausschließlich im EU-Ausland einlösbare E-Rezepte ausgeliefert, welche zuvor durch den Versicherten markiert wurden.Der Anwendungsfall wird ebenfalls dafür genutzt, eine Markierung zu löschen.: * keine

* Beschreibung: Durchzuführende Aktionen
  * Mit diesem Anwendungsfall kann der Versicherte ein E-Rezept für das Einlösen im EU-Ausland markieren. Bei der Abfrage eines LE-EU werden ausschließlich im EU-Ausland einlösbare E-Rezepte ausgeliefert, welche zuvor durch den Versicherten markiert wurden.Der Anwendungsfall wird ebenfalls dafür genutzt, eine Markierung zu löschen.: * Der Nutzer wählt im E-Rezept-FdV das zu markierende E-Rezept sowie die Option für die Markierung aus.
* Das E-Rezept-FdV übermittelt die Information an den E-Rezept-Fachdienst.
* Der E-Rezept-Fachdienst speichert die Information.

* Beschreibung: Nachbedingungen
  * Mit diesem Anwendungsfall kann der Versicherte ein E-Rezept für das Einlösen im EU-Ausland markieren. Bei der Abfrage eines LE-EU werden ausschließlich im EU-Ausland einlösbare E-Rezepte ausgeliefert, welche zuvor durch den Versicherten markiert wurden.Der Anwendungsfall wird ebenfalls dafür genutzt, eine Markierung zu löschen.: * Die Information zur Markierung ist im E-Rezept-Fachdienst gespeichert.
* Der Datenzugriff ist im E-Rezept-Fachdienst protokolliert.

* Beschreibung: Schnittstellen
  * Mit diesem Anwendungsfall kann der Versicherte ein E-Rezept für das Einlösen im EU-Ausland markieren. Bei der Abfrage eines LE-EU werden ausschließlich im EU-Ausland einlösbare E-Rezepte ausgeliefert, welche zuvor durch den Versicherten markiert wurden.Der Anwendungsfall wird ebenfalls dafür genutzt, eine Markierung zu löschen.: * [Query API: E-Rezept durch den Versicherten markieren](./query-api-task.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Mit diesem Anwendungsfall kann der Versicherte ein E-Rezept für das Einlösen im EU-Ausland markieren. Bei der Abfrage eines LE-EU werden ausschließlich im EU-Ausland einlösbare E-Rezepte ausgeliefert, welche zuvor durch den Versicherten markiert wurden.Der Anwendungsfall wird ebenfalls dafür genutzt, eine Markierung zu löschen.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall UC 3.19 - E-Rezept durch den Versicherten markieren
**Sequenzdiagramm:**

**Abbildung: **UC 3.19 - E-Rezept durch den Versicherten markieren
### Use Cases im Rahmen der Belieferung durch eine Apotheke im europäischen Ausland

### UC 4.19 - Demographische Daten eines Versicherten abrufen

* Beschreibung: Vorbedingungen
  * Mit diesem Anwendungsfall werden die demographischen Daten zu einem Versicherten vom E-Rezept-Fachdienst abgerufen.: * Der Versicherte hat seine Einwilligung zum Einlösen im EU-Ausland erteilen (Anwendungsfall “Einwilligung durch Versicherten erteilen”).
* Der Versicherte hat eine Zugriffsberechtigung für Land B erteilt (Anwendungsfall “Zugriffsberechtigung durch Versicherten erstellen”).
* Der Versicherte hat mindestens ein E-Rezept zum Einlösen im EU-Ausland markiert.

* Beschreibung: Durchzuführende Aktionen
  * Mit diesem Anwendungsfall werden die demographischen Daten zu einem Versicherten vom E-Rezept-Fachdienst abgerufen.: * Der Versicherte übermittelt die Informationen zur Zugriffsberechtigung an den LE-EU.
* Der LE-EU informiert den Versicherten über die Datenschutzrechte. Der Versicherte willigt gegenüber dem LE-EU in die Verarbeitung der Daten ein.
* Der LE-EU sendet einen Request über den eHDSI an das Land A (Deutschland).
* Der NCPeH-FD prüft die Permission aus der Anfrage und falls nicht vorhanden die Rolle des anfragenden LE-EU.
* Der NCPeH-FD sendet einen Request für die Liste einlösbarer E-Rezepte des Versicherten an den E-Rezept-Fachdienst.
* Der E-Rezept-Fachdienst übermittelt das aktuellste einlösbaren E-Rezept an den NCPeH-FD.
* Der NCPeH-FD extrahiert die notwendigen Informationen und erstellt den Response für den LE-EU.

* Beschreibung: Nachbedingungen
  * Mit diesem Anwendungsfall werden die demographischen Daten zu einem Versicherten vom E-Rezept-Fachdienst abgerufen.: * Der Status der einlösbaren E-Rezepte des Versicherten ist unverändert.
* Die Abfrage ist im E-Rezept-Fachdienst protokolliert.
* Der LE-EU stehen die demographischen Daten des Versicherten zur Verfügung.

* Beschreibung: Schnittstellen
  * Mit diesem Anwendungsfall werden die demographischen Daten zu einem Versicherten vom E-Rezept-Fachdienst abgerufen.: * [Operation API: Interaktion NCPeH - Abrufen](./op-get-eu-prescriptions.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Mit diesem Anwendungsfall werden die demographischen Daten zu einem Versicherten vom E-Rezept-Fachdienst abgerufen.:  NCPEH 

**Tabelle:**Fachlicher Anwendungsfall UC 4.19 - Demographische Daten eines Versicherten abrufen
**Sequenzdiagramm:**

**Abbildung: **UC 4.19 - Demographische Daten eines Versicherten abrufen

### UC 4.20 - Liste der einlösbaren E-Rezepte eines Versicherten abrufen

* Beschreibung: Vorbedingungen
  * Mit diesem Anwendungsfall werden die im europäischen Ausland einlösbaren E-Rezepte zu einem Versicherten vom E-Rezept-Fachdienst abgerufen.: * Der Versicherte hat eine Zugriffsberechtigung für Land B erteilt.
* Der Versicherte hat die Informationen zur Zugriffsberechtigung an den LE-EU übermittelt. (Anwendungsfall “Demographische Daten eines Versicherten abrufen”)
* Der Versicherte hat mindestens ein E-Rezept zum Einlösen im EU-Ausland markiert.

* Beschreibung: Durchzuführende Aktionen
  * Mit diesem Anwendungsfall werden die im europäischen Ausland einlösbaren E-Rezepte zu einem Versicherten vom E-Rezept-Fachdienst abgerufen.: * Der LE-EU sendet einen Request über den eHDSI an das Land A (Deutschland).
* Der NCPeH-FD prüft das Vorliegen einer Behandlungsbeziehung zwischen LE-EU und Versicherten.
* Der NCPeH-FD prüft die Permission aus der Anfrage und falls nicht vorhanden die Rolle des anfragenden LE-EU.
* Der NCPeH-FD sendet einen Request für die Liste einlösbarer E-Rezepte des Versicherten an den E-Rezept-Fachdienst.
* Der E-Rezept-Fachdienst übermittelt die Liste der einlösbaren E-Rezepte an den NCPeH-FD.
* Der NCPeH-FD extrahiert die notwendigen Informationen, transkodiert die Informationen und erstellt den Response für den LE-EU.

* Beschreibung: Nachbedingungen
  * Mit diesem Anwendungsfall werden die im europäischen Ausland einlösbaren E-Rezepte zu einem Versicherten vom E-Rezept-Fachdienst abgerufen.: * Der Status der einlösbaren E-Rezepte des Versicherten ist unverändert.
* Die Abfrage ist im E-Rezept-Fachdienst protokolliert.
* Der LE-EU stehen die Liste der einlösbaren E-Rezepte des Versicherten zur Verfügung.

* Beschreibung: Schnittstellen
  * Mit diesem Anwendungsfall werden die im europäischen Ausland einlösbaren E-Rezepte zu einem Versicherten vom E-Rezept-Fachdienst abgerufen.: * [Operation API: Interaktion NCPeH - Abrufen](./op-get-eu-prescriptions.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Mit diesem Anwendungsfall werden die im europäischen Ausland einlösbaren E-Rezepte zu einem Versicherten vom E-Rezept-Fachdienst abgerufen.:  NCPEH 

**Tabelle:**Fachlicher Anwendungsfall UC 4.20 - Liste der einlösbaren E-Rezepte eines Versicherten abrufen
**Sequenzdiagramm:**

**Abbildung: **UC 4.20 - Liste der einlösbaren E-Rezepte eines Versicherten abrufen

### UC 4.21 - Liste ausgewählter E-Rezepte eines Versicherten abrufen

* Beschreibung: Vorbedingungen
  * Mit diesem Anwendungsfall werden die zum Einlösen vorgesehenen E-Rezepte zu einem Versicherten vom E-Rezept-Fachdienst abgerufen.: * Der Versicherte hat eine Zugriffsberechtigung für Land B erteilt.
* Der Versicherte hat die Informationen zur Zugriffsberechtigung an den LE-EU übermittelt. (Anwendungsfall “Demographische Daten eines Versicherten abrufen”)
* Der LE-EU hat die Liste der einlösbaren E-Rezepte für den Versicherten abgerufen.

* Beschreibung: Durchzuführende Aktionen
  * Mit diesem Anwendungsfall werden die zum Einlösen vorgesehenen E-Rezepte zu einem Versicherten vom E-Rezept-Fachdienst abgerufen.: * Der LE-EU sendet einen Request mit einer Liste von Rezept-ID, über den eHDSI an das Land A (Deutschland).
* Der NCPeH-FD prüft das Vorliegen einer Behandlungsbeziehung zwischen LE-EU und Versicherten.
* Der NCPeH-FD prüft die Permission aus der Anfrage und falls nicht vorhanden die Rolle des anfragenden LE-EU.
* Der NCPeH-FD sendet einen Request mit der Liste von Rezept-IDs des Versicherten an den E-Rezept-Fachdienst.
* Der E-Rezept-Fachdienst ändert den Status der abgefragten E-Rezepte, falls der Status “ready” ist, in “in-progress”.
* Der E-Rezept-Fachdienst übermittelt die Liste der E-Rezepte an den NCPeH-FD.
* Der NCPeH-FD transformiert und transkodiert die E-Rezepte in das entsprechende eHDSI-Dokumentenformat und erstellt den Response für den LE-EU.

* Beschreibung: Nachbedingungen
  * Mit diesem Anwendungsfall werden die zum Einlösen vorgesehenen E-Rezepte zu einem Versicherten vom E-Rezept-Fachdienst abgerufen.: * Der Status der einlösbaren E-Rezepte des Versicherten ist “in-progress”.
* Die Abfrage ist im E-Rezept-Fachdienst protokolliert.
* Der LE-EU stehen die Liste der E-Rezepte des Versicherten zur Verfügung.

* Beschreibung: Schnittstellen
  * Mit diesem Anwendungsfall werden die zum Einlösen vorgesehenen E-Rezepte zu einem Versicherten vom E-Rezept-Fachdienst abgerufen.: * [Operation API: Interaktion NCPeH - Abrufen](./op-get-eu-prescriptions.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Mit diesem Anwendungsfall werden die zum Einlösen vorgesehenen E-Rezepte zu einem Versicherten vom E-Rezept-Fachdienst abgerufen.:  NCPEH 

**Tabelle:**Fachlicher Anwendungsfall UC 4.21 - Liste ausgewählter E-Rezepte eines Versicherten abrufen
**Sequenzdiagramm:**

**Abbildung: **UC 4.21 - Liste ausgewählter E-Rezepte eines Versicherten abrufen

### UC 4.22 - Abgabe eines E-Rezeptes im europäischen Ausland

* Beschreibung: Vorbedingungen
  * Mit diesem Anwendungsfall werden die Dispensierinformationen zu einem eingelösten E-Rezept an den E-Rezept-Fachdienst übermittelt.: * Der Versicherte hat eine Zugriffsberechtigung für Land B erteilt.
* Der Versicherte hat die Informationen zur Zugriffsberechtigung an den LE-EU übermittelt. (Anwendungsfall “Demographische Daten eines Versicherten abrufen”)
* Der LE-EU hat ausgewählte E-Rezepte des Versicherten abgerufen.

* Beschreibung: Durchzuführende Aktionen
  * Mit diesem Anwendungsfall werden die Dispensierinformationen zu einem eingelösten E-Rezept an den E-Rezept-Fachdienst übermittelt.: * Der Versicherte übermittelt, falls der zuvor übermittelte Zugriffscode zeitlich nicht mehr gültig ist, einen neuen Zugriffscode an den LE-EU.
* Der LE-EU sendet einen eDispensation Request für ein E-Rezept über den eHDSI an Land A (Deutschland).
* Der NCPeH-FD prüft das Vorliegen einer Behandlungsbeziehung zwischen LE-EU und Versicherten.
* Der NCPeH-FD prüft die Permission und falls nicht vorhanden die Rolle des anfragenden LE-EU.
* Der NCPeH-FD transformiert und transkodiert die Information zu jedem eDispensation Document in einen Dispensierinformationsdatensatz für das E-Rezept.
* Der NCPeH-FD sendet für jedes übermittelte eDispensation Document (CDA) einen Request mit den Dispensierinformationsdatensatz für das E-Rezept an den E-Rezept-Fachdienst.
* Der E-Rezept-Fachdienst speichert die Dispensierinformationen und ändert den Status des Task zu “completed”.
* Der E-Rezept-Fachdienst übermittelt den Status der Operation an den NCPeH-FD. Der NCPeH-FD übermittelt den Status an den LE-EU.

* Beschreibung: Nachbedingungen
  * Mit diesem Anwendungsfall werden die Dispensierinformationen zu einem eingelösten E-Rezept an den E-Rezept-Fachdienst übermittelt.: * Der Status der eingelösten E-Rezepte ist “completed”.
* Der Datenzugriff ist im E-Rezept-Fachdienst für jedes E-Rezept protokolliert.

* Beschreibung: Schnittstellen
  * Mit diesem Anwendungsfall werden die Dispensierinformationen zu einem eingelösten E-Rezept an den E-Rezept-Fachdienst übermittelt.: * [Operation API: Interaktion NCPeH - Abgeben](./op-eu-close.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Mit diesem Anwendungsfall werden die Dispensierinformationen zu einem eingelösten E-Rezept an den E-Rezept-Fachdienst übermittelt.:  NCPEH 

**Tabelle:**Fachlicher Anwendungsfall UC 4.22 - Abgabe eines E-Rezeptes im europäischen Ausland
**Sequenzdiagramm:**

**Abbildung: **UC 4.22 - Abgabe eines E-Rezeptes im europäischen Ausland
**Hinweis: Für den Anwendungsfall “Abgabe von E-Rezepten im europäischen Ausland” wird angenommen, dass die vollständigen Dispensierinformationen zu einer ePrescription (E-Rezept) in genau einem eDispensation Dokument (CDA) vom LE-EU übermittelt werden.**

Nach der Bereitstellung der Dispensierinformationen im E-Rezept-Fachdienst kann der Versicherte diese mit seinem E-Rezept-FdV herunterladen und anzeigen lassen.

Eine Übermittlung der Dispensierinformationen an den ePA Medication Service ist perspektivisch vorgesehen. Die Funktionalität wird ergänzt, sobald die Voraussetzungen in den verwendeten Datenmodellen geschaffen wurden.

