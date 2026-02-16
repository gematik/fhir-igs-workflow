# Operation: $close - E-Rezept fuer Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

E-Rezept fuer Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* **Operation: $close**

## Operation: $close

## Operation: $close

Die FHIR-Operation `$close` überführt einen im Status `in-progress` befindlichen `Task` in den Status `completed`, wenn der Kostenträger des Workflow abschliesst.

### Nachricht

Die Operation $close wird als HTTP POST auf /Task//$close ausgeführt.

### Anforderungen an Schnittstelle

Es gelten die übergreifenden Anforderungen an die $close Operation. ToDo: link zu übergreifenden Anforderungen

Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks für eine Verordnung mit Flowtype 162 mittels HTTP-POST/$close-Operation auf den in der URL referenzierten/Task/
die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Institutionen in der Rolle - oid_kostentraeger die Operation am Fachdienst aufrufen, damit der Workflow nicht durch einen Unberechtigten abgeschlossen werden kann. </requirement> </br>

Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks für ein E-Rezept mittels HTTP-POST/$close-Operation auf den in der URL referenzierten/Task/
mit Flowtype 162 sicherstellen, dass das in GEM_ERP_PR_PAR_CloseOperation_Input enthaltene MedicationDispense-Objekt dem Profil GEM_ERP_PR_MedicationDispense_DiGA entspricht. Andernfalls ist die Operation mit einem Fehler abzubrechen, und im OperationOutcome muss der Text "Unzulässige Abgabeinformationen: Für diesen Workflow sind nur Abgabeinformationen für digitale Gesundheitsanwendungen zulässig." zurückgegeben werden. </requirement> ### Auslöser Der Kostenträger übermittelt die Abgabeinformation (Freischaltcode) und schliesst den Vorgang ab. ### Hinweis Es gelten die Vorgaben des Basis-Workflows für E-Rezepte. ### Geschäftslogik ToDo: Diagram zum Ablauf

