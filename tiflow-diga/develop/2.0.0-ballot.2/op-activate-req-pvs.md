# Anforderungen an den verordnende Primärsystem für die $activate-Operation - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* [**Operation: $activate**](op-activate.md)
* **Anforderungen an den verordnende Primärsystem für die $activate-Operation**

## Anforderungen an den verordnende Primärsystem für die $activate-Operation

Diese Seite enthält die normativen Anforderungen an ein PVS für die Operation `$activate`.

### Anforderungen aus der Core Spezifikation

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an Clientsysteme für die Nutzung der Operation `$activate`.

funkt. Eignung: KonformitätsbestätigungDas PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden einstellen" für das E-Rezept die HTTP-Operation POST /Task/<id>/$activate mit
* Task-ID in URL <id> 
* AccessCode in X-AccessCode - Header oder URL-Parameter ?ac=
* QES signiertes E-Rezept-Bundle im HTTP-Request-Body des Aufrufs als data
ausführen.
Hinweis: Für den Fall, dass das Clientsystem beim Aufruf der Operation keinen Response erhält, soll der Aufruf wiederholt werden. Wenn im Response des zweiten Aufrufs ein Fehler 403 mit dem OperationOutcome "Task not in status draft but in status ready" zurückkommt, wurde der erste Aufruf bereits erfolgreich durch den TI-Flow-Fachdienst verarbeitet. Wenn eine Response mit dem Status 200 zurückkommt, war der zweite Aufruf erfolgreich.

#### Patientenausdruck

funkt. Eignung: HerstellererklärungDas PS der verordnenden LEI DARF im Anwendungsfall "E-Rezept durch Verordnenden einstellen" NICHT einen Ausdruck für den Versicherten erstellen, wenn der TI-Flow-Fachdienst im Response der Operation POST /Task/<id>/$activate mit einem Fehler antwortet.
Für den Patientenausdruck gelten vorrangig die Regelungen zum Ausdruck eines E-Rezepts aus den Bundesmantelverträgen [BMV] und [BMV-Z]. 

funkt. Eignung: HerstellererklärungDas PS der verordnenden LEI MUSS sicherstellen, dass für jeden Flowtype ein separater Patientenausdruck erfolgt, sofern der Nutzer Verordnungen mit unterschiedlichen Flowtypes einstellt und für diese Patientenausdrucke erzeugen möchte.

funkt. Eignung: HerstellererklärungDas PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden einstellen", wenn ein Patientenausdruck erstellt werden soll, einen E-Rezept-Token erstellen.
Für die Spezifikation des E-Rezept-Token siehe [gemSpec_DM_eRp#2.3]. 

funkt. Eignung: HerstellererklärungDas PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden einstellen", wenn ein Patientenausdruck erstellt werden soll, Datamatrix-Codes erstellen und für den Patientenausdruck verwenden.
Für die Spezifikation des Datamatrix-Code für E-Rezept-Token siehe [gemSpec_DM_eRp#2.3]. 

### Modulspezifische Anforderungen

Um die Einlösung einer elektronischen DiGA-Verordnung (Flowtype 162) sicherzustellen, ist dem Patienten ein Ausdruck auszuhändigen, ausgenommen der Patient lehnt einen Ausdruck ab, da er bspw. ein E-Rezept-Frontend des Versicherten der Krankenkasse oder der gematik nutzt.

funkt. Eignung: HerstellererklärungDas PS der verordnenden LEI MUSS nach dem erfolgreichen Einstellen einer Verordnung mit dem Flowtype 162 einen Patientenausdruck erstellen, sofern der Nutzer in Rücksprache mit dem Versicherten dies nicht aktiv ablehnt.

