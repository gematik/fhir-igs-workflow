# Technische Anwendungsfälle - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Technische Aspekte zur Arzneimittelverordnung**](menu-technisch.md)
* **Technische Anwendungsfälle**

## Technische Anwendungsfälle

Diese Seite beschreibt die technischen Anwendungsfälle, die für das Modul der verordnung von Arzneimitteln genutzt werden.

### UC 2.1 - E-Rezepte erzeugen

* Beschreibung: Vorbedingungen
  * Der verordnende Leistungserbringer erzeugt ein oder mehrere E-Rezepte im Primaersystem. Für jedes E-Rezept wird eine Rezept-ID aus dem E-Rezept-Fachdienst bezogen und der Datensatz anschließend qualifiziert elektronisch signiert (QES).: * Der oder die Versicherten sind der LEI bekannt.
* Ein oder mehrere Verordnungsdatensätze liegen im Primaersystem vor.
* HBA ist gesteckt und für die QES freigeschaltet.

* Beschreibung: Durchzuführende Aktionen
  * Der verordnende Leistungserbringer erzeugt ein oder mehrere E-Rezepte im Primaersystem. Für jedes E-Rezept wird eine Rezept-ID aus dem E-Rezept-Fachdienst bezogen und der Datensatz anschließend qualifiziert elektronisch signiert (QES).: * Der Leistungserbringer wählt Verordnungsdatensätze und ein Signaturverfahren aus.
* Das Primaersystem ruft pro E-Rezept eine Rezept-ID beim E-Rezept-Fachdienst ab und ergänzt sie im Datensatz.
* Die E-Rezepte werden über den Konnektor mit QES signiert (Einzel-, Stapel- oder Komfortsignatur).
* AccessCodes werden im Primaersystem gespeichert.

* Beschreibung: Nachbedingungen
  * Der verordnende Leistungserbringer erzeugt ein oder mehrere E-Rezepte im Primaersystem. Für jedes E-Rezept wird eine Rezept-ID aus dem E-Rezept-Fachdienst bezogen und der Datensatz anschließend qualifiziert elektronisch signiert (QES).: * E-Rezepte enthalten Rezept-ID und QES.
* AccessCode je E-Rezept ist im Primaersystem gespeichert.
* E-Rezepte sind im E-Rezept-Fachdienst im Status “initialisiert” angelegt.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Der verordnende Leistungserbringer erzeugt ein oder mehrere E-Rezepte im Primaersystem. Für jedes E-Rezept wird eine Rezept-ID aus dem E-Rezept-Fachdienst bezogen und der Datensatz anschließend qualifiziert elektronisch signiert (QES).: * [Operation API: E-Rezept erstellen](./op-create.md)
* QES im Primaersystem (Konnektor)

* Beschreibung: Relevante(r) Sektor(en)
  * Der verordnende Leistungserbringer erzeugt ein oder mehrere E-Rezepte im Primaersystem. Für jedes E-Rezept wird eine Rezept-ID aus dem E-Rezept-Fachdienst bezogen und der Datensatz anschließend qualifiziert elektronisch signiert (QES).:  (ZAHN-)ARZT 

**Tabelle:**Fachlicher Anwendungsfall UC 2.1 - E-Rezepte erzeugen
**Sequenzdiagramm:**

**Abbildung: **UC 2.1 - E-Rezepte erzeugen

### UC 2.3 - E-Rezept einstellen

* Beschreibung: Vorbedingungen
  * Ein E-Rezept wird vom Primaersystem beim E-Rezept-Fachdienst eingestellt und ein E-Rezept-Token erzeugt.: * UC 2.1 wurde ausgeführt; E-Rezept und Signatur liegen im Primaersystem vor.
* Rezept-ID und AccessCode sind bekannt.
* Status im E-Rezept-Fachdienst ist “initialisiert”.

* Beschreibung: Durchzuführende Aktionen
  * Ein E-Rezept wird vom Primaersystem beim E-Rezept-Fachdienst eingestellt und ein E-Rezept-Token erzeugt.: * Der Leistungserbringer wählt ein E-Rezept zum Einstellen aus.
* Das Primaersystem aktualisiert das E-Rezept im E-Rezept-Fachdienst.
* Das Primaersystem erstellt einen E-Rezept-Token und speichert ihn.

* Beschreibung: Nachbedingungen
  * Ein E-Rezept wird vom Primaersystem beim E-Rezept-Fachdienst eingestellt und ein E-Rezept-Token erzeugt.: * E-Rezept ist im E-Rezept-Fachdienst gespeichert und hat Status “offen”.
* Das Einstellen ist im E-Rezept-Fachdienst protokolliert.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Ein E-Rezept wird vom Primaersystem beim E-Rezept-Fachdienst eingestellt und ein E-Rezept-Token erzeugt.: * [Operation API: E-Rezept aktivieren](./op-activate.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Ein E-Rezept wird vom Primaersystem beim E-Rezept-Fachdienst eingestellt und ein E-Rezept-Token erzeugt.:  (ZAHN-)ARZT 

**Tabelle:**Fachlicher Anwendungsfall UC 2.3 - E-Rezept einstellen
**Sequenzdiagramm:**

**Abbildung: **UC 2.3 - E-Rezept einstellen
#### Technische Aspekte für die Mehrfachverordnung (MVO)

Für jede Teilverordnung einer Mehrfachverordnung wird ein einzelnes E-Rezept erstellt. Im Verordnungsdatensatz wird das ERezept als Teil einer Mehrfachverordnung gekennzeichnet (`MedicationRequest: extension:Mehrfachverordnung.extension:Kennzeichen`).

Zusätzlich werden u.a. die Informationen

* Nummer des Rezepts der Mehrfachverordnung (`MedicationRequest.extension:Mehrfachverordnung.extension:Nummerierung.value[x]:valueRatio.numerator`)
* Gesamtzahl der Teilverordnungen in der Mehrfachverordnung (`MedicationRequest: extension Mehrfachverordnung.extension: Nummerierung.value[x]:valueRatio.denominator`)
* Start der Gültigkeit (`MedicationRequest.extension: Mehrfachverordnung extension: Zeitraum.value[x]:valuePeriod.start`)
* Ende der Gültigkeit (`MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end`)

angegeben.

Jede Teilverordnung einer Mehrfachverordnung wird im E-Rezept-Fachdienst mit einem eigenen Workflow (Task) verwaltet. Dies ermöglicht den Versicherten und den Apotheken eine separate Verarbeitung jedes E-Rezepts einer Mehrfachverordnung.

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

### UC 3.1 - E-Rezepte durch Versicherten abrufen

* Beschreibung: Vorbedingungen
  * Ein Versicherter ruft im FdV alle seine im E-Rezept-Fachdienst eingestellten E-Rezepte ab.: * Keine.

* Beschreibung: Durchzuführende Aktionen
  * Ein Versicherter ruft im FdV alle seine im E-Rezept-Fachdienst eingestellten E-Rezepte ab.: * Das FdV fordert E-Rezepte beim E-Rezept-Fachdienst an.
* Der E-Rezept-Fachdienst identifiziert E-Rezepte über die Versicherten-ID.
* Der E-Rezept-Fachdienst liefert E-Rezepte, Status und Statuszeitpunkte; AccessCodes nur bei Abruf über FdV.

* Beschreibung: Nachbedingungen
  * Ein Versicherter ruft im FdV alle seine im E-Rezept-Fachdienst eingestellten E-Rezepte ab.: * E-Rezepte stehen im FdV zur Anzeige bereit; Daten für E-Rezept-Token sind verfügbar.
* Der Abruf ist protokolliert.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Ein Versicherter ruft im FdV alle seine im E-Rezept-Fachdienst eingestellten E-Rezepte ab.: * [Query API: Task](./query-api-task.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Ein Versicherter ruft im FdV alle seine im E-Rezept-Fachdienst eingestellten E-Rezepte ab.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall UC 3.1 - E-Rezepte durch Versicherten abrufen
**Sequenzdiagramm:**

**Abbildung: **UC 3.1 - E-Rezepte durch Versicherten abrufen
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

### UC 3.4 - Nachrichten durch Versicherten empfangen

* Beschreibung: Vorbedingungen
  * Ein Versicherter oder Vertreter empfaengt Nachrichten von abgebenden LEI über den E-Rezept-Fachdienst.: * UC 4.7 wurde ausgeführt.
* UC 3.3 wurde ausgeführt.

* Beschreibung: Durchzuführende Aktionen
  * Ein Versicherter oder Vertreter empfaengt Nachrichten von abgebenden LEI über den E-Rezept-Fachdienst.: * Das FdV fragt beim E-Rezept-Fachdienst nach neuen Nachrichten.
* Nachrichten werden heruntergeladen.

* Beschreibung: Nachbedingungen
  * Ein Versicherter oder Vertreter empfaengt Nachrichten von abgebenden LEI über den E-Rezept-Fachdienst.: * Nachrichten liegen im FdV zur Anzeige bereit.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Ein Versicherter oder Vertreter empfaengt Nachrichten von abgebenden LEI über den E-Rezept-Fachdienst.: * FHIR REST: Communication (E-Rezept-Nachrichten abrufen)

* Beschreibung: Relevante(r) Sektor(en)
  * Ein Versicherter oder Vertreter empfaengt Nachrichten von abgebenden LEI über den E-Rezept-Fachdienst.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall UC 3.4 - Nachrichten durch Versicherten empfangen
**Sequenzdiagramm:**

**Abbildung: **UC 3.4 - Nachrichten durch Versicherten empfangen
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

### UC 4.6 - Nachrichten durch Abgebenden empfangen

* Beschreibung: Vorbedingungen
  * Eine abgebende LEI empfaengt E-Rezept-Token über die TI oder optisch als 2D-Code.: * UC 3.3 wurde ausgeführt oder der 2D-Code wurde präsentiert.

* Beschreibung: Durchzuführende Aktionen
  * Eine abgebende LEI empfaengt E-Rezept-Token über die TI oder optisch als 2D-Code.: * Das PS wählt den Empfangsweg (TI oder 2D-Code).
* Bei TI: PS fragt beim E-Rezept-Fachdienst neue Nachrichten für die Telematik-ID ab und lädt sie herunter.
* Bei 2D-Code: PS wandelt den Code in die Token-Textform um.

* Beschreibung: Nachbedingungen
  * Eine abgebende LEI empfaengt E-Rezept-Token über die TI oder optisch als 2D-Code.: * E-Rezept-Token liegt im PS der abgebenden LEI vor.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Eine abgebende LEI empfaengt E-Rezept-Token über die TI oder optisch als 2D-Code.: * FHIR REST: Communication (E-Rezept-Nachrichten abrufen)

* Beschreibung: Relevante(r) Sektor(en)
  * Eine abgebende LEI empfaengt E-Rezept-Token über die TI oder optisch als 2D-Code.: 

**Tabelle:**Fachlicher Anwendungsfall UC 4.6 - Nachrichten durch Abgebenden empfangen
**Sequenzdiagramm:**

**Abbildung: **UC 4.6 - Nachrichten durch Abgebenden empfangen

### UC 4.1 - E-Rezept durch Abgebenden abrufen

* Beschreibung: Vorbedingungen
  * Eine abgebende LEI ruft ein E-Rezept auf Basis eines E-Rezept-Tokens aus dem E-Rezept-Fachdienst ab.: * Ein E-Rezept-Token wurde übermittelt.
* UC 4.6 wurde ausgeführt.
* Token liegt im PS vor; Status des E-Rezepts ist “offen”.

* Beschreibung: Durchzuführende Aktionen
  * Eine abgebende LEI ruft ein E-Rezept auf Basis eines E-Rezept-Tokens aus dem E-Rezept-Fachdienst ab.: * PS ermittelt Rezept-ID und AccessCode aus dem Token.
* PS ruft das E-Rezept beim E-Rezept-Fachdienst ab.
* Status wechselt auf “in Abgabe (gesperrt)”.
* E-Rezept-Fachdienst erzeugt ein Geheimnis zur Statusänderung und übermittelt es.
* PS prüft die QES über den Konnektor.

* Beschreibung: Nachbedingungen
  * Eine abgebende LEI ruft ein E-Rezept auf Basis eines E-Rezept-Tokens aus dem E-Rezept-Fachdienst ab.: * Status ist “in Abgabe (gesperrt)” und protokolliert.
* E-Rezept liegt im AVS vor; Geheimnis ist gespeichert.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Eine abgebende LEI ruft ein E-Rezept auf Basis eines E-Rezept-Tokens aus dem E-Rezept-Fachdienst ab.: * [Operation API: Task akzeptieren](./op-accept.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Eine abgebende LEI ruft ein E-Rezept auf Basis eines E-Rezept-Tokens aus dem E-Rezept-Fachdienst ab.: 

**Tabelle:**Fachlicher Anwendungsfall UC 4.1 - E-Rezept durch Abgebenden abrufen
**Sequenzdiagramm:**

**Abbildung: **UC 4.1 - E-Rezept durch Abgebenden abrufen
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

### UC 4.4 - Quittung abrufen

* Beschreibung: Vorbedingungen
  * Nach der Abgabe wird das E-Rezept quittiert und eine Quittung vom E-Rezept-Fachdienst abgerufen.: * UC 4.1 wurde ausgeführt.
* QES des E-Rezepts ist gültig geprüft.
* Rezept-ID, AccessCode und Geheimnis sind bekannt; Status ist “in Abgabe (gesperrt)”.

* Beschreibung: Durchzuführende Aktionen
  * Nach der Abgabe wird das E-Rezept quittiert und eine Quittung vom E-Rezept-Fachdienst abgerufen.: * Abgebender markiert das E-Rezept als abgegeben.
* PS übermittelt Rezept-ID, AccessCode, Geheimnis und Abgabeinformationen an den E-Rezept-Fachdienst.
* Status wechselt zu “quittiert”; Quittung wird erstellt und zurückgegeben.

* Beschreibung: Nachbedingungen
  * Nach der Abgabe wird das E-Rezept quittiert und eine Quittung vom E-Rezept-Fachdienst abgerufen.: * Status ist “quittiert”; Abgabeinformationen sind gespeichert.
* Statuswechsel ist protokolliert; Quittung liegt im PS vor.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Nach der Abgabe wird das E-Rezept quittiert und eine Quittung vom E-Rezept-Fachdienst abgerufen.: * [Operation API: Task schliessen](./op-close.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Nach der Abgabe wird das E-Rezept quittiert und eine Quittung vom E-Rezept-Fachdienst abgerufen.: 

**Tabelle:**Fachlicher Anwendungsfall UC 4.4 - Quittung abrufen
**Sequenzdiagramm:**

**Abbildung: **UC 4.4 - Quittung abrufen

### UC 4.5 - Abgabedatensatz durch Abgebenden signieren

* Beschreibung: Vorbedingungen
  * Der Abgebende signiert den Abgabedatensatz fortgeschritten oder qualifiziert (QES).: * E-Rezept wurde dispensiert.
* Abgabedatensatz liegt im PS bereit.
* HBA oder SMC-B ist gesteckt und freigeschaltet.

* Beschreibung: Durchzuführende Aktionen
  * Der Abgebende signiert den Abgabedatensatz fortgeschritten oder qualifiziert (QES).: * Bei Abgabe ohne Änderung: fortgeschrittene Signatur.
* Bei Abgabe mit Änderung: QES für den Dispensierdatensatz.

* Beschreibung: Nachbedingungen
  * Der Abgebende signiert den Abgabedatensatz fortgeschritten oder qualifiziert (QES).: * Abgabedatensatz ist durch den Abgebenden signiert.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Der Abgebende signiert den Abgabedatensatz fortgeschritten oder qualifiziert (QES).: * Keine (Signatur im Primaersystem)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Abgebende signiert den Abgabedatensatz fortgeschritten oder qualifiziert (QES).: 

**Tabelle:**Fachlicher Anwendungsfall UC 4.5 - Abgabedatensatz durch Abgebenden signieren
**Sequenzdiagramm:**

**Abbildung: **UC 4.5 - Abgabedatensatz durch Abgebenden signieren

### UC 4.8 - Quittung erneut abrufen

* Beschreibung: Vorbedingungen
  * Die Quittung wird erneut abgerufen, falls die Übertragung beim ersten Abruf fehlgeschlagen ist.: * UC 4.4 wurde ausgeführt; im PS liegt keine Quittung vor.
* Status des E-Rezepts ist “quittiert”.

* Beschreibung: Durchzuführende Aktionen
  * Die Quittung wird erneut abgerufen, falls die Übertragung beim ersten Abruf fehlgeschlagen ist.: * Abgebender wählt das E-Rezept und ruft die Quittung erneut ab.
* PS übermittelt Rezept-ID und Geheimnis; der E-Rezept-Fachdienst liefert die Quittung erneut aus.

* Beschreibung: Nachbedingungen
  * Die Quittung wird erneut abgerufen, falls die Übertragung beim ersten Abruf fehlgeschlagen ist.: * Quittung liegt im PS vor.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Die Quittung wird erneut abgerufen, falls die Übertragung beim ersten Abruf fehlgeschlagen ist.: * [Operation API: Task schliessen](./op-close.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Die Quittung wird erneut abgerufen, falls die Übertragung beim ersten Abruf fehlgeschlagen ist.: 

**Tabelle:**Fachlicher Anwendungsfall UC 4.8 - Quittung erneut abrufen
**Sequenzdiagramm:**

**Abbildung: **UC 4.8 - Quittung erneut abrufen
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

### E-Rezept qualifiziert signieren

* Beschreibung: Vorbedingungen
  * Der Verordnungsdatensatz wird durch den (Zahn-)Arzt mittels HBA qualifiziert elektronisch signiert (QES). Vorbereitende Tätigkeiten im Primärsystem können organisatorisch delegiert werden, die QES selbst jedoch nicht.: * Rezept-ID (PrescriptionID) ist im Verordnungsdatensatz enthalten.
* Ein freigeschalteter HBA steht zur Verfügung.
* Konsistenz: `authoredOn` im Verordnungsdatensatz entspricht dem Datum der QES.

* Beschreibung: Durchzuführende Aktionen
  * Der Verordnungsdatensatz wird durch den (Zahn-)Arzt mittels HBA qualifiziert elektronisch signiert (QES). Vorbereitende Tätigkeiten im Primärsystem können organisatorisch delegiert werden, die QES selbst jedoch nicht.: * Das Primärsystem startet die QES-Erstellung über den Konnektor.
* Der (Zahn-)Arzt signiert den Verordnungsdatensatz mit dem HBA.
* Das Primärsystem erhält den QES-signierten Datensatz zur weiteren Verarbeitung.

* Beschreibung: Nachbedingungen
  * Der Verordnungsdatensatz wird durch den (Zahn-)Arzt mittels HBA qualifiziert elektronisch signiert (QES). Vorbereitende Tätigkeiten im Primärsystem können organisatorisch delegiert werden, die QES selbst jedoch nicht.: * QES-signierter Verordnungsdatensatz liegt im Primärsystem vor.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Der Verordnungsdatensatz wird durch den (Zahn-)Arzt mittels HBA qualifiziert elektronisch signiert (QES). Vorbereitende Tätigkeiten im Primärsystem können organisatorisch delegiert werden, die QES selbst jedoch nicht.: * Keine (QES im Primaersystem)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Verordnungsdatensatz wird durch den (Zahn-)Arzt mittels HBA qualifiziert elektronisch signiert (QES). Vorbereitende Tätigkeiten im Primärsystem können organisatorisch delegiert werden, die QES selbst jedoch nicht.:  (ZAHN-)ARZT 

**Tabelle:**Fachlicher Anwendungsfall E-Rezept qualifiziert signieren
* Die QES-Erstellung erfolgt im Primärsystem (HBA/Konnektor) vor dem Aufruf von `$activate`.

**Sequenzdiagramm:**

**Abbildung: **E-Rezept qualifiziert signieren
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

