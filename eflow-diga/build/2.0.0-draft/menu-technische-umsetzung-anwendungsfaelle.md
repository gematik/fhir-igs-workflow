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
* UC 2.3 - E-Rezept einstellen
* UC 2.5 - E-Rezept durch Verordnenden löschen

#### Anwendungsfälle im Rahmen der Verwaltung durch den Versicherten

Die Prozesse des Versicherten für die Einsichtnahme in die Verordnungen, das Übermitteln der Verordnung an den Kostenträger und die Kommunikation mit dem Kostenträger, entsprechen denen welche für die Übermittlung von ärztlichen und zahnärztlichen Verordnungen für apothekenpflichtige Arzneimittel konzipiert wurden.

Folgende Anwendungsfälle werden genutzt:

* UC 3.1 - E-Rezepte durch Versicherten abrufen
* UC 3.2 - E-Rezept durch Versicherten löschen
* UC 3.3 - Nachricht durch Versicherten übermitteln
* UC 3.4 - Nachrichten durch Versicherten empfangen
* UC 3.8 - Nachricht durch Versicherten löschen
* UC 3.5 - Protokolldaten abrufen
* Kostenträger suchen

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

#### Anwändungsfälle im Rahmen des Einlösens durch Kostenträger

Die Prozesse des Kostenträgers für das Abrufen und Verarbeiten der Verordnung orientieren sich an den Prozessen der abgebenden Leistungserbringerinstitutionen bei Verordnungen für apothekenpflichtige Arzneimitteln.

Folgende Anwendungsfälle werden genutzt:

* UC 4.6 - Nachrichten durch Abgebenden empfangen
* UC 4.7 Nachricht durch Abgebenden übermitteln
* UC 4.1 - E-Rezept durch Abgebenden abrufen
* UC 4.2 - E-Rezept durch Abgebenden zurückgeben
* UC 4.4 - Quittung abrufen
* Recovery Secret
* Quittung erneut abrufen

