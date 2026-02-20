# Technische Anwendungsfälle - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Systemüberblick**](menu-technische-umsetzung-systemueberblick.md)
* **Technische Anwendungsfälle**

## Technische Anwendungsfälle

### Ablaufdiagramm

**Abbildung: **Ablaufdiagramm DiGA-Verordnung
### Technische Anwendungsfälle

#### Anwendungsfälle im Rahmen der Verordnung

Die Prozesse des verordnenden Leistungserbringers, welche für die Übermittlung von ärztlichen und zahnärztlichen Verordnungen für apothekenpflichtige Arzneimittel konzipiert wurden, werden ebenso für die Verordnung von DiGAs genutzt.

Folgende Anwendungsfälle werden genutzt:

* UC 2.1 - E-Rezepte erzeugen
* E-Rezept qualifiziert signieren
* UC 2.3 - E-Rezept einstellen
* UC 2.5 - E-Rezept durch Verordnenden löschen

##### UC 2.1 - E-Rezepte erzeugen

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
  * Der verordnende Leistungserbringer erzeugt ein oder mehrere E-Rezepte im Primaersystem. Für jedes E-Rezept wird eine Rezept-ID aus dem E-Rezept-Fachdienst bezogen und der Datensatz anschließend qualifiziert elektronisch signiert (QES).:  (ZAHN-)ARZT  PSYCHOTHERAPEUT 

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

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Der Verordnungsdatensatz wird durch den (Zahn-)Arzt mittels HBA qualifiziert elektronisch signiert (QES). Vorbereitende Tätigkeiten im Primärsystem können organisatorisch delegiert werden, die QES selbst jedoch nicht.: * Keine (QES im Primaersystem)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Verordnungsdatensatz wird durch den (Zahn-)Arzt mittels HBA qualifiziert elektronisch signiert (QES). Vorbereitende Tätigkeiten im Primärsystem können organisatorisch delegiert werden, die QES selbst jedoch nicht.:  (ZAHN-)ARZT  PSYCHOTHERAPEUT 

**Tabelle:**Fachlicher Anwendungsfall E-Rezept qualifiziert signieren
**Sequenzdiagramm:**

**Abbildung: **E-Rezept qualifiziert signieren

##### UC 2.3 - E-Rezept einstellen

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
  * Ein E-Rezept wird vom Primaersystem beim E-Rezept-Fachdienst eingestellt und ein E-Rezept-Token erzeugt.:  (ZAHN-)ARZT  PSYCHOTHERAPEUT 

**Tabelle:**Fachlicher Anwendungsfall UC 2.3 - E-Rezept einstellen
**Sequenzdiagramm:**

**Abbildung: **UC 2.3 - E-Rezept einstellen

##### UC 2.5 - E-Rezept durch Verordnenden löschen

* Beschreibung: Vorbedingungen
  * Ein E-Rezept wird durch die verordnende LEI gelöscht und der Status im E-Rezept-Fachdienst auf “gelöscht” gesetzt.: * UC 2.3 wurde ausgeführt.
* Rezept-ID und AccessCode sind bekannt.
* Status im E-Rezept-Fachdienst ist “offen”.

* Beschreibung: Durchzuführende Aktionen
  * Ein E-Rezept wird durch die verordnende LEI gelöscht und der Status im E-Rezept-Fachdienst auf “gelöscht” gesetzt.: * Ein Mitarbeiter der verordnenden LEI markiert das E-Rezept zum Löschen und bestätigt den Vorgang.
* Das Primaersystem ruft den E-Rezept-Fachdienst mit Rezept-ID und AccessCode auf.
* Der Status wird auf “gelöscht” gesetzt und medizinische Daten werden gelöscht.
* Der AccessCode wird im Primaersystem gelöscht.

* Beschreibung: Nachbedingungen
  * Ein E-Rezept wird durch die verordnende LEI gelöscht und der Status im E-Rezept-Fachdienst auf “gelöscht” gesetzt.: * Status ist “gelöscht”; personenbezogene und medizinische Daten sind entfernt.
* Statuswechsel ist protokolliert.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Ein E-Rezept wird durch die verordnende LEI gelöscht und der Status im E-Rezept-Fachdienst auf “gelöscht” gesetzt.: * [Operation API: E-Rezept löschen](./op-abort.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Ein E-Rezept wird durch die verordnende LEI gelöscht und der Status im E-Rezept-Fachdienst auf “gelöscht” gesetzt.:  (ZAHN-)ARZT  PSYCHOTHERAPEUT 

**Tabelle:**Fachlicher Anwendungsfall UC 2.5 - E-Rezept durch Verordnenden löschen
**Sequenzdiagramm:**

**Abbildung: **UC 2.5 - E-Rezept durch Verordnenden löschen
#### Anwendungsfälle im Rahmen der Verwaltung durch den Versicherten

Die Prozesse des Versicherten für die Einsichtnahme in die Verordnungen, das Übermitteln der Verordnung an den Kostenträger und die Kommunikation mit dem Kostenträger, entsprechen denen welche für die Übermittlung von ärztlichen und zahnärztlichen Verordnungen für apothekenpflichtige Arzneimittel konzipiert wurden.

Folgende Anwendungsfälle werden genutzt:

* UC 3.1 - E-Rezepte durch Versicherten abrufen
* UC 3.2 - E-Rezept durch Versicherten löschen
* UC 3.3 - Nachricht durch Versicherten übermitteln
* Kostenträger suchen
* UC 3.4 - Nachrichten durch Versicherten empfangen
* UC 3.8 - Nachricht durch Versicherten löschen
* UC 3.5 - Protokolldaten abrufen

##### UC 3.1 - E-Rezepte durch Versicherten abrufen

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

##### UC 3.2 - E-Rezept durch Versicherten löschen

* Beschreibung: Vorbedingungen
  * Der Versicherte setzt den Status eines E-Rezepts auf “gelöscht” und loescht es im E-Rezept-Fachdienst.: * UC 3.1 wurde ausgeführt.
* Status des E-Rezepts ist ungleich “in Abgabe (gesperrt)”.

* Beschreibung: Durchzuführende Aktionen
  * Der Versicherte setzt den Status eines E-Rezepts auf “gelöscht” und loescht es im E-Rezept-Fachdienst.: * Versicherter wählt ein E-Rezept im FdV und bestätigt das Löschen.
* Das FdV überträgt die Loeschanforderung an den E-Rezept-Fachdienst.
* Der Status wird geaendert; Daten im E-Rezept werden gelöscht.
* Der E-Rezept-Token wird im FdV gelöscht.

* Beschreibung: Nachbedingungen
  * Der Versicherte setzt den Status eines E-Rezepts auf “gelöscht” und loescht es im E-Rezept-Fachdienst.: * Status ist “gelöscht”; personenbezogene und medizinische Daten sind entfernt.
* Statuswechsel ist protokolliert.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Der Versicherte setzt den Status eines E-Rezepts auf “gelöscht” und loescht es im E-Rezept-Fachdienst.: * [Operation API: E-Rezept löschen](./op-abort.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Versicherte setzt den Status eines E-Rezepts auf “gelöscht” und loescht es im E-Rezept-Fachdienst.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall UC 3.2 - E-Rezept durch Versicherten löschen
**Sequenzdiagramm:**

**Abbildung: **UC 3.2 - E-Rezept durch Versicherten löschen

##### UC 3.3 - Nachricht durch Versicherten übermitteln

* Beschreibung: Vorbedingungen
  * Ein Versicherter oder Vertreter übermittelt einen E-Rezept-Token und/oder eine Nachricht an eine Apotheke oder einen Vertreter, wahlweise über die TI oder als 2D-Code.: * UC 3.1 wurde ausgeführt und ein E-Rezept-Token erstellt.
* Alternativ liegt ein E-Rezept-Token beim Vertreter vor.

* Beschreibung: Durchzuführende Aktionen
  * Ein Versicherter oder Vertreter übermittelt einen E-Rezept-Token und/oder eine Nachricht an eine Apotheke oder einen Vertreter, wahlweise über die TI oder als 2D-Code.: * Auswahl eines E-Rezept-Tokens und Versandart (TI oder 2D-Code).
* Bei Versand über TI: Apotheke im Verzeichnisdienst waehlen oder KVNR2 eingeben.
* Das FdV stellt die Nachricht mit Token und/oder Text im E-Rezept-Fachdienst ein.
* Bei 2D-Code: Token wird als 2D-Code angezeigt oder ausgedruckt.

* Beschreibung: Nachbedingungen
  * Ein Versicherter oder Vertreter übermittelt einen E-Rezept-Token und/oder eine Nachricht an eine Apotheke oder einen Vertreter, wahlweise über die TI oder als 2D-Code.: * Nachricht liegt im E-Rezept-Fachdienst und kann vom Empfänger abgerufen werden.
* Bei 2D-Code ist der Token für den Empfänger verfügbar.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Ein Versicherter oder Vertreter übermittelt einen E-Rezept-Token und/oder eine Nachricht an eine Apotheke oder einen Vertreter, wahlweise über die TI oder als 2D-Code.: * FHIR REST: Communication (E-Rezept-Nachricht einstellen)

* Beschreibung: Relevante(r) Sektor(en)
  * Ein Versicherter oder Vertreter übermittelt einen E-Rezept-Token und/oder eine Nachricht an eine Apotheke oder einen Vertreter, wahlweise über die TI oder als 2D-Code.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall UC 3.3 - Nachricht durch Versicherten übermitteln
**Sequenzdiagramm:**

**Abbildung: **UC 3.3 - Nachricht durch Versicherten übermitteln
Für das Übermitteln der Verordnung wird als Adressat der Kostenträger ausgewählt. Bei der Umsetzung im E-Rezept-FdV kann die Auswahl automatisiert erfolgen.

##### Ermitteln der Telematik-ID des Kostenträgers

Damit das E-Rezept-FdV der gematik “UC 3.3 - Nachricht durch Versicherten übermitteln” ausführen kann, muss es zunächst die Telematik-ID des Kostenträgers als Empfängeradresse der Nachricht ermitteln.

Das E-Rezept-FdV benötigt das Haupt-Institutionskennzeichen (IK) des Kostenträgers. Dieses IK wird über die Authentifizierungsmethoden des E-Rezept-FdV bereitgestellt. Das E-Rezept-FdV erhält sowohl bei der Authentifizierung mittels eGK, wie auch mittels sektoralem IDP (GesundheitsID) einen ACCESS_TOKEN vom E-Rezept Authorization Server (Teil des IDP-Dienstes) ausgestellt. Dieser ACCESS_TOKEN enthält das IK des Kostenträgers.

Sobald dem E-Rezept-FdV das IK vorliegt, sucht es im FHIR-VZD nach der Telematik-ID des Kostenträgers mithilfe des IK.

Dieser Fall ist für die E-Rezept-FdVs der Krankenkassen nicht relevant, da diese die korrekte Telematik-ID in ihren Apps vorab festlegen können. Sollte jedoch eine Vertreterfunktion implementiert werden, wird dieser Fall auch für sie relevant.

##### Fallback bei Fehlern und fehlenden Informationen

Falls es dem E-Rezept-FdV nicht möglich ist, das IK oder die Telematik-ID des Kostenträgers zu bestimmen, soll der Versicherte dennoch die Möglichkeit haben, seine DiGA Verordnung zuzuweisen.

Hierzu zeigt das E-Rezept-FdV dem Versicherten alle Kostenträgereinträge des FHIR-VZD mit oid_kostentraeger, die eine IKNR und Telematik-ID haben. Der Versicherte wählt die Krankenkasse aus, bei der er versichert ist und kann so die Einlösung vornehmen.

##### Zuweisen der Verordnung durch den Versicherten

Sobald die Telematik-ID im E-Rezept-FdV vorliegt, kann der Versicherte die Verordnung seinem Kostenträger zuweisen. Hierzu wird eine Communication (GEM_ERP_PR_Communication_DispReq) erstellt und der E-Rezept-Token eingebettet. Beim Zuweisen im Rahmen einer DiGA-Verordnung wird kein Payload mit Zusatzinformationen wie bspw. Kontaktdaten und Belieferungsoptionen übertragen.

##### UC 3.4 - Nachrichten durch Versicherten empfangen

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

##### UC 3.8 - Nachricht durch Versicherten löschen

* Beschreibung: Vorbedingungen
  * Der Versicherte loescht von ihm übermittelte Nachrichten an Apotheken oder Versicherte.: * UC 3.3 wurde ausgeführt.

* Beschreibung: Durchzuführende Aktionen
  * Der Versicherte loescht von ihm übermittelte Nachrichten an Apotheken oder Versicherte.: * Der Versicherte wählt Nachrichten zum Löschen aus und bestätigt den Vorgang.
* Das FdV überträgt die Loeschanforderung je Nachricht an den E-Rezept-Fachdienst.
* Der E-Rezept-Fachdienst loescht die Nachrichten und liefert ggf. eine Warnung, wenn bereits abgerufen.
* Die Nachrichten werden im FdV gelöscht.

* Beschreibung: Nachbedingungen
  * Der Versicherte loescht von ihm übermittelte Nachrichten an Apotheken oder Versicherte.: * Nachrichten sind im E-Rezept-Fachdienst und im FdV gelöscht.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Der Versicherte loescht von ihm übermittelte Nachrichten an Apotheken oder Versicherte.: * FHIR REST: Communication (E-Rezept-Nachricht löschen)

* Beschreibung: Relevante(r) Sektor(en)
  * Der Versicherte loescht von ihm übermittelte Nachrichten an Apotheken oder Versicherte.:  VERSICHERTER 

**Tabelle:**Fachlicher Anwendungsfall UC 3.8 - Nachricht durch Versicherten löschen
**Sequenzdiagramm:**

**Abbildung: **UC 3.8 - Nachricht durch Versicherten löschen
#### Anwändungsfälle im Rahmen des Einlösens durch Kostenträger

Die Prozesse des Kostenträgers für das Abrufen und Verarbeiten der Verordnung orientieren sich an den Prozessen der abgebenden Leistungserbringerinstitutionen bei Verordnungen für apothekenpflichtige Arzneimitteln.

Folgende Anwendungsfälle werden genutzt:

* UC 4.6 - Nachrichten durch Abgebenden empfangen
* UC 4.7 - Nachricht durch Abgebenden übermitteln
* UC 4.1 - E-Rezept durch Abgebenden abrufen
* UC 4.2 - E-Rezept durch Abgebenden zurückgeben
* UC 4.4 - Quittung abrufen
* Recovery Secret
* UC 4.8 - Quittung erneut abrufen

##### UC 4.6 - Nachrichten durch Abgebenden empfangen

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

##### UC 4.7 - Nachricht durch Abgebenden übermitteln

* Beschreibung: Vorbedingungen
  * Die abgebende LEI antwortet auf eine Nachricht eines Versicherten oder Vertreters.: * UC 3.3 wurde ausgeführt.
* UC 4.6 wurde ausgeführt.

* Beschreibung: Durchzuführende Aktionen
  * Die abgebende LEI antwortet auf eine Nachricht eines Versicherten oder Vertreters.: * Ein Mitarbeiter wählt die Nachricht zu einem E-Rezept und erstellt eine Antwort.
* Das PS stellt die Antwortnachricht im E-Rezept-Fachdienst ein.

* Beschreibung: Nachbedingungen
  * Die abgebende LEI antwortet auf eine Nachricht eines Versicherten oder Vertreters.: * Nachricht liegt im E-Rezept-Fachdienst und kann asynchron empfangen werden.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Die abgebende LEI antwortet auf eine Nachricht eines Versicherten oder Vertreters.: * FHIR REST: Communication (E-Rezept-Nachricht einstellen)

* Beschreibung: Relevante(r) Sektor(en)
  * Die abgebende LEI antwortet auf eine Nachricht eines Versicherten oder Vertreters.: 

**Tabelle:**Fachlicher Anwendungsfall UC 4.7 - Nachricht durch Abgebenden übermitteln
**Sequenzdiagramm:**

**Abbildung: **UC 4.7 - Nachricht durch Abgebenden übermitteln

##### UC 4.1 - E-Rezept durch Abgebenden abrufen

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
  * Eine abgebende LEI ruft ein E-Rezept auf Basis eines E-Rezept-Tokens aus dem E-Rezept-Fachdienst ab.:  KOSTENTRÄGER 

**Tabelle:**Fachlicher Anwendungsfall UC 4.1 - E-Rezept durch Abgebenden abrufen
**Sequenzdiagramm:**

**Abbildung: **UC 4.1 - E-Rezept durch Abgebenden abrufen

##### UC 4.2 - E-Rezept durch Abgebenden zurückgeben

* Beschreibung: Vorbedingungen
  * Ein abgerufenes E-Rezept wird an den E-Rezept-Fachdienst zurückgegeben.: * UC 4.1 wurde ausgeführt.
* Rezept-ID, AccessCode und Geheimnis sind bekannt.
* Status ist “in Abgabe (gesperrt)”.

* Beschreibung: Durchzuführende Aktionen
  * Ein abgerufenes E-Rezept wird an den E-Rezept-Fachdienst zurückgegeben.: * Abgebender markiert das E-Rezept zum Zurückgeben und bestätigt.
* PS ruft den E-Rezept-Fachdienst mit Rezept-ID, AccessCode und Geheimnis auf.
* Status wird auf “offen” geaendert.

* Beschreibung: Nachbedingungen
  * Ein abgerufenes E-Rezept wird an den E-Rezept-Fachdienst zurückgegeben.: * Status ist “offen” und protokolliert.
* E-Rezept, Token und Geheimnis sind im PS gelöscht.

* Beschreibung: Schnittstelle des E-Rezept-Fachdienst
  * Ein abgerufenes E-Rezept wird an den E-Rezept-Fachdienst zurückgegeben.: * [Operation API: Task zurückweisen](./op-reject.md)

* Beschreibung: Relevante(r) Sektor(en)
  * Ein abgerufenes E-Rezept wird an den E-Rezept-Fachdienst zurückgegeben.:  KOSTENTRÄGER 

**Tabelle:**Fachlicher Anwendungsfall UC 4.2 - E-Rezept durch Abgebenden zurückgeben
**Sequenzdiagramm:**

**Abbildung: **UC 4.2 - E-Rezept durch Abgebenden zurückgeben

##### UC 4.4 - Quittung abrufen

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
  * Nach der Abgabe wird das E-Rezept quittiert und eine Quittung vom E-Rezept-Fachdienst abgerufen.:  KOSTENTRÄGER 

**Tabelle:**Fachlicher Anwendungsfall UC 4.4 - Quittung abrufen
**Sequenzdiagramm:**

**Abbildung: **UC 4.4 - Quittung abrufen

##### UC 4.8 - Quittung erneut abrufen

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
  * Die Quittung wird erneut abgerufen, falls die Übertragung beim ersten Abruf fehlgeschlagen ist.:  KOSTENTRÄGER 

**Tabelle:**Fachlicher Anwendungsfall UC 4.8 - Quittung erneut abrufen
**Sequenzdiagramm:**

**Abbildung: **UC 4.8 - Quittung erneut abrufen

