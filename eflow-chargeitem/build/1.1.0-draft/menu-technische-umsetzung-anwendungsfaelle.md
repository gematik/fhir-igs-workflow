# Technische Anwendungsfälle - Abrechnungsinformationen zu E-Rezepten für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen zu E-Rezepten für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Systemüberblick**](menu-technische-umsetzung-systemueberblick.md)
* **Technische Anwendungsfälle**

## Technische Anwendungsfälle

Diese Seite beschreibt die technischen Anwendungsfälle des Szenarios “Abrechnungsinformationen für PKV-Versicherte”.

### UC 4.11 - Abrechnungsinformation durch Abgebenden bereitstellen

* Beschreibung: Vorbedingungen
  * Mit der Belieferung des E-Rezepts übermittelt die abgebende LEI den PKV-Abgabedatensatz an den E-Rezept-Fachdienst und stellt damit die Abrechnungsinformation digital bereit. Voraussetzung ist die Einwilligung des Versicherten zum Speichern der Abrechnungsinformationen.: * Ein Mitarbeiter der abgebenden LEI hat den Anwendungsfall “UC 4.4 - Quittung abrufen” durchgeführt.
* Die Task-ID und das Geheimnis zur Statusänderung “in Abgabe (gesperrt)” des E-Rezepts sind im PS bekannt.
* Das E-Rezept im E-Rezept-Fachdienst hat den Status “quittiert”.
* Der Versicherte hat im E-Rezept-FdV eine Einwilligung zum Speichern der Abrechnungsinformationen auf dem E-Rezept-Fachdienst erteilt. Diese Information liegt im PS vor.

* Beschreibung: Durchzuführende Aktionen
  * Mit der Belieferung des E-Rezepts übermittelt die abgebende LEI den PKV-Abgabedatensatz an den E-Rezept-Fachdienst und stellt damit die Abrechnungsinformation digital bereit. Voraussetzung ist die Einwilligung des Versicherten zum Speichern der Abrechnungsinformationen.: * Ein Mitarbeiter der abgebenden LEI hat mit dem Versicherten abgestimmt, dass die Abrechnungsinformation digital zur Verfügung gestellt werden soll.
* Das PS erstellt den PKV-Abgabedatensatz und signiert diesen mit dem Konnektor.
* Das PS erstellt eine ChargeItem-Ressource mit einem Identifier aus der PrescriptionID und den übrigen Pflichtfeldern gemäß FHIR-Profil und übermittelt diese an den E-Rezept-Fachdienstes zusammen mit dem generierten Geheimnis des belieferten Tasks zum Zeitpunkt des Statuswechsels “in Abgabe (gesperrt)” und den signierten Abgabedaten.
* Der E-Rezept-Fachdienst prüft, ob eine Einwilligung zum Speichern der Abrechnungsinformationen vorliegt. Falls die Einwilligung vorliegt, übernimmt der E-Rezept-Fachdienst den Verordnungsdatensatz und die Quittung aus dem E-Rezept-Workflow und speichert diese als Teil der Abrechnungsinformation zusammen mit dem “ChargeItem”. Identifier der ChargeItem-Ressource ist die Rezept-ID.
* Der E-Rezept-Fachdienst prüft die Signatur und die FHIR-Validität des PKV-Abgabedatensatzes.
* Der E-Rezept-Fachdienst erzeugt einen AccessCode zum Ändern des PKV-Abgabedatensatzes.
* Der Status des E-Rezept Workflows ändert sich nicht.

* Beschreibung: Nachbedingungen
  * Mit der Belieferung des E-Rezepts übermittelt die abgebende LEI den PKV-Abgabedatensatz an den E-Rezept-Fachdienst und stellt damit die Abrechnungsinformation digital bereit. Voraussetzung ist die Einwilligung des Versicherten zum Speichern der Abrechnungsinformationen.: * Die Abrechnungsinformation ist im E-Rezept-Fachdienst gespeichert.
* Das Einstellen der Abrechnungsinformation ist im E-Rezept-Fachdienst protokolliert.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Mit der Belieferung des E-Rezepts übermittelt die abgebende LEI den PKV-Abgabedatensatz an den E-Rezept-Fachdienst und stellt damit die Abrechnungsinformation digital bereit. Voraussetzung ist die Einwilligung des Versicherten zum Speichern der Abrechnungsinformationen.: * [Abrechnungsinformation bereitstellen](./query-api-chargeitem.md#post-chargeitem-bereitstellen)

* Beschreibung: Relevante(r) Sektor(en)
  * Mit der Belieferung des E-Rezepts übermittelt die abgebende LEI den PKV-Abgabedatensatz an den E-Rezept-Fachdienst und stellt damit die Abrechnungsinformation digital bereit. Voraussetzung ist die Einwilligung des Versicherten zum Speichern der Abrechnungsinformationen.:  APOTHEKER 

**Tabelle:**UC 4.11 - Abrechnungsinformation durch Abgebenden bereitstellen
**Sequenzdiagramm:**

**Abbildung: **UC 4.11 - Abrechnungsinformation durch Abgebenden bereitstellen

### UC 4.10 - Abrechnungsinformationen durch Abgebenden abrufen

* Beschreibung: Vorbedingungen
  * Die Apotheke ruft eine zuvor von ihr bereitgestellte Abrechnungsinformation ab, wenn sie die Daten im Primärsystem nicht mehr vorliegen hat und der AccessCode bekannt ist.: * Rezept-ID und AccessCode zum Ändern sind bekannt.

* Beschreibung: Durchzuführende Aktionen
  * Die Apotheke ruft eine zuvor von ihr bereitgestellte Abrechnungsinformation ab, wenn sie die Daten im Primärsystem nicht mehr vorliegen hat und der AccessCode bekannt ist.: * Das PS übermittelt beim Aufruf an den E-Rezept-Fachdienst die Rezept-ID und den AccessCode zum Ändern.
* Der E-Rezept-Fachdienst prüft den AccessCode zum Ändern.
* Der E-Rezept-Fachdienst prüft, ob die Abrechnungsinformation initial durch die LEI eingestellt wurde.
* Der E-Rezept-Fachdienst übermittelt den PKV-Abgabedatensatz und den Verordnungsdatensatz an die Apotheke.

* Beschreibung: Nachbedingungen
  * Die Apotheke ruft eine zuvor von ihr bereitgestellte Abrechnungsinformation ab, wenn sie die Daten im Primärsystem nicht mehr vorliegen hat und der AccessCode bekannt ist.: * Der PKV-Abgabedatensatz und der Verordnungsdatensatz liegen im PS vor, um Änderungen am PKV-Abgabedatensatz zu ermöglichen.
* Der Datenzugriff ist im E-Rezept-Fachdienst protokolliert.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Die Apotheke ruft eine zuvor von ihr bereitgestellte Abrechnungsinformation ab, wenn sie die Daten im Primärsystem nicht mehr vorliegen hat und der AccessCode bekannt ist.: * [Abrechnungsinformation abrufen](./query-api-chargeitem.md#get-chargeitemid-details)

* Beschreibung: Relevante(r) Sektor(en)
  * Die Apotheke ruft eine zuvor von ihr bereitgestellte Abrechnungsinformation ab, wenn sie die Daten im Primärsystem nicht mehr vorliegen hat und der AccessCode bekannt ist.:  APOTHEKER 

**Tabelle:**UC 4.10 - Abrechnungsinformationen durch Abgebenden abrufen
**Sequenzdiagramm:**

**Abbildung: **UC 4.10 - Abrechnungsinformationen durch Abgebenden abrufen

### UC 4.13 - PKV-Abgabedatensatz durch Abgebenden ändern

* Beschreibung: Vorbedingungen
  * Die abgebende LEI ändert auf Wunsch des Versicherten den PKV-Abgabedatensatz. Der zuvor gespeicherte Datensatz wird überschrieben.: * Ein Mitarbeiter der abgebenden LEI hat den Anwendungsfall “Abrechnungsinformation durch Abgebenden bereitstellen” durchgeführt.
* Die Rezept-ID der Abrechnungsinformation und der AccessCode zum Ändern sind im PS bekannt.

* Beschreibung: Durchzuführende Aktionen
  * Die abgebende LEI ändert auf Wunsch des Versicherten den PKV-Abgabedatensatz. Der zuvor gespeicherte Datensatz wird überschrieben.: * Ein Mitarbeiter der abgebenden LEI erstellt mit dem Primärsystem einen neuen PKV-Abgabedatensatz.
* Das PS übermittelt beim Aufruf des E-Rezept-Fachdienstes die Rezept-ID, den AccessCode zum Ändern und den PKV-Abgabedatensatz.
* Der E-Rezept-Fachdienst prüft den AccessCode zum Ändern.
* Der E-Rezept-Fachdienst prüft, dass die Abgabeinformation initial durch die LEI eingestellt wurde.
* Der E-Rezept-Fachdienst prüft die Signatur und die FHIR-Validität des PKV-Abgabedatensatzes.
* Der E-Rezept-Fachdienst überschreibt den PKV-Abgabedatensatz.
* Der E-Rezept-Fachdienst erzeugt einen neuen AccessCode zum Ändern und überschreibt den alten AccessCode zum Ändern.

* Beschreibung: Nachbedingungen
  * Die abgebende LEI ändert auf Wunsch des Versicherten den PKV-Abgabedatensatz. Der zuvor gespeicherte Datensatz wird überschrieben.: * Das Ändern des PKV-Abgabedatensatzes ist im E-Rezept-Fachdienst protokolliert.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Die abgebende LEI ändert auf Wunsch des Versicherten den PKV-Abgabedatensatz. Der zuvor gespeicherte Datensatz wird überschrieben.: * [Abrechnungsinformation abrufen](./query-api-chargeitem.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Die abgebende LEI ändert auf Wunsch des Versicherten den PKV-Abgabedatensatz. Der zuvor gespeicherte Datensatz wird überschrieben.:  APOTHEKER 

**Tabelle:**UC 4.13 - PKV-Abgabedatensatz durch Abgebenden ändern
**Sequenzdiagramm:**

**Abbildung: **UC 4.13 - PKV-Abgabedatensatz durch Abgebenden ändern

### UC 3.14 - Einwilligung durch Versicherten erteilen

* Beschreibung: Vorbedingungen
  * Ein Versicherter erteilt die Einwilligung für die Nutzung einer Funktionalität der Anwendung.: * Ein Versicherter hat eine Datenverarbeitung ausgewählt, für die er eine Einwilligung erteilen möchte.

* Beschreibung: Durchzuführende Aktionen
  * Ein Versicherter erteilt die Einwilligung für die Nutzung einer Funktionalität der Anwendung.: * Ein Versicherter wählt im E-Rezept-FdV die Operation zum Erteilen der Einwilligung aus.
* Der E-Rezept-Fachdienst speichert die Einwilligung.

* Beschreibung: Nachbedingungen
  * Ein Versicherter erteilt die Einwilligung für die Nutzung einer Funktionalität der Anwendung.: * Die Einwilligung ist im E-Rezept-Fachdienst gespeichert.
* Das Erteilen der Einwilligung ist im E-Rezept-Fachdienst protokolliert.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Ein Versicherter erteilt die Einwilligung für die Nutzung einer Funktionalität der Anwendung.: * [Operation API: Einwilligung durch Versicherten erteilen](./query-api-consent.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Ein Versicherter erteilt die Einwilligung für die Nutzung einer Funktionalität der Anwendung.:  VERSICHERTER 

**Tabelle:**UC 3.14 - Einwilligung durch Versicherten erteilen
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

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Ein Versicherter widerruft die Einwilligung für die Nutzung einer Funktionalität der Anwendung.: * [Operation API: Einwilligung durch Versicherten widerrufen](./query-api-consent.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Ein Versicherter widerruft die Einwilligung für die Nutzung einer Funktionalität der Anwendung.:  VERSICHERTER 

**Tabelle:**UC 3.15 - Einwilligung durch Versicherten widerrufen
**Sequenzdiagramm:**

**Abbildung: **UC 3.15 - Einwilligung durch Versicherten widerrufen

### UC 3.13 - Einwilligungen durch Versicherten einsehen

* Beschreibung: Vorbedingungen
  * Ein Versicherter ermittelt, welche Einwilligungen auf dem E-Rezept-Fachdienst für seine KVNR hinterlegt sind..: * keine

* Beschreibung: Durchzuführende Aktionen
  * Ein Versicherter ermittelt, welche Einwilligungen auf dem E-Rezept-Fachdienst für seine KVNR hinterlegt sind..: * Das E-Rezept-FdV führt die Operation zur Abfrage der Einwilligungen aus.
* Der E-Rezept-Fachdienst gibt die Information an das E-Rezept-FdV.

* Beschreibung: Nachbedingungen
  * Ein Versicherter ermittelt, welche Einwilligungen auf dem E-Rezept-Fachdienst für seine KVNR hinterlegt sind..: * Die Information steht zur Anzeige im E-Rezept-FdV bereit.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Ein Versicherter ermittelt, welche Einwilligungen auf dem E-Rezept-Fachdienst für seine KVNR hinterlegt sind..: * [Operation API: Einwilligungen durch Versicherten einsehen](./query-api-consent.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Ein Versicherter ermittelt, welche Einwilligungen auf dem E-Rezept-Fachdienst für seine KVNR hinterlegt sind..:  VERSICHERTER 

**Tabelle:**UC 3.13 - Einwilligungen durch Versicherten einsehen
**Sequenzdiagramm:**

**Abbildung: **UC 3.13 - Einwilligungen durch Versicherten einsehen

### UC 3.10 - Abrechnungsinformationen durch Versicherten abrufen

* Beschreibung: Vorbedingungen
  * Der Versicherte ruft die Abrechnungsinformationen aus dem E-Rezept-Fachdienst ab und kann sie anzeigen, exportieren oder weiterleiten.: * Einwilligung liegt vor.
* Abrechnungsinformationen wurden durch eine Apotheke bereitgestellt.

* Beschreibung: Durchzuführende Aktionen
  * Der Versicherte ruft die Abrechnungsinformationen aus dem E-Rezept-Fachdienst ab und kann sie anzeigen, exportieren oder weiterleiten.: * Liste per GET /ChargeItem abrufen.
* Detailabruf via GET /ChargeItem/<id> durchführen.
* Fachdienst signiert Datensätze beim Detailabruf.

* Beschreibung: Nachbedingungen
  * Der Versicherte ruft die Abrechnungsinformationen aus dem E-Rezept-Fachdienst ab und kann sie anzeigen, exportieren oder weiterleiten.: * Daten stehen im FdV zur Anzeige und zum Export bereit; Abruf ist protokolliert.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Der Versicherte ruft die Abrechnungsinformationen aus dem E-Rezept-Fachdienst ab und kann sie anzeigen, exportieren oder weiterleiten.: * [Abrechnungsinformation abrufen](./query-api-chargeitem.md#get-chargeitem-liste)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Versicherte ruft die Abrechnungsinformationen aus dem E-Rezept-Fachdienst ab und kann sie anzeigen, exportieren oder weiterleiten.:  VERSICHERTER 

**Tabelle:**UC 3.10 - Abrechnungsinformationen durch Versicherten abrufen
**Sequenzdiagramm:**

**Abbildung: **UC 3.10 - Abrechnungsinformationen durch Versicherten abrufen

### Abrechnungsinformationen durch den Versicherten weitergeben

* Beschreibung: Vorbedingungen
  * Der Versicherte gibt die Abrechnungsinformation aus dem E-Rezept-FdV heraus an eine Ziel-App weiter (z. B. Service-App der Krankenversicherung, Service-App der Beihilfe) oder exportiert sie als PDF/A.: * Der Versicherte hat über das E-Rezept-FdV die Abrechnungsinformation vom E-Rezept-Fachdienst abgerufen.

* Beschreibung: Durchzuführende Aktionen
  * Der Versicherte gibt die Abrechnungsinformation aus dem E-Rezept-FdV heraus an eine Ziel-App weiter (z. B. Service-App der Krankenversicherung, Service-App der Beihilfe) oder exportiert sie als PDF/A.: * Das FdV erstellt eine PDF/A-Datei mit der eingebetteten Abrechnungsinformation.
* Das FdV übergibt die PDF/A-Datei an die Ziel-App oder bietet sie zum Download an.

* Beschreibung: Nachbedingungen
  * Der Versicherte gibt die Abrechnungsinformation aus dem E-Rezept-FdV heraus an eine Ziel-App weiter (z. B. Service-App der Krankenversicherung, Service-App der Beihilfe) oder exportiert sie als PDF/A.: * Die Abrechnungsinformation ist in der Ziel-App übertragen.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Der Versicherte gibt die Abrechnungsinformation aus dem E-Rezept-FdV heraus an eine Ziel-App weiter (z. B. Service-App der Krankenversicherung, Service-App der Beihilfe) oder exportiert sie als PDF/A.: * [Abrechnungsinformation weitergeben](./menu-technische-umsetzung-verarbeitungsregeln.md#abrechnungsinformationen-exportieren)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Versicherte gibt die Abrechnungsinformation aus dem E-Rezept-FdV heraus an eine Ziel-App weiter (z. B. Service-App der Krankenversicherung, Service-App der Beihilfe) oder exportiert sie als PDF/A.:  VERSICHERTER 

**Tabelle:**Abrechnungsinformationen durch den Versicherten weitergeben
**Sequenzdiagramm:**

**Abbildung: **Abrechnungsinformationen durch den Versicherten weitergeben

### UC 3.12 - Abrechnungsinformationen durch den Versicherten markieren

* Beschreibung: Vorbedingungen
  * Der Versicherte markiert die Abrechnungsinformation im E-Rezept-FdV, um sie für bestimmte Aktionen zu kennzeichnen. Der E-Rezept-Fachdienst speichert die Markierung und stellt sie bei Abruf der Abrechnungsinformation bereit.: * Eine LEI hat den Anwendungsfall “Abrechnungsinformation durch Abgebenden bereitstellen” für das E-Rezept durchgeführt. Die Abrechnungsinformation ist auf dem E-Rezept-Fachdienst gespeichert.
* Der Versicherte hat sich über den Anwendungsfall “Abrufen der Abrechnungsinformation durch den Versicherten” die zu markierende Abrechnungsinformation herausgesucht.

* Beschreibung: Durchzuführende Aktionen
  * Der Versicherte markiert die Abrechnungsinformation im E-Rezept-FdV, um sie für bestimmte Aktionen zu kennzeichnen. Der E-Rezept-Fachdienst speichert die Markierung und stellt sie bei Abruf der Abrechnungsinformation bereit.: * Ein Versicherter wählt im E-Rezept-FdV die zu markierende Abrechnungsinformation sowie die zu Optionen für die Markierung aus.
* Der E-Rezept-Fachdienst speichert die Information.

* Beschreibung: Nachbedingungen
  * Der Versicherte markiert die Abrechnungsinformation im E-Rezept-FdV, um sie für bestimmte Aktionen zu kennzeichnen. Der E-Rezept-Fachdienst speichert die Markierung und stellt sie bei Abruf der Abrechnungsinformation bereit.: * Die Information zur Markierung ist im E-Rezept-Fachdienst gespeichert. Der Datenzugriff ist im E-Rezept-Fachdienst protokolliert.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Der Versicherte markiert die Abrechnungsinformation im E-Rezept-FdV, um sie für bestimmte Aktionen zu kennzeichnen. Der E-Rezept-Fachdienst speichert die Markierung und stellt sie bei Abruf der Abrechnungsinformation bereit.: * [Abrechnungsinformation markieren](./menu-technische-umsetzung-verarbeitungsregeln.md#abrechnungsinformationen-markieren)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Versicherte markiert die Abrechnungsinformation im E-Rezept-FdV, um sie für bestimmte Aktionen zu kennzeichnen. Der E-Rezept-Fachdienst speichert die Markierung und stellt sie bei Abruf der Abrechnungsinformation bereit.:  VERSICHERTER 

**Tabelle:**UC 3.12 - Abrechnungsinformationen durch den Versicherten markieren
**Sequenzdiagramm:**

**Abbildung: **UC 3.12 - Abrechnungsinformationen durch den Versicherten markieren

### UC 3.11 - Abrechnungsinformationen durch den Versicherten löschen

* Beschreibung: Vorbedingungen
  * Ein Versicherter wählt im E-Rezept-FdV die zu löschende Abrechnungsinformation aus und bestätigt das Löschen. Das FdV überträgt den Lösch-Request. Der E-Rezept-Fachdienst löscht die Abrechnungsinformation: * Eine LEI hat den Anwendungsfall “Abrechnungsinformation durch Abgebenden bereitstellen” für das E-Rezept durchgeführt.
* Der Versicherte hat sich über den Anwendungsfall “Abrufen der Abrechnungsinformation durch den Versicherten” die Abrechnungsinformation auf sein FdV heruntergeladen.

* Beschreibung: Durchzuführende Aktionen
  * Ein Versicherter wählt im E-Rezept-FdV die zu löschende Abrechnungsinformation aus und bestätigt das Löschen. Das FdV überträgt den Lösch-Request. Der E-Rezept-Fachdienst löscht die Abrechnungsinformation: * Ein Versicherter wählt im E-Rezept-FdV die zu löschende Abrechnungsinformation aus und bestätigt das Löschen.
* Das E-Rezept-FdV überträgt den Löschrequest
* Der E-Rezept-Fachdienst löscht die Abrechnungsinformation.

* Beschreibung: Nachbedingungen
  * Ein Versicherter wählt im E-Rezept-FdV die zu löschende Abrechnungsinformation aus und bestätigt das Löschen. Das FdV überträgt den Lösch-Request. Der E-Rezept-Fachdienst löscht die Abrechnungsinformation: * Die Abrechnungsinformation sind auf dem E-Rezept-Fachdienst gelöscht. Das Löschen ist im E-Rezept-Fachdienst protokolliert.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Ein Versicherter wählt im E-Rezept-FdV die zu löschende Abrechnungsinformation aus und bestätigt das Löschen. Das FdV überträgt den Lösch-Request. Der E-Rezept-Fachdienst löscht die Abrechnungsinformation: * [Abrechnungsinformation löschen](./menu-technische-umsetzung-verarbeitungsregeln.md#abrechnungsinformationen-löschen)

* Beschreibung: Relevante(r) Sektor(en)
  * Ein Versicherter wählt im E-Rezept-FdV die zu löschende Abrechnungsinformation aus und bestätigt das Löschen. Das FdV überträgt den Lösch-Request. Der E-Rezept-Fachdienst löscht die Abrechnungsinformation:  VERSICHERTER 

**Tabelle:**UC 3.11 - Abrechnungsinformationen durch den Versicherten löschen
**Sequenzdiagramm:**

**Abbildung: **UC 3.11 - Abrechnungsinformationen durch den Versicherten löschen

### Berechtigen der Apotheke zum Ändern des PKV-Abgabedatensatzes

* Beschreibung: Vorbedingungen
  * Der Versicherte übermittelt der abgebenden LEI einen AccessCode, um die Apotheke zum Abruf und einmaligen Ändern zu berechtigen. Die Übermittlung erfolgt gemäß dem Anwendungsfall “UC 3.3 - Nachricht durch Versicherten übermitteln”.: * Ein Mitarbeiter der abgebenden LEI hat den Anwendungsfall “UC 4.11 - Abrechnungsinformation durch Abgebenden bereitstellen” durchgeführt.

* Beschreibung: Durchzuführende Aktionen
  * Der Versicherte übermittelt der abgebenden LEI einen AccessCode, um die Apotheke zum Abruf und einmaligen Ändern zu berechtigen. Die Übermittlung erfolgt gemäß dem Anwendungsfall “UC 3.3 - Nachricht durch Versicherten übermitteln”.: * Das E-Rezept-FdV erzeugt einen Abrechnungsinformation-Token.
* Der Versicherte übermittelt den Token per Nachricht (Communication) oder zeigt einen 2D-Code.

* Beschreibung: Nachbedingungen
  * Der Versicherte übermittelt der abgebenden LEI einen AccessCode, um die Apotheke zum Abruf und einmaligen Ändern zu berechtigen. Die Übermittlung erfolgt gemäß dem Anwendungsfall “UC 3.3 - Nachricht durch Versicherten übermitteln”.: * Das AVS nutzt den AccessCode für Abruf/Änderung der Abrechnungsinformation.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Der Versicherte übermittelt der abgebenden LEI einen AccessCode, um die Apotheke zum Abruf und einmaligen Ändern zu berechtigen. Die Übermittlung erfolgt gemäß dem Anwendungsfall “UC 3.3 - Nachricht durch Versicherten übermitteln”.: * [Nachricht an Apotheke übermitteln](./query-api-communication.md#abrechnungsinformationen-löschen)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Versicherte übermittelt der abgebenden LEI einen AccessCode, um die Apotheke zum Abruf und einmaligen Ändern zu berechtigen. Die Übermittlung erfolgt gemäß dem Anwendungsfall “UC 3.3 - Nachricht durch Versicherten übermitteln”.:  VERSICHERTER 

**Tabelle:**Berechtigen der Apotheke zum Ändern des PKV-Abgabedatensatzes
**Sequenzdiagramm:**

**Abbildung: **Berechtigen der Apotheke zum Ändern des PKV-Abgabedatensatzes

