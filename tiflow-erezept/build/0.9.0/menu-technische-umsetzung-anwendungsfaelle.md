# Technische Anwendungsfälle - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Technische Aspekte zur Arzneimittelverordnung**](menu-technisch.md)
* **Technische Anwendungsfälle**

## Technische Anwendungsfälle

Diese Seite beschreibt die technischen Anwendungsfälle, die für das Modul der Verordnung von Arzneimitteln genutzt werden.

### Umzusetzende Anwendungsfälle von Clients

#### PS verordnende LEI

Das PS der verordnenden LEI MUSS für die Umsetzung der Verordnung von E-Rezepten für Arzneimittel die Anwendungsfälle
* UC 2.1 - E-Rezepte erzeugen
* E-Rezept qualifiziert signieren
* UC 2.3 - E-Rezept einstellen
* UC 2.5 - E-Rezept durch Verordnenden löschen
umsetzen.
#### E-Rezept-FdV

Das E-Rezept-FdV MUSS für die Umsetzung der Nutzung von E-Rezepten für Arzneimittel die Anwendungsfälle
* UC 3.1 – E-Rezepte durch Versicherten abrufen
* UC 3.2 – E-Rezept durch Versicherten löschen
* UC 3.3 – Nachricht durch Versicherten übermitteln
* UC 3.4 – Nachricht durch Versicherten empfangen
* UC 3.8 – Nachricht durch Versicherten löschen
* UC 3.5 - Protokolldaten abrufen
umsetzen.
#### PS abgebende LEI

Das PS der abgebenden LEI MUSS für die Umsetzung der Belieferung von E-Rezepten für Arzneimittel die Anwendungsfälle
* UC 4.15 - Einlösbare E-Rezepte durch Abgebenden abrufen
* UC 4.1 - E-Rezept durch Abgebenden abrufen
* UC 4.2 - E-Rezept durch Abgebenden zurückgeben
* UC 4.3 - E-Rezept durch Abgebenden löschen
* UC 4.4 - Quittung abrufen
* UC 4.5 - Abgabedatensatz durch Abgebenden signieren
* UC 4.17 - Verordnung erneut abrufen
* UC 4.8 - Quittung erneut abrufen
* UC 4.6 - Nachrichten durch Abgebenden empfangen
* UC 4.7 - Nachricht durch Abgebenden übermitteln
* UC 4.9 - Nachricht durch Abgebenden löschen
umsetzen.

Das PS der abgebenden LEI SOLL für die Umsetzung der Belieferung von E-Rezepten für Arzneimittel den Anwendungsfall
* UC 4.16 - Dispensierinformationen bereitstellen
umsetzen.
### Technische Use Cases

#### Verordnende Leistungserbringerinstitution

##### UC 2.1 - E-Rezepte erzeugen

* Beschreibung: Vorbedingungen
  * Der verordnende Leistungserbringer erzeugt eine Verordnung im Primaersystem. Für die Verordnung wird eine Rezept-ID aus dem TI-Flow-Fachdienst bezogen und der Verordnungsdatensatz anschließend qualifiziert elektronisch signiert (QES).: * Der Versicherte ist der LEI bekannt.
* Ein Verordnungsdatensatz liegt im Primärsystem vor.
* HBA ist gesteckt und für die QES freigeschaltet.

* Beschreibung: Durchzuführende Aktionen
  * Der verordnende Leistungserbringer erzeugt eine Verordnung im Primaersystem. Für die Verordnung wird eine Rezept-ID aus dem TI-Flow-Fachdienst bezogen und der Verordnungsdatensatz anschließend qualifiziert elektronisch signiert (QES).: * Der Leistungserbringer wählt den Verordnungsdatensatz und ein Signaturverfahren aus.
* Das Primärsystem ruft eine Rezept-ID beim TI-Flow-Fachdienst ab und ergänzt sie im Verordnungsdatensatz.
* Der AccessCode wird im Primärsystem gespeichert.
* Der Verordnungsdatensatz wird über den Konnektor mit QES signiert (Einzel-, Stapel- oder Komfortsignatur).

* Beschreibung: Nachbedingungen
  * Der verordnende Leistungserbringer erzeugt eine Verordnung im Primaersystem. Für die Verordnung wird eine Rezept-ID aus dem TI-Flow-Fachdienst bezogen und der Verordnungsdatensatz anschließend qualifiziert elektronisch signiert (QES).: * E-Rezept enthält Rezept-ID und QES.
* AccessCode des E-Rezepts ist im Primärsystem gespeichert.
* Workflow zum E-Rezept ist im TI-Flow-Fachdienst im Status “initialisiert” angelegt.

* Beschreibung: Schnittstellen
  * Der verordnende Leistungserbringer erzeugt eine Verordnung im Primaersystem. Für die Verordnung wird eine Rezept-ID aus dem TI-Flow-Fachdienst bezogen und der Verordnungsdatensatz anschließend qualifiziert elektronisch signiert (QES).: * [Operation API: E-Rezept erstellen](./op-create.md)
* QES im Primärsystem (Konnektor)

* Beschreibung: Relevante(r) Sektor(en)
  * Der verordnende Leistungserbringer erzeugt eine Verordnung im Primaersystem. Für die Verordnung wird eine Rezept-ID aus dem TI-Flow-Fachdienst bezogen und der Verordnungsdatensatz anschließend qualifiziert elektronisch signiert (QES).:  (ZAHN-)ARZT 

**Tabelle:**Fachlicher Anwendungsfall UC 2.1 - E-Rezepte erzeugen
**Sequenzdiagramm:**

**Abbildung: **UC 2.1 - E-Rezepte erzeugen

##### E-Rezept qualifiziert signieren

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

* Beschreibung: Schnittstellen
  * Der Verordnungsdatensatz wird durch den (Zahn-)Arzt mittels HBA qualifiziert elektronisch signiert (QES). Vorbereitende Tätigkeiten im Primärsystem können organisatorisch delegiert werden, die QES selbst jedoch nicht.: * Keine (QES im Primärsystem)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Verordnungsdatensatz wird durch den (Zahn-)Arzt mittels HBA qualifiziert elektronisch signiert (QES). Vorbereitende Tätigkeiten im Primärsystem können organisatorisch delegiert werden, die QES selbst jedoch nicht.:  (ZAHN-)ARZT 

**Tabelle:**Fachlicher Anwendungsfall E-Rezept qualifiziert signieren
* Die QES-Erstellung erfolgt im Primärsystem (HBA/Konnektor) vor dem Aufruf von `$activate`.

**Sequenzdiagramm:**

**Abbildung: **E-Rezept qualifiziert signieren

##### UC 2.3 - E-Rezept einstellen

* Beschreibung: Vorbedingungen
  * Ein E-Rezept wird vom Primärsystem beim TI-Flow-Fachdienst eingestellt und ein E-Rezept-Token erzeugt.: * UC 2.1 wurde ausgeführt; E-Rezept und Signatur liegen im Primärsystem vor.
* Rezept-ID und AccessCode sind bekannt.
* Status im TI-Flow-Fachdienst ist “initialisiert”.

* Beschreibung: Durchzuführende Aktionen
  * Ein E-Rezept wird vom Primärsystem beim TI-Flow-Fachdienst eingestellt und ein E-Rezept-Token erzeugt.: * Der Leistungserbringer wählt ein E-Rezept zum Einstellen aus.
* Das Primärsystem lädt das E-Rezept in den Workflow im TI-Flow-Fachdienst.
* Das Primärsystem erstellt einen E-Rezept-Token und speichert ihn.

* Beschreibung: Nachbedingungen
  * Ein E-Rezept wird vom Primärsystem beim TI-Flow-Fachdienst eingestellt und ein E-Rezept-Token erzeugt.: * Das E-Rezept ist im TI-Flow-Fachdienst gespeichert.
* Der Workflow hat den Status “ready”.
* Das Einstellen ist im TI-Flow-Fachdienst für den Versicherten protokolliert.

* Beschreibung: Schnittstellen
  * Ein E-Rezept wird vom Primärsystem beim TI-Flow-Fachdienst eingestellt und ein E-Rezept-Token erzeugt.: * [Operation API: E-Rezept aktivieren](./op-activate.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Ein E-Rezept wird vom Primärsystem beim TI-Flow-Fachdienst eingestellt und ein E-Rezept-Token erzeugt.:  (ZAHN-)ARZT 

**Tabelle:**Fachlicher Anwendungsfall UC 2.3 - E-Rezept einstellen
**Sequenzdiagramm:**

**Abbildung: **UC 2.3 - E-Rezept einstellen
**Technische Aspekte für die Mehrfachverordnung (MVO)**

Für jede Teilverordnung einer Mehrfachverordnung wird ein einzelnes E-Rezept erstellt. Im Verordnungsdatensatz wird das E-Rezept als Teil einer Mehrfachverordnung gekennzeichnet (`MedicationRequest: extension:Mehrfachverordnung.extension:Kennzeichen`).

Zusätzlich werden u.a. die Informationen

* Nummer des Rezepts der Mehrfachverordnung (`MedicationRequest.extension:Mehrfachverordnung.extension:Nummerierung.value[x]:valueRatio.numerator`)
* Gesamtzahl der Teilverordnungen in der Mehrfachverordnung (`MedicationRequest: extension Mehrfachverordnung.extension: Nummerierung.value[x]:valueRatio.denominator`)
* Start der Gültigkeit (`MedicationRequest.extension: Mehrfachverordnung extension: Zeitraum.value[x]:valuePeriod.start`)
* Ende der Gültigkeit (`MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end`) angegeben.

Jede Teilverordnung einer Mehrfachverordnung wird im TI-Flow-Fachdienst mit einem eigenen Workflow (Task) verwaltet. Dies ermöglicht den Versicherten und den Apotheken eine separate Verarbeitung jedes E-Rezepts einer Mehrfachverordnung.

##### UC 2.5 - E-Rezept durch Verordnenden löschen

* Beschreibung: Vorbedingungen
  * Ein E-Rezept wird durch die verordnende LEI gelöscht und der Status im TI-Flow-Fachdienst auf “cancelled” gesetzt.: * UC 2.3 wurde ausgeführt.
* Rezept-ID und AccessCode sind bekannt.
* Status im TI-Flow-Fachdienst ist “ready”.

* Beschreibung: Durchzuführende Aktionen
  * Ein E-Rezept wird durch die verordnende LEI gelöscht und der Status im TI-Flow-Fachdienst auf “cancelled” gesetzt.: * Ein Mitarbeiter der verordnenden LEI markiert das E-Rezept zum Löschen und bestätigt den Vorgang.
* Das Primärsystem ruft den TI-Flow-Fachdienst mit Rezept-ID und AccessCode auf.
* Der Status wird auf “cancelled” gesetzt und medizinische Daten werden gelöscht.
* Der AccessCode wird im Primärsystem gelöscht.

* Beschreibung: Nachbedingungen
  * Ein E-Rezept wird durch die verordnende LEI gelöscht und der Status im TI-Flow-Fachdienst auf “cancelled” gesetzt.: * Der Workflow hat den Status “cancelled”.
* Die personenbezogene und medizinische Daten (ausser Versicherten-ID) sind aus dem Workflow entfernt.
* Das Löschen ist im TI-Flow-Fachdienst für den Versicherten protokolliert.

* Beschreibung: Schnittstellen
  * Ein E-Rezept wird durch die verordnende LEI gelöscht und der Status im TI-Flow-Fachdienst auf “cancelled” gesetzt.: * [Operation API: E-Rezept löschen](./op-abort.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Ein E-Rezept wird durch die verordnende LEI gelöscht und der Status im TI-Flow-Fachdienst auf “cancelled” gesetzt.:  (ZAHN-)ARZT 

**Tabelle:**Fachlicher Anwendungsfall UC 2.5 - E-Rezept durch Verordnenden löschen
**Sequenzdiagramm:**

**Abbildung: **UC 2.5 - E-Rezept durch Verordnenden löschen
#### Versicherter

##### UC 3.1 - E-Rezepte durch Versicherten abrufen

* Beschreibung: Vorbedingungen
  * Ein Versicherter ruft im E-Rezept-FdV alle seine im TI-Flow-Fachdienst eingestellten E-Rezepte ab.: * Keine.

* Beschreibung: Durchzuführende Aktionen
  * Ein Versicherter ruft im E-Rezept-FdV alle seine im TI-Flow-Fachdienst eingestellten E-Rezepte ab.: * Das FdV fordert E-Rezepte beim TI-Flow-Fachdienst an.
* Der TI-Flow-Fachdienst identifiziert E-Rezepte über die Versicherten-ID.
* Der TI-Flow-Fachdienst liefert E-Rezepte, Status und Statuszeitpunkte.

* Beschreibung: Nachbedingungen
  * Ein Versicherter ruft im E-Rezept-FdV alle seine im TI-Flow-Fachdienst eingestellten E-Rezepte ab.: * E-Rezepte stehen im E-Rezept-FdV zur Anzeige bereit; Daten für E-Rezept-Token sind verfügbar.
* Der Abruf ist protokolliert.

* Beschreibung: Schnittstellen
  * Ein Versicherter ruft im E-Rezept-FdV alle seine im TI-Flow-Fachdienst eingestellten E-Rezepte ab.: * [Query API: Task](./query-api-task.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Ein Versicherter ruft im E-Rezept-FdV alle seine im TI-Flow-Fachdienst eingestellten E-Rezepte ab.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall UC 3.1 - E-Rezepte durch Versicherten abrufen
**Sequenzdiagramm:**

**Abbildung: **UC 3.1 - E-Rezepte durch Versicherten abrufen

##### UC 3.2 - E-Rezept durch Versicherten löschen

* Beschreibung: Vorbedingungen
  * Der Versicherte setzt den Status eines E-Rezepts auf “cancelled” und löscht es im TI-Flow-Fachdienst.: * UC 3.1 wurde ausgeführt.
* Status des E-Rezepts ist ungleich “in-progress”.

* Beschreibung: Durchzuführende Aktionen
  * Der Versicherte setzt den Status eines E-Rezepts auf “cancelled” und löscht es im TI-Flow-Fachdienst.: * Versicherter wählt ein E-Rezept im E-Rezept-FdV und bestätigt das Löschen.
* Das E-Rezept-FdV überträgt die Löschanforderung an den TI-Flow-Fachdienst.
* Der Status wird geändert; Daten im E-Rezept werden gelöscht.
* Der E-Rezept-Token wird im E-Rezept-FdV gelöscht.

* Beschreibung: Nachbedingungen
  * Der Versicherte setzt den Status eines E-Rezepts auf “cancelled” und löscht es im TI-Flow-Fachdienst.: * Der Workflow hat den Status “cancelled”.
* Die personenbezogene und medizinische Daten (ausser Versicherten-ID) sind aus dem Workflow entfernt.
* Das Löschen ist im TI-Flow-Fachdienst für den Versicherten protokolliert.

* Beschreibung: Schnittstellen
  * Der Versicherte setzt den Status eines E-Rezepts auf “cancelled” und löscht es im TI-Flow-Fachdienst.: * [Operation API: E-Rezept löschen](./op-abort.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Versicherte setzt den Status eines E-Rezepts auf “cancelled” und löscht es im TI-Flow-Fachdienst.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall UC 3.2 - E-Rezept durch Versicherten löschen
**Sequenzdiagramm:**

**Abbildung: **UC 3.2 - E-Rezept durch Versicherten löschen

##### UC 3.3 - Nachricht durch Versicherten übermitteln

* Beschreibung: Vorbedingungen
  * Ein Versicherter übermittelt einen E-Rezept-Token und/oder eine Nachricht an eine abgebende Institution , wahlweise über die TI oder als 2D-Code.: * UC 3.1 wurde ausgeführt und ein E-Rezept-Token erstellt.

* Beschreibung: Durchzuführende Aktionen
  * Ein Versicherter übermittelt einen E-Rezept-Token und/oder eine Nachricht an eine abgebende Institution , wahlweise über die TI oder als 2D-Code.: * Auswahl eines E-Rezept-Tokens und Versandart (TI oder 2D-Code).
* Bei Versand über TI: Empfängerinstitution (bspw. Apotheke) im Verzeichnisdienst suchen und auswählen.
* Das FdV stellt die Nachricht mit Token und/oder Text im E-Rezept-Fachdienst ein.
* Bei 2D-Code: Token wird als 2D-Code angezeigt oder ausgedruckt.

* Beschreibung: Nachbedingungen
  * Ein Versicherter übermittelt einen E-Rezept-Token und/oder eine Nachricht an eine abgebende Institution , wahlweise über die TI oder als 2D-Code.: * Nachricht liegt im TI-Flow-Fachdienst und kann vom Empfänger abgerufen werden.
* Bei 2D-Code ist der Token für den Empfänger verfügbar.

* Beschreibung: Schnittstellen
  * Ein Versicherter übermittelt einen E-Rezept-Token und/oder eine Nachricht an eine abgebende Institution , wahlweise über die TI oder als 2D-Code.: * [Query API: Nachricht einstellen](./query-api-communication.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Ein Versicherter übermittelt einen E-Rezept-Token und/oder eine Nachricht an eine abgebende Institution , wahlweise über die TI oder als 2D-Code.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall UC 3.3 - Nachricht durch Versicherten übermitteln
**Sequenzdiagramm:**

**Abbildung: **UC 3.3 - Nachricht durch Versicherten übermitteln

##### UC 3.4 - Nachrichten durch Versicherten empfangen

* Beschreibung: Vorbedingungen
  * Ein Versicherter empfängt Nachrichten von abgebenden Institution über den E-Rezept-Fachdienst.: * UC 4.7 wurde ausgeführt.
* UC 3.3 wurde ausgeführt.

* Beschreibung: Durchzuführende Aktionen
  * Ein Versicherter empfängt Nachrichten von abgebenden Institution über den E-Rezept-Fachdienst.: * Das FdV fragt beim TI-Flow-Fachdienst nach neuen Nachrichten.
* Nachrichten werden heruntergeladen.

* Beschreibung: Nachbedingungen
  * Ein Versicherter empfängt Nachrichten von abgebenden Institution über den E-Rezept-Fachdienst.: * Nachrichten liegen im FdV zur Anzeige bereit.

* Beschreibung: Schnittstellen
  * Ein Versicherter empfängt Nachrichten von abgebenden Institution über den E-Rezept-Fachdienst.: * [Query API: Nachrichten abrufen](./query-api-communication.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Ein Versicherter empfängt Nachrichten von abgebenden Institution über den E-Rezept-Fachdienst.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall UC 3.4 - Nachrichten durch Versicherten empfangen
**Sequenzdiagramm:**

**Abbildung: **UC 3.4 - Nachrichten durch Versicherten empfangen

##### UC 3.8 - Nachricht durch Versicherten löschen

* Beschreibung: Vorbedingungen
  * Der Versicherte löscht von ihm übermittelte Nachrichten an Apotheken oder Versicherte.: * UC 3.3 wurde ausgeführt.

* Beschreibung: Durchzuführende Aktionen
  * Der Versicherte löscht von ihm übermittelte Nachrichten an Apotheken oder Versicherte.: * Der Versicherte wählt Nachrichten zum Löschen aus und bestätigt den Vorgang.
* Das FdV überträgt die Löschanforderung je Nachricht an den TI-Flow-Fachdienst.
* Der TI-Flow-Fachdienst löscht die Nachrichten und liefert ggf. eine Warnung, wenn bereits abgerufen.
* Die Nachrichten werden im FdV gelöscht.

* Beschreibung: Nachbedingungen
  * Der Versicherte löscht von ihm übermittelte Nachrichten an Apotheken oder Versicherte.: * Nachrichten sind im TI-Flow-Fachdienst und im FdV gelöscht.

* Beschreibung: Schnittstellen
  * Der Versicherte löscht von ihm übermittelte Nachrichten an Apotheken oder Versicherte.: * [Query API: Nachricht löschen](./query-api-communication.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Versicherte löscht von ihm übermittelte Nachrichten an Apotheken oder Versicherte.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall UC 3.8 - Nachricht durch Versicherten löschen
**Sequenzdiagramm:**

**Abbildung: **UC 3.8 - Nachricht durch Versicherten löschen
#### Apotheke

##### UC 4.6 - Nachrichten durch Abgebenden empfangen

* Beschreibung: Vorbedingungen
  * Eine abgebende LEI empfängt E-Rezept-Token über die TI oder optisch als 2D-Code.: * UC 3.3 wurde ausgeführt oder der 2D-Code wurde präsentiert.

* Beschreibung: Durchzuführende Aktionen
  * Eine abgebende LEI empfängt E-Rezept-Token über die TI oder optisch als 2D-Code.: * Das Primärsystem wählt den Empfangsweg (TI oder 2D-Code).
* Bei TI: Primärsystem fragt beim TI-Flow-Fachdienst neue Nachrichten für die Telematik-ID ab und lädt sie herunter.
* Bei 2D-Code: Primärsystem wandelt den Code in die Token-Textform um.

* Beschreibung: Nachbedingungen
  * Eine abgebende LEI empfängt E-Rezept-Token über die TI oder optisch als 2D-Code.: * E-Rezept-Token liegt im Primärsystem vor.

* Beschreibung: Schnittstellen
  * Eine abgebende LEI empfängt E-Rezept-Token über die TI oder optisch als 2D-Code.: * [Query API: Nachrichten abrufen](./query-api-communication.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Eine abgebende LEI empfängt E-Rezept-Token über die TI oder optisch als 2D-Code.: 

**Tabelle:**Fachlicher Anwendungsfall UC 4.6 - Nachrichten durch Abgebenden empfangen
**Sequenzdiagramm:**

**Abbildung: **UC 4.6 - Nachrichten durch Abgebenden empfangen

##### UC 4.15 - E-Rezepte durch Abgebenden abrufen (PoPP)

* Beschreibung: Vorbedingungen
  * Eine Apotheke kann nach dem Einlesen der eGK auf die einlösbaren E-Rezepte des Versicherten zugreifen.: * Der Versicherte oder ein Vertreter befindet sich vor Ort im Kontakt mit einem Mitarbeiter der Apotheke.
* Der Versicherte hat seine eGK bzw. der Vertreter die eGK des zu Vertretenden dabei.

* Beschreibung: Durchzuführende Aktionen
  * Eine Apotheke kann nach dem Einlesen der eGK auf die einlösbaren E-Rezepte des Versicherten zugreifen.: * Das PS liest unter Nutzung eines im Rahmen von PoPP zulässigen Kartenlesegerät die eGK ein.
* Das PS ruft für diese eGK den Anwendungsfall zum Erstellen eines PoPP-Token auf. Im Ergebnis erhält das PS, sofern die eGK nicht gesperrt und das Authentifizierungszertifikat gültig ist, einen PoPP-Token.
* Das PS übermittelt dem PoPP-Token, um die einlösbaren E-Rezepte des Versicherten vom TI-Flow-Fachdienst abzurufen.
* Der TI-Flow-Fachdienst prüft die Gültigkeit des PoPP-Tokens.
* Der TI-Flow-Fachdienst übermittelt die Zugriffsinformationen (Task-ID und AccessCode) zu jedem einlösbaren E-Rezept.

* Beschreibung: Nachbedingungen
  * Eine Apotheke kann nach dem Einlesen der eGK auf die einlösbaren E-Rezepte des Versicherten zugreifen.: * Im PS stehen die Zugriffsinformationen (Task-ID und AccessCode) für alle einlösbaren E-Rezepte zur Verfügung.
* Im PS kann zu den einzelnen E-Rezepten der Anwendungsfall “UC 4.1 - E-Rezept durch Abgebenden abrufen” ausführen, um die E-Rezepte im PS anzuzeigen.
* Der Zugriff der Apotheke auf die E-Rezepte ist für den Versicherten auf dem TI-Flow-Fachdienst protokolliert.

* Beschreibung: Schnittstellen
  * Eine Apotheke kann nach dem Einlesen der eGK auf die einlösbaren E-Rezepte des Versicherten zugreifen.: * [Query API: Task](./query-api-task.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Eine Apotheke kann nach dem Einlesen der eGK auf die einlösbaren E-Rezepte des Versicherten zugreifen.: 

**Tabelle:**Fachlicher Anwendungsfall UC 4.15 - E-Rezepte durch Abgebenden abrufen (PoPP)
**Sequenzdiagramm:**

**Abbildung: **UC 4.15 - E-Rezepte durch Abgebenden abrufen (PoPP)

##### UC 4.1 - E-Rezept durch Abgebenden abrufen

* Beschreibung: Vorbedingungen
  * Eine abgebende LEI ruft ein E-Rezept auf Basis eines E-Rezept-Tokens aus dem TI-Flow-Fachdienst ab.: * Ein E-Rezept-Token wurde übermittelt.
* UC 4.6 wurde ausgeführt.
* Token liegt im Primärsystem vor; Status des E-Rezepts ist “ready”.

* Beschreibung: Durchzuführende Aktionen
  * Eine abgebende LEI ruft ein E-Rezept auf Basis eines E-Rezept-Tokens aus dem TI-Flow-Fachdienst ab.: * Primärsystem ermittelt Rezept-ID und AccessCode aus dem Token.
* Primärsystem ruft das E-Rezept beim TI-Flow-Fachdienst ab.
* Status wechselt auf “in-progress”.
* TI-Flow-Fachdienst erzeugt ein Geheimnis zur Statusänderung und übermittelt es.
* optional: Primärsystem prüft die QES über den Konnektor.

* Beschreibung: Nachbedingungen
  * Eine abgebende LEI ruft ein E-Rezept auf Basis eines E-Rezept-Tokens aus dem TI-Flow-Fachdienst ab.: * Status ist “in-progress” und protokolliert.
* E-Rezept liegt im AVS vor; Geheimnis ist gespeichert.

* Beschreibung: Schnittstellen
  * Eine abgebende LEI ruft ein E-Rezept auf Basis eines E-Rezept-Tokens aus dem TI-Flow-Fachdienst ab.: * [Operation API: Task akzeptieren](./op-accept.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Eine abgebende LEI ruft ein E-Rezept auf Basis eines E-Rezept-Tokens aus dem TI-Flow-Fachdienst ab.: 

**Tabelle:**Fachlicher Anwendungsfall UC 4.1 - E-Rezept durch Abgebenden abrufen
**Sequenzdiagramm:**

**Abbildung: **UC 4.1 - E-Rezept durch Abgebenden abrufen
**Technische Aspekte für die Mehrfachverordnung (MVO)**

Wenn ein AVS eine Teilverordnung abruft, deren Einlösezeitraum noch nicht erreicht ist, dann liefert der TI-Flow-Fachdienst einen Fehler 403. Im OperationOutcome der Fehlermeldung liefert der TI-Flow-Fachdienst das Datum des Beginns der Einlösefrist.

Für die QES-Prüfung wird die PKCS#7-Datei verwendet. Die Verordnungsdaten des E-Rezepts sind innerhalb der PKCS#7-Datei enthalten und müssen für die Weiterverarbeitung extrahiert werden.

##### UC 4.2 - E-Rezept durch Abgebenden zurückgeben

* Beschreibung: Vorbedingungen
  * Ein abgerufenes E-Rezept wird an den TI-Flow-Fachdienst zurückgegeben.: * UC 4.1 wurde ausgeführt.
* Rezept-ID, AccessCode und Geheimnis sind bekannt.
* Status ist “in-progress”.

* Beschreibung: Durchzuführende Aktionen
  * Ein abgerufenes E-Rezept wird an den TI-Flow-Fachdienst zurückgegeben.: * Abgebender markiert das E-Rezept zum Zurückgeben und bestätigt.
* Primärsystem ruft den TI-Flow-Fachdienst mit Rezept-ID und Geheimnis auf.
* Status wird auf “ready” geändert.

* Beschreibung: Nachbedingungen
  * Ein abgerufenes E-Rezept wird an den TI-Flow-Fachdienst zurückgegeben.: * Status ist “ready” und protokolliert.
* E-Rezept, Token und Geheimnis sind im Primärsystem gelöscht.

* Beschreibung: Schnittstellen
  * Ein abgerufenes E-Rezept wird an den TI-Flow-Fachdienst zurückgegeben.: * [Operation API: Task zurückweisen](./op-reject.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Ein abgerufenes E-Rezept wird an den TI-Flow-Fachdienst zurückgegeben.: 

**Tabelle:**Fachlicher Anwendungsfall UC 4.2 - E-Rezept durch Abgebenden zurückgeben
**Sequenzdiagramm:**

**Abbildung: **UC 4.2 - E-Rezept durch Abgebenden zurückgeben

##### UC 4.3 - E-Rezept durch Abgebenden löschen

* Beschreibung: Vorbedingungen
  * Der abgebende Leistungserbringer löscht ein zuvor abgerufenes E-Rezept.: * Ein E-Rezept-Token wurde übermittelt und der Wunsch zum Löschen liegt vor.
* UC 4.6 und UC 4.1 wurden ausgeführt.
* Rezept-ID, AccessCode und Geheimnis sind bekannt; Status ist “in-progress”.

* Beschreibung: Durchzuführende Aktionen
  * Der abgebende Leistungserbringer löscht ein zuvor abgerufenes E-Rezept.: * Abgebender markiert das E-Rezept zum Löschen und bestätigt.
* Primärsystem ruft den TI-Flow-Fachdienst mit Rezept-ID und Geheimnis auf.
* Status wechselt auf “cancelled”; Daten werden entfernt.

* Beschreibung: Nachbedingungen
  * Der abgebende Leistungserbringer löscht ein zuvor abgerufenes E-Rezept.: * Status ist “cancelled” und protokolliert; Daten sind entfernt.
* E-Rezept, Token und Geheimnis sind im Primärsystem gelöscht.

* Beschreibung: Schnittstellen
  * Der abgebende Leistungserbringer löscht ein zuvor abgerufenes E-Rezept.: * [Operation API: E-Rezept löschen](./op-abort.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Der abgebende Leistungserbringer löscht ein zuvor abgerufenes E-Rezept.: 

**Tabelle:**Fachlicher Anwendungsfall UC 4.3 - E-Rezept durch Abgebenden löschen
**Sequenzdiagramm:**

**Abbildung: **UC 4.3 - E-Rezept durch Abgebenden löschen

##### UC 4.16 - Dispensierinformationen bereitstellen

* Beschreibung: Vorbedingungen
  * Ein Mitarbeiter der abgebenden LEI hat ein E-Rezept dispensiert. Er markiert das E-Rezept über das Primärsystem als abgegeben und bestätigt es. Das Primärsystem übermittelt beim Aufruf des TI-Flow-Fachdienstes die Rezept-ID und das Geheimnis zur Bereitstellung der Dispensierinformationen. Im Aufruf ist die Dispensierinformation enthalten.: * Ein Mitarbeiter der abgebenden LEI hat den Anwendungsfall “UC 4.1 - E-Rezept durch Abgebenden abrufen” durchgeführt.- Das Primärsystem hat die QES des E-Rezepts erfolgreich geprüft. Die QES des E-Rezepts ist gültig.
* Die Rezept-ID, der AccessCode und das Geheimnis zur Statusänderung “in-progress” des E-Rezepts sind im Primärsystem bekannt.
* Das E-Rezept im TI-Flow-Fachdienst hat den Status “in-progress”.

* Beschreibung: Durchzuführende Aktionen
  * Ein Mitarbeiter der abgebenden LEI hat ein E-Rezept dispensiert. Er markiert das E-Rezept über das Primärsystem als abgegeben und bestätigt es. Das Primärsystem übermittelt beim Aufruf des TI-Flow-Fachdienstes die Rezept-ID und das Geheimnis zur Bereitstellung der Dispensierinformationen. Im Aufruf ist die Dispensierinformation enthalten.: * Abgebender wählt ein beliefertes E-Rezept zur Bereitstellung von Dispensierinformationen aus.
* Das Primärsystem übermittelt die Dispensierinformationen an den TI-Flow-Fachdienst.

* Beschreibung: Nachbedingungen
  * Ein Mitarbeiter der abgebenden LEI hat ein E-Rezept dispensiert. Er markiert das E-Rezept über das Primärsystem als abgegeben und bestätigt es. Das Primärsystem übermittelt beim Aufruf des TI-Flow-Fachdienstes die Rezept-ID und das Geheimnis zur Bereitstellung der Dispensierinformationen. Im Aufruf ist die Dispensierinformation enthalten.: * Das E-Rezept im TI-Flow-Fachdienst hat den Status “in-progress”.
* Die Information zur Abgabe liegen im TI-Flow-Fachdienst.
* Das Bereitstellen der Dispensierinformationen ist im TI-Flow-Fachdienst protokolliert.
* Das Primärsystem erhält eine Bestätigung, dass die Dispensierinformationen bereitgestellt wurden.

* Beschreibung: Schnittstellen
  * Ein Mitarbeiter der abgebenden LEI hat ein E-Rezept dispensiert. Er markiert das E-Rezept über das Primärsystem als abgegeben und bestätigt es. Das Primärsystem übermittelt beim Aufruf des TI-Flow-Fachdienstes die Rezept-ID und das Geheimnis zur Bereitstellung der Dispensierinformationen. Im Aufruf ist die Dispensierinformation enthalten.: * [Operation API: Dispensierinformationen bereitstellen](./op-dispense.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Ein Mitarbeiter der abgebenden LEI hat ein E-Rezept dispensiert. Er markiert das E-Rezept über das Primärsystem als abgegeben und bestätigt es. Das Primärsystem übermittelt beim Aufruf des TI-Flow-Fachdienstes die Rezept-ID und das Geheimnis zur Bereitstellung der Dispensierinformationen. Im Aufruf ist die Dispensierinformation enthalten.: 

**Tabelle:**Fachlicher Anwendungsfall UC 4.16 - Dispensierinformationen bereitstellen
**Sequenzdiagramm:**

**Abbildung: **UC 4.16 - Dispensierinformationen bereitstellen

##### UC 4.4 - Quittung abrufen

* Beschreibung: Vorbedingungen
  * Nach der Abgabe wird das E-Rezept quittiert und eine Quittung vom TI-Flow-Fachdienst abgerufen.: * UC 4.1 wurde ausgeführt.
* QES des E-Rezepts ist gültig geprüft.
* Rezept-ID, AccessCode und Geheimnis sind bekannt; Status ist “in-progress”.

* Beschreibung: Durchzuführende Aktionen
  * Nach der Abgabe wird das E-Rezept quittiert und eine Quittung vom TI-Flow-Fachdienst abgerufen.: * Abgebender markiert das E-Rezept als abgegeben.
* Primärsystem übermittelt Rezept-ID, Geheimnis und Abgabeinformationen an den TI-Flow-Fachdienst.
* Status wechselt zu “quittiert”; Quittung wird erstellt und zurückgegeben.

* Beschreibung: Nachbedingungen
  * Nach der Abgabe wird das E-Rezept quittiert und eine Quittung vom TI-Flow-Fachdienst abgerufen.: * Status ist “quittiert”; Abgabeinformationen sind gespeichert.
* Statuswechsel ist protokolliert; Quittung liegt im Primärsystem vor.

* Beschreibung: Schnittstellen
  * Nach der Abgabe wird das E-Rezept quittiert und eine Quittung vom TI-Flow-Fachdienst abgerufen.: * [Operation API: Task schliessen](./op-close.md)

* Beschreibung: Folgeaktionen des E-Rezept-Fachdienst
  * Nach der Abgabe wird das E-Rezept quittiert und eine Quittung vom TI-Flow-Fachdienst abgerufen.: * [Abgabedatensatz signieren](./menu-technische-umsetzung-abgabedatensatz.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Nach der Abgabe wird das E-Rezept quittiert und eine Quittung vom TI-Flow-Fachdienst abgerufen.: 

**Tabelle:**Fachlicher Anwendungsfall UC 4.4 - Quittung abrufen
**Sequenzdiagramm:**

**Abbildung: **UC 4.4 - Quittung abrufen

##### UC 4.5 - Abgabedatensatz durch Abgebenden signieren

* Beschreibung: Vorbedingungen
  * Der Abgebende signiert den Abgabedatensatz fortgeschritten oder qualifiziert (QES).: * E-Rezept wurde dispensiert.
* Abgabedatensatz liegt im Primärsystem bereit.
* HBA oder SMC-B ist gesteckt und freigeschaltet.

* Beschreibung: Durchzuführende Aktionen
  * Der Abgebende signiert den Abgabedatensatz fortgeschritten oder qualifiziert (QES).: * Bei Abgabe ohne Änderung: fortgeschrittene Signatur.
* Bei Abgabe mit Änderung: QES für den Dispensierdatensatz.

* Beschreibung: Nachbedingungen
  * Der Abgebende signiert den Abgabedatensatz fortgeschritten oder qualifiziert (QES).: * Abgabedatensatz ist durch den Abgebenden signiert.

* Beschreibung: Schnittstellen
  * Der Abgebende signiert den Abgabedatensatz fortgeschritten oder qualifiziert (QES).: * Keine (Signatur im Primärsystem)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Abgebende signiert den Abgabedatensatz fortgeschritten oder qualifiziert (QES).: 

**Tabelle:**Fachlicher Anwendungsfall UC 4.5 - Abgabedatensatz durch Abgebenden signieren
**Sequenzdiagramm:**

**Abbildung: **UC 4.5 - Abgabedatensatz durch Abgebenden signieren

##### UC 4.17 - Verordnung erneut abrufen

* Beschreibung: Vorbedingungen
  * Die Verordnung wird erneut abgerufen, falls die Übertragung beim ersten Abruf mit $accept fehlgeschlagen ist.: * UC 4.1 wurde ausgeführt; im Clientsystem liegt keine Verordnung oder das zugehörige Secret vor.
* Status des E-Rezepts ist “in-progress”.

* Beschreibung: Durchzuführende Aktionen
  * Die Verordnung wird erneut abgerufen, falls die Übertragung beim ersten Abruf mit $accept fehlgeschlagen ist.: * Abgebender wählt die Zugriffsinformation für die Verordnung (E-Rezept-Token) aus und ruft die Verordnung erneut ab.
* Primärsystem übermittelt Rezept-ID und Access_Code; der TI-Flow-Fachdienst liefert die Verordnung und das Secret erneut aus.

* Beschreibung: Nachbedingungen
  * Die Verordnung wird erneut abgerufen, falls die Übertragung beim ersten Abruf mit $accept fehlgeschlagen ist.: * Verordnung liegt im Primärsystem vor.

* Beschreibung: Schnittstellen
  * Die Verordnung wird erneut abgerufen, falls die Übertragung beim ersten Abruf mit $accept fehlgeschlagen ist.: * [Query API: Task](./query-api-task.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Die Verordnung wird erneut abgerufen, falls die Übertragung beim ersten Abruf mit $accept fehlgeschlagen ist.: 

**Tabelle:**Fachlicher Anwendungsfall UC 4.17 - Verordnung erneut abrufen
**Sequenzdiagramm:**

**Abbildung: **UC 4.17 - Verordnung erneut abrufen

##### UC 4.8 - Quittung erneut abrufen

* Beschreibung: Vorbedingungen
  * Die Quittung wird erneut abgerufen, falls die Übertragung beim ersten Abruf fehlgeschlagen ist.: * UC 4.4 wurde ausgeführt; im Primärsystem liegt keine Quittung vor.
* Status des E-Rezepts ist “quittiert”.

* Beschreibung: Durchzuführende Aktionen
  * Die Quittung wird erneut abgerufen, falls die Übertragung beim ersten Abruf fehlgeschlagen ist.: * Abgebender wählt das E-Rezept und ruft die Quittung erneut ab.
* Primärsystem übermittelt Rezept-ID und Geheimnis; der TI-Flow-Fachdienst liefert die Quittung erneut aus.

* Beschreibung: Nachbedingungen
  * Die Quittung wird erneut abgerufen, falls die Übertragung beim ersten Abruf fehlgeschlagen ist.: * Quittung liegt im Primärsystem vor.

* Beschreibung: Schnittstellen
  * Die Quittung wird erneut abgerufen, falls die Übertragung beim ersten Abruf fehlgeschlagen ist.: * [Query API: Task](./query-api-task.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Die Quittung wird erneut abgerufen, falls die Übertragung beim ersten Abruf fehlgeschlagen ist.: 

**Tabelle:**Fachlicher Anwendungsfall UC 4.8 - Quittung erneut abrufen
**Sequenzdiagramm:**

**Abbildung: **UC 4.8 - Quittung erneut abrufen

##### UC 4.7 - Nachricht durch Abgebenden übermitteln

* Beschreibung: Vorbedingungen
  * Die abgebende LEI antwortet auf eine Nachricht eines Versicherten.: * UC 3.3 wurde ausgeführt.
* UC 4.6 wurde ausgeführt.

* Beschreibung: Durchzuführende Aktionen
  * Die abgebende LEI antwortet auf eine Nachricht eines Versicherten.: * Ein Mitarbeiter wählt die Nachricht zu einer Verordnung und erstellt eine Antwort.
* Das Primärsystem stellt die Antwortnachricht im E-Rezept-Fachdienst ein.

* Beschreibung: Nachbedingungen
  * Die abgebende LEI antwortet auf eine Nachricht eines Versicherten.: * Nachricht liegt im TI-Flow-Fachdienst und kann asynchron empfangen werden.

* Beschreibung: Schnittstellen
  * Die abgebende LEI antwortet auf eine Nachricht eines Versicherten.: * [Query API: Nachricht einstellen](./query-api-communication.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Die abgebende LEI antwortet auf eine Nachricht eines Versicherten.: 

**Tabelle:**Fachlicher Anwendungsfall UC 4.7 - Nachricht durch Abgebenden übermitteln
**Sequenzdiagramm:**

**Abbildung: **UC 4.7 - Nachricht durch Abgebenden übermitteln

##### UC 4.9 - Nachricht durch Abgebenden löschen

* Beschreibung: Vorbedingungen
  * Der Abgebende löscht von ihm übermittelte Nachrichten an Versicherte.: * UC 4.7 wurde ausgeführt.

* Beschreibung: Durchzuführende Aktionen
  * Der Abgebende löscht von ihm übermittelte Nachrichten an Versicherte.: * Der Abgebende wählt Nachrichten zum Löschen aus und bestätigt.
* Das Primärsystem überträgt Löschanforderungen an den TI-Flow-Fachdienst.
* Der TI-Flow-Fachdienst löscht Nachrichten und liefert ggf. Warnung bei bereits erfolgtem Abruf.
* Nachrichten werden im Primärsystem gelöscht.

* Beschreibung: Nachbedingungen
  * Der Abgebende löscht von ihm übermittelte Nachrichten an Versicherte.: * Nachrichten sind im TI-Flow-Fachdienst und im Primärsystem gelöscht.

* Beschreibung: Schnittstellen
  * Der Abgebende löscht von ihm übermittelte Nachrichten an Versicherte.: * [Query API: Nachricht löschen](./query-api-communication.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Abgebende löscht von ihm übermittelte Nachrichten an Versicherte.: 

**Tabelle:**Fachlicher Anwendungsfall UC 4.9 - Nachricht durch Abgebenden löschen
**Sequenzdiagramm:**

**Abbildung: **UC 4.9 - Nachricht durch Abgebenden löschen

