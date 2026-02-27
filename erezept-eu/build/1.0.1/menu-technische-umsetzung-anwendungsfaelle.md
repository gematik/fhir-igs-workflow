# Technische Umsetzung - Technische Anwendungsfälle - E-Rezept Workflow EU v1.0.1

E-Rezept Workflow EU

Version 1.0.1 - release 

* [**Table of Contents**](toc.md)
* [**Technische Umsetzung - Systemüberblick**](menu-technische-umsetzung-systemueberblick.md)
* **Technische Umsetzung - Technische Anwendungsfälle**

## Technische Umsetzung - Technische Anwendungsfälle

### Statusmodell

Für die Übermittlung von ärztlichen und zahnärztlichen Verordnungen für apothekenpflichtige Arzneimittel in Deutschland wird das folgende Statusmodell umgesetzt.

**Abbildung: **Statusübergänge Fachanwendung E-Rezept


Für die im Rahmen des Einlösens im europäischen Ausland vorgegebenen Prozessschritten lässt sich das Statusmodell nicht vollständig anwenden, da kein Prozessschritt vorgesehen ist, ein zur Abgabe vorgesehenes E-Rezept an den Versicherten zurückzugeben, wenn die Abgabe nicht erfolgen kann.

| | | | |
| :--- | :--- | :--- | :--- |
| Identifizierung des Versicherten im Abgabeland | UC Demographische Daten eines Versicherten abrufen | offen (ready) | offen (ready) |
| Auflistung von E-Rezepten des Versicherten | UC Liste der einlösbaren E-Rezepte eines Versicherten abrufen | offen (ready) | offen (ready) |
| Abruf der abzugebenden E-Rezepte als Original | UC Liste ausgewählter E-Rezepte eines Versicherten abrufen | offen (ready) | in Abgabe (gesperrt) (in-progress) |
| Abgabe von Arzneimitteln im Abgabeland | UC Abgabe von E-Rezepten im europäischen Ausland | in Abgabe (gesperrt) (in-progress) | quittiert (completed) |

**Tabelle: **Statusübergänge EU Mapping

Sobald ein E-Rezept durch eine LE-EU mit dem Anwendungsfall “Abruf der abzugebenden E-Rezepten des Versicherten” abgerufen wurde, kann es nicht mehr erneut abgerufen werden oder in einer anderen Apotheke eingelöst werden.

### Umzusetzende Anwendungsfälle von Clients

#### E-Rezept-FdV

Das E-Rezept-Fachdienst MUSS für die Umsetzung der Bedienung von E-Rezepten im EU Kontext die Anwendungsfälle
* UC 3.13 - Einwilligung einsehen
* UC 3.14 - Einwilligung erteilen
* UC 3.15 - Einwilligung widerrufen
* UC 3.16 - Zugriffsberechtigung durch Versicherten erstellen
* UC 3.17 - Zugriffsberechtigung durch Versicherten löschen
* UC 3.18 - Zugriffsberechtigung durch Versicherten einsehen
* UC 3.19 - E-Rezept durch den Versicherten markieren
umsetzen.
### Use Cases zur Verwaltung der Einwilligung durch den Versicherten

 ###

* Beschreibung: Vorbedingungen
  * : 
* Beschreibung: Durchzuführende Aktionen
  * : 
* Beschreibung: Nachbedingungen
  * : 
* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
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
* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
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
* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * : 
* Beschreibung: Relevante(r) Sektor(en)
  * : 

**Tabelle:**Fachlicher Anwendungsfall
### Use Cases zur Verwaltung der Zugriffsberechtigung durch den Versicherten

 ###

* Beschreibung: Vorbedingungen
  * : 
* Beschreibung: Durchzuführende Aktionen
  * : 
* Beschreibung: Nachbedingungen
  * : 
* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
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
* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
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
* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * : 
* Beschreibung: Relevante(r) Sektor(en)
  * : 

**Tabelle:**Fachlicher Anwendungsfall
### Use Cases zur Verwaltung der E-Rezepte durch den Versicherten

 ###

* Beschreibung: Vorbedingungen
  * : 
* Beschreibung: Durchzuführende Aktionen
  * : 
* Beschreibung: Nachbedingungen
  * : 
* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * : 
* Beschreibung: Relevante(r) Sektor(en)
  * : 

**Tabelle:**Fachlicher Anwendungsfall
### Use Cases im Rahmen der Belieferung durch eine Apotheke im europäischen Ausland

 ###

* Beschreibung: Vorbedingungen
  * : 
* Beschreibung: Durchzuführende Aktionen
  * : 
* Beschreibung: Nachbedingungen
  * : 
* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
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
* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
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
* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
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
* Beschreibung: Technische Anwendungsfälle des E-Rezept-Fachdienst
  * : 
* Beschreibung: Relevante(r) Sektor(en)
  * : 

**Tabelle:**Fachlicher Anwendungsfall
**Hinweis: Für den Anwendungsfall “Abgabe von E-Rezepten im europäischen Ausland” wird angenommen, dass die vollständigen Dispensierinformationen zu einer ePrescription (E-Rezept) in genau einem eDispensation Dokument (CDA) vom LE-EU übermittelt werden.**

Nach der Bereitstellung der Dispensierinformationen im E-Rezept-Fachdienst kann der Versicherte diese mit seinem E-Rezept-FdV herunterladen und anzeigen lassen.

Eine Übermittlung der Dispensierinformationen an den ePA Medication Service ist perspektivisch vorgesehen. Die Funktionalität wird ergänzt, sobald die Voraussetzungen in den verwendeten Datenmodellen geschaffen wurden.

