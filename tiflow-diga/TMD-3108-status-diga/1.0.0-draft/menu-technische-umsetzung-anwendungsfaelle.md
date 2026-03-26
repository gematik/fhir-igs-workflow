# Technische Anwendungsfälle - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v1.0.0-draft

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Systemüberblick**](menu-technische-umsetzung-systemueberblick.md)
* **Technische Anwendungsfälle**

## Technische Anwendungsfälle

### Ablaufdiagramm Verordnung von DiGAs

**Abbildung: **Ablaufdiagramm DiGA-Verordnung
### Umzusetzende Anwendungsfälle von Clients

Die folgenden Abschnitte beschreiben die technischen Anwendungsfälle, die für das Modul der Verordnung von digitalen Gesundheitsanwendungen genutzt werden.

#### PS verordnende LEI

Das PS der verordnenden LEI MUSS für die Umsetzung der Verordnung von DiGAs die Anwendungsfälle
* UC 2.1 - E-Rezepte erzeugen
* E-Rezept qualifiziert signieren
* UC 2.3 - E-Rezept einstellen
* UC 2.5 - E-Rezept durch Verordnenden löschen
umsetzen.
#### E-Rezept-FdV

Das E-Rezept-FdV MUSS für die Umsetzung der Nutzung von Verordnungen von DiGAs die Anwendungsfälle
* UC 3.1 – E-Rezepte durch Versicherten abrufen
* UC 3.2 – E-Rezept durch Versicherten löschen
* Kostenträger suchen
* UC 3.3 – Nachricht durch Versicherten übermitteln
* UC 3.4 – Nachricht durch Versicherten empfangen
* UC 3.8 – Nachricht durch Versicherten löschen
* UC 3.5 - Protokolldaten abrufen
umsetzen.
#### Clientsystem Kostenträger

Das Clientsystem des Kostenträgers MUSS für die Umsetzung der Verordnung von DiGAs die Anwendungsfälle
* UC 4.1 - E-Rezept durch Abgebenden abrufen
* UC 4.2 - E-Rezept durch Abgebenden zurückgeben
* UC 4.4 - Quittung abrufen
* UC 4.17 - Verordnung erneut abrufen
* UC 4.8 - Quittung erneut abrufen
* UC 4.6 - Nachrichten durch Abgebenden empfangen
* UC 4.7 - Nachricht durch Abgebenden übermitteln
* UC 4.9 - Nachricht durch Abgebenden löschen
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
  * Der verordnende Leistungserbringer erzeugt eine Verordnung im Primaersystem. Für die Verordnung wird eine Rezept-ID aus dem TI-Flow-Fachdienst bezogen und der Verordnungsdatensatz anschließend qualifiziert elektronisch signiert (QES).: * [Operation API: Verordnung erstellen](./op-create.md)
* QES im Primärsystem (Konnektor)

* Beschreibung: Relevante(r) Sektor(en)
  * Der verordnende Leistungserbringer erzeugt eine Verordnung im Primaersystem. Für die Verordnung wird eine Rezept-ID aus dem TI-Flow-Fachdienst bezogen und der Verordnungsdatensatz anschließend qualifiziert elektronisch signiert (QES).:  (ZAHN-)ARZT  PSYCHOTHERAPEUT 

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
  * Der Verordnungsdatensatz wird durch den (Zahn-)Arzt mittels HBA qualifiziert elektronisch signiert (QES). Vorbereitende Tätigkeiten im Primärsystem können organisatorisch delegiert werden, die QES selbst jedoch nicht.:  (ZAHN-)ARZT  PSYCHOTHERAPEUT 

**Tabelle:**Fachlicher Anwendungsfall E-Rezept qualifiziert signieren
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
  * Ein E-Rezept wird vom Primärsystem beim TI-Flow-Fachdienst eingestellt und ein E-Rezept-Token erzeugt.:  (ZAHN-)ARZT  PSYCHOTHERAPEUT 

**Tabelle:**Fachlicher Anwendungsfall UC 2.3 - E-Rezept einstellen
**Sequenzdiagramm:**

**Abbildung: **UC 2.3 - E-Rezept einstellen

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
  * Ein E-Rezept wird durch die verordnende LEI gelöscht und der Status im TI-Flow-Fachdienst auf “cancelled” gesetzt.:  (ZAHN-)ARZT  PSYCHOTHERAPEUT 

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
Für das Übermitteln der Verordnung wird als Adressat der Kostenträger ausgewählt. Bei der Umsetzung im E-Rezept-FdV kann die Auswahl automatisiert erfolgen.

##### Ermitteln der Telematik-ID des Kostenträgers

Damit das E-Rezept-FdV der gematik “UC 3.3 - Nachricht durch Versicherten übermitteln” ausführen kann, muss es zunächst die Telematik-ID des Kostenträgers als Empfängeradresse der Nachricht ermitteln.

Das E-Rezept-FdV benötigt das Haupt-Institutionskennzeichen (IK) des Kostenträgers. Dieses IK wird über die Authentifizierungsmethoden des E-Rezept-FdV bereitgestellt. Das E-Rezept-FdV erhält sowohl bei der Authentifizierung mittels eGK, wie auch mittels sektoralem IDP (GesundheitsID) einen ACCESS_TOKEN vom E-Rezept Authorization Server (Teil des IDP-Dienstes) ausgestellt. Dieser ACCESS_TOKEN enthält das IK des Kostenträgers.

Sobald dem E-Rezept-FdV das IK vorliegt, sucht es im FHIR-VZD nach der Telematik-ID des Kostenträgers mithilfe des IK.

Dieser Fall ist für die E-Rezept-FdVs der Krankenkassen nicht relevant, da diese die korrekte Telematik-ID in ihren Apps vorab festlegen können.

##### Fallback bei Fehlern und fehlenden Informationen

Falls es dem E-Rezept-FdV nicht möglich ist, das IK oder die Telematik-ID des Kostenträgers zu bestimmen, soll der Versicherte dennoch die Möglichkeit haben, seine DiGA Verordnung zuzuweisen.

Hierzu zeigt das E-Rezept-FdV dem Versicherten alle Kostenträgereinträge des FHIR-VZD mit oid_kostentraeger, die eine IKNR und Telematik-ID haben. Der Versicherte wählt die Krankenkasse aus, bei der er versichert ist und kann so die Einlösung vornehmen.

##### Zuweisen der Verordnung durch den Versicherten

Sobald die Telematik-ID im E-Rezept-FdV vorliegt, kann der Versicherte die Verordnung seinem Kostenträger zuweisen. Hierzu wird eine Communication (GEM_ERP_PR_Communication_DispReq) erstellt und der E-Rezept-Token eingebettet. Beim Zuweisen im Rahmen einer DiGA-Verordnung wird kein Payload mit Zusatzinformationen wie bspw. Kontaktdaten und Belieferungsoptionen übertragen.

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
#### Kostenträger

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
  * Eine abgebende LEI ruft ein E-Rezept auf Basis eines E-Rezept-Tokens aus dem TI-Flow-Fachdienst ab.:  KOSTENTRÄGER 

**Tabelle:**Fachlicher Anwendungsfall UC 4.1 - E-Rezept durch Abgebenden abrufen
**Sequenzdiagramm:**

**Abbildung: **UC 4.1 - E-Rezept durch Abgebenden abrufen

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
  * Ein abgerufenes E-Rezept wird an den TI-Flow-Fachdienst zurückgegeben.:  KOSTENTRÄGER 

**Tabelle:**Fachlicher Anwendungsfall UC 4.2 - E-Rezept durch Abgebenden zurückgeben
**Sequenzdiagramm:**

**Abbildung: **UC 4.2 - E-Rezept durch Abgebenden zurückgeben

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

* Beschreibung: Relevante(r) Sektor(en)
  * Nach der Abgabe wird das E-Rezept quittiert und eine Quittung vom TI-Flow-Fachdienst abgerufen.:  KOSTENTRÄGER 

**Tabelle:**Fachlicher Anwendungsfall UC 4.4 - Quittung abrufen
**Sequenzdiagramm:**

**Abbildung: **UC 4.4 - Quittung abrufen

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
  * Die Verordnung wird erneut abgerufen, falls die Übertragung beim ersten Abruf mit $accept fehlgeschlagen ist.:  KOSTENTRÄGER 

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
  * Die Quittung wird erneut abgerufen, falls die Übertragung beim ersten Abruf fehlgeschlagen ist.:  KOSTENTRÄGER 

**Tabelle:**Fachlicher Anwendungsfall UC 4.8 - Quittung erneut abrufen
**Sequenzdiagramm:**

**Abbildung: **UC 4.8 - Quittung erneut abrufen

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
  * Eine abgebende LEI empfängt E-Rezept-Token über die TI oder optisch als 2D-Code.:  KOSTENTRÄGER 

**Tabelle:**Fachlicher Anwendungsfall UC 4.6 - Nachrichten durch Abgebenden empfangen
**Sequenzdiagramm:**

**Abbildung: **UC 4.6 - Nachrichten durch Abgebenden empfangen

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
  * Die abgebende LEI antwortet auf eine Nachricht eines Versicherten.:  KOSTENTRÄGER 

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
  * Der Abgebende löscht von ihm übermittelte Nachrichten an Versicherte.:  KOSTENTRÄGER 

**Tabelle:**Fachlicher Anwendungsfall UC 4.9 - Nachricht durch Abgebenden löschen
**Sequenzdiagramm:**

**Abbildung: **UC 4.9 - Nachricht durch Abgebenden löschen

