# E-Rezept-FdV Anforderungen: Task - TIFlow - Grenzüberschreitender Datenaustausch v1.0.0-draft

TIFlow - Grenzüberschreitender Datenaustausch

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Task**](query-api-task.md)
* **E-Rezept-FdV Anforderungen: Task**

## E-Rezept-FdV Anforderungen: Task

### Anforderungen der Schnittstelle aus diesem Modul

#### PATCH

Der Zugriff mittels der HTTP-Operation PATCH steht ausschließlich dem Versicherten zur Verfügung. Die PATCH-Operation führt zu keiner Statusänderung des Tasks.

Das E-Rezept-FdV KANN es dem Nutzer ermöglichen, die Markierung eines E-Rezeptes zum Einlösen im EU-Ausland zu verwalten.

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept markieren" dem Nutzer vor der Möglichkeit zum Markieren der E-Rezepte zum Einlösen im EU-Ausland einen Hinweis anzeigen, dass die Belieferungsmöglichkeit für die E-Rezepte mit der Apotheke vorab geklärt werden soll.

Das E-Rezept-FdV KANN den Anwendungsfall "E-Rezept markieren" umsetzen.

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept markieren" dem Nutzer ermöglichen, ein oder mehrere E-Rezepte auszuwählen.

Das E-Rezept-FdV MUSS, wenn es den Anwendungsfall umsetzt, den Anwendungsfall "E-Rezept durch den Versicherten markieren" gemäß TAB_FdVERP_029 umsetzen. Tabelle #: TAB_FdVERP_029 – E-Rezept markieren Name E-Rezept markieren Auslöser Aufruf des Anwendungsfalls in der Graphical User Interface (GUI) Akteur Versicherter Vorbedingung Der Nutzer hat eine oder mehrere Markierungen aus- oder abgewählt. Der Nutzer hat sich gegenüber der TI authentisiert. Nachbedingung Die Markierungen sind im TI-Flow-Fachdienst gespeichert. Standardablauf Task-ID bestimmen FHIR Ressource erstellen Daten im TI-Flow-Fachdienst speichern

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept markieren" eine Parameters Ressource des Profils [GEM ERPEU PR PAR PATCH Task Input] erstellen.

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept markieren" zum Speichern der Information im TI-Flow-Fachdienst die HTTP-Operation PATCH /Task/<id> mit: ACCESS_TOKEN im Authorization-Header, Prescription-ID in URL <id>, FHIR-Ressource im HTTP-Request-Body, ausführen.

