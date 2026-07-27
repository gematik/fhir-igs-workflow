# FdV-Anforderungen: Task-Query - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Task**](query-api-task.md)
* **FdV-Anforderungen: Task-Query**

## FdV-Anforderungen: Task-Query

Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `Task`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `Task`-Query-Endpunkte.

#### Liste der Verordnungen des Nutzers abrufen

funkt. Eignung: Test Produkt/FADas E-Rezept-FdV MUSS im Anwendungsfall "E-Rezepte abrufen" zum Herunterladen alle E-Rezepte des Nutzers die HTTP-Operation GET /Task ausführen.

funkt. Eignung: Test Produkt/FADas E-Rezept-FdV KANN es dem Versicherten ermöglichen, die vom TI-Flow-Fachdienst heruntergeladenen E-Rezepte im lokalen Speicher persistent abzulegen.
#### Eine spezifische Verordnung durch Nutzer abrufen

Der Aufruf wird genutzt, wenn die Informationen zu einer spezifischen Verordnung vom TI-Flow-Fachdienst heruntergeladen werden sollen, bspw. um zu prüfen, ob sich der Status geändert hat. Dafür muss die Task-ID dieser Verordnung im E-Rezept-FdV bekannt sein.

funkt. Eignung: Test Produkt/FADas E-Rezept-FdV MUSS im Anwendungsfall "E-Rezepte abrufen" zum Herunterladen einer spezifischen Verordnung des Nutzers die HTTP-Operation GET /Task/<id> mit
* Task-ID in URL <id> 
ausführen.
Für weitere Informationen siehe Operation "Ein einzelnes E-Rezept abrufen" aus der API-Schnittstelle [E-Rezept API Dokumentation].

Der Response beinhaltet die Task Ressource des E-Rezepts.

### Modulspezifische Anforderungen

#### GET /Task

##### Workflowspezifische Anforderungen

funkt. Eignung: Test Produkt/FADas E-Rezept-FdV MUSS den Nutzer bei der Einsicht in ein E-Rezept mit dem Flowtype 166 darauf hinweisen, dass bei diesem Vorgang seine Einlösemöglichkeiten beschränkt sind und das Rezept eine verkürzte Gültigkeit aufweist.
#### PATCH /Task

Der Zugriff mittels der HTTP-Operation PATCH steht ausschließlich dem Versicherten zur Verfügung. Die PATCH-Operation führt zu keiner Statusänderung des Tasks.

funkt. Eignung: HerstellererklärungDas E-Rezept-FdV KANN es dem Nutzer ermöglichen, die Markierung eines E-Rezeptes zum Einlösen im EU-Ausland zu verwalten.

funkt. Eignung: HerstellererklärungDas E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept markieren" dem Nutzer vor der Möglichkeit zum Markieren der E-Rezepte zum Einlösen im EU-Ausland einen Hinweis anzeigen, dass die Belieferungsmöglichkeit für die E-Rezepte mit der Apotheke vorab geklärt werden soll.

funkt. Eignung: HerstellererklärungDas E-Rezept-FdV KANN den Anwendungsfall "E-Rezept markieren" umsetzen.

funkt. Eignung: HerstellererklärungDas E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept markieren" dem Nutzer ermöglichen, ein oder mehrere E-Rezepte auszuwählen.

funkt. Eignung: HerstellererklärungDas E-Rezept-FdV MUSS, wenn es den Anwendungsfall umsetzt, den Anwendungsfall "E-Rezept durch den Versicherten markieren" gemäß TAB_FdVERP_029 umsetzen. Tabelle #: TAB_FdVERP_029 - E-Rezept markieren Name E-Rezept markieren Auslöser Aufruf des Anwendungsfalls in der Graphical User Interface (GUI) Akteur Versicherter Vorbedingung Der Nutzer hat eine oder mehrere Markierungen aus- oder abgewählt. Der Nutzer hat sich gegenüber der TI authentisiert. Nachbedingung Die Markierungen sind im TI-Flow-Fachdienst gespeichert. Standardablauf Task-ID bestimmen FHIR Ressource erstellen Daten im TI-Flow-Fachdienst speichern

funkt. Eignung: HerstellererklärungDas E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept markieren" eine Parameters Ressource des Profils [GEM ERPEU PR PAR PATCH Task Input] erstellen.

funkt. Eignung: HerstellererklärungDas E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept markieren" zum Speichern der Information im TI-Flow-Fachdienst die HTTP-Operation PATCH /Task/<id> mit:
* Prescription-ID in URL <id> 
* FHIR-Ressource im HTTP-Request-Body 
ausführen.

