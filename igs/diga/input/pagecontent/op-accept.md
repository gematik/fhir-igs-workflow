Die FHIR-Operation `$acsept` überführt einen im Status `ready` befindlichen `Task` in den Status `in-progress`, nachdem der Kostenträger die Verordnung vom Fachdienst abgerufen hat.

### Nachricht
Die Operation $accept wird als HTTP POST auf /Task/<id>/$accept ausgeführt.

### Anforderungen an Schnittstelle

Es gelten die übergreifenden Anforderungen an die $accept Operation.
ToDo: link zu übergreifenden Anforderungen

[Workflow-spezifische Anforderungen für den E-Rezept-Fachdienst](./op-accept-req-server.html)







### Hinweis
Es gelten die Vorgaben des Basis-Workflows für E-Rezepte.
