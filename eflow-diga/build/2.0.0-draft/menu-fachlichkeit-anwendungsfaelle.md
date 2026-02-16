# Anwendungsfaelle im DiGA-Workflow - E-Rezept fuer Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

E-Rezept fuer Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Ueberblick zur Verordnung von DiGAs**](menu-fachlichkeit-ueberblick.md)
* **Anwendungsfaelle im DiGA-Workflow**

## Anwendungsfaelle im DiGA-Workflow

### Fachliche Anwendungsfälle

Die folgenden fachlichen Anwendungsfälle beschreiben die Schritte zur Verordnung und Bereitstellung einer DiGA-Verordnung.

#### Übergreifende Vorbedingungen

* Der Leistungserbringer ist gegenüber der TI authentisiert (Institutionsidentitaet via SMC-B über IdP/Konnektor).
* Für die QES steht ein freigeschalteter HBA zur Verfuegung.
* Der Verordnungsdatensatz wird als KBV-konformes FHIR-Bundle im Primaersystem geführt.

#### E-Rezept erstellen

* Beschreibung: Vorbedingungen
  * Ein E-Rezept wird im Primaersystem (PVS/KIS) als Verordnungsdatensatz erstellt. Fuer die Bereitstellung auf dem E-Rezept-Fachdienst wird ein Task angelegt, ueber den eine Rezept-ID (PrescriptionID) vergeben und ein AccessCode erzeugt wird.: 
* Beschreibung: Durchzuführende Aktionen
  * Ein E-Rezept wird im Primaersystem (PVS/KIS) als Verordnungsdatensatz erstellt. Fuer die Bereitstellung auf dem E-Rezept-Fachdienst wird ein Task angelegt, ueber den eine Rezept-ID (PrescriptionID) vergeben und ein AccessCode erzeugt wird.: - Das Primaersystem legt im E-Rezept-Fachdienst einen Task an. - Der E-Rezept-Fachdienst vergibt eine Rezept-ID (PrescriptionID) und generiert einen AccessCode. - Das Primaersystem uebernimmt die Rezept-ID in den lokalen Verordnungsdatensatz.
* Beschreibung: Nachbedingungen
  * Ein E-Rezept wird im Primaersystem (PVS/KIS) als Verordnungsdatensatz erstellt. Fuer die Bereitstellung auf dem E-Rezept-Fachdienst wird ein Task angelegt, ueber den eine Rezept-ID (PrescriptionID) vergeben und ein AccessCode erzeugt wird.: - Task liegt im Status `draft` vor. - Rezept-ID und AccessCode sind im Primaersystem verfuegbar.
* Beschreibung: Unterstützende Schnittstelle(n) des Medication Service
  * Ein E-Rezept wird im Primaersystem (PVS/KIS) als Verordnungsdatensatz erstellt. Fuer die Bereitstellung auf dem E-Rezept-Fachdienst wird ein Task angelegt, ueber den eine Rezept-ID (PrescriptionID) vergeben und ein AccessCode erzeugt wird.: 
* Beschreibung: Relevante(r) Sektor(en)
  * Ein E-Rezept wird im Primaersystem (PVS/KIS) als Verordnungsdatensatz erstellt. Fuer die Bereitstellung auf dem E-Rezept-Fachdienst wird ein Task angelegt, ueber den eine Rezept-ID (PrescriptionID) vergeben und ein AccessCode erzeugt wird.:  (ZAHN-)ARZT 

#### E-Rezept qualifiziert signieren

* Beschreibung: Vorbedingungen
  * Der Verordnungsdatensatz wird durch den (Zahn-)Arzt mittels HBA qualifiziert elektronisch signiert (QES). Vorbereitende Taetigkeiten im Primaersystem koennen organisatorisch delegiert werden, die QES selbst jedoch nicht.: 
* Beschreibung: Durchzuführende Aktionen
  * Der Verordnungsdatensatz wird durch den (Zahn-)Arzt mittels HBA qualifiziert elektronisch signiert (QES). Vorbereitende Taetigkeiten im Primaersystem koennen organisatorisch delegiert werden, die QES selbst jedoch nicht.: - Das Primaersystem startet die QES-Erstellung ueber den Konnektor. - Der (Zahn-)Arzt signiert den Verordnungsdatensatz mit dem HBA. - Das Primaersystem erhaelt den QES-signierten Datensatz zur weiteren Verarbeitung.
* Beschreibung: Nachbedingungen
  * Der Verordnungsdatensatz wird durch den (Zahn-)Arzt mittels HBA qualifiziert elektronisch signiert (QES). Vorbereitende Taetigkeiten im Primaersystem koennen organisatorisch delegiert werden, die QES selbst jedoch nicht.: - QES-signierter Verordnungsdatensatz liegt im Primaersystem vor.
* Beschreibung: Unterstützende Schnittstelle(n) des Medication Service
  * Der Verordnungsdatensatz wird durch den (Zahn-)Arzt mittels HBA qualifiziert elektronisch signiert (QES). Vorbereitende Taetigkeiten im Primaersystem koennen organisatorisch delegiert werden, die QES selbst jedoch nicht.: 
* Beschreibung: Relevante(r) Sektor(en)
  * Der Verordnungsdatensatz wird durch den (Zahn-)Arzt mittels HBA qualifiziert elektronisch signiert (QES). Vorbereitende Taetigkeiten im Primaersystem koennen organisatorisch delegiert werden, die QES selbst jedoch nicht.:  (ZAHN-)ARZT 

#### E-Rezept vervollstaendigen und Task aktivieren

* Beschreibung: Vorbedingungen
  * Der (Zahn-)Arzt finalisiert eine bereits erstellte Verordnung und stellt sie qualifiziert signiert fuer den Versicherten bereit. Mit der Bereitstellung startet der Einloese-Workflow: Die Verordnung wird im E-Rezept-Fachdienst geprueft und anschliessend so veroeffentlicht, dass sie im vorgesehenen Prozess (z. B. Einloesung in der Apotheke oder Bearbeitung durch den Kostentraeger) genutzt werden kann.: 
* Beschreibung: Durchzuführende Aktionen
  * Der (Zahn-)Arzt finalisiert eine bereits erstellte Verordnung und stellt sie qualifiziert signiert fuer den Versicherten bereit. Mit der Bereitstellung startet der Einloese-Workflow: Die Verordnung wird im E-Rezept-Fachdienst geprueft und anschliessend so veroeffentlicht, dass sie im vorgesehenen Prozess (z. B. Einloesung in der Apotheke oder Bearbeitung durch den Kostentraeger) genutzt werden kann.: - Das Primaersystem stellt den qualifiziert signierten Verordnungsdatensatz beim E-Rezept-Fachdienst bereit. - Der E-Rezept-Fachdienst prueft Berechtigung, Signatur und fachliche Konsistenz der Verordnung. - Bei erfolgreicher Pruefung wird die Verordnung fuer die weitere Verarbeitung (Einloesung/Bearbeitung) freigeschaltet.
* Beschreibung: Nachbedingungen
  * Der (Zahn-)Arzt finalisiert eine bereits erstellte Verordnung und stellt sie qualifiziert signiert fuer den Versicherten bereit. Mit der Bereitstellung startet der Einloese-Workflow: Die Verordnung wird im E-Rezept-Fachdienst geprueft und anschliessend so veroeffentlicht, dass sie im vorgesehenen Prozess (z. B. Einloesung in der Apotheke oder Bearbeitung durch den Kostentraeger) genutzt werden kann.: - Das E-Rezept ist bereitgestellt und kann im weiteren Prozess eingeloest bzw. bearbeitet werden. - Der Status des Workflows entspricht der bereitgestellten Verordnung.
* Beschreibung: Unterstützende Schnittstelle(n) des Medication Service
  * Der (Zahn-)Arzt finalisiert eine bereits erstellte Verordnung und stellt sie qualifiziert signiert fuer den Versicherten bereit. Mit der Bereitstellung startet der Einloese-Workflow: Die Verordnung wird im E-Rezept-Fachdienst geprueft und anschliessend so veroeffentlicht, dass sie im vorgesehenen Prozess (z. B. Einloesung in der Apotheke oder Bearbeitung durch den Kostentraeger) genutzt werden kann.: 
* Beschreibung: Relevante(r) Sektor(en)
  * Der (Zahn-)Arzt finalisiert eine bereits erstellte Verordnung und stellt sie qualifiziert signiert fuer den Versicherten bereit. Mit der Bereitstellung startet der Einloese-Workflow: Die Verordnung wird im E-Rezept-Fachdienst geprueft und anschliessend so veroeffentlicht, dass sie im vorgesehenen Prozess (z. B. Einloesung in der Apotheke oder Bearbeitung durch den Kostentraeger) genutzt werden kann.:  (ZAHN-)ARZT 

#### DiGA-Verordnung einem Kostentraeger zuweisen

* Beschreibung: Vorbedingungen
  * Versicherte leiten ihr E-Rezept fuer eine DiGA an den zustaendigen Kostentraeger weiter - entweder per E-Rezept-FdV nach Section 360 Abs. 10 SGB V oder ueber einen Ausdruck nach Section 360 Abs. 9 SGB V. Ziel ist es, den Freischaltcode anzufordern und den Status des Antrags transparent zu halten.: 
* Beschreibung: Durchzuführende Aktionen
  * Versicherte leiten ihr E-Rezept fuer eine DiGA an den zustaendigen Kostentraeger weiter - entweder per E-Rezept-FdV nach Section 360 Abs. 10 SGB V oder ueber einen Ausdruck nach Section 360 Abs. 9 SGB V. Ziel ist es, den Freischaltcode anzufordern und den Status des Antrags transparent zu halten.: - Das E-Rezept-FdV ermittelt die Telematik-ID des Kostentraegers ueber das FHIR-VZD oder bietet eine manuelle Auswahl an. - Das System erstellt eine `Communication` (DispReq) mit dem E-Rezept-Token und adressiert diese an den Kostentraeger. - Alternativ uebermittelt der Versicherte den Ausdruck an den Kostentraeger, der daraufhin den Abrufprozess startet.
* Beschreibung: Nachbedingungen
  * Versicherte leiten ihr E-Rezept fuer eine DiGA an den zustaendigen Kostentraeger weiter - entweder per E-Rezept-FdV nach Section 360 Abs. 10 SGB V oder ueber einen Ausdruck nach Section 360 Abs. 9 SGB V. Ziel ist es, den Freischaltcode anzufordern und den Status des Antrags transparent zu halten.: - Der Kostentraeger verfuegt ueber das E-Rezept-Token und kann das DiGA-E-Rezept abrufen. - Der Versicherte sieht im Protokoll den Versandzeitpunkt und kann den Status nachverfolgen.
* Beschreibung: Unterstützende Schnittstelle(n) des Medication Service
  * Versicherte leiten ihr E-Rezept fuer eine DiGA an den zustaendigen Kostentraeger weiter - entweder per E-Rezept-FdV nach Section 360 Abs. 10 SGB V oder ueber einen Ausdruck nach Section 360 Abs. 9 SGB V. Ziel ist es, den Freischaltcode anzufordern und den Status des Antrags transparent zu halten.: 
* Beschreibung: Relevante(r) Sektor(en)
  * Versicherte leiten ihr E-Rezept fuer eine DiGA an den zustaendigen Kostentraeger weiter - entweder per E-Rezept-FdV nach Section 360 Abs. 10 SGB V oder ueber einen Ausdruck nach Section 360 Abs. 9 SGB V. Ziel ist es, den Freischaltcode anzufordern und den Status des Antrags transparent zu halten.:  VERSICHERTER 

#### DiGA-E-Rezept abrufen (Kostentraeger)

* Beschreibung: Vorbedingungen
  * Der Kostentraeger ruft mit Hilfe des erhaltenen E-Rezept-Tokens die DiGA-Verordnung vom E-Rezept-Fachdienst ab, prueft Leistungsanspruch und bereitet die Freischaltcode-Erstellung vor.: 
* Beschreibung: Durchzuführende Aktionen
  * Der Kostentraeger ruft mit Hilfe des erhaltenen E-Rezept-Tokens die DiGA-Verordnung vom E-Rezept-Fachdienst ab, prueft Leistungsanspruch und bereitet die Freischaltcode-Erstellung vor.: - Das Kostentraegersystem ruft /Task/{id}/$accept mit AccessCode auf und erhaelt Task, Binary und Secret. - Die Verordnung wird im Backend persistiert, fachlich geprueft und mit dem Freischaltprozess verknuepft. - Status- und Protokolleintraege werden im eigenen System und gegenueber dem Versicherten gepflegt.
* Beschreibung: Nachbedingungen
  * Der Kostentraeger ruft mit Hilfe des erhaltenen E-Rezept-Tokens die DiGA-Verordnung vom E-Rezept-Fachdienst ab, prueft Leistungsanspruch und bereitet die Freischaltcode-Erstellung vor.: - Das Secret liegt vor und belegt den Kostentraeger als Bearbeiter; Task-Status wechselt auf `in-progress`. - Pruef- und Abrechnungsdaten stehen strukturiert zur Verfuegung; der Versicherte sieht eine Statusaenderung.
* Beschreibung: Unterstützende Schnittstelle(n) des Medication Service
  * Der Kostentraeger ruft mit Hilfe des erhaltenen E-Rezept-Tokens die DiGA-Verordnung vom E-Rezept-Fachdienst ab, prueft Leistungsanspruch und bereitet die Freischaltcode-Erstellung vor.: 
* Beschreibung: Relevante(r) Sektor(en)
  * Der Kostentraeger ruft mit Hilfe des erhaltenen E-Rezept-Tokens die DiGA-Verordnung vom E-Rezept-Fachdienst ab, prueft Leistungsanspruch und bereitet die Freischaltcode-Erstellung vor.:  KOSTENTRAEGER 

#### Freischaltcode bereitstellen oder Rueckmeldung geben

* Beschreibung: Vorbedingungen
  * Nach erfolgreicher Pruefung stellt der Kostentraeger den Freischaltcode als Abgabeinformation im E-Rezept-Fachdienst bereit oder dokumentiert, aus welchem Grund kein Code erzeugt werden kann.: 
* Beschreibung: Durchzuführende Aktionen
  * Nach erfolgreicher Pruefung stellt der Kostentraeger den Freischaltcode als Abgabeinformation im E-Rezept-Fachdienst bereit oder dokumentiert, aus welchem Grund kein Code erzeugt werden kann.: - Das Kostentraegersystem uebermittelt ueber `$dispense` oder `$close` eine Parameters-Ressource mit dem Freischaltcode bzw. einer versichertenfreundlichen Rueckmeldung. - Der E-Rezept-Fachdienst persistiert die Abgabeinformation und beendet bei `$close` den Workflow mit Quittung.
* Beschreibung: Nachbedingungen
  * Nach erfolgreicher Pruefung stellt der Kostentraeger den Freischaltcode als Abgabeinformation im E-Rezept-Fachdienst bereit oder dokumentiert, aus welchem Grund kein Code erzeugt werden kann.: - Der Versicherte sieht im E-Rezept-FdV (oder erhaelt per Krankenkasse) den Freischaltcode oder die Begruendung. - Der Workflow ist abgeschlossen; der Kostentraeger erhaelt eine Quittung fuer die Dokumentation.
* Beschreibung: Unterstützende Schnittstelle(n) des Medication Service
  * Nach erfolgreicher Pruefung stellt der Kostentraeger den Freischaltcode als Abgabeinformation im E-Rezept-Fachdienst bereit oder dokumentiert, aus welchem Grund kein Code erzeugt werden kann.: 
* Beschreibung: Relevante(r) Sektor(en)
  * Nach erfolgreicher Pruefung stellt der Kostentraeger den Freischaltcode als Abgabeinformation im E-Rezept-Fachdienst bereit oder dokumentiert, aus welchem Grund kein Code erzeugt werden kann.:  KOSTENTRAEGER 

