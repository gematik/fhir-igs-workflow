# Anforderungen an den verordnende Primärsystem für die $activate-Operation - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* [**Operation: $activate**](op-activate.md)
* **Anforderungen an den verordnende Primärsystem für die $activate-Operation**

## Anforderungen an den verordnende Primärsystem für die $activate-Operation

Diese Seite enthält die normativen Anforderungen an ein PVS für die Operation `$activate`.

### Anforderungen aus der Core Spezifikation

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an Clientsysteme für die Nutzung der Operation `$activate`.

**Sequenzdiagramm:**

**Abbildung: **UC 4.1 - E-Rezept durch Abgebenden abrufen


Das PS der verordnenden LEI MUSS den Anwendungsfall "UC 2.3 - E-Rezept einstellen" gemäß TAB_ILFERP_003 umsetzen. 

* Name: Auslöser
  * E-Rezept durch Verordnenden einstellen: * Aufruf des Anwendungsfalls in der GUI
* kann durch "E-Rezept durch Verordnenden erstellen" getriggert werden

* Name: Akteur
  * E-Rezept durch Verordnenden einstellen: Leistungserbringer, Mitarbeiter der verordnenden LEI
* Name: Vorbedingung
  * E-Rezept durch Verordnenden einstellen: * Das E-Rezept wurde erstellt. (Anwendungsfall "E-Rezept erstellen"). Es stehen ein QES-signiertes E-Rezept-Bundle als PKCS#7-Datei bereit.
* Die LEI hat sich gegenüber der TI authentisiert.

* Name: Nachbedingung
  * E-Rezept durch Verordnenden einstellen: Das E-Rezept ist auf dem E-Rezept-Fachdienst gespeichert. Es kann durch den Versicherten oder einen Apotheker in Kenntnis der Einlöseinformationen (Task-ID + AccessCode) abgerufen werden. Der Workflow hat den Status "ready".
* Name: Standardablauf
  * E-Rezept durch Verordnenden einstellen: 1. Task auf dem E-Rezept-Fachdienst aktivieren
1. optional, wenn der Patientenausdruck ausgedruckt werden soll:
1. E-Rezept-Token erzeugen
1. Patientenausdruck erstellen



**Tabelle: **TAB_ILFERP_003 - E-Rezept durch Verordnenden einstellen

Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden einstellen" für das E-Rezept die HTTP-Operation POST /Task/<id>/$activate mit
* ACCESS_TOKEN im Authorization-Header
* Task-ID in URL <id> 
* AccessCode in X-AccessCode - Header oder URL-Parameter ?ac=
* QES signiertes E-Rezept-Bundle im http-Body des Aufrufs als data
ausführen.
Hinweis: Für den Fall, dass das Clientsystem beim Aufruf der Operation keinen Response erhält, soll der Aufruf wiederholt werden. Wenn im Response des zweiten Aufrufs ein Fehler 403 mit dem OperationOutcome “Task not in status draft but in status ready” zurückkommt, wurde der erste Aufruf bereits erfolgreich durch den E-Rezept-Fachdienst verarbeitet. Wenn eine Response mit dem Status 200 zurückkommt, war der zweite Aufruf erfolgreich.

Das PS der verordnenden LEI DARF im Anwendungsfall "E-Rezept durch Verordnenden einstellen" NICHT einen Ausdruck für den Versicherten erstellen, wenn der E-Rezept-Fachdienst im Response der Operation POST /Task/<id>/$activate mit einem Fehler antwortet.
Für den Patientenausdruck gelten vorrangig die Regelungen zum Ausdruck eines E-Rezepts aus den Bundesmantelverträgen [BMV] und [BMV-Z]. 

Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden einstellen", wenn ein Patientenausdruck erstellt werden soll, einen E-Rezept-Token erstellen.
Für die Spezifikation des E-Rezept-Token siehe [gemSpec_DM_eRp#2.3]. 

Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden einstellen", wenn ein Patientenausdruck erstellt werden soll, Datamatrix-Codes erstellen und für den Patientenausdruck verwenden.
Für die Spezifikation des Datamatrix-Code für E-Rezept-Token siehe [gemSpec_DM_eRp#2.3]. 

### Modulspezifische Anforderungen

Es gibt keine modulspezifischen Anforderungen.

